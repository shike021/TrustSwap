# Escrow Service

## Overview
This project implements a smart contract-based escrow service for secure online transactions. It ensures that funds are held in escrow until both the buyer and seller confirm the transaction, enhancing trust in online marketplaces.

## Features
- **Secure Transactions**: Funds are held in escrow until both parties confirm.
- **User-Friendly Interface**: A simple web application allows users to interact with the escrow service.
- **Blockchain Integration**: Built on the Morph testnet, leveraging Ethereum's Layer 2 solutions.

## Prerequisites
- Node.js (v20.x or higher)
- Truffle (`npm install -g truffle`)
- Metamask or any Ethereum-compatible wallet

## Installation
1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/escrow-service.git
   cd escrow-service
   ```
2. Install dependencies:
   ```bash
   npm install
   ```

## Deployment
1. Create a `.env` file in the root directory and add your mnemonic:
   ```plaintext
   MNEMONIC=your mnemonic here
   ```
2. Deploy the smart contract to the Morph testnet:
   ```bash
   truffle migrate --network morph_testnet
   ```

## Usage
1. Start the local development server:
   ```bash
   npm start
   ```
2. Open the application in your browser:
   ```bash
   open public/index.html
   ```
3. Connect your wallet and interact with the escrow service.

## Testing
Run the test suite to ensure everything works as expected:
```bash
truffle test
```

## Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss any changes.

## License
This project is licensed under the MIT License.
