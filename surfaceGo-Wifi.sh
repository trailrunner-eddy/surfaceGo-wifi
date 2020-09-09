#!/bin/bash

# Simple shell script to autofix no wifi support on Kali Linux on a Surface Go
# board.bin file needs to be in your ~/Downloads/ folder
# If you do not have the board.bin file and are connected via ethernet the script can download the file
# board.bin file was taken from: https://www.killernetworking.com/support/K1535_Debian
# I uploaded the file to GitHub incase the killernetworking link ever goes dead.

# Checking to make sure board.bin is present
if [[ -f ~/Downloads/board.bin ]]
then
    echo "You have the file. Requesting sudo access to rm and cp the file."
    # Replacing the old board.bin file
    sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
    sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw2.1

    # Replacing the old board.bin file in second location
    sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
    sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw3.0
else
    echo "Please download the board.bin file"
    # Providing the download within the script
    echo "Would you like to download the file [y/n]?"
    read input
    if [[ $input == 'y' || $input == 'Y' ]]
    then
        wget https://github.com/trailrunner-eddy/surfaceGo-wifi/blob/master/board.bin -P ~/Downloads/
        echo "File downloaded"
        # Replacing the old board.bin file
        sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
        sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw2.1

        # Same as above, just different location
        sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
        sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw3.0
    else
        echo "Make sure you place the board.bin file in ~/Downloads"
        echo "Download link: https://github.com/trailrunner-eddy/surfaceGo-wifi/blob/master/board.bin "
    fi    
fi
echo "Done!" 