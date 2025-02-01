import binascii

def text_to_hex(text):
    hex_data = binascii.hexlify(text.encode()).decode()
    return hex_data

def partition_hex(hex_data, block_size=32):
    partitions = [hex_data[i:i+block_size] for i in range(0, len(hex_data), block_size)]
    # Pad the last partition if it's shorter than block_size
    if len(partitions[-1]) < block_size:
        partitions[-1] = partitions[-1].ljust(block_size, '0')
    return partitions

def convert_and_partition_text_file(input_file, output_file):
    with open(input_file, 'r',errors='ignore') as f:
        text = f.read().strip()
    
    hex_data = text_to_hex(text)
    partitions = partition_hex(hex_data, block_size=32)  # 32 hex characters = 128 bits

    with open(output_file, 'w') as f:
        for partition in partitions:
            f.write(partition + '\n')

# Example usage:
input_file = 'AES.txt'
output_file = 'AES partitioned.txt'
convert_and_partition_text_file(input_file, output_file)
