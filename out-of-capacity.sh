#!/usr/bin/env bash

TERMINATE=0;
delay=1;

function abort {
    TERMINATE=1;
}

trap abort 0 1 2 3 6 9 15;

# Retry until succeed or terminated gracefully.
while true; do
    terraform apply -no-color -auto-approve # 1> /dev/null;
    
    # Check if the script should terminate gracefully.
    if [[ $TERMINATE -eq 1 ]]; then
        echo "Terminating script gracefully..."
        break;
    fi;
    
    # Ask for user input to check if they want to terminate the script.
    echo "Press 'q' and Enter to terminate the script gracefully."
    read -t $delay -n 1 input
    if [[ $input = "q" ]]; then
        echo "Terminating script gracefully..."
        break;
    fi;
done;
