Wyoming Whisper docker container with GPU support for Home-Assistant

docker pull confusedengineer/wyoming-whisper-gpu:latest

I made changes with TrueNAS users in mind by removing the "command" portions as they seemed to cause some difficulties.

Requirements when running:
 - Mount a volume at "/data" in the container
 - Run as privileged
 - Expose container port 10300
 - Add NVIDIA GPU access
 - Enjoy!

todo: Make environment variables to adjust beam size, model, and device:
Current defaults are 5, Medium-int, and CUDA (NVIDIA), respectively 
