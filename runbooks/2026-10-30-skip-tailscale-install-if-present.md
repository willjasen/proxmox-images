# Skip Tailscale installation if present

## Objective

Make `debian-13-lxc.sh` avoid reinstalling Tailscale when the `tailscale` command is already available.

## Initial state

The script unconditionally ran the Tailscale installer. The repository had no runbook directory or overview.

## Actions

- Added a `command -v tailscale` check and a skip message; the installer runs only when the command is absent.
- Checked shell syntax with `sh -n debian-13-lxc.sh`.

## Verification

The shell syntax check passed. The diff was reviewed to confirm the change is limited to the Tailscale installation block and this runbook documentation.

## Final state

Tailscale installation is skipped when its CLI is already on `PATH`. No installation was run against a live system.
