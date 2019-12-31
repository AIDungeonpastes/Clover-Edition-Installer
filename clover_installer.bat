@echo off

title Clover Edition Installer
set curl=%~dp0curl\curl.exe
set git=%~dp0mingit\cmd\git.exe

echo We'll start by installing Python, and remember to tick the ADD PIP TO PATH option.
start /wait %curl% -o %~dp0python-3.7.6-amd64.exe https://www.python.org/ftp/python/3.7.6/python-3.7.6-amd64.exe
start /wait %~dp0python-3.7.6-amd64.exe
echo Now we install Nvidia CUDA.
set /p versionprompt=What version of Windows are you on? (Options: 10, 8.1, 7)
if "%versionprompt%"=="10" (
	start /wait %curl% -o %~dp0cuda_10.2.89_441.22_win10.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_win10.exe
	start /wait %~dp0cuda_10.2.89_441.22_win10.exe
)

if "%versionprompt%"=="8.1" (
	start /wait %curl% -o %~dp0cuda_10.2.89_441.22_windows.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_windows.exe
	start /wait %~dp0cuda_10.2.89_441.22_windows.exe
)

if "%versionprompt%"=="7" (
	start /wait %curl% -o %~dp0cuda_10.2.89_441.22_windows.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_windows.exe
	start /wait %~dp0cuda_10.2.89_441.22_windows.exe
)
:: This is a workaround to be able to use the updated path from the Python install.
echo Going to main script...
start /wait %~dp0main.bat
cmd /k