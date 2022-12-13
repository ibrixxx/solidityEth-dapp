const main = async () => {
    const [deployer] = await hre.ethers.getSigners()
    const accountBalance = await deployer.getBalance()

    console.log("Deploying contracts with account: ", deployer.address)
    console.log("Account balance: ", accountBalance.toString())

    const waveContractFactory = await hre.ethers.getContractFactory("WavePortal");
    const waveContract = await waveContractFactory.deploy();
    await waveContract.deployed();

    console.log("WavePortal address: ", waveContract.address);
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
