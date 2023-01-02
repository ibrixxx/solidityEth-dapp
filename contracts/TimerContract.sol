// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./WavePortal.sol";
import "@openzeppelin/contracts/ethereum-alarm-clock/EthereumAlarmClock.sol";


contract TimerContract {
    WavePortal wavePortal;
    EthereumAlarmClock eac = EthereumAlarmClock('');


    constructor(address _wavePortal) public {
        wavePortal = WavePortal(_wavePortal);
        eac.scheduleCall(address(this), now + 1 days, 0, wave().encodeABI());
    }

    function wave() public {
        wavePortal.wave(1);
    }
}

