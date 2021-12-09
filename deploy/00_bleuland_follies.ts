module.exports = async ({ getNamedAccounts, deployments }: any) => {
  const { deploy } = deployments;
  const { deployer, erc721base } = await getNamedAccounts();

  let baseAddress = erc721base;
  // Deploy in testnet or when no base is deployed
  if (!baseAddress) {
    baseAddress = (await deployments.get("ERC721Base")).address;
  }

  await deploy("BleulandFollies", {
    from: deployer,
    args: [baseAddress],
    log: true,
  });
};
module.exports.tags = ["BleulandFollies"];
module.exports.dependencies = ["ERC721Base"];
