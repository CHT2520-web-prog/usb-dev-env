@echo off
set "ROOT=%~dp0"
set "PATH=%ROOT%php;%ROOT%tools;%ROOT%git\cmd;%PATH%"

REM ==========================================
REM Portable HOME and Git configuration
REM ==========================================
set "HOME=%ROOT%home"
set "USERPROFILE=%ROOT%home"

if not exist "%ROOT%home" mkdir "%ROOT%home"

if exist "%ROOT%git\cmd\git.exe" (

    echo Configuring portable Git...

    REM Use USB-local Git configuration
    set "GIT_CONFIG_GLOBAL=%ROOT%home\.gitconfig"
    set "GIT_CONFIG_NOSYSTEM=1"

    REM Configure browser-based GitHub authentication
    "%ROOT%git\cmd\git.exe" config --global credential.helper manager

    echo Git configured successfully.

) else (
    echo Git not found on USB - skipping Git configuration.
)


set "PHPRC=%ROOT%php"
set "COMPOSER_HOME=%ROOT%composer-home"
set "COMPOSER_CACHE_DIR=%ROOT%composer-home\cache"
set "npm_config_cache=%ROOT%npm-cache"
set "npm_config_prefix=%ROOT%npm-global"

echo Starting Adminer...
start "Adminer" php -S localhost:8081 -t "%ROOT%adminer"

echo Adminer available at http://localhost:8081/adminer.php

if not exist "%ROOT%www" mkdir "%ROOT%www"
pushd "%ROOT%www"

echo Working in: %CD%
php -v
node -v
cmd /k
