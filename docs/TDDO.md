# 比赛说明
Morph Consumer Buildathon: Transforming On-Chain Consumer Finance Online
Welcome to the Morph Buildathon, a 6-week online buildathon dedicated to on-chain consumer finance. This exciting event starts on June 23, 2025, and runs through August 4, 2025, welcoming participants globally to collaborate and compete in a completely virtual setting. Whether you're a seasoned developer, an entrepreneur, or a creative financial thinker, the Morph Buildathon offers a chance to create impactful solutions within the consumer finance space.


Prize Pool 
The Morph Buildathon has a total prize pool $15,000 in USDT, which will be distributed across two tracks. In addition to cash prizes, we are considering additional non-monetary incentives such as exclusive internship interviews with Morph and feature opportunities on our platform, rewarding outstanding creativity and innovation.


Timeline 
Start Date: June 23, 2025
Midpoint Check-in: July 14, 2025
Final Submission Deadline: August 04, 2025
Winner Announcement: August 18, 2025
Tracks and Challenges  
The Morph Buildathon comprises two main tracks:

PayFi Track 
Focus on payment solutions that bridge fiat and cryptocurrencies, ensure payment security, and innovate in payments infrastructure. Participants are encouraged to explore technologies that make transactions more efficient, reliable, and accessible for users globally.


PayFi project ideas  

Consumer Track 
Develop consumer-facing applications that enhance financial literacy, offer intuitive budget tools, implement user-friendly interfaces for crypto transactions, and create innovative investment platforms. Participants are invited to tailor solutions that prioritize user experience and security.


Consumer project ideas 

Submission Requirements 
Every submission must be deployed on Morph testnet
Must include a public Github repo
Must include a demo video
Must include a link to the MVP
Submissions will be evaluated based on criteria such as innovation, technical proficiency, scalability, user experience, and impact potential.

Resources  
Testnet tokens faucet
Morph Main Website 
Developer Documentation 
Educational Resources 
Event Positioning 
Morph Buildathon is designed to foster innovation and collaboration in the burgeoning field of blockchain-enabled consumer finance. By offering a platform open to participants from all backgrounds and skill levels, we aim to explore new frontiers in financial technology, focusing on applications that can significantly benefit everyday consumers. This hackathon encourages developing solutions that integrate seamlessly into the modern financial landscape, with potential to set new industry standards.

Encouragement and Vision 
Morph Buildathon envisions a future where financial services are inclusive, transparent, and accessible to all. We encourage participants to think big, challenge norms, and pave the way for groundbreaking advancements in on-chain consumer finance. With the support of our community and partners, we are excited to see transformative ideas come to life.


# 参赛题目
Smart Contract Escrow for Online Purchases #1554963

A service that uses smart contracts to hold payment in escrow until both buyer and seller confirm the transaction, enhancing trust in online marketplaces.

# 开发资料和文档
Skip to main content
Morph Doc Logo
For Users
For Developers


Welcome to Morph
Introductory Concepts
Step-by-Step Guides
Links and Tools
Build on Morph
Fundamental Concepts
Developer Guides
Developer Resources
Welcome to Morph
Welcome to Morph
We’re thrilled to have you here, exploring the world of Morph. If you’re a developer looking for technical documentation, head over to our For Developers section. But if you’re here to understand what Morph is all about, you’re in the right place!

userpage

What is Morph?
Morph is a cutting-edge Layer 2 solution built on Ethereum, combining the best of optimistic rollups and zk technology. This makes us scalable, secure, and perfect for everyday applications. Our mission is to build the first blockchain for consumers, where user-friendly applications integrate seamlessly into everyday life, becoming indispensable utilities. We prioritize enabling blockchain applications that enhance daily experiences over chasing trivial technical milestones. Our focus is on creating meaningful, practical solutions that transform blockchain technology into core aspects of daily life

Getting Started
To help you navigate through our resources, here’s a quick guide:

Introductory Concepts: Get a general understanding of Morph, including what makes it unique, our vision and mission, key concepts, and a look at our roadmap. This section will help you grasp the basics and understand the foundation of Morph.

/img/cards/users.svg
Morph's Vision and Mission
/img/cards/research.svg
Morph's Architecture
/img/cards/guide.svg
Roadmap
Step-by-Step Guides: Follow these practical tutorials for setting up your wallet, using the faucet, bridging assets, and exploring the Morph ecosystem. These guides are perfect for hands-on learning and getting started with Morph.

/img/cards/wallet.svg
Wallet Setup
./img/cards/faucet.svg
Faucet
/img/cards/bridge.svg
Bridge
Links and Tools: Access useful tools such as the Morph Holesky Explorer and the official bridge. This section provides all the necessary links and resources to interact with and explore the Morph network effectively.

./img/cards/bridge.svg
Morph Bridge
/img/cards/guide.svg
Morph Explorer
/img/cards/faucet.svg
Morph Faucet
Engage in Our Ecosystem
Want to skip most of the reading and get started with exploring more right away? These are the guides that will get you right into the action:

Wallet Setup: Learn how to set up your wallet to interact with Morph.
Using the Faucet: Get test tokens to start experimenting on our testnet.
Bridging Assets: Understand how to bridge assets between Morph and Ethereum.
Exploring Morph Zoo: Dive into the diverse range of dApps and projects in the Morph ecosystem.
Morph Holesky Explorer: Use our explorer to track transactions and explore the blockchain.
Explore and Connect
We believe in building a vibrant community around Morph. Join us on Discord to engage with other users and follow us on Twitter to stay updated with our latest news and developments.

Edit this page
Next
Overview
What is Morph?
Getting Started
Engage in Our Ecosystem
Explore and Connect

© 2025 Morph. All rights reserved
Learn
Docs
Blog
Developers
APIs
Tools
Community
Forum
Telegram
Twitter
Discord
Company
About
Contact us
Careers
Brand Kit
It’s

morphing

time!

# Morph dev
Start Developing on Morph
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