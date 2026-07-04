"""
Snowflake Loader
Community Nursing Project
"""

from pathlib import Path

import snowflake.connector

from config import (
    SNOWFLAKE_ACCOUNT,
    SNOWFLAKE_USER,
    SNOWFLAKE_PASSWORD,
    SNOWFLAKE_WAREHOUSE,
    SNOWFLAKE_DATABASE,
    SNOWFLAKE_SCHEMA,
    DATA_FOLDER
)


class SnowflakeLoader:

    def __init__(self):

        self.conn = None
        self.cursor = None

    def connect(self):

        print("Connecting to Snowflake...")

        self.conn = snowflake.connector.connect(
            account=SNOWFLAKE_ACCOUNT,
            user=SNOWFLAKE_USER,
            password=SNOWFLAKE_PASSWORD,
            warehouse=SNOWFLAKE_WAREHOUSE,
            database=SNOWFLAKE_DATABASE,
            schema=SNOWFLAKE_SCHEMA
        )

        self.cursor = self.conn.cursor()

        print("Connected.")

    def disconnect(self):

        if self.cursor:
            self.cursor.close()

        if self.conn:
            self.conn.close()

        print("Connection closed.")

    def get_csv_files(self):

        return sorted(DATA_FOLDER.glob("*.csv"))
    
    def upload_file(self, csv_path: Path):

        table_name = csv_path.stem.upper()

        print(f"\nLoading {table_name}...")

        # Delete existing data
        self.cursor.execute(f"TRUNCATE TABLE {table_name}")

        # Upload the file to Snowflake's temporary stage
        put_sql = f"""
        PUT 'file://{csv_path.as_posix()}'
        @%{table_name}
        OVERWRITE = TRUE;
        """

        self.cursor.execute(put_sql)

        # Load the file into the table
        copy_sql = f"""
        COPY INTO {table_name}
        FROM @%{table_name}
        FILE_FORMAT = (
            TYPE = CSV
            SKIP_HEADER = 1
            FIELD_OPTIONALLY_ENCLOSED_BY = '"'
        );
        """

        self.cursor.execute(copy_sql)

        print(f"✓ {table_name} loaded successfully.")