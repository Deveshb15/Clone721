// SPDX-License-Identifier: MIT
/*

 ________  _______   ___      ___ _______   ________  ___  ___     
|\   ___ \|\  ___ \ |\  \    /  /|\  ___ \ |\   ____\|\  \|\  \    
\ \  \_|\ \ \   __/|\ \  \  /  / | \   __/|\ \  \___|\ \  \\\  \   
 \ \  \ \\ \ \  \_|/_\ \  \/  / / \ \  \_|/_\ \_____  \ \   __  \  
  \ \  \_\\ \ \  \_|\ \ \    / /   \ \  \_|\ \|____|\  \ \  \ \  \ 
   \ \_______\ \_______\ \__/ /     \ \_______\____\_\  \ \__\ \__\
    \|_______|\|_______|\|__|/       \|_______|\_________\|__|\|__|
                                              \|_________|         
                                                                   
                                                                   

*/
pragma solidity ^0.8.7;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract ERC721Proxy is ERC721, ERC721URIStorage {

    string public baseURI;

    // constructor(string memory _name, string memory _symbol, string memory _uri) ERC721(_name, _symbol) {
    //     baseURI = _uri;
    // }
    constructor(string memory _name, string memory _symbol) ERC721(_name, _symbol) {
        baseURI = "ipfs://QmNVL1r5C3w3aWMFegE7HgD4LAeEsXCvgXS5Hcydizt1ku";
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }

    function safeMint(address to, uint256 tokenId)
        public
    {
        _safeMint(to, tokenId);
    }

    // The following functions are overrides required by Solidity.

    function _burn(uint256 tokenId) internal override(ERC721, ERC721URIStorage) {
        super._burn(tokenId);
    }

    function tokenURI(uint256 tokenId)
        public
        view
        override(ERC721, ERC721URIStorage)
        returns (string memory)
    {
        return string(abi.encodePacked(_baseURI(), "/", Strings.toString(tokenId), ".json"));
    }
}