# Use a lightweight Node.js image
FROM node:18

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json files to install dependencies
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application files, including the src folder
COPY . .

# Set environment variables (optional)
ENV DATABASE_URL psql://localhost:27017/mydb

# Expose the application port
EXPOSE 3000

# Start the app, pointing to the main file in the src folder
CMD ["ts-node", "src/index.ts"]
