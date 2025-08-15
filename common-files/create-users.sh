#!/bin/bash

USER_TO_CREATE="home-operator"
 

# create home operator
if id "$USER_TO_CREATE" &>/dev/null; then
    echo "User '$USER_TO_CREATE' already exists."
else
    #create the group
    sudo groupadd -g 1001 "$USER_TO_CREATE"
    # Create the user
    sudo useradd -m -s /bin/bash -u 1001 -g 1001 "$USER_TO_CREATE"
    sudo usermod -aG sudo,adm,backup,operator "$USER_TO_CREATE"
    if [ $? -eq 0 ]; then
        echo "User home-operator has been created successfully."
    else
        echo "Failed to create user home-operator."
    fi
fi

