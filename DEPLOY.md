# Deploying the Registry

## GitHub Deployment

1. Create repository: https://github.com/rmaciag/zerobuffer-vcpkg-registry

2. Push the registry:
   ```bash
   cd ./test-registry
   git remote add origin https://github.com/rmaciag/zerobuffer-vcpkg-registry.git
   git push -u origin main
   ```

3. Users configure with:
   ```json
   {
     "registries": [{
       "kind": "git",
       "repository": "https://github.com/rmaciag/zerobuffer-vcpkg-registry",
       "baseline": "cf476af5439b03157351ffd12ce25c10f8b6304f",
       "packages": ["zerobuffer"]
     }]
   }
   ```

## Private Registry

For private distribution, create a private GitHub repository and add users as collaborators.

## GitLab/Bitbucket

The same structure works with any git hosting service.
