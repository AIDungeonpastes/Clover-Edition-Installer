@echo off

title Clover Edition Installer
set curl=%~dp0curl\curl.exe

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

echo Now we'll install Git, so you can download and update Clover Edition.
start /wait %curl% -L -o %~dp0Git-2.24.1.2-64-bit.exe https://github.com/git-for-windows/git/releases/download/v2.24.1.windows.2/Git-2.24.1.2-64-bit.exe
start /wait %~dp0Git-2.24.1.2-64-bit.exe
:: This is a workaround to be able to use the updated path from the Python and Git install.
echo Going to main script...
start /wait %~dp0main.bat
cmd /k