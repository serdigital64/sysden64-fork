function sysden64_terraform_setup() {
  bl64_dbg_app_show_function "$@"
  local home="$1"
  local model="${SYSDEN64_PATH_ETC}/terraform"

  bl64_msg_show_phase 'prepare Terraform'
  ! bl64_bsh_command_is_executable 'terraform' &&
    bl64_msg_show_warning "$SYSDEN64_TXT_NOT_DETECTED" && return 0

  bl64_fs_path_copy \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "$BL64_VAR_DEFAULT" \
    "${home}/${SYSDEN64_PATH_SHELLENV}" \
    "${model}/${SYSDEN64_PATH_SHELLENV}"/*.env
}