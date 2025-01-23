require("@nomiclabs/hardhat-ethers");
require("dotenv").config();

module.exports = {
  solidity: "2.22.18",
  networks: {
    sepolia: {
      url: process.env.SEPOLIA_RPC_URL, // RPC URL from Alchemy/Infura
      accounts: [process.env.PRIVATE_KEY], // Private key of your wallet
    },
  },
};

