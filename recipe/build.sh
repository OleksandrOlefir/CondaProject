#!/bin/bash
set -ex

if [[ "$ARCH" == "32" ]]; then
  export CFLAGS="-m32 ${CFLAGS}"
  export CXXFLAGS="-m32 ${CXXFLAGS}"
else
  export CFLAGS="-m64 ${CFLAGS}"
  export CXXFLAGS="-m64 ${CXXFLAGS}"
fi

mkdir -p build
cd build

cmake "${SRC_DIR}" -DCMAKE_INSTALL_PREFIX="$PREFIX"
make -j$(nproc)

ctest

install -Dm755 conda-project "$PREFIX/bin/conda-project"
