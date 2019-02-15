#!/bin/bash
tmux new-session  -s mysession -d 'htop'
tmux split-window -v 'sudo tcpdump port 443 or port 80' #run tcpdump
tmux select-pane -t 0
tmux split-window -h 
tmux clock -t mysession
tmux select-pane -t 2
tmux attach-session -t mysession

