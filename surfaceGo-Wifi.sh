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
    # Providing the download within the script
    echo "Would you like to download the file [y/n]?"
    read input
    if [[ $input == 'y' || $input == 'Y' ]]
    then
        wget http://www.killernetworking.com/support/K1535_Debian/board.bin -P ~/Downloads/
        echo "File downloaded"
        # Replacing the old board.bin file
        sudo rm /lib/firmware/ath10k/QCA6174/hw2.1/board.bin
        sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw2.1

        # Same as above, just different location
        sudo rm /lib/firmware/ath10k/QCA6174/hw3.0/board.bin
        sudo cp ~/Downloads/board.bin /lib/firmware/ath10k/QCA6174/hw3.0
    else
        echo "Make sure you place the board.bin file in ~/Downloads"
        echo "Download link: http://www.killernetworking.com/support/K1535_Debian/board.bin "
    fi    
fi
echo "Done!"