require('dotenv').config();
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      host: "127.0.0.1",
      port: 8545,
      network_id: "*"
    },
    morph_testnet: {
      provider: () => new HDWalletProvider(process.env.MNEMONIC, "https://rpc-quicknode-holesky.morphl2.io"),
      network_id: 2810, // Morph Holesky Testnet
      gas: 4500000,
      gasPrice: 10000000000
    }
  },

  compilers: {
    solc: {
      version: "0.8.19", // Updated to match OpenZeppelin compatibility
      settings: {
        optimizer: {
          enabled: true,
          runs: 200
        }
      }
    }
  },
  contracts_directory: './contracts',
  contracts_build_directory: './build/contracts'
};
