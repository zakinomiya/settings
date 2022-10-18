#!/bin/zsh

set -v

SETTINGS_DIR=$(pwd)
CONFIG_DIR=${XDG_CONFIG_HOME}
DEFAULT_CONFIG_DIR="${HOME}/.config"
PACKAGE_LIST="packages.txt"

function func_start() {
  echo "**********Func Start(${FUNCNAME[1]})************"
}

function func_end() {
  echo "***********Func End(${FUNCNAME[1]})*************"
}

function testing() {
  local args=($@)
  local func=${args[1]}
  local funcArgs="${args[@]:2}"

  printf "testing func %s\n" "$func"
  "${func}" "${funcArgs[*]}"
}

function mkdir_if_not_exist() {
  func_start 
  dir=$1
  printf "dir=%s\n" ${dir}
  if test "${dir}" ;then
    func_end
    return
  fi
  mkdir ${dir}
  echo "Directory ${dir} created"
  fund_end 
}

function setup_vim() {
  func_start

  echo "Installing dein"
  curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > installer.sh
  sh ./installer.sh ~/.cache/dein
  
  func_end
}


function install_zsh_template() {
  func_start

  curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh
  THEME_PATH=${HOME}/.oh-my-zsh/custom/themes/powerlevel10k
  if [ ! -e ${THEME_PATH} ]; then
    echo "Installing the theme (powelevel10k)"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
  else
    echo "powerlevel10k already installed. skipping"
  fi

  func_end
}

function link_dotfiles() {
  func_start
  cd ${SETTINGS_DIR}
  mkdir_if_not_exist ${CONFIG_DIR} && ln -snfv ${SETTINGS_DIR}/nvim ${CONFIG_DIR}/nvim

  pushd dots
  for f in .??*; do
    [[ ${f} = ".git" ]] && continue
    [[ ${f} = ".gitignore" ]] && continue
    ln -snfv ${SETTINGS_DIR}/dots/${f} ${HOME}/${f}
    source ${f} 2>/dev/null
  done

  popd
  func_end
}

function link_cmds() {
  func_start
  pushd cmds
  for f in *.sh; do
    local cmdname=$(echo ${f} | sed 's/\.sh//')
    ln -snfv ${SETTINGS_DIR}/cmds/${f} /usr/local/bin/${cmdname}
    source ${f} 2>/dev/null
  done
  popd
  func_end
}

function install_packages() {
  func_start

  while read package; do
    sudo apt-get install -y $package 
  done < $PACKAGE_LIST

  func_end
}

function run() {
  echo "===============Start Running================="

  install_packages

  printf "SETTINGS_DIR=%s\n" ${SETTINGS_DIR}
  if [ -z ${CONFIG_DIR} ]; then
    echo "==============NOTICE================"
    echo "XDG_CONFIG_HOME has not been set."
    echo "Using ${DEFAULT_CONFIG_DIR}?"
    echo "===================================="
    CONFIG_DIR=${DEFAULT_CONFIG_DIR}
  fi

  install_zsh_template 
  # setup_vim
  # link_dotfiles
  # link_cmds

  echo "Done setting links"
  echo "===============Stop Running=================="
}

[[ -z $1 ]] && cat <<EOF
Please provide one of the subcommands below.
  run : run the script. 
  test <func_name> <...args>: unit test a function.
EOF

[[ $1 = "test" ]] && testing $@
[[ $1 = "run" ]] && run

