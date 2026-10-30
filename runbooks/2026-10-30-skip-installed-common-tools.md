# Skip installed common tools

## Objective

Update `debian-13-lxc.sh` to avoid reinstalling common tools that are already installed.

## Initial state

The script always passed the full common package list to `apt install`. The current checkout has no runbooks directory; an earlier runbook was removed in a later repository commit, so this task adds a new overview for the current runbook.

## Actions

- Used `dpkg-query` to identify packages not in the `installed` state.
- Limited the `apt install` invocation to missing packages and added a message when all are installed.

## Verification

`sh -n debian-13-lxc.sh` and `git diff --check` passed. No packages were installed or removed during this change.

## Final state

The common tools step skips apt installation when every listed package is installed, and installs only packages that are missing.
