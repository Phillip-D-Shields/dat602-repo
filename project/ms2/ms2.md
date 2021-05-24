# MILESTONE TWO

> # PROJECT REALIGNMENT DEFENSE

I have decided to realign this assessment with my direction as an aspiring blockchain developer. I am currently focused on learning Haskell, Plutus, and Solidity outside of classes because I firmly believe that blockchain technology and decentralised database structures will become much more prevalant in the future. I am not suggesting that decentralised databases will render centralised databases obselete, but I am confident that blockchain technology is and will continue to emerge as a powerful technology. 

I really struggled to piece the classes and class content together, and if I am required to 'teach myself' large chunks to be able to complete the assessment, then I would much prefer to learn a tech stack more inline with my future plans as a smart contract developer. I will provide information and examples that meet some or most of the requirements already defined by the milestones. I will adjust my project to meet the requirements, as it is obviously not fair to expect the curriculim to change for me.

> ### TECH STACK USED

<!-- add links -->
> - Node.js - Javascript runtime.
> - Web3.js - Collection of js libraries used to interact with the ethereum network.
> - Solidity - a statically-typed curly-braces programming language designed for developing smart contracts that run on ethereum network.
> - MetaMask - A browser extension that allows the browser to access the ethereum virtual network, also know as EVN, and interact with the blockchain as a wallet.
> - Truffle - Development environment, testing framework and asset pipeline for blockchains.
> - Ganache - Development blockchain used for developing and testing smart contracts without having to deploy them.
> - React.js - Front-end framework.

> ### NEW GAME OUTLINE

The new game will be a decentralised app, also known as a dApp, that contains a memory tile game. When a user matches two tiles they will automatically be given a non=fungible token, also known as an NFT, of the tiles they have just matched. The first iteration of the game will be single player, and will contain a chat room and highscores leaderboard. A second iteration of a multiplayer game will begin development after certain requirements are achieved for the single player game. 

There are a large number of different blockchains currently in existence, that could be used for this assessment. Ethereum is by far the biggest and most popular of them all, so the tech stack used is specific for interacting with the EVN. But the overlaying concepts could be applied in the same way with most blockchains.

A major concern when realigning this assessment was that in order for a user to interact with the EVN they must pay gas fees, usually in the crypto currency ETH. This provides financial reimbursment for the nodes that run the EVN. Luckily, with the Ganache development suite, a local blockchain is simulated and can be used for developing and testing without requiring any actual fees to be paid to the EVN.

## PROCEDURES

The procedures used to create, retrieve, update, and delete data will be significantly different than using a centralised relational database. The ethereum virtual network (EVN) and interplanetary file system (IPFS) will be used to complete all CRUD procedures required.

### GAME PLAY

A player will be given a set time limit to find as many matches within a set of tiles randomly distributed across the screen. Any match they find within the time limit will be minted as an ERC721 NFT and sent directly to their metamask wallet.

### REGISTRATION

Since Metamask is required to access the EVN, the unique wallet address can be used as the users credentials. This means that a user will not have to register or login with credentials specific to the game. They only need to have previously created a Metamask wallet, then navigate to the dApp with the wallet activated as a browser extension. Some specific instructions about installing and using Metamask can be found here.

The advantage of using the wallet for player credentials is that a user can access all dApps across the EVN with a single wallet.  

<!-- insert screenshots with captions about registering and using the wallet address -->

### PLAYER SELECTION

This section will be replaced with game level selection. The more difficult a level is, the more tiles will be displayed making it more difficult for the user to find within the time limit. More valuable tiles will also be assigned to the more difficult levels. Player records and additional data will be kept on the IPFS. Player data could be stored on the EVN as well, but IPFS is a fascinating and promising tech that I would like to incorporate into this project.

<!-- insert screenshots of code for mm address and basic ipfs storage and retrieval -->

### CONFIRMATION

Blockchains and smart contracts are immutable, so it is imperative that smart contracts be tested rigorously before deploying to the actual EVN. This process ensures that everything is verified before any data transactions occur. This process reduces data transmission, bandwidth used, resources required, and possiblity for user error.  

### GAME ADMIN

An admin account will not be necessary. EVN smart contracts and the blockchain blocks are immutable, so any admin options or actions must be considered prior to smart contract deployment. The player data stored on IPFS will also only be modified through smart contracts that monitor user activity.

## MULTIPLAYER ACID

### ATOMICITY

### CONSISTENCY

### ISOLATION

### DURABILITY

## TESTS
