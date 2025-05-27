# conda-project

**conda-project** is a demonstration C++ project using [`nlohmann_json`](https://github.com/nlohmann/json) for JSON support. The project is designed to demonstrate how to build and package a C++ application using **Conda** in a cross-platform environment.

---

## Project Overview

After building and running the application, it prints:

```
Hello! My name is Oleksandr!
I want to work at SoftServe.
```

---

## Dependencies

This project depends on the following libraries:

- [`nlohmann_json`](https://github.com/nlohmann/json) — Modern C++ JSON library

---

## Build Instructions

To build and run the application manually:

```bash
mkdir build
cd build
cmake ..
make
./conda-project
```

> **Note:** Make sure you have `cmake` and a C++11-capable compiler installed.

---

## Conda Packaging

### Folder Structure

The `recipe/` folder contains:

- `meta.yaml` — package metadata
- `build.sh` — shell build script for Linux/macOS
- `bld.bat` — batch build script for Windows

Both scripts support:

- `ARCH` variable for architecture-specific builds (`32` or `64`)
- `PREFIX` for the Conda build environment path

### Build a Conda Package

```bash
conda build recipe/
```

or

```bash
conda-build . --package-format tar.bz2
```

### Install Locally

```bash
conda install --use-local conda-project
```

### Run Locally

```bash
conda-project
```

---

## Convert the Package to Other Platforms

For cross-platform distribution of this C++ application, it is recommended to **build the package natively on each target platform** rather than using `conda convert`.

To build for a specific platform:

* **Linux/macOS:** Run `conda build recipe/` on a Linux or macOS machine.
* **Windows:** Run `conda build recipe/` on a Windows machine (e.g., in a Windows environment with Conda installed).

This will generate platform-specific `.tar.bz2` packages (e.g., `linux-64/conda-project-1.0-*.tar.bz2`, `win-64/conda-project-1.0-*.tar.bz2`).

You can convert the built `.tar.bz2` package using:

```bash
conda convert --platform all /path/to/conda-project.tar.bz2 -o ./output
```

Supported platforms:

- `osx-64`
- `linux-32`
- `linux-64`
- `win-32`
- `win-64`
- `all`

---

## Project Structure

```
conda-project/
├── CMakeLists.txt
├── main.cpp
├── libs/
│   ├── hellolib/
│   │   ├── CMakeLists.txt
│   │   ├── hello.cpp
│   │   └── hello.h
│   └── messagelib/
│       ├── CMakeLists.txt
│       ├── message.cpp
│       └── message.h
├── recipe/
│   ├── meta.yaml
│   ├── build.sh
│   └── bld.bat
├── test/
│   ├── CMakeLists.txt
│   ├── test_hello.cpp
│   └── test_message.cpp
├── README.md
```


## Limitations

When attempting to convert the built Conda package from **Linux to Windows (`win-32`)** using `conda convert`, you may encounter the following error:

```
FileNotFoundError: [Errno 2] No such file or directory: '/tmp/tmp.../Scripts/conda-project-script.py'
```

### Root Cause

The `conda convert` command expects Python entry points or scripts (like `conda-project-script.py`) inside the `Scripts/` folder when converting to Windows. If the project is a **compiled C++ binary** (not a Python script), such files do not exist. This is a **known limitation** of `conda convert` when used with non-Python packages.

### Fix Options

#### Option 1 (Recommended): Convert only between compatible platforms

Use `conda convert` only between Unix-like platforms (e.g. Linux ↔ macOS). You can skip Windows platforms by specifying targets manually:

```bash
conda convert --platform osx-64 --platform linux-64 ./conda-project-1.0-*.tar.bz2 -o ./output
```

#### Option 2: Build natively on each platform

For full cross-platform support:

- Build the package directly on **Linux**, **macOS**, and **Windows** (manually or using CI tools like GitHub Actions).
- This ensures each platform gets the correct compiled binary.

#### Option 3: Ignore conversion errors for Windows

You may continue using the converted Linux/macOS packages. Just note in your documentation that **Windows users must build the package natively** on a Windows system.
