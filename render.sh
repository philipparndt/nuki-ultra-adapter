#!/usr/bin/env bash

# Check if OpenSCAD is installed
if ! command -v openscad &> /dev/null; then
    echo "Error: OpenSCAD is not installed. Please install it and try again."
    exit 1
fi

# Check for input arguments
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 input.scad output.stl"
    exit 1
fi

# Input and output file paths
INPUT_FILE="$1"
OUTPUT_FILE="$2"

# Check if the input file exists
if [ ! -f "$INPUT_FILE" ]; then
    echo "Error: Input file '$INPUT_FILE' does not exist."
    exit 1
fi

# Render the SCAD file to STL
echo "Rendering '$INPUT_FILE' to '$OUTPUT_FILE'..."
openscad --export-format binstl -o "$OUTPUT_FILE" "$INPUT_FILE"

if [ $? -eq 0 ]; then
    echo "Successfully rendered to '$OUTPUT_FILE'."
else
    echo "Error: Failed to render '$INPUT_FILE' to STL."
    exit 1
fi
