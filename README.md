# Sapiens Server Automatic Setup (no fluff version)
Some helpful scripts for running a Sapiens dedicated server on Linux. Designed to be run as root.

Been tested on:
 - `ubuntu:noble` Docker image
 - EC2 AWS instance (Ubuntu 24)
 - DigitalOcean droplet

## Installation

1. Clone this repository: `git clone https://github.com/DecDuck/sapiens-server.git`
2. Open it up: `cd sapiens-server`
3. Edit your `config.sh`. If you're on the command line, it's easiest to use `nano`. Type `nano config.sh`, and use arrow keys to navigate. You'll usually only need to change the world name, and sometimes the install directory. 
4. Run the installation script: `./install.sh`
5. Create the world: `./create_world.sh`. Once it says "Steam authentication successful", hit Ctrl+C.
6. Run your server: `./start.sh`

To run your server without keeping it open, use the below commands. 

## Server Configuration

To properly advertise your server, add admins/mods and change your server name, edit the `serverConfig.lua` found in `~/.local/share/majicjungle/sapiens`. If you're used to `nano` (from the install steps), run: `nano ~/.local/share/majicjungle/sapiens/serverConfig.lua`

## Commands

**./sapiens.sh start** - starts your server in a screen session so it is running in the background.<br>
**./sapiens.sh stop** - stops your server running in the background.<br>
**./sapiens.sh restart** - Basically a stop, wait, and then a start.  Good to bounce the server if things are getting laggy.<br>
**./sapiens.sh console** - When a server is running in the background use this command to bring up the server console.  To exit the console without stopping the server hold CTRL and type A D.<br>

## Accessing from the internet
How you access it from the internet depends on how you've set up the server. In essence, you need to open the following ports:
 - 16161/udp (or your `config.sh`'s UDP_PORT)
 - 16162/udp (or your `config.sh`'s UDP_PORT + 1) (if you enabled advertising)
 - 16168/tcp (or your `config.sh`'s HTTP_PORT)

These change with the options in `config.sh`

## Updating your server
Run open the directory up, and run these two commands:
1. `git pull` (updates the installer)
2. `./install.sh` (runs the installer)
