
Step 1 : docker init

Welcome to the Docker Init CLI!
This utility will walk you through creating the following files with sensible defaults for your project:
  - .dockerignore
  - Dockerfile
  - compose.yaml
  - README.Docker.md

Let's get started!
? What application platform does your project use? Java
? What's the relative directory (with a leading .) for your app? ./src
? What version of Java do you want to use? 24.0.2 2025-07-15
? What port does your server listen on? 8080

✔ Created → .dockerignore
✔ Created → Dockerfile
✔ Created → compose.yaml
✔ Created → README.Docker.md

→ Your Docker files are ready!
  Review your Docker files and tailor them to your application.
  Consult README.Docker.md for information about using the generated files.

! Warning → No build tools were found in the current directory. Maven (with the Maven Wrapper) is required to build your Java application with Docker Init. Set up Maven before running your application: https://maven.apache.org.

What's next?
  Start your application by running → docker compose up --build
  Your application will be available at http://localhost:8080

 Step 2 : Create APIs
Customer
DockerInitDemoApplication


Step 3 : docker compose up --build

Step 4 : Browser  : http://localhost:8080/customers
[
  {
    "id": 101,
    "name": "Basant",
    "email": "basant@gmail.com",
    "gender": "Male"
  },
  {
    "id": 102,
    "name": "Santosh",
    "email": "santosh@gmail.com",
    "gender": "Male"
  },
  {
    "id": 103,
    "name": "Shruti",
    "email": "shruti@gmail.com",
    "gender": "Female"
  }
]

