from snowflake_loader import SnowflakeLoader


def main():

    loader = SnowflakeLoader()

    try:

        loader.connect()

        csv_files = loader.get_csv_files()

        print(f"\nFound {len(csv_files)} CSV files.\n")

        for csv_file in csv_files:
            loader.upload_file(csv_file)

        print("\n===================================")
        print("SUCCESS")
        print(f"Loaded {len(csv_files)} tables.")
        print("===================================")

    except Exception as e:

        print("\nERROR")
        print(e)
        raise

    finally:

        loader.disconnect()


if __name__ == "__main__":
    main()