#!/bin/sh
SESSION=$USER

tmux -2 new-session -d -s $SESSION

tmux new-window -t $SESSION:1 -n 'Development'
tmux split-window -h
tmux select-pane -t 0
tmux send-keys "vim" C-m
tmux select-pane -t 1
tmux send-keys "tail -f /var/log/{messages,kernel,dmesg,syslog} | ccze" C-m
tmux split-window -v
tmux resize-pane -D 10
tmux send-keys "newsbeuter" C-m
# Setup a CoffeeScript compiler/watchdog pane
tmux select-pane -t 0
tmux split-window -v
tmux resize-pane -D 10
tmux send-keys "" C-m

# Setup a MySQL window
tmux new-window -t $SESSION:2 -n 'File Commander' 'mc'

# Set default window
tmux select-window -t $SESSION:1

# Attach to session
tmux -2 attach-session -t $SESSION
