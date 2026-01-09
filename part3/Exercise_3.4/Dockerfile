# Use an image that has Docker and Git installed
FROM docker:25-git

# Set working directory
WORKDIR /app

# Copy our script into the image
COPY builder.sh .

# Make the script executable
RUN chmod +x builder.sh

# Make script the default entrypoint
ENTRYPOINT ["./builder.sh"]
