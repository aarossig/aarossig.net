#!/bin/env bash

# Quit on error.
set -e

# Strip all EXIF data.
exiftool -overwrite_original -all= "${1}"
