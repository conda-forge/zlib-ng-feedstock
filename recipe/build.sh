set -ex

mkdir build
cd build

# when building zlib-ng, build the shared library only
# when building zlib compat, build shared+static -- this is done via not
# passing any BUILD_SHARED_LIBS value
if [[ ${ZLIB_COMPAT} == 0 ]]; then
	CMAKE_ARGS+=" -DBUILD_SHARED_LIBS=1"
fi

cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DZLIB_COMPAT=$ZLIB_COMPAT \
    ..

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
    ctest -j${CPU_COUNT}
fi
make install
