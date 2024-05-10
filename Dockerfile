FROM node:20-alpine

LABEL maintainer="Soe Thura <thixpin@gmail.com>"
LABEL description="Docker image for Next.js app"

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code excluding the files in .dockerignore
COPY . .

# Build the Next.js app
RUN npm run build

# Expose port 3000
EXPOSE 3000

# Command to run the Next.js app
CMD ["npm", "start"]

# Build the Docker image
# docker build -t nextjs-app .
# docker run -p 3000:3000 -d --name nextjs-app nextjs-app
