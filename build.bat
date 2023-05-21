@echo off
setlocal

@REM Read the version details from the module.prop file
for /f "tokens=2 delims=<> " %%a in ('find "version=Version" ^< "module.prop" ') do set version=%%a

echo ^>^> Creating zip file

if exist "C:\Program Files\7-Zip\7z.exe" (
  "C:\Program Files\7-Zip\7z.exe" a -tzip "Systemless-Hosts v%version%.zip" * -x!build.bat -x!README.md
) else if exist "C:\Program Files (x86)\7-Zip\7z.exe" (
  "C:\Tools\7z.exe" a -tzip "Systemlless-Hosts v%version%.zip" * -x!build.bat -x!README.md
) else (
  echo ERROR^: 7zip executable not found! Please install it from https://www.7-zip.org/download.html
  exit /b 1
)

echo.
echo ^>^> Done! You can find the module zip file in the current directory - '%CD%\Systemless-Hosts v%version%.zip'