function module_duf_setup() {
  bl64_dbg_app_show_function "$@"
  local home="$1"
  local module_type="$SYSDEN64_MODULE_TYPE_SHARED"
  local model='duf'
  local source=''

  [[ -z "$(bl64_bsh_command_locate 'duf')" ]] &&
    bl64_dbg_app_show_info "$SYSDEN64_TXT_NOT_DETECTED" && return 0
  bl64_msg_show_phase 'prepare DUF'

  source="$(module_set_model "$module_type" "$model")" &&
    module_setup_env "$home" "$source"
}
