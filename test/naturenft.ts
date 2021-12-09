import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { expect } from "chai";
import "@nomiclabs/hardhat-ethers";
import { ethers, deployments } from "hardhat";
import { ERC721Base, NatureNFT, TestBase } from "../typechain";

describe("NatureNFT", () => {
  let signer: SignerWithAddress;
  let signerAddress: string;
  let natureNFT: NatureNFT;
  let baseNft: ERC721Base;

  beforeEach(async () => {
    const { NatureNFT } = await deployments.fixture([
      "ERC721Base",
      "NatureNFT",
    ]);

    natureNFT = (await ethers.getContractAt(
      "NatureNFT",
      NatureNFT.address
    )) as NatureNFT;
    baseNft = (await ethers.getContractAt(
      "TestBase",
      NatureNFT.address
    )) as TestBase;

    signer = (await ethers.getSigners())[0];
    signerAddress = await signer.getAddress();
  });

  it("mints", async () => {
    await natureNFT.mint('https://gateway.pinata.cloud/ipfs/QmUXnF3fzWU52se4B5Rjdbz2vywBmqU7yhKoswn2uNaow2');
    expect(await baseNft.ownerOf(0)).to.be.equal(signerAddress)
    const uri = await baseNft.tokenURI(0)
    expect(uri).to.be.equal('https://gateway.pinata.cloud/ipfs/QmUXnF3fzWU52se4B5Rjdbz2vywBmqU7yhKoswn2uNaow2')
  });
});
