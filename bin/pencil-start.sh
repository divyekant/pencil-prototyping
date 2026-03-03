#!/usr/bin/env bash
# bin/pencil-start.sh — Install, launch, and manage Pencil.dev

set -euo pipefail

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
    --help) usage; exit 0 ;;
    *) usage; exit 0 ;;
  esac
}

main "$@"
