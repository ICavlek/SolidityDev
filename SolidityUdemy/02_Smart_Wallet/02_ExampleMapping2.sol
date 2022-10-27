//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMappingWithdrawals {
    mapping(address => uint) public balanceReceived;

    function sendMoney() public payable {
        balanceReceived[msg.sender] += msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function withdrawAllMoney(address payable _to) public {
        // It takes some time for the amounts to arrive to destination
        // Therefore, it needs to be set 0, because maybe someone will request multiple times
        uint balanceToSendOut = balanceReceived[msg.sender];
        balanceReceived[msg.sender] = 0;
        _to.transfer(balanceToSendOut);
    }
}