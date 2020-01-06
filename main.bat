@echo off

title Clover Edition Installer
setlocal
if exist %USERPROFILE%\AppData\Local\Programs\Python\Python37\Scripts set PATH=%PATH%;%USERPROFILE%\AppData\Local\Programs\Python\Python37\Scripts
set aria=%~dp0aria2\aria2c.exe

start /wait pip install torch -f https://download.pytorch.org/whl/torch_stable.html
start /wait pip install transformers colorama
start /wait git clone --depth=1 "https://github.com/cloveranon/Clover-Edition/"
echo We are now starting to download the model, It will take a while to get up to speed.
echo DHT errors are normal.
echo After the model is finished downloading, it will seed for 120 minutes or until it reaches a ratio of 1.0
echo You can still play the game while it's seeding, to play the game open the Clover-Edition directory in your terminal of choice and type python (or python3) play.py
echo For terminal I would recommend cmder (https://cmder.net) or windows terminal (https://github.com/microsoft/terminal/releases) if you use windows 10.
start /wait %aria% --dir=Clover-Edition\models --max-connection-per-server 16 --split 64 --bt-max-peers 500 --seed-ratio=1.0 --seed-time=120 --summary-interval=15 --disable-ipv6 --check-integrity --stderr --torrent-file=Clover-Edition\model.torrent
cmd /k
