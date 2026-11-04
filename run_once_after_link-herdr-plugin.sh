#!/bin/sh
command -v herdr >/dev/null 2>&1 || exit 0
herdr plugin link "$HOME/.config/herdr/my-plugins/workspace-layout" || true
