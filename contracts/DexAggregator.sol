// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract DexAggregator is Ownable {
    struct Dex {
        address contractAddress;
        string name;
        bool active;
    }

    Dex[] private dexes;

    // Events
    event DexAdded(uint id, address contractAddress, string name, bool active);

    /// @notice Contract constructor
    constructor() {
        console.log("Deploying DexAggregator contract");
    }

    function addDex(address _contractAddress, string memory _name, bool _active) public onlyOwner {
        console.log("Adding a new Dex with contract '%s'", _contractAddress);

        dexes.push(Dex(_contractAddress, _name, _active));

        // Emiting event
        emit DexAdded(dexes.length - 1, _contractAddress, _name, _active);
    }

    function getNumDexes() public view returns (uint) {
        return dexes.length;
    }

    // function swap(address _token0, address _token1) public payable {

    // }
}
