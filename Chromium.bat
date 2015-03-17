@echo off
"%~dp0chrome-win32\chrome.exe" --no-first-run --User-data-dir="%~dp0Data" --disk-cache-dir="%USERPROFILE%\ChromeCache"