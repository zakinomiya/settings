local M = {};

function exit_visual_mode() 
    -- Visualモードを強制的に抜ける (Escキーを送信)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
end

-- 選択範囲を別ファイルの末尾に追記して削除する関数
function M.move_selection_to_file(target_path)
    -- Visualモードの選択範囲（開始行と終了行）を取得
    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")
    local start_line = math.min(start_pos[2], end_pos[2]) - 1
    local end_line = math.max(start_pos[2], end_pos[2])

    -- 選択された行のテキストを取得
    local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

    -- ファイルを追記モード (a) で開く
    local file = io.open(vim.fn.expand(target_path), "a")
    if file then
        file:write("\n--- " .. os.date("%Y-%m-%d %H:%M") .. " ---\n")
        for _, line in ipairs(lines) do
            file:write(line .. "\n")
        end
        file:close()
        
        -- 元のファイルから選択範囲を削除
        vim.api.nvim_buf_set_lines(0, start_line, end_line, false, {})
        exit_visual_mode()
    else
        print("Error: Could not open file " .. target_path)
    end
end

-- プロンプトを出して「新規ファイル」として保存用
function M.export_to_new_file(dir_path)
    vim.ui.input({ prompt = 'New filename (without ext): ' }, function(input)
        if not input or input == "" then return end

        local date_str = os.date("%Y%m%d")
        local full_path = vim.fn.expand(dir_path) .. "/a_" .. date_str .. "_" .. input .. ".md"

        local start_pos = vim.fn.getpos("v")
        local end_pos = vim.fn.getpos(".")
        local start_line = math.min(start_pos[2], end_pos[2]) - 1
        local end_line = math.max(start_pos[2], end_pos[2])
        local lines = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)

        local file = io.open(full_path, "w")
        if file then
            for _, line in ipairs(lines) do file:write(line .. "\n") end
            file:close()
            vim.api.nvim_buf_set_lines(0, start_line, end_line, false, {})
            exit_visual_mode()
        else
            print("Error: Could not create file " .. full_path)
        end
    end)
end

-- fzf-luaで既存ファイルを選択して追記 or 新規ファイル作成
function M.export_to_misc_file(dir_path)
    local expanded_dir = vim.fn.expand(dir_path)
    local bufnr = vim.api.nvim_get_current_buf()

    local start_pos = vim.fn.getpos("v")
    local end_pos = vim.fn.getpos(".")
    local start_line = math.min(start_pos[2], end_pos[2]) - 1
    local end_line = math.max(start_pos[2], end_pos[2])

    exit_visual_mode()

    vim.schedule(function()
    local files = vim.fn.globpath(expanded_dir, "*.md", false, true)
    local entries = { "+ New file" }
    for _, f in ipairs(files) do
        table.insert(entries, vim.fn.fnamemodify(f, ":t"))
    end

    require("fzf-lua").fzf_exec(entries, {
        prompt = "Export to> ",
        actions = {
            ["default"] = function(selected)
                if not selected or #selected == 0 then return end
                local choice = selected[1]
                local lines = vim.api.nvim_buf_get_lines(bufnr, start_line, end_line, false)

                if choice == "+ New file" then
                    vim.ui.input({ prompt = 'New filename (without ext): ' }, function(input)
                        if not input or input == "" then return end
                        local date_str = os.date("%Y%m%d")
                        local full_path = expanded_dir .. "/a_" .. date_str .. "_" .. input .. ".md"
                        local file = io.open(full_path, "w")
                        if file then
                            for _, line in ipairs(lines) do file:write(line .. "\n") end
                            file:close()
                            vim.api.nvim_buf_set_lines(bufnr, start_line, end_line, false, {})
                        else
                            print("Error: Could not create file " .. full_path)
                        end
                    end)
                else
                    local full_path = expanded_dir .. "/" .. choice
                    local file = io.open(full_path, "a")
                    if file then
                        file:write("\n--- " .. os.date("%Y-%m-%d %H:%M") .. " ---\n")
                        for _, line in ipairs(lines) do file:write(line .. "\n") end
                        file:close()
                        vim.api.nvim_buf_set_lines(bufnr, start_line, end_line, false, {})
                    else
                        print("Error: Could not open file " .. full_path)
                    end
                end
            end,
        },
    })
    end)
end

return M

