import pandas as pd
import numpy as np
import argparse
import os

def is_purely_binary(series):
    """
    Check if a pandas Series contains only 0s and 1s
    
    Parameters:
    -----------
    series : pandas.Series
        Input series to check
    
    Returns:
    --------
    bool
        True if series contains only 0s and 1s, False otherwise
    """
    # Convert to string to handle potential numeric types
    str_series = series.astype(str)
    
    # Check if all values are either '0' or '1'
    return all(str_series.isin(['0', '1']))

def identify_decimal_columns(df):
    """
    Identify columns that contain numeric decimal values
    
    Parameters:
    -----------
    df : pandas.DataFrame
        Input DataFrame to analyze
    
    Returns:
    --------
    list
        List of column names containing decimal values
    """
    # Identify numeric columns that are not purely binary
    numeric_columns = []
    for col in df.select_dtypes(include=[np.number]).columns:
        # Skip columns that are purely binary (0s and 1s)
        if not is_purely_binary(df[col]):
            numeric_columns.append(col)
    
    return numeric_columns

def convert_decimal_to_padded_binary(df):
    """
    Convert decimal columns to binary with a single consistent bit length
    
    Parameters:
    -----------
    df : pandas.DataFrame
        Input DataFrame containing decimal columns
    
    Returns:
    --------
    tuple
        Processed DataFrame and conversion details
    """
    # Create a copy of the DataFrame to avoid modifying the original
    processed_df = df.copy()
    
    # Identify decimal columns
    decimal_columns = identify_decimal_columns(df)
    
    # Find the maximum decimal value across all identified columns
    max_decimal = 0
    for column in decimal_columns:
        column_max = int(processed_df[column].max())
        max_decimal = max(max_decimal, column_max)
    
    # Calculate the required bit length
    bit_length = max_decimal.bit_length()
    
    # Dictionary to store conversion details
    conversion_details = {
        'max_value': max_decimal,
        'bit_length': bit_length,
        'converted_columns': []
    }
    
    # Process each decimal column
    for decimal_column in decimal_columns:
        # Find the decimal column index
        decimal_col_index = processed_df.columns.get_loc(decimal_column)
        
        # Function to convert single decimal to padded binary
        def decimal_to_binary(decimal_val):
            """Convert a single decimal to padded binary string"""
            return f'{int(decimal_val):0{bit_length}b}'
        
        # Convert decimals to binary strings with zero-padding
        binary_strings = processed_df[decimal_column].apply(decimal_to_binary)
        
        # Store converted column name
        conversion_details['converted_columns'].append(decimal_column)
        
        # Prepare new bit columns
        for bit_position in range(bit_length):
            # Create column name for each bit
            col_name = f'{decimal_column}_bit_{bit_length - bit_position - 1}'
            
            # Convert binary string to bit value for each row
            bit_column = binary_strings.apply(lambda x: int(x[bit_position]))
            
            # Insert the bit column right after the decimal column
            processed_df.insert(decimal_col_index + bit_position + 1, col_name, bit_column)
    
    return processed_df, conversion_details

def process_csv(input_file):
    """
    Process a CSV file by converting decimal columns to binary
    
    Parameters:
    -----------
    input_file : str
        Path to the input CSV file
    
    Returns:
    --------
    str
        Path to the output CSV file
    """
    # Read the CSV file
    df = pd.read_csv(input_file)
    
    # Convert decimal to binary
    processed_df, conversion_details = convert_decimal_to_padded_binary(df)
    
    # Generate output filename
    base, ext = os.path.splitext(input_file)
    output_file = f"{base}_converted{ext}"
    
    # Save the processed DataFrame to a new CSV
    processed_df.to_csv(output_file, index=False)
    
    # Print conversion details
    print(f"\nProcessed CSV saved to {output_file}")
    print("\nConversion Details:")
    print(f"Maximum Value Across All Columns: {conversion_details['max_value']}")
    print(f"Consistent Bit Length Used: {conversion_details['bit_length']}")
    print("\nConverted Columns:")
    for column in conversion_details['converted_columns']:
        print(f"- {column}")
    
    return output_file

def main():
    # Set up argument parser
    parser = argparse.ArgumentParser(description='Convert decimal columns to binary digits')
    
    # Add positional argument for file path
    parser.add_argument('file_path', type=str, 
                        help='Path to the input CSV file')
    
    # Parse arguments
    args = parser.parse_args()
    
    # Process the CSV
    process_csv(args.file_path)

if __name__ == "__main__":
    main()