# Clair container scan

## Overview
Automatically scan a particular local docker image or all local docker containers with [Clair Vulnerability Scanner](https://github.com/coreos/clair) using [Clair-Scanner](https://github.com/arminc/clair-scanner) and [clair-local-scan](https://github.com/arminc/clair-local-scan).

## Quick start
### Scan all local containers
To get json output of the clair scan of all running containers to standard out just run:
```bash
./clair-container-scan.sh
```
The output will be empty and the return code will be zero, if no CVE was found.
If there are findings, the output will list details in json.

You can use the `-v` flag to add verbose output, in case of a problem.
### Scan a particular local image
To scan one particular local image just specify the image name as parameter:
```
# To scan alpine:3.4 run:
./clair-container-scan.sh alpine:3.4
```

The output will be empty and the return code will be zero, if no CVE was found.

If there are findings, the output will list details in json.
## Prerequisites
* Docker 1.12 or newer
* docker-compose 1.9.0 or newer

## Credits
* Docker
* docker-compose
* [Clair Vulnerability Scanner](https://github.com/coreos/clair)
* [Clair-Scanner](https://github.com/arminc/clair-scanner) (release v8 is included)
* [clair-local-scan](https://github.com/arminc/clair-local-scan).
