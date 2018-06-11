# Clair container scan

## Overview
Automatically scan a particular local docker image or all local docker containers with [Clair Vulnerability Scanner](https://github.com/coreos/clair) using [Clair-Scanner](https://github.com/arminc/clair-scanner) and [clair-local-scan](https://github.com/arminc/clair-local-scan).

## Prerequisites
* docker (1.12 or newer)
* docker-compose (1.9.0 or newer)

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

## Integration in CI/CD

The easiest (but not most secure way) of integrating into your CI/CD tool is to run following one-liner (replace `alpine:3.4` with the image you want to scan):
```
# to scan alpine:3.4 again
curl -s https://raw.githubusercontent.com/usr42/clair-container-scan/master/clair-container-scan.sh | sh -s -- alpine:3.4
```

__WARNING:__ You should never pipe a remote-script directly into a shell, unless you completely trust the source and integrity of the file to execute. Usually, it is better to download the file, validate its input, and run you local, validated version.

## Credits
* Docker
* docker-compose
* [Clair Vulnerability Scanner](https://github.com/coreos/clair)
* [Clair-Scanner](https://github.com/arminc/clair-scanner) (release v8 is included)
* [clair-local-scan](https://github.com/arminc/clair-local-scan)
