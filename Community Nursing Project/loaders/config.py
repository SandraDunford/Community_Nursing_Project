"""
Configuration settings for the Community Nursing Project loader.
"""

from pathlib import Path
from dotenv import load_dotenv
import os

# -------------------------------------------------------
# Load environment variables from .env
# -------------------------------------------------------

# Project root (Community Nursing Project)
PROJECT_ROOT = Path(__file__).resolve().parent.parent

# Load .env
load_dotenv(PROJECT_ROOT / ".env")

# -------------------------------------------------------
# Snowflake connection details
# -------------------------------------------------------

SNOWFLAKE_ACCOUNT = os.getenv("SNOWFLAKE_ACCOUNT")
SNOWFLAKE_USER = os.getenv("SNOWFLAKE_USER")
SNOWFLAKE_PASSWORD = os.getenv("SNOWFLAKE_PASSWORD")
SNOWFLAKE_WAREHOUSE = os.getenv("SNOWFLAKE_WAREHOUSE")
SNOWFLAKE_DATABASE = os.getenv("SNOWFLAKE_DATABASE")
SNOWFLAKE_SCHEMA = os.getenv("SNOWFLAKE_SCHEMA")

# -------------------------------------------------------
# Project folders
# -------------------------------------------------------

DATA_FOLDER = PROJECT_ROOT / "Data" / "csv"

LOG_FOLDER = PROJECT_ROOT / "logs"

# Create logs folder automatically if it doesn't exist
LOG_FOLDER.mkdir(exist_ok=True)

# -------------------------------------------------------
# File settings
# -------------------------------------------------------

FILE_EXTENSION = ".csv"