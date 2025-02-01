def convert_hex_to_plain_text(input_file, output_file):
    # Open the input file in read mode and the output file in write mode
    with open(input_file, 'r', errors='ignore') as infile, open(output_file, 'w', encoding='utf-8') as outfile:
        # Read each line from the input file
        for line in infile:
            # Remove any whitespace (e.g., newline character) from the end of the line
            hex_value = line.strip()
            
            # Convert hex value to bytes
            byte_array = bytes.fromhex(hex_value)
            
            # Decode bytes using Latin-1 encoding to get plain text
            plain_text = byte_array.decode('latin-1')
            
            # Write the plain text to the output file
            outfile.write(plain_text)

# Provide the input and output file paths
input_file = 'AES decrypted with wrong key.txt'
output_file = 'AES FAILED!!.txt'

# Call the function to convert hex to plain text and write to the output file
convert_hex_to_plain_text(input_file, output_file)
