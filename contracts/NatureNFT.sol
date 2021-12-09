// SPDX-License-Identifier: GPL-3.0
pragma solidity 0.8.9;

import {IBaseERC721Interface, ConfigSettings} from "gwei-slim-nft-contracts/contracts/base/ERC721Base.sol";
import {ERC721Delegated} from "gwei-slim-nft-contracts/contracts/base/ERC721Delegated.sol";

import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract NatureNFT is ERC721Delegated {
    uint256 public currentTokenId;
    mapping(uint256 => string) private myUris;

    constructor(
        IBaseERC721Interface baseFactory
    )
        ERC721Delegated(
          baseFactory,
          "Nature",
          "NATURE",
          ConfigSettings({
            royaltyBps: 1000,
            uriBase: "",
            uriExtension: "",
            hasTransferHook: false
          })
      )
    {}

    function mint(string memory uri) external onlyOwner {
        myUris[currentTokenId] = uri;
        _mint(msg.sender, currentTokenId++);
    }

    function burn(uint256 tokenId) external onlyOwner {
        require(_exists(tokenId));
        _burn(tokenId);
    }

    function tokenURI(uint256 id) external view returns (string memory) {
        return myUris[id];
    }
}
