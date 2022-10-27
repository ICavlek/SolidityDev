//SPDX-License-Identifier: MIT

pragma solidity 0.8.16;

contract ExampleUnits {
    modifier betweenOneAndTwoEth() {
        require(msg.value >= 1 ether && msg.value < 2 ether); // ether, gwei, wei
        _;
    }

    uint runUntilTimeStamp;
    uint startTimeStamp;

    constructor(uint startInDays) {
        startTimeStamp = block.timestamp + (startInDays * 1 days); //seconds, minutes, hours, days, weeks
        runUntilTimeStamp = startTimeStamp + (7 days);
    }
}