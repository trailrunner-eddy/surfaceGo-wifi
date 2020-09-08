#!/bin/bash

# Simple shell script to autofix no wifi support on Kali Linux on a Surface Go
# Requires board.bin file in ~/Downloads/

# Checking to make sure board.bin is present
if [[ -f ~/Downloads/board.bin ]]
then
    echo "You have the file. Requesting sudo access to rm and cp the file."
    # Replacing the old board.bin file
    sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
    sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw2.1

    # Same as above, just different location
    sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
    sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw3.0
else
    echo "Make sure you download the board.bin file and place it in ~/Downloads/"
fi
echo "Done! Reboot for wifi to work!"