
const KerwinToken = artifacts.require("KerwinToken.sol")

const fromWei = (bn)=>{
    return web3.utils.fromWei(bn,"ether")
}

const toWei = (number)=>{
    return web3.utils.toWei(number.toString(),"ether")
}

module.exports = async function(callback){
    const kerwinToken = await KerwinToken.deployed()
    let res_yue =await kerwinToken.balanceOf("0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1")
    console.log("转账当前余额为：",fromWei(res_yue))

    await kerwinToken.transfer("0x20e2A427173f9E5174dae39B09204a00f733Cd56",toWei(10000),{
        from:"0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1"
    })

    let res2 = await kerwinToken.balanceOf("0x90F8bf6A479f320ead074411a4B0e7944Ea8c9C1")
    console.log("转账账号余额为：",fromWei(res2))

    let res3 = await kerwinToken.balanceOf("0x20e2A427173f9E5174dae39B09204a00f733Cd56")
    console.log("到账账号余额为：",fromWei(res3))
    callback()
}