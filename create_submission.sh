#!/bin/bash

# Script to create submission package for the assignment

echo "Creating submission package..."
echo "================================"

# Check if base notebook exists
if [ ! -f "hw1_programming_base_notebook.ipynb" ]; then
    echo "Error: hw1_programming_base_notebook.ipynb not found!"
    exit 1
fi

# Check if data files exist
if [ ! -f "wdbc.data" ] || [ ! -f "wdbc.names" ]; then
    echo "Error: Dataset files not found!"
    exit 1
fi

# Create a temporary directory for submission
TEMP_DIR="submission_temp"
mkdir -p "$TEMP_DIR"

# Copy required files
echo "Copying files..."
cp hw1_programming_base_notebook.ipynb "$TEMP_DIR/"
cp wdbc.data "$TEMP_DIR/"
cp wdbc.names "$TEMP_DIR/"
cp requirements.txt "$TEMP_DIR/"
cp README.md "$TEMP_DIR/"

# Optional: Also include solution notebook for reference
if [ -f "hw1_programming_solution.ipynb" ]; then
    echo "Including solution notebook for reference..."
    cp hw1_programming_solution.ipynb "$TEMP_DIR/"
fi

# Optional: Convert notebook to PDF if nbconvert is available
if command -v jupyter &> /dev/null; then
    echo "Converting notebook to PDF (optional)..."
    jupyter nbconvert --to pdf hw1_programming_base_notebook.ipynb --output "$TEMP_DIR/hw1_programming_base_notebook.pdf" 2>/dev/null || echo "PDF conversion skipped (optional)"
fi

# Create zip file
ZIP_NAME="hw1_programming_submission.zip"
echo "Creating zip file: $ZIP_NAME"
cd "$TEMP_DIR"
zip -r "../$ZIP_NAME" * > /dev/null
cd ..

# Clean up
rm -rf "$TEMP_DIR"

# Check file size
FILE_SIZE=$(du -h "$ZIP_NAME" | cut -f1)
echo "================================"
echo "Submission package created: $ZIP_NAME"
echo "File size: $FILE_SIZE"
echo ""

# Check if under 10MB
SIZE_BYTES=$(stat -f%z "$ZIP_NAME" 2>/dev/null || stat -c%s "$ZIP_NAME" 2>/dev/null)
MAX_SIZE=$((10 * 1024 * 1024)) # 10 MB in bytes

if [ "$SIZE_BYTES" -lt "$MAX_SIZE" ]; then
    echo "✓ File size is under 10 MB requirement"
else
    echo "⚠ Warning: File size exceeds 10 MB!"
fi

echo ""
echo "Contents:"
unzip -l "$ZIP_NAME"
