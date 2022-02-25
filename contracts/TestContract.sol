// SPDX-License-Identifier: GPL-3.0

/** Test Contract **/ 

pragma solidity 0.8.9;

import {IBaseERC721Interface, ConfigSettings} from "gwei-slim-nft-contracts/contracts/base/ERC721Base.sol";
import {ERC721Delegated} from "gwei-slim-nft-contracts/contracts/base/ERC721Delegated.sol";

import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract BleulandFollies is ERC721Delegated {
    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter public atId;
    
    mapping(uint256 => string) private myUris;

    string public contractURIData;

    constructor(
        IBaseERC721Interface baseFactory
    )
        ERC721Delegated(
          baseFactory,
          "Test Contract",
          "TESTAUCTION",
          ConfigSettings({
            royaltyBps: 1000,
            uriBase: "",
            uriExtension: "",
            hasTransferHook: false
          })
      )
    {}

    function mint(string memory uri) external onlyOwner {
        myUris[atId.current()] = uri;        
        _mint(msg.sender, atId.current());
        atId.increment();
    }

    function tokenURI(uint256 id) external view returns (string memory) {
        return myUris[id];
    }

    function burn(uint256 tokenId) external onlyOwner {
      _burn(tokenId);
    }

    function updateContractURI(string memory _contractURIData) external onlyOwner {
      contractURIData = _contractURIData;
    }
}