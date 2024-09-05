// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.16 <0.9.0;

contract StudentListStorage{
    // 结构体
    struct Student{
        uint id;
        string name;
        uint age;
    }
    //动态数组
    Student[] public StudentList;
    //set变量
    function addList(string memory _name,uint _age) public returns (unit){
        uint count = StudentList.length;
        uint index = count+1;
        StudentList.push(Student(index,_name,_age));
        return StudentList.length;
    }
    //get变量
    function getList() public view returns (Student[] memroy){
        Student[] memory list = StudentList;
        return list;
    }
}