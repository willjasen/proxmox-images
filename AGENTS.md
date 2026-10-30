# Repository Instructions

## Scope

This repository contains helper scripts for preparing Proxmox image templates. Keep changes focused on this workflow and document user-facing setup assumptions in `README.md`.

## Shell scripts

- Keep scripts POSIX `/bin/sh` compatible unless a script explicitly requires another shell.
- Review commands that update packages, install software, or pipe downloaded content into a shell; explain their effect and prerequisites in the README when they affect usage.
- Do not run provisioning scripts against a live host as part of local verification.
- For shell-only changes, use `sh -n <script>` and review the diff. Do not claim runtime behavior was tested unless it was.

## Documentation

- Runbooks are not needed for this project.
