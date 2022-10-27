//SPDX-License-Identifier: MIT

pragma solidity 0.8.14;

contract ExampleUint {
    uint public myUint = 0; // 0 - (2^256 - 1)

    uint8 public myUint8 = 2**4; // Leaving it uninitialized, uses more gas

    int public myInt = -10; // -2^128 + 2^128-1

    function setMyUint(uint _myUint) public {
        myUint = _myUint;
    }

    function incrementUint8() public {
        ++myUint8;
    }

    function decrementUint() public {
        myUint--;
    }

    function incrementMyInt() public {
        ++myInt;
    }

}