@echo off
setlocal EnableDelayedExpansion

echo Starting in %cd%

REM Initialize a counter
set /a "count=0"

REM Loop through each subfolder
for /d %%D in (*) do (
    echo Processing folder: %%D
    pushd %%D
    REM Loop through each image file in the subfolder
    for %%F in (*.jpg *.png *.jpeg) do (
        echo Renaming "%%F" to "!count!%%~xF"
        ren "%%F" "!count!%%~xF"
        REM Increment the counter
        set /a "count+=1"
    )
    popd
)

endlocal
