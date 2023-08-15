### ShareImmo Web dApp

## Table of Contents
[Prerequisites](#prerequisites) 
[Installation](#installation) 
[Configuration](#configuration)
[Usage](#usage)
[Contribution](#contribution)
[License](#License)

## Prerequisites
- Docker & Docker Compose : https://www.docker.com/products/docker-desktop/
- Node.js & npm : https://docs.npmjs.com/downloading-and-installing-node-js-and-npm
- Ganache (for running a local Ethereum network) : https://trufflesuite.com/docs/ganache/
- Truffle : https://trufflesuite.com/docs/truffle/

<a name="installation"/>

## Installation

1. Clone the repository

```
git clone repository_url.git
cd path_to_directory
```

2. Install dependencies

- For the React frontend:

```
cd shareimmo-ihm
npm install
```

- For the NodeJS and Express backend:

```
cd shareimmo-api
npm install
```

- For the Ethereum & Truffle blockchain part:

```
cd shareimmo-dapp
npm install
```

3. Start Ganache

Ensure Ganache is running if using a local Ethereum network.

4. Database Configuration

If your backend utilizes a database, set up the database access information in .env file.

5. Start the application with Docker

At the project root:

```
docker-compose up --build -d
```
<a name="configuration"/>

## Configuration
- React Frontend: Modify the .env file in the front directory for any specific settings.
- NodeJS & Express Backend: Adjust the backend/config.js file for database information and other configuration settings.
- Ethereum & Truffle Blockchain: Refer to Truffle's documentation for project-specific configuration.

<a name="usage"/>

## Usage
Once the application is up and running:

- Access the React frontend at http://localhost:3000
- Access the NodeJS & Express backend at http://localhost:5000
- Interact with the blockchain via scripts or interfaces provided in the blockchain module.

<a name="contribution"/>

## Contribution
To contribute:

1. Clone the repository and update the submodules

```
git clone https://github.com/ShareImmo/shareimmo-docker.git
cd shareimmo-docker
git submodule update --init --recursive
```

2. Create your feature branch

```
git checkout -b feature/AmazingFeature
```

3. Make your changes. If your changes involve one or several submodules:

a. Navigate to the directory of the concerned submodule.

b. Commit and push your changes in this submodule.

c. Return to the main directory and commit the submodule changes.

4. Push your feature branch to the repository

```
git push origin feature/AmazingFeature
```

<a name="license"/>

## License
This project is under the MIT license. See the LICENSE file for more details.