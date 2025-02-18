# Enhanced Cryptographic System using Modified AES Algorithm

# Introduction

This project explores cryptographic complexities, focusing on the AES algorithm, a robust symmetric block cipher technique. Initially, the standard Mix Columns and Inverse Mix Columns operations were removed to analyze their impact on computational efficiency and the Avalanche effect. However, to maintain diffusion and confusion properties, these operations were reintroduced. An optimized AES-128 cryptographic system was designed using Verilog in Xilinx ISE. Enhancements in the SubBytes process improved the Avalanche effect by 1%, boosting data security. Optimizations in Mix Columns and Inverse Mix Columns reduced area by 30% and power by 14%, while improving delay but increasing encryption time. Cadence EDA analysis showed a 12% decrease in ADP and 22% in PDP, improving efficiency. File handling operations converted plain text into 128-bit hexadecimal values, which were input into the AES system. This enabled successful encryption and decryption of a text file, enhancing both security and performance.

# Languages and Tools
Tools: Xilinx ISE, Cadence Genus Synthesis Solution
Languages: Verilog, Python
