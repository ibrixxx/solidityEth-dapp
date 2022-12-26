// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

import "hardhat/console.sol";

contract WavePortal {
    uint256 totalWaves;
    uint members;

    constructor() {
        console.log('test 12');
    }

    event NewWave(address indexed from, uint256 timestamp);

    struct Wave {
        address waver;
        uint256 timestamp;
    }

    Wave[] waves;

    function wave(uint256 number) public {
        totalWaves += number;
        console.log('%s has waved', msg.sender);
        waves.push(Wave(msg.sender, block.timestamp));
        emit NewWave(msg.sender, block.timestamp);
    }

    function setMembers(uint256 x) public{
        members = x;
    }

    function getMembers() public view returns (uint256){
        console.log('We have %d total members!', members);
        return members;
    }

    function getTotalWaves() public view returns (uint256) {
        console.log('We have %d total waves!', totalWaves);
        return totalWaves;
    }

    function getAllWaves() public view returns (Wave[] memory) {
        return waves;
    }
}
