#!/bin/bash
set -e

export DISPLAY=:1

echo ">>> تشغيل الشاشة الوهمية..."
Xvfb :1 -screen 0 1366x768x24 &
sleep 2

echo ">>> تشغيل مدير النوافذ..."
fluxbox &
sleep 1

echo ">>> تشغيل كروم..."
chromium-browser --no-sandbox --disable-gpu --disable-dev-shm-usage --start-maximized &
sleep 2

echo ">>> تشغيل خادم VNC..."
x11vnc -display :1 -forever -nopw -quiet -shared &
sleep 1

echo ">>> تشغيل noVNC على البورت 6080..."
websockify --web=/usr/share/novnc/ 6080 localhost:5900 &

echo ">>> كل الخدمات شغالة. افتح تبويب Ports وادخل على البورت 6080."
