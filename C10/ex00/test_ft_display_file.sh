#!/bin/bash

# Compile the code
echo "Compiling ft_display_file..."
make
if [ $? -ne 0 ]; then
    echo "FAIL: Compilation failed"
    exit 1
fi
echo "PASS: Compilation successful"

# Create test files
echo "This is line 1" > test_file.txt
echo "This is line 2" >> test_file.txt
echo "This is line 3" >> test_file.txt

# Test 1: No arguments
echo "Test 1: No arguments"
./ft_display_file > output1.txt 2>&1
if [ $? -eq 1 ] && grep -q "File name missing" output1.txt; then
    echo "PASS: Displays 'File name missing.' when no arguments given"
else
    echo "FAIL: Did not display 'File name missing.' when no arguments given"
    cat output1.txt
fi
rm -f output1.txt

# Test 2: Valid file with content
echo "Test 2: Valid file with content"
./ft_display_file test_file.txt > output2.txt 2>&1
if [ $? -eq 0 ] && grep -q "This is line 1" output2.txt && grep -q "This is line 2" output2.txt && grep -q "This is line 3" output2.txt; then
    echo "PASS: Displays file content when file exists"
else
    echo "FAIL: Did not display file content when file exists"
    cat output2.txt
fi
rm -f output2.txt

# Test 3: Multiple arguments
echo "Test 3: Multiple arguments"
./ft_display_file test_file.txt test_file.txt > output3.txt 2>&1
if [ $? -eq 1 ] && grep -q "Too many arguments" output3.txt; then
    echo "PASS: Displays 'Too many arguments' when more than one argument given"
else
    echo "FAIL: Did not display 'Too many arguments' when more than one argument given"
    cat output3.txt
fi
rm -f output3.txt

# Test 4: Non-existent file
echo "Test 4: Non-existent file"
./ft_display_file non_existent_file.txt > output4.txt 2>&1
if [ $? -eq 1 ] && grep -q "Cannot read file" output4.txt; then
    echo "PASS: Displays 'Cannot read file' when file cannot be read"
else
    echo "FAIL: Did not display 'Cannot read file' when file cannot be read"
    cat output4.txt
fi
rm -f output4.txt

# Cleanup
echo "Cleaning up..."
rm -f test_file.txt
make clean

echo "All tests completed!"
