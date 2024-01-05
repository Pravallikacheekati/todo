#!/bin/bash

# Check if the script is provided with at least one argument
if [ "$#" -lt 1 ]; then
    echo "Usage: $0 <name>"
    exit 1
fi

# Access the first argument as the name
name=$1

# Print a message using the provided name
echo "Hello, $name!"

