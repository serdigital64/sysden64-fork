# Version: 1.1.2
function module_starship_setup() {
  bl64_dbg_app_show_function "$@"
  local home="$1"
  local module_type="$SYSDEN64_MODULE_TYPE_SHARED"
  local model='starship'
  local source=''
  local config='.config/starship.toml'
  local target="${home}/${config}"

  [[ -z "$(bl64_bsh_command_locate 'starship')" || -z "$(bl64_bsh_command_locate 'bash')" ]] &&
    bl64_dbg_app_show_info "$SYSDEN64_TXT_NOT_DETECTED" && return 0
  bl64_msg_show_phase 'prepare Starship'

  source="$(module_set_model "$module_type" "$model")" &&
    module_setup_env "$home" "$source" ||
    return $?

  module_config_backup "$model" "$target" || return $?
  bl64_msg_show_task "promote configuration from model (${model}/${config})"
  bl64_fs_path_copy \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "${home}/.config" \
    "${source}/${config}"
}
