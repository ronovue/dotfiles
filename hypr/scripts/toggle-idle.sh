#!/bin/bash

if pgrep hypridle > /dev/null; then
    pkill hypridle
    notify-send "🛑 Hypridle paused"
else
    hypridle &
    notify-send "✅ Hypridle resumed"
fi
