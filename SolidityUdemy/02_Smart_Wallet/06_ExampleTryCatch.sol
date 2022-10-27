//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract WillTHrow {
    error NotAllowedError(string);

    function aFunction() public pure {
        // require(false, "ErrorMessage"); -> used to validate user input, returns remained gas
        // assert(false); -> used to validate invariants, consumes all gas
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorLogCode(uint code);
    event ErrorLogBytes(bytes lowLevelData);

    function catchTheError() public {
        WillTHrow will = new WillTHrow();
        try will.aFunction() { // Rarely used try/catch, you usually want it to fail
            // add code if it works
        } catch Error(string memory reason) { // for require, state reverting if one fails, all will fail
            emit ErrorLogging(reason);
        } catch Panic(uint errorCode) { // for assert, not state reverting
            emit ErrorLogCode(errorCode);
        } catch(bytes memory lowLevelData) { // for rest
            emit ErrorLogBytes(lowLevelData);
        }
    }
}