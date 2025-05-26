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

> **Note:** Make sure you have `cmake` and a C++17-capable compiler installed.

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

### Install Locally

```bash
conda install --use-local conda-project
```

---

## Convert the Package to Other Platforms

You can convert the built `.tar.bz2` (tar -cjf /home/oleksandr/miniconda3/conda-bld/linux-64/conda-project-1.0-h2bc3f7f_0.tar.bz2 .) package using:

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

---

## Author

**Oleksandr Olefir**
