// SPDX-License-Identifier: GPL-3.0

/** OOBK ~ Oskar's Spot on the Block! (-:
Made this for you my Son, hope you have some
FUN with it in your future (-;
LOVE DMBK!
                   ___       ___         
                  (   )     (   )        
  .--.     .--.    | |.-.    | |   ___   
 /    \   /    \   | /   \   | |  (   )  
|  .-. ; |  .-. ;  |  .-. |  | |  ' /    
| |  | | | |  | |  | |  | |  | |,' /     
| |  | | | |  | |  | |  | |  | .  '.     
| |  | | | |  | |  | |  | |  | | `. \    
| '  | | | '  | |  | '  | |  | |   \ \   
'  `-' / '  `-' /  ' `-' ;   | |    \ .  
 `.__.'   `.__.'    `.__.   (___ ) (___) 
                                                                             
**/ 

pragma solidity 0.8.9;

import {IBaseERC721Interface, ConfigSettings} from "gwei-slim-nft-contracts/contracts/base/ERC721Base.sol";
import {ERC721Delegated} from "gwei-slim-nft-contracts/contracts/base/ERC721Delegated.sol";

import {CountersUpgradeable} from "@openzeppelin/contracts-upgradeable/utils/CountersUpgradeable.sol";

contract OOBK is ERC721Delegated {
    using CountersUpgradeable for CountersUpgradeable.Counter;
    CountersUpgradeable.Counter public atId;
    
    mapping(uint256 => string) private myUris;

    string public contractURI = 'https://ipfs.io/ipfs/QmW8BXyARdoB6i35eUJAvEqreCGV9QVU1nbK9q3G5u7Kfj';

    constructor(
        IBaseERC721Interface baseFactory
    )
        ERC721Delegated(
          baseFactory,
          "Oskar Oak Blodorn Kim",
          "OOBK",
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

    function updateContractURI(string memory _contractURI) external onlyOwner {
      contractURI = _contractURI;
    }
}
