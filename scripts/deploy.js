// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// You can also run a script with `npx hardhat run <script>`. If you do that, Hardhat
// will compile your contracts, add the Hardhat Runtime Environment's members to the
// global scope, and execute the script.
const hre = require("hardhat");

async function main() {

  // const ERC721Proxy = await hre.ethers.getContractFactory("ERC721Proxy");
  // const ERC721ProxyDeploy = await ERC721Proxy.deploy();

  // await ERC721ProxyDeploy.deployed();

  // console.log(
  //   `ERC721Proxy deployed to ${ERC721ProxyDeploy.address}`
  // );

  const ERC721Factory = await hre.ethers.getContractFactory("ERC721Factory")
  const ERC721FactoryDeploy = await ERC721Factory.deploy()

  await ERC721FactoryDeploy.deployed()
  
  console.log(
    `ERC721Factory deployed to ${ERC721FactoryDeploy.address}`
  )
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
