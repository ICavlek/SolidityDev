//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleViewPure {
    uint public myStorageVariable;

    function getMyStorageVariable() public view returns(uint) {
        return myStorageVariable; // It can access storage variables, but it cannot write them -> read only
    }

    function getAddition(uint a, uint b) public pure returns(uint) {
        return a+b; // it can only call variables which are NOT storage variables -> static
    }

    function setMyStorageVariable(uint _newVar) public returns(uint) {
        myStorageVariable = _newVar; //Bad practice, writing functions usually don't have returns, Events are used for that
        return _newVar;
    }
}