# BasicNft 🐶

```markdown
## 📝 Description
BasicNft is a simple ERC721 contract that allows users to mint NFTs representing unique Doggies. Each NFT has its own metadata URI stored on-chain, making it fully customizable.

## 🚀 Features
- 🐕 **Mint Unique Doggie NFTs**: Each NFT has a unique token ID and metadata URI.
- 🔗 **On-Chain Metadata Storage**: Token URIs are stored in a mapping.
- 🛠 **OpenZeppelin ERC721 Standard**: Secure and efficient implementation.
- 👤 **Anyone Can Mint**: No restrictions on minting NFTs.

## 📋 Prerequisites
- Install [Foundry](https://book.getfoundry.sh/) for smart contract development.
- Install OpenZeppelin contracts:
  ```sh
  forge install OpenZeppelin/openzeppelin-contracts
  ```

## 🛠 Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/tunnelrat07/NFTcontracts.git
   ```
2. Navigate to the project directory:
   ```sh
   cd NFTcontracts
   ```
3. Install dependencies:
   ```sh
   forge install
   ```

## 🚀 Deployment
To deploy the contract using Foundry:
```sh
forge create --rpc-url YOUR_RPC_URL --private-key YOUR_PRIVATE_KEY src/BasicNft.sol:BasicNft
```

## 🎮 Usage
### 🏗 Mint an NFT
```solidity
BasicNft basicNft = BasicNft(CONTRACT_ADDRESS);
basicNft.mintNFT("ipfs://your-metadata-uri");
```

### 📜 Retrieve Token Metadata
```solidity
string memory uri = basicNft.tokenURI(TOKEN_ID);
```

# MoodNft 🎭

```markdown
## 📝 Description
MoodNft is an advanced ERC721 NFT that dynamically updates its metadata based on mood. Owners can toggle their NFT's mood between "HAPPY" 😊 and "SAD" 😢, affecting how the NFT is displayed.

## 🚀 Features
- 🎨 **Dynamic Metadata**: NFT mood changes between "HAPPY" and "SAD".
- 🔗 **On-Chain Metadata Storage**: Uses Base64 encoding for storing metadata directly on-chain.
- 🛠 **OpenZeppelin ERC721 Standard**: Ensures security and reliability.
- 👤 **Owner-Only Mood Change**: Only the NFT owner can flip the mood.
- 🖼 **Customizable SVG Artwork**: Define your own sad and happy NFT images.

## 📋 Prerequisites
- Install [Foundry](https://book.getfoundry.sh/) for smart contract development.
- Install OpenZeppelin contracts:
  ```sh
  forge install OpenZeppelin/openzeppelin-contracts
  ```

## 🛠 Installation
1. Clone the repository:
   ```sh
   git clone https://github.com/tunnelrat07/NFTcontracts.git
   ```
2. Navigate to the project directory:
   ```sh
   cd NFTcontracts
   ```
3. Install dependencies:
   ```sh
   forge install
   ```

## 🚀 Deployment
To deploy the contract using Foundry:
```sh
forge create --rpc-url YOUR_RPC_URL --private-key YOUR_PRIVATE_KEY src/MoodNft.sol:MoodNft --constructor-args "ipfs://sad-image-uri" "ipfs://happy-image-uri"
```

## 🎮 Usage
### 🏗 Mint an NFT
```solidity
MoodNft moodNft = MoodNft(CONTRACT_ADDRESS);
moodNft.mintNft();
```

### 🔄 Flip Mood (Owner-Only)
```solidity
moodNft.flipMood(TOKEN_ID);
```

### 📜 Retrieve Token Metadata
```solidity
string memory uri = moodNft.tokenURI(TOKEN_ID);
```

### 🌆 Get Mood-Specific SVG URI
```solidity
string memory sadImage = moodNft.getSadSvgURI();
string memory happyImage = moodNft.getHappySvgURI();
```

## 🧪 Testing
Run the contract tests using Foundry:
```sh
forge test
```

## ⚖️ License
This project is licensed under the MIT License.
```
