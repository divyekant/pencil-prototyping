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
