const main = async () => {
    const waveContractFactory = await hre.ethers.getContractFactory('WavePortal')
    const waveContract = await waveContractFactory.deploy()
    await waveContract.deployed()

    console.log('Contract addy: ', waveContract.address)

    let waveCount = await waveContract.getTotalWaves()
    console.log(waveCount.toNumber())

    let firstWaveTxn = await waveContract.wave(300)
    await firstWaveTxn.wait()

    const [_, randomPerson] = await hre.ethers.getSigners()
    firstWaveTxn = await waveContract.connect(randomPerson).wave(20)
    await firstWaveTxn.wait()

    await waveContract.getTotalWaves()
    let allWaves = await waveContract.getAllWaves()
    console.log(allWaves)
}

const intMain = async () => {
    try {
        await main()
        process.exit(0)
    }
    catch (e) {
        console.log(e)
        process.exit(1)
    }
}

intMain()
