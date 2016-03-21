#!/bin/bash
SESSION=$USER

tmux -2 new -d -s $SESSION
tmux rename-window 'bench-repo' 
tmux send-keys -t $SESSION 'cd ~/bench-repo' C-m

tmux new-window
tmux rename-window 'frappe'
tmux send-keys -t $SESSION 'cd ~/bench/apps/frappe' C-m

tmux new-window
tmux rename-window 'erpnext'
tmux send-keys -t $SESSION 'cd ~/bench/apps/erpnext' C-m

tmux new-window
tmux rename-window 'shell'
tmux send-keys -t $SESSION 'cd ~' C-m

