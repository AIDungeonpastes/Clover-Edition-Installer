@echo off

title Clover Edition Installer
setlocal
set aria=%~dp0aria2\aria2c.exe

echo We'll start by installing Python, and remember to tick the 'Add Python 3.7 to PATH' box.
if not exist %USERPROFILE%\AppData\Local\Programs\Python\Python37 (
	:pyinst
	start /wait %aria% -d %~dp0 -o python-3.7.6-amd64.exe https://www.python.org/ftp/python/3.7.6/python-3.7.6-amd64.exe
		echo cc31a9a497a4ec8a5190edecc5cdd303  python-3.7.6-amd64.exe | hashsum /a MD5 /c /q && (
		echo Hashcheck on python-3.7.6-amd64.exe passed.
		start /wait %~dp0python-3.7.6-amd64.exe
	) || (
		echo Hashcheck on python-3.7.6-amd64.exe failed! Redownloading...
		goto pyinst
	)
)

if exist %USERPROFILE%\AppData\Local\Programs\Python\Python37 echo Python 3.7 already installed, moving on...

echo Now we install Nvidia CUDA.
set /p versionprompt="What version of Windows are you on? (Options: 10, 8.1, 7)> "
if "%versionprompt%"=="10" (
	:cuda10inst
	start /wait %aria% -d %~dp0 -o cuda_10.2.89_441.22_win10.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_win10.exe
		echo d9f5b9f24c3d3fc456a3c789f9b43419  cuda_10.2.89_441.22_win10.exe | hashsum /a MD5 /c /q && (
		echo Hashcheck on cuda_10.2.89_441.22_win10.exe passed.
		start /wait %~dp0cuda_10.2.89_441.22_win10.exe
	) || (
		echo Hashcheck on cuda_10.2.89_441.22_win10.exe failed! Redownloading...
		goto cuda10inst
	)
)

if "%versionprompt%"=="8.1" (
	:cuda81inst
	start /wait %aria% -d %~dp0 -o cuda_10.2.89_441.22_windows.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_windows.exe
		echo 832aa4221dc001587a5a87d092ae6cec  cuda_10.2.89_441.22_windows.exe | hashsum /a MD5 /c /q && (
		echo Hashcheck on cuda_10.2.89_441.22_windows.exe passed.
		start /wait %~dp0cuda_10.2.89_441.22_windows.exe
	) || (
		echo Hashcheck on cuda_10.2.89_441.22_windows.exe failed! Redownloading...
		goto cuda81inst
	)
)

if "%versionprompt%"=="7" (
	:cuda7inst
	start /wait %aria% -d %~dp0 -o cuda_10.2.89_441.22_windows.exe http://developer.download.nvidia.com/compute/cuda/10.2/Prod/local_installers/cuda_10.2.89_441.22_windows.exe
		echo 832aa4221dc001587a5a87d092ae6cec  cuda_10.2.89_441.22_windows.exe | hashsum /a MD5 /c /q && (
		echo Hashcheck on cuda_10.2.89_441.22_windows.exe passed.
		start /wait %~dp0cuda_10.2.89_441.22_windows.exe
	) || (
		echo Hashcheck on cuda_10.2.89_441.22_windows.exe failed! Redownloading...
		goto cuda7inst
	)
)

echo Now we'll install Git, so you can download and update Clover Edition.
if not exist "C:\Program Files\Git\cmd" (
	:gitinst
	start /wait %aria% -d %~dp0 -o Git-2.24.1.2-64-bit.exe https://github.com/git-for-windows/git/releases/download/v2.24.1.windows.2/Git-2.24.1.2-64-bit.exe
		echo 34e484936105713e7d0c2f421bf62e4cfe652f6638a9ecb5df2186c1918753e2  Git-2.24.1.2-64-bit.exe | hashsum /a SHA256 /c /q && (
		echo Hashcheck on Git-2.24.1.2-64-bit.exe passed.
		start /wait %~dp0Git-2.24.1.2-64-bit.exe
	) || (
		echo Hashcheck on Git-2.24.1.2-64-bit.exe failed! Redownloading...
		goto gitinst
	)
)

if exist "C:\Program Files\Git\cmd" echo Git already installed, moving on...

:: This is a workaround to be able to use the updated path from the Python and Git install.
echo Going to main script...
start /wait %~dp0main.bat
cmd /k
