#!/usr/bin/env bats

load test_helper

@test "script exists and is executable" {
  [ -f "${PENCIL_START}" ]
  [ -x "${PENCIL_START}" ]
}

@test "--help prints usage" {
  run "${PENCIL_START}" --help
  [ "$status" -eq 0 ]
  [[ "$output" == *"Usage"* ]]
}

@test "--check returns 0 when Pencil.app exists at user Applications" {
  mkdir -p "${TEST_TEMP}/Applications/Pencil.app"
  PENCIL_USER_APP="${TEST_TEMP}/Applications/Pencil.app" \
    run "${PENCIL_START}" --check
  [ "$status" -eq 0 ]
  [[ "$output" == *"installed"* ]]
}

@test "--check returns 0 when Pencil.app exists at system Applications" {
  mkdir -p "${TEST_TEMP}/SysApplications/Pencil.app"
  PENCIL_USER_APP="${TEST_TEMP}/Applications/Pencil.app" \
  PENCIL_SYS_APP="${TEST_TEMP}/SysApplications/Pencil.app" \
    run "${PENCIL_START}" --check
  [ "$status" -eq 0 ]
}

@test "--check returns 1 when Pencil.app not found" {
  PENCIL_USER_APP="${TEST_TEMP}/Applications/Pencil.app" \
  PENCIL_SYS_APP="${TEST_TEMP}/SysApplications/Pencil.app" \
    run "${PENCIL_START}" --check
  [ "$status" -eq 1 ]
  [[ "$output" == *"not installed"* ]]
}
