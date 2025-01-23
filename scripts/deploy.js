async function main() {
    const [deployer] = await ethers.getSigners();
    console.log("Deploying contracts with the account:", deployer.address);

    const InvestmentToken = await ethers.getContractFactory("InvestmentToken");
    const token = await InvestmentToken.deploy(1000000); // Initial supply
    console.log("InvestmentToken deployed to:", token.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });