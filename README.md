# ZeroBuffer vcpkg Registry

Custom vcpkg registry for ZeroBuffer - a high-performance zero-copy IPC library.

## Usage

Add to your `vcpkg-configuration.json`:

```json
{
  "registries": [
    {
      "kind": "git",
      "repository": "https://github.com/modelingevolution/zerobuffer-vcpkg-registry",
      "baseline": "<BASELINE_COMMIT_SHA>",
      "packages": ["zerobuffer"]
    }
  ]
}
```

Replace `<BASELINE_COMMIT_SHA>` with the latest commit SHA from this repository.

Then install:
```bash
vcpkg install zerobuffer
```

## Finding the Baseline

To get the latest baseline commit SHA:
```bash
git ls-remote https://github.com/modelingevolution/zerobuffer-vcpkg-registry HEAD
```

Or check the [latest commit](https://github.com/modelingevolution/zerobuffer-vcpkg-registry/commits/main) on GitHub.
