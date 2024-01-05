#!/bin/bash

# Script name: greet.sh

# Check if the first argument (name) is provided
if [ -z "$1" ]; then
    # Default name if not provided
    name="Guest"
else
    # Use the provided name
    name="$1"
fi

# Greet the user
echo "Hello, $name! Welcome to the script"
