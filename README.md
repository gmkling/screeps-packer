# screeps-packer
Packs ami images for screeps private servers.

Uses updated commands from the article [Private server on Ubuntu using MongoDB and Redis](https://docs.screeps.com/contributed/ps_ubuntu.html).

Add your Steam API key to the screeps-server.pkr.hcl file. Run `packer validate .` then `packer build .` to build and register the AMI.

I am not able to fully get this working at this time, but a similar project for docker images is online at [github](https://github.com/QNimbus/docker-screeps).