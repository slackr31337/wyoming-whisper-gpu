Wyoming Whisper docker container with GPU support for Home-Assistant

Docker: https://hub.docker.com/r/confusedengineer/wyoming-whisper-gpu

docker pull confusedengineer/wyoming-whisper-gpu:latest

I made changes with TrueNAS users in mind by removing the "command" portions as they seemed to cause some difficulties.

Requirements when running:
 - Mount a volume at "/data" in the container
 - Run as privileged
 - Expose container port 10300
 - Add NVIDIA GPU access
 - Enjoy!

todo: Make environment variables to adjust beam size, model, device, etc.

Currently defaults are 5, medium-int8, cuda, english.
