#!/usr/bin/env zsh
set -e
set -u
set -o pipefail

SESSION="dashboard"   # session name
WIN="dashboard"       # window name
ROOT="$HOME"

# Commands
NEWS_CMD="newsboat"
TASK_CMD="task list"
NAVI_CMD="navi"
BTOP_CMD="btop"
WEATHER_CMD="curl v2d.wttr.in"  # refresh every 30 mins

# --- Guard ---
if tmux has-session -t "$SESSION" 2>/dev/null; then
  exit 0
fi

# --- Create session ---
tmux new-session -d -s "$SESSION" -n "$WIN" -c "$ROOT"
tmux setw -t "$SESSION":0 automatic-rename off

# Split into LEFT (≈33%) and RIGHT (≈67%)
LEFT=$(tmux display-message -p -t "$SESSION":0.0 '#{pane_id}')
RIGHT=$(tmux split-window -h -t "$LEFT" -c "$ROOT" -p 67 -P -F '#{pane_id}')

# LEFT column: 3 rows
L_BOTTOM=$(tmux split-window -v -t "$LEFT" -c "$ROOT" -p 33 -P -F '#{pane_id}')
L_MIDDLE=$(tmux split-window -v -t "$LEFT" -c "$ROOT" -p 50 -P -F '#{pane_id}')

# RIGHT block: top (60%) = btop, bottom (40%) = weather
R_BOTTOM=$(tmux split-window -v -t "$RIGHT" -c "$ROOT" -p 40 -P -F '#{pane_id}')

# Launch apps in panes
tmux send-keys -t "$LEFT"      "$NEWS_CMD" C-m
tmux send-keys -t "$L_MIDDLE"  "$TASK_CMD" C-m
tmux send-keys -t "$L_BOTTOM"  "$NAVI_CMD" C-m

tmux send-keys -t "$RIGHT"     "$BTOP_CMD" C-m
tmux send-keys -t "$R_BOTTOM"  "$WEATHER_CMD" C-m

# Done — leave session running in background
exit 0
