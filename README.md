🌲 Hytale Server Dockerized
Welcome! This repository provides a simple, lightweight, and ready-to-use setup to run your own Hytale Dedicated Server using Podman (or Docker).

We use Alpine Linux and Java 25 to ensure the best performance with the smallest footprint possible. Whether you are hosting a small adventure with friends or testing out mods, this setup has got you covered!

✨ Features
Lightweight: Built on eclipse-temurin:25-jre-alpine for minimal resource usage.

Fast Boot: Optimized with Ahead-Of-Time (.aot) cache support.

Persistent: Your worlds, configs, and logs are saved directly in your folder.

Secure: Ready for encrypted authentication persistence.

🛠️ Prerequisites
Before starting, make sure you have:

    Podman and Podman-compose installed (Docker works too!).

Your Hytale server files. You need to place them in a folder named Server/ in the root of this project:

HytaleServer.jar

HytaleServer.aot

Licenses/ folder

Your Assets.zip file in the root directory.

🚀 Getting Started
1. Prepare your files
Your folder structure should look like this:

Plaintext

.
├── Dockerfile
├── docker-compose.yml
├── Assets.zip
└── Server/
    ├── HytaleServer.jar
    ├── HytaleServer.aot
    └── Licenses/
2. Launch the server
Run the following command to build the image and start the container:

Bash

podman compose up -d
3. Authenticate your server
Hytale requires a one-time device authorization. To do this:

Attach to the server console: podman attach hytale_server.

Type /auth login device and follow the instructions in your browser.

Once successful, set up persistence so you don't have to log in again: /auth persistence Encrypted.

To leave the console without stopping the server, press Ctrl + P then Ctrl + Q.

⚙️ Configuration
You can easily adjust the memory allocated to the server in the docker-compose.yml file:

Default RAM: 4G.

Default Port: 5520 (UDP - QUIC Protocol).

Feel free to edit config.json to change your server name or MOTD (default is "Adventure Time").

🤝 Contributing
Suggestions and bug reports are more than welcome! Feel free to open an issue or submit a pull request.

Happy adventures in Orbis! 🌍✨
