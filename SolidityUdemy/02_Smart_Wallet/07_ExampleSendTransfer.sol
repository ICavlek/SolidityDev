//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Sender {
    receive() external payable {}

    function withdrawTransfer(address payable _to) public {
        _to.transfer(10); // Will throw exception if the transaction failes
    }

    function withdrawSend(address payable _to) public {
        bool isSent = _to.send(10); // Will return a boolean depending if it is successful or if it failed
        require(isSent, "Sending the funds was unsuccessful");
    }
}

contract ReceiverNoAction {

    function balance() public view returns(uint) {
        return address(this).balance;
    }

    receive() external payable {}
}

contract ReceiverAction {
    uint public balanceReceived;

    receive() external payable {
        balanceReceived += msg.value; // Expensive, especially the first time
    }

    function balance() public view returns(uint) {
        return address(this).balance;
    }
}