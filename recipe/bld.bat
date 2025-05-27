@echo on
setlocal EnableDelayedExpansion

if "%ARCH%"=="32" (
    set CFLAGS=/arch:IA32 %CFLAGS%
    set CXXFLAGS=/arch:IA32 %CXXFLAGS%
) else (
    set CFLAGS=/arch:SSE2 %CFLAGS%
    set CXXFLAGS=/arch:SSE2 %CXXFLAGS%
)

mkdir build
cd build

cmake .. -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PREFIX% || exit /b 1
nmake || exit /b 1
ctest

mkdir %PREFIX%\bin
if exist conda-project.exe (
    copy conda-project.exe %PREFIX%\bin\
) else (
    echo "ERROR: conda-project.exe not found!"
    exit /b 1
)
