const Contacts = artifacts.require("KerwinToken.sol")

module.exports =async function(callback){
    const KerwinToken =await Contacts.deployed()
    let res =await KerwinToken.name()
    console.log("代币的名称",res)

    let res1 = await KerwinToken.totalSupply()
    console.log("代币的总量",res1)
    callback()
}