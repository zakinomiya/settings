#!/bin/sh
# Claude Code status line — inspired by Powerlevel10k (dir · vcs · context · time)
input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd')
model=$(echo "$input" | jq -r '.model.display_name // .model.id')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# Shorten home directory to ~
home="$HOME"
short_cwd=$(echo "$cwd" | sed "s|^$home|~|")

# Git branch (skip optional lock to avoid hanging)
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(GIT_OPTIONAL_LOCKS=0 git -C "$cwd" symbolic-ref --short HEAD 2>/dev/null \
           || GIT_OPTIONAL_LOCKS=0 git -C "$cwd" rev-parse --short HEAD 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=" \033[33m($branch)\033[0m"
  fi
fi

# Context usage indicator
ctx_info=""
if [ -n "$used" ]; then
  used_int=$(printf "%.0f" "$used")
  if [ "$used_int" -ge 80 ]; then
    ctx_info=" \033[31mctx:${used_int}%\033[0m"
  elif [ "$used_int" -ge 50 ]; then
    ctx_info=" \033[33mctx:${used_int}%\033[0m"
  else
    ctx_info=" \033[32mctx:${used_int}%\033[0m"
  fi
fi

# Time
now=$(date +%H:%M)

# user@host
userhost="$(whoami)@$(hostname -s)"

printf "\033[34m%b\033[0m%b  \033[35m%b\033[0m  \033[36m%b\033[0m  %b%b" \
  "$short_cwd" "$git_branch" "$userhost" "$model" "$now" "$ctx_info"
