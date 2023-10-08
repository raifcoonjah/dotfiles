#!/bin/bash

# Define the path to the AppImage and the icon file
APPIMAGE_PATH="$pwd/whatsapp-desktop-linux-1.2.3-2.AppImage"
ICON_PATH="whatsapp-icon.png" # Assuming the icon file is in the current directory
DESKTOP_FILE_PATH="$HOME/Desktop/WhatsAppDesktop.desktop"

# Check if the AppImage and icon file exist
if [ ! -f "$APPIMAGE_PATH" ]; then
    echo "Error: AppImage not found at $APPIMAGE_PATH."
    exit 1
fi

if [ ! -f "$ICON_PATH" ]; then
    echo "Error: Icon file not found at $ICON_PATH."
    exit 1
fi

# Create the .desktop file
echo "[Desktop Entry]" > "$DESKTOP_FILE_PATH"
echo "Type=Application" >> "$DESKTOP_FILE_PATH"
echo "Name=WhatsApp Desktop" >> "$DESKTOP_FILE_PATH"
echo "Exec=\"$APPIMAGE_PATH\"" >> "$DESKTOP_FILE_PATH"
echo "Icon=$ICON_PATH" >> "$DESKTOP_FILE_PATH"
echo "Terminal=false" >> "$DESKTOP_FILE_PATH"
echo "Categories=Network;" >> "$DESKTOP_FILE_PATH"
echo "Comment=WhatsApp Desktop Client" >> "$DESKTOP_FILE_PATH"
echo "StartupWMClass=whatsapp-desktop" >> "$DESKTOP_FILE_PATH"

# Make the desktop file executable
chmod +x "$DESKTOP_FILE_PATH"

echo "Desktop file created at $DESKTOP_FILE_PATH. Please move to /usr/share/applications directory!"
