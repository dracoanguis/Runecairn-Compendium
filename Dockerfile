FROM node:20-alpine AS build

LABEL Developers="Hugo Haldi, Ethan Arm"

# Set the environment variable to the URL of the API
ARG PUBLIC_APIURL
ENV PUBLIC_APIURL=$PUBLIC_APIURL

# The WORKDIR instruction sets the working directory for everything that will happen next
WORKDIR /app

# Copy the package.json and package-lock.json files to the working directory
COPY package.json package-lock.json ./

# Install the build-time dependencies
RUN npm install

# Copy the rest of the files to the working directory
COPY . .

# Build SvelteKit app
RUN npm run build

# Start a new stage
FROM node:20-alpine

# The WORKDIR instruction sets the working directory for everything that will happen next
WORKDIR /app

ENV NODE_ENV=production

# Copy the build folder from the previous stage to the working directory
COPY --from=build /app/build ./
COPY --from=build /app/package.json ./

# Install the runtime dependencies
RUN npm install

# The USER instruction sets the user name to use as the default user for the remainder of the current stage
USER node:node

# This is the command that will be run inside the image when you tell Docker to start the container
CMD ["node", "index.js"]

# Expose the port that the app runs on
EXPOSE 3000
