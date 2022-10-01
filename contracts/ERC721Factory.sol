// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

import "./ERC721Proxy.sol";

contract ERC721Factory {
    address public deployer;

    mapping(address => address[]) public allClones;

    event DropCreated(address dropAddress);

    constructor() {
        deployer = msg.sender;
    }

    // create clone of ERC721 smart contract
    function createDrop(string memory _name, string memory _symbol) public {
        ERC721Proxy child = new ERC721Proxy(_name, _symbol);
        emit DropCreated(address(child));
    }

}