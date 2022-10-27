//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract SampleFallback {
    uint public lastValueSent;
    string public lastFunctionCalled;
    uint public myUint;

    function setMyUint(uint _myNewUint) public {
        myUint = _myNewUint;
    }

    // 0xe492fd840000000000000000000000000000000000000000000000000000000000000001 - this is the value 1 sent from setMyUint
    // 492fd84 - Function signature, kcak hash of "setMyUint(uint256)"
    // Console check -> web3.utils.sha3("setMyUint(uint256)")
    // 0xe492fd842fb25dc4b3c624c80776108b452a545c682a78e4252b5560c6537b79 - first 4 bytes are taken, rest is thrown away
    // If we send 0xe492fd840000000000000000000000000000000000000000000000000000000000000001 directly to CALLDATA, it will be as calling setMyUint with 1
    // If we send 0xabcd, it doesn't know where to go -> it goes to fallback function
    // address(this).balance -> gives the contracts balance in WEI, if some money was sent to it
    // Gas limit 2300 gas in real network

    // function that is called in CALLDATA WITHOUT any data
    receive() external payable { 
        lastValueSent = msg.value;
        lastFunctionCalled = "receive";
    }

    // function that is called in CALLDATA WITH some data, i.e. 0xabcd
    // if you comment out receive() function and transact in CALLDATA without anything, it will automatically call fallback()
    fallback() external payable { 
        lastValueSent = msg.value;
        lastFunctionCalled = "fallback";
    }
}