@echo on
setlocal EnableDelayedExpansion

if "%ARCH%"=="32" (
    set CFLAGS=/arch:IA32 %CFLAGS%
    set CXXFLAGS=/arch:IA32 %CXXFLAGS%
) else (
    set CFLAGS=/arch:AVX2 %CFLAGS%
    set CXXFLAGS=/arch:AVX2 %CXXFLAGS%
)

mkdir build
cd build

cmake .. -G "NMake Makefiles" -DCMAKE_INSTALL_PREFIX=%PREFIX%
nmake
ctest

mkdir %PREFIX%\bin
copy conda-project.exe %PREFIX%\bin\
