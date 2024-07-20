FROM ubuntu:22.04

# Update package lists and install necessary packages including Git
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    netcat \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set the PATH to include /usr/games and /usr/local/games where cowsay and fortune are installed
ENV PATH="/usr/games:/usr/local/games:${PATH}"

# Set working directory
WORKDIR /usr/src/app

# Clone the repository
COPY . .

# Ensure the wisecow.sh script has execute permissions
RUN chmod +x wisecow.sh

# Expose the port the application will run on
EXPOSE 4499

# Specify the command to run the script
CMD ["./wisecow.sh"]
