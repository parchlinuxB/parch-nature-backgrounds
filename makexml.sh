#!/bin/bash

# Directory containing the images
image_dir=$(pwd)  # Current directory where the script is located

# Output XML file
output_file="wallpapers.xml"

# Function to generate the XML content for a single wallpaper
generate_wallpaper_xml() {
  local name=$1
  local filename=$2
  local pcolor=$3
  local scolor=$4

  echo "  <wallpaper deleted=\"false\">"
  echo "    <name>${name}</name>"
  echo "    <filename>${filename}</filename>"
  echo "    <options>zoom</options>"
  echo "    <shade_type>solid</shade_type>"
  echo "    <pcolor>${pcolor}</pcolor>"
  echo "    <scolor>${scolor}</scolor>"
  echo "  </wallpaper>"
}

# XML header
cat <<EOL > "$output_file"
<?xml version="1.0"?>
<!DOCTYPE wallpapers SYSTEM "gnome-wp-list.dtd">
<wallpapers>
EOL

# Colors for the wallpapers
colors=("#241f31" "#0B0021")

# Counter for naming
counter=1

# Loop through jpg, jpeg, and png files in the directory
for file in "$image_dir"/*.{jpg,jpeg,png}; do
  if [[ -f $file ]]; then
    # Determine the name and colors for the wallpaper
    base_name=$(basename "$file")
    name="Background ${counter}"
    pcolor=${colors[$((counter % 2))]}
    scolor="#000000"
    xml_filename="/usr/share/wallpapers/parch-nature/$base_name"

    # Generate the XML for the wallpaper
    generate_wallpaper_xml "$name" "$xml_filename" "$pcolor" "$scolor" >> "$output_file"

    # Increment the counter
    counter=$((counter + 1))
  fi
done

# XML footer
echo "</wallpapers>" >> "$output_file"

echo "XML file $output_file has been created."

