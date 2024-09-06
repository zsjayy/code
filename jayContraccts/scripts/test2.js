const Contacts = artifacts.require("StudentListStorage.sol")

module.exports =async function (callback) {
    const studentStorage = await Contacts.deployed()
    
    await studentStorage.addList("jay", 100)
    let res = await studentStorage.getList()
    console.log(res)
    // console.log(await studentStorage.name())
    // console.log(await studentStorage.age())
    await studentStorage.delList(0)
    let res1 = await studentStorage.getList()
    console.log(res1)

    callback()
}