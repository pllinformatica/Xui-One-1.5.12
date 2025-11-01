#!/bin/bash

INSTALLER="xui-1.5.13.tar.gz"
URL="https://valut.iptvtools.io/xuione/$INSTALLER"

echo ""
echo "==============================================="
echo " Welcome to the XUI Installer"
echo " This project is proudly provided by IPTVTOOLS.io"
echo "==============================================="
echo ""

echo "[*] Downloading XUI installer package..."

wget --quiet --show-progress --progress=bar:force:noscroll "$URL" -O "$INSTALLER" 2>&1

if [ ! -f "$INSTALLER" ]; then
    echo "[!] Download failed. Exiting."
    exit 1
fi

echo ""
echo "[*] Extracting files..."
tar -xzf "$INSTALLER" || { echo "[!] Extraction failed!"; exit 1; }

echo "[*] Cleaning up downloaded archive..."
rm -f "$INSTALLER"

echo "[*] Setting permissions..."
chmod +x install

echo "[*] Starting XUI install..."
./install
