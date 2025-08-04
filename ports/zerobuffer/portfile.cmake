vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO modelingevolution/streamer
    REF ff64e3286b5fdfb5f9501e26b1b95b3cf4f2f973
    SHA512 0
    HEAD_REF master
)

# The zerobuffer C++ code is in a subdirectory
set(SOURCE_PATH "${SOURCE_PATH}/src/zerobuffer/cpp")

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
)

vcpkg_cmake_install()
vcpkg_cmake_config_fixup(CONFIG_PATH lib/cmake/ZeroBuffer)

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

# ZeroBuffer doesn't have a LICENSE file in the repo yet
file(WRITE "${CURRENT_PACKAGES_DIR}/share/${PORT}/copyright" "Copyright (c) 2024 ModelingEvolution\n\nMIT License")