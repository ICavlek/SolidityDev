//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMapping {
    mapping(uint => bool) public myMapping; //mapping is better then arrays THEY DON'T HAVE FIXED LENGTH; all uint values 2^256? in myMapping are initialized with default of bool that is false
    mapping(address => bool) public myAddressMapping;
    mapping(uint => mapping(uint => bool)) public uintUintBoolMapping;

    //function myMappingInternally(uint _key) public view returns(bool) {
    //    return myMapping[_key];
    //}
    //---> this myMappingInternally is what is equivalent in behind of 
    //mapping(uint => bool) public myMapping;

    function setValue(uint _index) public {
        myMapping[_index] = true;
    }

    function setMyAddressToTrue() public {
        myAddressMapping[msg.sender] = true;
    }

    function setUintUintBoolMapping(uint _key1, uint _key2, bool _value) public {
        uintUintBoolMapping[_key1][_key2] = _value;
    }
}