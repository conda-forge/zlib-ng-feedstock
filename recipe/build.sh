set -ex

mkdir build
cd build

cmake \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX:PATH="$PREFIX" \
    -DBUILD_SHARED_LIBS=1 \
    -DZLIB_COMPAT=$COMPAT \
    ..

make -j${CPU_COUNT}
if [[ "${target_platform}" == "${build_platform}" ]]; then
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
    ctest
fi
fi
make install
