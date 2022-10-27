//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract TheBlockChainMessenger {
    uint public changedCounter;
    address public owner;
    string public theMessage;

    constructor() {
        owner = msg.sender;
    }

    function updateTheMessage(string memory _newMessage) public {
        if(msg.sender == owner) {
            theMessage = _newMessage;
            ++changedCounter;
        }
    }
}