//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleString {
    string public myString = "Hello World"; // Not advisable to use strings, better bytes
    bytes public myBytes = "Hello World";
    bytes public myBytesUni = unicode"Čavlek";

    function setMyString(string memory _myString) public {
        myString = _myString;
    }

    function compareTwoStrings(string memory _myString) public view returns(bool) {
        return keccak256(abi.encodePacked(myString)) == keccak256(abi.encodePacked(_myString));
    }

    function getBytesLength() public view returns(uint) {
        return myBytes.length;
    }

    function getBytesUnicodeLength() public view returns(uint) {
        return myBytesUni.length; // Č takes 2 bytes
    }
}