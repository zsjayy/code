// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract StudentStorage{
    // 这两个是状态变量，存储在storage，高gas消费
    uint age;
    string name;

    function setData(string memory _name, uint _age) public{
        //_name,_age是形参，中转传递值，使用memory存储，低gas消费
        name = _name;
        age = _age;
        
    }
}