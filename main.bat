@echo off

title Clover Edition Installer

start /wait pip install torch -f https://download.pytorch.org/whl/torch_stable.html
start /wait pip install transformers pyjarowinkler colorama
start /wait git clone --depth=1 "https://github.com/cloveranon/Clover-Edition/"
echo And now the last step is up to you, you need to torrent a model and place it in the models folder, more information here: https://github.com/cloveranon/Clover-Edition#models
cmd /k