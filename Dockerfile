# Step 1: Base Image
FROM node:10

# Step 2: Set the container current working directory (PWD) to “/app”
WORKDIR /app

# Step 3,4: Copy relevant files to install dependencies
COPY package.json package-lock.json* ./
RUN npm install

# Step 5: Copy rest of the code files
COPY . .

# Step 6: Build the project
RUN npm build

# Step 7: Flag that the software inside this image listens on port 3000
EXPOSE 3000

# Step 8: Specify the command to be run inside the container when it’s started
CMD [ "npm", "start" ]