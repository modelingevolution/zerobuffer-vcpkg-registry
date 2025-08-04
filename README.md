# ZeroBuffer vcpkg Registry

This is a custom vcpkg registry for the ZeroBuffer library, a high-performance zero-copy inter-process communication library for video streaming.

## Using this Registry

To use ZeroBuffer in your project via vcpkg, you need to configure vcpkg to use this custom registry.

### 1. Create vcpkg-configuration.json

In your project root, create a `vcpkg-configuration.json` file:

```json
{
  "default-registry": {
    "kind": "git",
    "baseline": "903956eff7cb94774a9e805ff573c000afc43e3e",
    "repository": "https://github.com/Microsoft/vcpkg"
  },
  "registries": [
    {
      "kind": "git",
      "baseline": "0432a90f8c15faa2933cbcf13c5285f982055dd5",
      "repository": "https://github.com/modelingevolution/zerobuffer-vcpkg-registry",
      "packages": [
        "zerobuffer"
      ]
    }
  ]
}
```

### 2. Create vcpkg.json

Create a `vcpkg.json` file to declare your dependencies:

```json
{
  "name": "your-project",
  "version": "1.0.0",
  "dependencies": [
    "zerobuffer"
  ]
}
```

### 3. Install Dependencies

```bash
vcpkg install
```

Or if you're using a specific triplet:

```bash
vcpkg install --triplet x64-linux
vcpkg install --triplet x64-windows
```

### 4. Use in CMake

In your `CMakeLists.txt`:

```cmake
find_package(zerobuffer CONFIG REQUIRED)
target_link_libraries(your_target PRIVATE zerobuffer::zerobuffer)
```

## Registry Structure

This registry follows the standard vcpkg registry format:

- `ports/` - Contains port files for packages
  - `zerobuffer/` - ZeroBuffer port
    - `portfile.cmake` - Build instructions
    - `vcpkg.json` - Package metadata and dependencies
- `versions/` - Version database
  - `baseline.json` - Default versions
  - `z-/zerobuffer.json` - Version history for ZeroBuffer

## ZeroBuffer Dependencies

ZeroBuffer requires:
- Boost (log, thread, filesystem, system) >= 1.82.0
- CMake build system
- C++17 compiler

## Updating the Registry

When a new version of ZeroBuffer is released:

1. Update the `REF` in `ports/zerobuffer/portfile.cmake` to the new commit SHA
2. Calculate the SHA512 hash of the source archive
3. Increment the `port-version` in `ports/zerobuffer/vcpkg.json`
4. Commit the changes
5. Get the git tree hash: `git rev-parse HEAD:ports/zerobuffer`
6. Add the new version to `versions/z-/zerobuffer.json`
7. Update `versions/baseline.json` with the new port-version
8. Commit and push to GitHub

## License

ZeroBuffer is licensed under the MIT License. See the [ZeroBuffer repository](https://github.com/modelingevolution/streamer) for details.