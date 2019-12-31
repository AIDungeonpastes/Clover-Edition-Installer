@echo off

title Clover Edition Installer
set aria=%~dp0aria2\aria2c.exe

start /wait pip install torch -f https://download.pytorch.org/whl/torch_stable.html
start /wait pip install transformers pyjarowinkler colorama
start /wait git clone --depth=1 "https://github.com/cloveranon/Clover-Edition/"
echo We are now starting to download the model.
echo It will take a while to get up to speed.
echo DHT errors are normal.
start /wait %aria% --max-connection-per-server 16 --split 64 --bt-max-peers 500 --seed-ratio=1.0 --seed-time=120 --summary-interval=15 --disable-ipv6 --check-integrity --stderr "https://raw.githubusercontent.com/cloveranon/Clover-Edition/master/model.torrent"
move model_v5_pytorch Clover-Edition\models\pytorch-gpt2-xl-aid2-v5
echo The setup for Clover Edition has completed successfully, to play the game open the Clover-Edition directory in your terminal of choice and type python (or python3) play.py
echo For terminal I would recommend cmder (https://cmder.net) or windows terminal (https://github.com/microsoft/terminal/releases) if you use windows 10. 
cmd /k
