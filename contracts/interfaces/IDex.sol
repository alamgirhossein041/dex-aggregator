// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

/**
 * @title Dex interface.
 */
interface IDex {
    /**
     * @notice Contract initializer method.
     * @param _symbol - Collateral ERC20 token symbol.
     * @param _collateral - Collateral ERC20 token address.
     * @param _ticketPrice - Single ticket price.
     */
    function swap(string memory _symbol, address _collateral, uint _ticketPrice) external;
}
