// SPDX-License-Identifier: GPL-3.0

/**    BLEULAND FOLLIES BY DAIN MYRICK BLODORN KIM
    _______  _______   ________  ________  _______   ________  ________   _______ 
  ╱╱      ╱ ╱       ╲ ╱        ╲╱    ╱   ╲╱       ╲ ╱        ╲╱    ╱   ╲_╱       ╲
 ╱╱       ╲╱        ╱╱         ╱         ╱        ╱╱         ╱         ╱         ╱
╱         ╱        ╱╱        _╱         ╱        ╱╱         ╱         ╱         ╱ 
╲________╱╲________╱╲________╱╲________╱╲________╱╲___╱____╱╲__╱_____╱╲________╱  
    _______  ________  _______   _______   ________  ________  ________           
  ╱╱       ╲╱        ╲╱       ╲ ╱       ╲ ╱        ╲╱        ╲╱        ╲          
 ╱╱      __╱         ╱        ╱╱        ╱_╱       ╱╱         ╱        _╱          
╱        _╱         ╱        ╱╱        ╱╱         ╱        _╱-        ╱           
╲_______╱ ╲________╱╲________╱╲________╱╲________╱╲________╱╲________╱

**/ 

pragma solidity 0.8.9;

import {IBaseERC721Interface, ConfigSettings} from "gwei-slim-nft-contracts/contracts/base/ERC721Base.sol";
import {ERC721Delegated} from "gwei-slim-nft-contracts/contracts/base/ERC721Delegated.sol";

import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract BleulandFollies is ERC721Delegated {
    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter public atId;
    
    mapping(uint256 => string) private myUris;

    constructor(
        IBaseERC721Interface baseFactory
    )
        ERC721Delegated(
          baseFactory,
          "Bleuland Follies",
          "BLEULAND",
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

    string public contractInfo = 'ipfs://QmXBAyvBCZ8WErGqTjKSWQztB4zRMsEtf3T5ZuBzBTDP3z';
}