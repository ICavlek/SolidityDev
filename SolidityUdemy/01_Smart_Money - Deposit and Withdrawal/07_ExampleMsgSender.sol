//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMsgSender {
    address public someAddress; //20 bytes

    function updateSomeAddress() public {
        someAddress = msg.sender; // From Account to Contract
    }
}