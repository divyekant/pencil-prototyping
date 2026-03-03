#!/usr/bin/env bash
# bin/pencil-start.sh — Install, launch, and manage Pencil.dev

set -euo pipefail

# Configurable paths (overridable for testing)
PENCIL_USER_APP="${PENCIL_USER_APP:-$HOME/Applications/Pencil.app}"
PENCIL_SYS_APP="${PENCIL_SYS_APP:-/Applications/Pencil.app}"

find_pencil() {
  if [ -d "${PENCIL_USER_APP}" ]; then
    echo "${PENCIL_USER_APP}"
    return 0
  elif [ -d "${PENCIL_SYS_APP}" ]; then
    echo "${PENCIL_SYS_APP}"
    return 0
  fi
  return 1
}

check_installed() {
  local path
  if path="$(find_pencil)"; then
    echo "Pencil is installed at ${path}"
    return 0
  else
    echo "Pencil is not installed"
    return 1
  fi
}

usage() {
  cat <<'USAGE'
Usage: pencil-start.sh [OPTIONS]

Options:
  --check     Check if Pencil is installed (exit 0=yes, 1=no)
  --install   Download and install Pencil
  --start     Launch Pencil and wait for readiness
  --status    Report install/running/port state
  --help      Show this help

No flag: run full sequence (check → install if needed → start)

Exit codes:
  0  Success (Pencil installed and running)
  1  Failure (timeout, download error, etc.)
  2  Installed but needs activation (first-time)
USAGE
}

main() {
  case "${1:-}" in
    --check) check_installed; exit $? ;;
    --help) usage; exit 0 ;;
    *) usage; exit 0 ;;
  esac
}

main "$@"
