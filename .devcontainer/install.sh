#!/bin/bash
set -e

echo ">>> تحديث النظام وتثبيت البرامج المطلوبة..."
sudo apt-get update -y
sudo apt-get install -y \
    xvfb \
    fluxbox \
    x11vnc \
    novnc \
    websockify \
    chromium-browser \
    wget \
    curl

echo ">>> تم التثبيت بنجاح."
