1. Forked https://github.com/digitalocean/sample-nodejs
2. Single stage docker build. Possible room for improvement would be multistage npm build and limit what get's copied to end image.
3. Added test stage before build with semgrep to scan for nodejs vulnerabilities (uncomment line #2 in .semgrepignore to fail the build).
4. Added docker compose file and .dockerignore
5. Added grype to test the running image.
   As this is CI/CD and not a developer maching both services stop after grype finished scan and if there are no errors image is "pushed" to a remote registry.
   Changing `command: "sample-nodejs:latest"` to `#command: "sample-nodejs:latest --fail-on critical"` will fail make grype to exit with exit code 1 and image is not "pushed" to a remote registry.
6. Requirements: `docker, docker compose and make`. Use `make up` to start
