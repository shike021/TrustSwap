# 1. Morph Integration One Page
Network Parameters
Network	Chain ID	RPC URL	Block Explorer URL
Morph Mainnet	2818	https://rpc-quicknode.morphl2.io	https://explorer.morphl2.io/
Ethereum Mainnet	1	https://ethereum-rpc.publicnode.com/	https://etherscan.io/
Morph Holesky Testnet	2810	https://rpc-quicknode-holesky.morphl2.io	https://explorer-holesky.morphl2.io/
Holesky Testnet	17000	https://ethereum-holesky-rpc.publicnode.com/	https://holesky.etherscan.io/
To notice, we have set a rate limit for the public RPC access, currently 600 requests per minute per IP.

If you need higher tps, please contact our team for private RPC access. You can also use our partner quicknode or tenderly to create your own private RPC.

Websocket Connection
wss://rpc-quicknode.morphl2.io

Explorer Information
Official Mainnet Explorer

Official Testnet Explorer

Explorer API Documentation

Explorer API: https://explorer-api.morphl2.io/api

Testnet Explorer API: https://explorer-holesky-api.morphl2.io/api

For detail guide on how to verify your contract on Morph explorer, click here

Bridge Information
Official Bridge

Official Testnet Bridge

Withdrawal and Deposit Time
Due to Morph opzkEVM design, each withdrawal request will need to go through a 48 hours withdrawal period (challenge window) to be finalized.

Deposit needs to wait for 2 Ethereum epoch (about 13~20 min).

New Bridge Asset Support:
Add your Token to the Official Bridge

You can also use LayerZero to wrap your token:

LayerZero on Morph

Transaction Fees & Blocks
For Ethereum Layer2, there are 2 part of fees: L1 fee and L2 fee.

For L2 fee, Morph currently using the EIP-1559 mechanism for transaction fees same as Ethereum mainnet. Each transaction will have a base fee and a priority fee. The base fee is set to 0.001 Gwei. If the block transaction limit (100 per block) is not reached, only pay base fee is enough.

tip
Please note we have a lowest L2 priority fee setting (0.01 gwei) for testnet, this is in order to prevent spams. For mainnet, we are able process transaction without priority fee.

Morph currently produce 1 block per second for non-empty block, if there is no new transaction, we will produce 1 empty block every 5 seconds.

Each block can have 100 transactions maximum and we will keep raising the limit.

Important Contracts
We have documented all the important contracts on Morph, you can find them here

Node Deployment
Right now we support you to run the Morph node (full node and validator node) in docker and run on host.

You can check the node deployment guide for more details.

# 2.Start Developing on Morph
Developing on Morph is as straightforward as developing on Ethereum.

To deploy contracts onto a MorphL2 chain, simply set the RPC endpoint of your target MorphL2 chain and deploy using your preferred Ethereum development framework:

Hardhat
Foundry
Brownie
Alchemy
QuickNode SDK
...it all just works!

Mainnet:
Step 1: Network Configuration
Before you start, ensure you are connected to the following networks:

Network Name	Morph Mainnet	Ethereum Mainnet
RPC URL	https://rpc-quicknode.morphl2.io	https://ethereum-rpc.publicnode.com/
Chain ID	2818	1
Currency Symbol	ETH	ETH
Block Explorer URL	https://explorer.morphl2.io/	https://etherscan.io/
Websocket Connection
wss://rpc-quicknode.morphl2.io

Step 2: Set up your developing framework
Hardhat
Modify your Hardhat config file hardhat.config.ts to point at the Morph public RPC.

const config: HardhatUserConfig = {
  ...
  networks: {
    morphl2: {
      url: 'https://rpc-quicknode.morphl2.io',
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
      gasprice = 1000000000
    },
  },
};


Foundry
To deploy using Morph Public RPC, run:

forge create ... --rpc-url= --legacy

ethers.js
Setting up a Morph provider in an ethers script:

import { ethers } from 'ethers';

const provider = new ethers.providers.JsonRpcProvider(
  'https://rpc-quicknode.morphl2.io'
);

Holesky Testnet:
Step 1: Network Configuration
Before you start, ensure you are connected to the following networks:

Network Name	Morph Holesky Testnet	Holesky Testnet
RPC URL	https://rpc-quicknode-holesky.morphl2.io	https://ethereum-holesky-rpc.publicnode.com/
Chain ID	2810	17000
Currency Symbol	ETH	ETH
Block Explorer URL	https://explorer-holesky.morphl2.io/	https://holesky.etherscan.io/
Websocket Connection
wss://rpc-quicknode-holesky.morphl2.io

Step 2: Set up your developing framework
Hardhat
Modify your Hardhat config file hardhat.config.ts to point at the Morph public RPC.

const config: HardhatUserConfig = {
  ...
  networks: {
    morphl2: {
      url: 'https://rpc-quicknode-holesky.morphl2.io',
      accounts:
        process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
      gasprice = 2000000000
    },
  },
};


Foundry
To deploy using Morph Public RPC, run:

forge create ... --rpc-url= --legacy

ethers.js
Setting up a Morph provider in an ethers script:

import { ethers } from 'ethers';

const provider = new ethers.providers.JsonRpcProvider(
  'https://rpc-quicknode-holesky.morphl2.io'
);

Step 3: Acquire Ether
To start building on Morph, you may need some testnet ETH. Use a faucet to acquire holesky Ether, then bridge the test Ethereum Ether to the Morph testnet.

Each faucet has its own rules and requirements, so you may need to try a few before finding one that works for you.

Holesky ETH faucet websites:

https://stakely.io/en/faucet/ethereum-holesky-testnet-eth

https://faucet.quicknode.com/ethereum/holesky

https://holesky-faucet.pk910.de/

https://cloud.google.com/application/web3/faucet/ethereum (needs a Google account)

We have our own website faucet that can claim ETH & USDT for you initial usage.

Morph also offers a Discord faucet to obtain Morph Holesky USDT & Morph Holesky ETH.

Once you receive ETH on Holesky, you should see it in your wallet on the Holesky Network. It may take a few seconds for them to appear, but you can check the status by looking for a transaction to your address on a Holesky Block Explorer.

# 3. Deploy Contracts on Morph
The Morph Holesky Testnet allows anyone to deploy a smart contract on Morph. This tutorial will guide you through deploying a contract on Morph Holesky using common Ethereum development tools.

This demo repo illustrates contract deployment with Hardhat and Foundry.

tip
Before you start deploying the contract, you need to request test tokens from a Holesky faucet and use the bridge to transfer some test ETH from Holesky to Morph Holesky.

See our Faucet for details.

Deploy with Hardhat
Clone the repo
git clone https://github.com/morph-l2/morph-examples.git

Install Dependencies
If you haven't already, install nodejs and yarn.

cd contract-deployment-demos/hardhat-demo
yarn install

This will install everything you need include hardhat for you.

Compile
Compile your contract

yarn compile

Test
This will run the test script in test/Lock.ts

yarn test

Deploy
Create a .env file following the example .env.example in the root directory. Change PRIVATE_KEY to your own account private key in the .env.

And Change the network settings in the hardhat.config.ts file with the following information:

 morphTestnet: {
   url: process.env.MORPH_TESTNET_URL || "",
   accounts:
     process.env.PRIVATE_KEY !== undefined ? [process.env.PRIVATE_KEY] : [],
 }

Then run the following command to deploy the contract on the Morph Holesky Testnet. This will run the deployment script that set the initialing parameters, you can edit the script in scripts/deploy.ts

yarn deploy:morphTestnet

Verify your contracts on Morph Explorer
To verify your contract through hardhat, you need to add the following Etherscan and Sourcify configs to your hardhat.config.js file:

module.exports = {
  networks: {
    morphTestnet: { ... }
  },
  etherscan: {
    apiKey: {
      morphTestnet: 'anything',
    },
    customChains: [
      {
        network: 'morphTestnet',
        chainId: 2810,
        urls: {
          apiURL: 'https://explorer-api-holesky.morphl2.io/api? ',
          browserURL: 'https://explorer-holesky.morphl2.io/',
        },
      },
    ],
  },
};

Then run the hardhat verify command to finish the verification

npx hardhat verify --network morphTestnet DEPLOYED_CONTRACT_ADDRESS <ConstructorParameter>

For example

npx hardhat verify --network morphTestnet 0x8025985e35f1bAFfd661717f66fC5a434417448E '0.00001'

Once succeed, you can check your contract and the deployment transaction on Morph Holesky Explorer

Deploy contracts with Foundry
Clone the repo
git clone https://github.com/morph-l2/morph-examples.git

Install Foundry
curl -L https://foundry.paradigm.xyz | bash
foundryup

Then go the right folder of our example:

cd contract-deployment-demos/foundry-demo

Compile
forge build

Deploy
A Deployment script and use of environment variables has already been set up for you. You can view the script at script/Counter.s.sol

Rename your .env.example file to .env and fill in your private key. The RPC URL has already been filled in along with the verifier URL.

To use the variables in your .env file run the following command:

source .env

You can now deploy to Morph with the following command:

forge script script/Counter.s.sol --rpc-url $RPC_URL --broadcast --private-key $DEPLOYER_PRIVATE_KEY --legacy


Adjust as needed for your own script names.

Verify
Verification requires some flags passed to the normal verification script. You can verify using the command below:

 forge verify-contract YourContractAddress Counter\
  --chain 2810 \
  --verifier-url $VERIFIER_URL \
  --verifier blockscout --watch

Once succeeded, you can check your contract and the deployment transaction on Morph Holesky Explorer.

Questions and Feedback
Thank you for participating in and developing on the Morph Holesky Testnet! If you encounter any issues, join our Discord and find us at #dev-support channel.

# 4. Verify Your Smart Contracts
After deploying your smart contracts, it's crucial to verify your code on our block explorer. This can be automated using your development framework, such as Hardhat.

Verify with development framework
Most smart contract tools have plugins for verifying contracts on Etherscan. Blockscout supports Etherscan's contract verification APIs, making it straightforward to use these tools with the Morph Mainnet & Testnet.

Verify with Hardhat
To verify your contract through hardhat, you need to add the following Etherscan and Sourcify configs to your hardhat.config.js file:

module.exports = {
  networks: {
    morph: { ... }
  },
  etherscan: {
    apiKey: {
      morph: 'anything',
    },
    customChains: [
      {
        network: 'morph',
        chainId: 2818,
        urls: {
          apiURL: 'https://explorer-api.morphl2.io/api? ',
          browserURL: 'https://explorer.morphl2.io/',
        },
      },
    ],
  },
};

Verify with Foundry
Verification with foundry requires some flags passed to the normal verification script. You can verify using the command below:

 forge verify-contract YourContractAddress Counter\
  --chain 2818 \
  --verifier-url https://explorer-api.morphl2.io/api? \
  --verifier blockscout --watch

Verify with Morph explorer frontend
Visit：Morph block explorer
We currently support 6 different ways to verify your contracts on our block explorer.

There are 2 general parameters:

Compiler: Has to be consistent with what you select when deployment.
Optimization: Can be ignored if you don't have contract optimization. If you do, it has to be consistent with deployment.
Method: Solidity (Flattened Sources Code)
Frontend:
fscs

Flatten
Flatten through forge command, for example:

forge flatten --output FlattenedL2StandardBridge.sol ./contracts/L2/L2StandardBridge.sol

Method: Solidity (Standard JSON Input)
sjis1

Obtain JSON File
Can be obtained through solc
Can be obatined through remix compiler
sjis2

sjis3

Method: Solidity (Multi-part files)
Frontend:
You can submit multiple contract file by your own needs mpfs1
SOL File Process
If there is any imported file, it needs to be modified to be referenced by the same level path, and these files must be submitted together. mpfs2
Method: Vyper (Contracts)
Frontend:
cv

Method: Vyper (Standard Json Input)
Frontend:
sjiv

Method: Vyper (Multi-part files)
Frontend:
mpfv

After Verification
avp

# 5.Using the SDK
CrossChainMessenger
The CrossChainMessenger class simplifies the process of moving assets and data between Ethereum and Morph. You can use this class to, for example, initiate a withdrawal of ERC20 tokens from Morph back to Ethereum, accurately track when the withdrawal is ready to be finalized on Ethereum, and execute the finalization transaction after the challenge period has elapsed. The CrossChainMessenger can handle deposits and withdrawals of ETH and any ERC20-compatible token. The CrossChainMessenger automatically connects to all relevant contracts so complex configuration is not necessary.

L2Provider and related utilities
The Morph SDK includes various utilities for handling Morph's transaction fee model. For instance, estimateTotalGasCost will estimate the total cost (in wei) to send at transaction on Morph including both the L2 execution cost and the L1 data cost. You can also use the asL2Provider function to wrap an ethers Provider object into an L2Provider which will have all of these helper functions attached.

Other utilities
The SDK contains other useful helper functions and constants. For a complete list, refer to the auto-generated SDK documentation

