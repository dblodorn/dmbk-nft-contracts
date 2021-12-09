// SPDX-License-Identifier: GPL-3.0

/**    ,,,,,
         /(o o)\
|=-----ooO-(o)-Ooo--------------------------------------=|  
|      ___           ___                       ___       |
|     /\  \         /\  \          ___        /\__\      |
|    /::\  \       /::\  \        /\  \      /::|  |     |
|   /:/\:\  \     /:/\:\  \       \:\  \    /:|:|  |     |
|  /:/  \:\__\   /::\~\:\  \      /::\__\  /:/|:|  |__   |
| /:/__/ \:|__| /:/\:\ \:\__\  __/:/\/__/ /:/ |:| /\__\  |
| \:\  \ /:/  / \/__\:\/:/  / /\/:/  /    \/__|:|/:/  /  |
|  \:\  /:/  /       \::/  /  \::/__/         |:/:/  /   |
|   \:\/:/  /        /:/  /    \:\__\         |::/  /    |
|    \::/__/        /:/  /      \/__/         /:/  /     |
|     ~~            \/__/                     \/__/      |
|                          ''',                          |
|                   o_)O \)____)"                        |
|                    \_        )                         |
|               MrDain!  '',,,,,,                        |
|                        ||  ||       ** NFT Factory **  |
|                       "--'"--'   ** From TinkerTown ** |
|=--------||-?-||---------------------------------------=|
 
**/ 

pragma solidity 0.8.9;

import {IBaseERC721Interface, ConfigSettings} from "gwei-slim-nft-contracts/contracts/base/ERC721Base.sol";
import {ERC721Delegated} from "gwei-slim-nft-contracts/contracts/base/ERC721Delegated.sol";

import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract MrDainBlo is ERC721Delegated {
    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter public atId;
    
    mapping(uint256 => string) private myUris;

    constructor(
        IBaseERC721Interface baseFactory
    )
        ERC721Delegated(
          baseFactory,
          "Mr Dain's NFT Factory",
          "MRDAINBLO",
          ConfigSettings({
            royaltyBps: 1000,
            uriBase: "",
            uriExtension: "",
            hasTransferHook: false
          })
      )
    {}

    function mint(string memory uri) public onlyOwner {
        myUris[atId.current()] = uri;        
        _mint(msg.sender, atId.current());
        atId.increment();
    }

    function burn(uint256 tokenId) public onlyOwner {
        require(_exists(tokenId));
        _burn(tokenId);
    }

    function tokenURI(uint256 id) external view returns (string memory) {
        return myUris[id];
    }
}
