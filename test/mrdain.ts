import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import "@nomiclabs/hardhat-ethers";
import { ethers, deployments } from "hardhat";
import { ERC721Base, MrDain, TestBase } from "../typechain";

describe("MrDain", () => {
  let signer: SignerWithAddress;
  let signerAddress: string;
  let mrDain: MrDain;
  let baseNft: ERC721Base;

  beforeEach(async () => {
    const { MrDain } = await deployments.fixture([
      "ERC721Base",
      "MrDain",
    ]);

    mrDain = (await ethers.getContractAt(
      "MrDain",
      MrDain.address
    )) as MrDain;
    baseNft = (await ethers.getContractAt(
      "TestBase",
      MrDain.address
    )) as TestBase;

    signer = (await ethers.getSigners())[0];
    signerAddress = await signer.getAddress();
  });

  it("mints", async () => {
    await mrDain.mint('http://cool-nfts.net');
    expect(await baseNft.ownerOf(0)).to.be.equal(signerAddress)
    const uri = await baseNft.tokenURI(0)
    expect(uri).to.be.equal('http://cool-nfts.net')
  });
});
