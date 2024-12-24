Here's a README for the **PhotoNFT** project:

---

# **PhotoNFT DApp**

A decentralized application (DApp) that allows users to mint, view, and manage photo NFTs (Non-Fungible Tokens). Users can mint new photo NFTs, set their visibility (public or private), and grant or revoke access to private photos. Built using **Solidity** smart contracts and **Web3.js** to interact with the Ethereum blockchain.

---

## **Features**

1. **Mint a Photo NFT**:
   - Users can mint a new photo NFT by providing a unique photo hash (IPFS URL), a description, and choosing whether the photo is public or private.
2. **Grant Photo Access**:

   - Users can grant specific viewers access to their private photo NFTs.

3. **Check Photo Access**:
   - Users can check if a specific address has access to a photo (either public or private).

---

## **Smart Contract Overview**

The PhotoNFT smart contract allows users to mint photo NFTs, manage their visibility, and grant access permissions to specific users. Here's a breakdown of the contract's key functions:

### **Main Functions**:

1. **mintPhoto**:

   - Allows a user to mint a new photo NFT. The photo can either be public or private.
   - Emits the `PhotoMinted` event upon successful minting.

2. **grantPhotoAccess**:

   - Allows the creator of a private photo to grant access to a specific address.
   - Emits the `PhotoAccessGranted` event upon success.

3. **canViewPhoto**:
   - Allows anyone to check if a specific viewer can view a photo based on its public/private status or granted access.

### **Events**:

- **PhotoMinted**: Emitted when a new photo NFT is minted.
- **PhotoAccessGranted**: Emitted when access to a private photo is granted.

---

## **Tech Stack**

- **Solidity**: Smart contract programming language to build the PhotoNFT contract.
- **Ethereum**: Blockchain network to deploy and interact with the contract.
- **Web3.js**: JavaScript library to interact with the Ethereum blockchain in the frontend.
- **MetaMask**: Browser extension to manage Ethereum accounts and interact with the Ethereum network.

---

## **Frontend Overview**

The frontend is a basic HTML interface that interacts with the Ethereum smart contract. The following features are available in the frontend:

1. **Mint a New Photo NFT**:
   - Input photo hash (IPFS URL), description, and choose whether the photo is public or private.
2. **Grant Access**:

   - Specify the photo ID and the viewer's address to grant them access to a private photo.

3. **Check Access**:
   - Check if a specific address can view a particular photo based on its visibility (public or private) and the viewer’s access permissions.

---

## **Installation**

### **1. Clone the Repository**

```bash
git clone https://github.com/your-repository/photo-nft-dapp.git
cd photo-nft-dapp
```

### **2. Install Dependencies**

The frontend uses **Web3.js** to interact with the Ethereum blockchain. Simply open the `index.html` file in your browser.

1. Ensure you have **MetaMask** installed and configured.
2. Ensure you're connected to the correct network (e.g., **Rinkeby**, **Goerli**, or **Mainnet**).

### **3. Deploy the Smart Contract**

You can deploy the smart contract using **Remix IDE** or any other Solidity development environment. Follow these steps:

- Copy the provided Solidity code into Remix IDE (https://remix.ethereum.org).
- Deploy the contract to an Ethereum testnet (e.g., Rinkeby or Goerli).
- Once deployed, copy the **contract address** and replace `YOUR_CONTRACT_ADDRESS` in the `index.html` file with the deployed contract address.

---

## **Usage**

### **Mint a Photo NFT**

1. Go to the mint section on the webpage.
2. Enter the photo hash (IPFS URL), a description, and choose whether the photo is public or private.
3. Click the "Mint Photo" button. This will mint a new photo NFT and store it on the blockchain.

### **Grant Access to a Private Photo**

1. In the access section, input the photo ID and the viewer's Ethereum address.
2. Click the "Grant Access" button to grant the viewer access to the private photo.

### **Check Photo Access**

1. Enter the photo ID and the viewer's Ethereum address.
2. Click the "Check Access" button to verify if the viewer can access the photo (based on public/private visibility and granted access).

---

## **License**

This project is licensed under the **MIT License** - see the [LICENSE](LICENSE) file for details.

---

## **Contributing**

Feel free to fork the repository, make improvements, or report any issues. Contributions are welcome!

---

## **Acknowledgments**

- **Web3.js**: For interacting with the Ethereum blockchain.
- **MetaMask**: For managing Ethereum accounts and interacting with the network in the browser.
- **Remix IDE**: For Solidity development and contract deployment.

---

This README provides a complete guide to setting up, using, and understanding the **PhotoNFT DApp**. Let me know if you need further assistance or clarification!
