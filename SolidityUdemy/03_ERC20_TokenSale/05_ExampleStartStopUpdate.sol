//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract ExampleStartStopUpdate {
    receive() external payable {}

    function destroySmartContract() public {
        selfdestruct(payable(msg.sender)); // There will be no more code on this address, but you can still interact with this address
        // Eth can be locked in this address, if you destroy it and send it after again
    }
}