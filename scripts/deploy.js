// scripts/deploy.js
const hre = require("hardhat"); 

async function main() {
    // Get the contract to deploy
    const Greeter = await ethers.getContractFactory("Greeter");
    console.log("Deploying Greeter...");

    // Deploy the contract
    const greeter = await Greeter.deploy("Hello, Hardhat!");
    await greeter.deployed();

    console.log("Greeter deployed to:", greeter.address);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
