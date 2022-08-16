#!/bin/env bash

# Quit on error.
set -e

# Grab input arguments.
INPUT_IMAGE="${1}"
OUT_DIR="${2}"

# Image name without extension.
IMAGE_FILENAME=$(basename -- ${INPUT_IMAGE})
IMAGE_NAME="${IMAGE_FILENAME%.*}"
IMAGE_EXTENSION="${IMAGE_FILENAME##*.}"

# Copy the image as-is.
mkdir -p "${OUT_DIR}"

# Generate an image given a minimum size and suffix to convert.
generate_image() {
  MINIMUM_SIZE="${1}"
  SIZE_SUFFIX="${2}"
  IMAGE_WIDTH=$(identify -format "%[fx:w]" "${INPUT_IMAGE}")
  if [ "${IMAGE_WIDTH}" -gt "${MINIMUM_SIZE}" ]; then
    CONVERT_FILENAME="${OUT_DIR}/${IMAGE_NAME}_${SIZE_SUFFIX}.${IMAGE_EXTENSION}"
    CONVERT_FILENAME=$(realpath -sm $CONVERT_FILENAME)
    echo "Generating ${CONVERT_FILENAME}"
    convert "${INPUT_IMAGE}" \
        -filter Catrom -quality 100 \
        -resize "${MINIMUM_SIZE}" \
        "${CONVERT_FILENAME}"
  fi
}

# Resize images into different sizes if needed.
cp "${INPUT_IMAGE}" "${OUT_DIR}"
generate_image "80" "xs" &
generate_image "160" "s" &
generate_image "320" "m" &
generate_image "480" "l" &
generate_image "640" "xl" &
generate_image "1280" "xxl" &
wait
