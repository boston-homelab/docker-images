# YubiKey Test

**Description:**

This project allows testing a Yubikey in a Docker container so that the information learned from using this image can be used to create other projects. For example, I originally wanted to containerize the Certificate Authority in "Build a Tiny Certificate Authority For Your Homelab."[^1]

[^1]:https://smallstep.com/blog/build-a-tiny-ca-with-raspberry-pi-yubikey/

## USAGE:

### Prep

```
# Specify the configuration file to use
export Dockerfile=Dockerfile
# Tag and Version must be lowercase
export Tag=yubikeytest
export Version=snapshot-001
```

### Build

```
docker build --rm -f $Dockerfile -t $Tag:$Version .
```

### Run

```
# Get Usage information
docker run --privileged -v /dev/bus/usb:/dev/bus/usb $Tag:$Version 

# Get Yubikey device information
docker run --privileged -v /dev/bus/usb:/dev/bus/usb $Tag:$Version "ykman info"

# Get Yubikey PIV information
docker run --privileged -v /dev/bus/usb:/dev/bus/usb $Tag:$Version "ykman piv info"

# Enter interactive mode using ksh
docker run -it --privileged -v /dev/bus/usb:/dev/bus/usb $Tag:$Version sh

```

## Acknowledgments 

There isn't much information out there on how to get everything working. Fortunately, madchap had a project[^2] that did precisely what I wanted.  Some modifications were needed, such as:

1) Updating Ubuntu to Jammy (22.04)
2) Removing outdated packages
3) Modifying the entrypoint to fit my needs

[^2]:https://github.com/madchap/yubitools