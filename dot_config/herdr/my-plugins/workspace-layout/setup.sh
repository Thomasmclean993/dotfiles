#!/bin/sh
h="${HERDR_BIN_PATH:-herdr}"
ws="$HERDR_WORKSPACE_ID"
[ -n "$ws" ] || exit 0

pane="$HERDR_PANE_ID"
if [ -z "$pane" ]; then
  pane=$("$h" pane list | jq -r --arg ws "$ws" '[.result.panes[] | select(.workspace_id == $ws)][0].pane_id')
fi
[ -n "$pane" ] && [ "$pane" != "null" ] || exit 0

right=$("$h" pane split --pane "$pane" --direction right --ratio 0.5 | jq -r '.result.pane.pane_id')
"$h" pane split --pane "$right" --direction down --ratio 0.8 >/dev/null
"$h" pane run "$right" claude
"$h" pane run "$pane" nvim .
