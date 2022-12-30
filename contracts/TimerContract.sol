pragma solidity ^0.8.17;

import "hardhat/console.sol";
import "./WavePortal.sol";

contract TimerContract {
    WavePortal wavePortal;

    constructor(address _wavePortal) public {
        wavePortal = WavePortal(_wavePortal);
    }

    function wave() public {
        wavePortal.wave(1);
    }
}
