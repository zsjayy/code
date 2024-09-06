const consoleShim = require("gremlins/lib/consoleShim")

const Contacts = artifacts.require("StudentListStorage.sol")

module.exports =async function (callback) {
    const studentStorage = await Contacts.deployed()
    
    await studentStorage.addList("jay01", 100)
    let res = await studentStorage.getList()
    console.log(res,res.length)
    // console.log(await studentStorage.name())
    // console.log(await studentStorage.age())
    // console.log(studentStorage.gitList().legth)
    await studentStorage.delList(5)
    let res1 = await studentStorage.getList()
    console.log("删除后的结果",res1)

    callback()
}