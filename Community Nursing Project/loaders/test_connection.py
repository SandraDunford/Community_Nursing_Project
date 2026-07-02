from snowflake_loader import SnowflakeLoader

loader = SnowflakeLoader()

loader.connect()

csv_files = loader.get_csv_files()

loader.upload_file(csv_files[0])

loader.disconnect()