@echo off
setlocal enabledelayedexpansion

echo Starting the renaming process...

:: Navigate to each subfolder and its subfolders
for /r %%d in (.) do (
    pushd %%d
    set /a count=0

    :: Check if there are image files in the folder
    dir *.jpg *.png *.gif >nul 2>&1
    if not errorlevel 1 (
        echo Processing folder: %%d

        :: Rename each image file in the current subfolder
        for %%f in (*.jpg *.png *.gif) do (
            if !count! lss 10 (
                echo Renaming %%f to !count!%%~xf
                ren "%%f" "!count!%%~xf"
                set /a count+=1
            )
        )
    )

    popd
)

echo Renaming process completed.

:: Keep the window open
pause
endlocal