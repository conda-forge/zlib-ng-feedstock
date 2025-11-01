set -ex

mkdir build
cd build

cmake \
    ${CMAKE_ARGS} \
    -DBUILD_SHARED_LIBS=1 \
    ..

make -j${CPU_COUNT}
if [[ "${CONDA_BUILD_CROSS_COMPILATION:-}" != "1" || "${CROSSCOMPILING_EMULATOR}" != "" ]]; then
    ctest
fi
make install
