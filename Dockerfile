# Use the Python 3 alpine official image
# https://hub.docker.com/_/python
FROM python:3-alpine

# Create and change to the app directory.
WORKDIR /app

# Copy local code to the container image.
COPY . .

# Install project dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Run the web service on container startup.
CMD ["hypercorn", "main:app", "--bind", "::"]

# Command to run the application with automatic reload
#CMD ["hypercorn", "main:app", "--reload", "--bind", "0.0.0.0"]