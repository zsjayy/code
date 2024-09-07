const Contacts = artifacts.require("KerwinToken.sol")

module.exports = function(deployer){
    deployer.deploy(Contacts)
}