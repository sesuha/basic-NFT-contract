// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract BasicNFT is ERC721URIStorage, Ownable {
    uint256 public tokenCounter;

    constructor() ERC721("BasicNFT", "BNFT") Ownable(msg.sender) {
        tokenCounter = 0;
    }

    function createNFT(string memory _tokenURI) public onlyOwner {
        _safeMint(msg.sender, tokenCounter);
        _setTokenURI(tokenCounter, _tokenURI);
        tokenCounter++;
    }
}

