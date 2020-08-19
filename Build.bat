@echo off

CD /D VideoDuplicateFinder.Console
dotnet publish -c Release -v q --self-contained -r win-x64 -f netcoreapp3.1 -o "..\Releases\VDF.Windows-x64"
dotnet publish -c Release -v q --self-contained -r linux-x64 -f netcoreapp3.1 -o "..\Releases\VDF.Linux-x64"
CD /D ..

CD /D VideoDuplicateFinder.Windows
dotnet publish -c Release -v q --self-contained -r win-x64 -f netcoreapp3.1 -o "..\Releases\VDF.Windows-x64"
CD /D ..

CD /D VideoDuplicateFinderLinux
dotnet publish -c Release -v q --self-contained -r linux-x64 -f netcoreapp3.1 -o "..\Releases\VDF.Linux-x64"
CD /D ..

if not exist ".\Releases\ffmpeg\" goto end
echo Copy ffmpeg binaries
if not exist ".\Releases\VDF.Windows-x64\bin" mkdir ".\Releases\VDF.Windows-x64\bin"
xcopy /q /y ".\Releases\ffmpeg\x64\*.*" ".\Releases\VDF.Windows-x64\bin"

:end

echo Build succeed
