# geant4_docker
Build a GEANT4 image and push to docker hub with github actions. The action workflow is set up with instructions from https://docs.docker.com/ci-cd/github-actions/.

The base image is from `rootproject/root:6.22.08-centos7`, and the GEANT4 program of tag `v10.3.3` is installed in `/opt/geant4/`.

The entry point is stored in `/opt/geant4/geant4.entrypoint.sh`.

The final image is pushed to `kmtsui/geant4:latest` at docker hub. After the build, the action will trigger another build of `WCSim_hybridPMT` in https://github.com/kmtsui/wcsim_hybrid_docker/. Such trigger is explained in https://github.community/t/triggering-by-other-repository/16163/2.

## Usage
To run the container, simply call
```
docker run -it --rm --name geant4_container kmtsui/geant4:latest bash
```
Options:
- `-it`: Keep bash open after invoking
- `--rm`: Delete container when stopping. Remove this option if you want to keep your container for more than one session
- `--name geant4_container`: Name for your container.
