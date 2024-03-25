# Warning: configuration file generated by SysDen64. DO NOT MODIFY
# Version: 1.0.0

[[ -f '/etc/bashrc' ]] &&
  source '/etc/bashrc'

if ! [[ "$PATH" =~ "${HOME}/.local/bin:${HOME}/bin:" ]]; then
  PATH="${HOME}/.local/bin:${HOME}/bin:${PATH}"
fi
export PATH

if [[ -d "${HOME}/.bashrc.d" ]]; then
  _module=""
  for _module in "${HOME}/.bashrc.d"/*.sh; do
    [[ -r "$_module" ]] &&
      source "$_module"
  done
  unset _module
fi
