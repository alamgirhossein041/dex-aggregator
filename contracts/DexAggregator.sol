// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "./interfaces/IDexAdapter.sol";
import "hardhat/console.sol";

contract DexAggregator is Ownable {
    // Structs
    struct DexAdapter {
        address contractAddress;
        string name;
        bool active;
    }

    // Variables
    // DexAdapter[] private dexAdapters;
    mapping(uint => DexAdapter) private adapters;
    uint256 private numDexAdapters;
    uint256 private numActiveDexAdapters;

    // Events
    event DexAdapterAdded(uint adapterId, address contractAddress, string name, bool active);

    /**
     * @notice Contract constructor.
     */
    constructor() {
        console.log("Deploying DexAggregator contract");
    }

    /**
     * @notice Adds a new Dex contract to the aggregator controller.
     * @param _contractAddress - DexAdapter contract address.
     * @param _name - Dexname.
     */
    function addDexAdapter(address _contractAddress, string memory _name) public onlyOwner returns (uint256) {
        // TODO: Check correct id
        // TODO: Check if the address belongs to an IDexAdapter contract

        console.log("Adding a new Dex with contract '%s'", _contractAddress);

        // dexAdapters.push(DexAdapter(_contractAddress, _name, true));
        adapters[numDexAdapters] = DexAdapter(_contractAddress, _name, true);
        numDexAdapters += 1;
        numActiveDexAdapters += 1;

        // Emiting event
        emit DexAdapterAdded(numDexAdapters - 1, _contractAddress, _name, true);
        return numDexAdapters - 1;
    }

    function getDexAdapter(uint256 _adapterId) public view returns (address, string memory, bool) {
        DexAdapter storage adapter = adapters[_adapterId];

        return (adapter.contractAddress, adapter.name, adapter.active);
    }

    function updateDexAdapter(
        uint _dexId,
        address _contractAddress,
        string memory _name,
        bool _active
    ) public onlyOwner {
        // TODO: Check correct id
        // TODO: Check if the address belongs to an IDexAdapter contract

        adapters[_dexId] = DexAdapter(_contractAddress, _name, _active);
    }

    function getNumDexAdapters() public view returns (uint256, uint256) {
        return (numActiveDexAdapters, numDexAdapters);
    }

    // function swap(uint _adapterId, address _token0, address _token1) public payable {
    //     // IERC20 public token1;
    //     // IERC20 public token2;

    //     console.log("Swapping on '%i' dex -> t1:'%s', t2:'%s' ", _dexId, _token0, _token1);
    // }
}
