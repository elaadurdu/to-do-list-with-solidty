// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ToDo{

    struct List{
        string task;
        bool isCompleted;
    }

    List[] public lists;

    function create(string calldata _task) external{
        lists.push(List({
            task: _task,
            isCompleted: false
        }));
    }
    function updateTasks(uint _index, string calldata _task) external{
        lists[_index].task = _task;
        //List storage list = lists[_index];
    }
    function get(uint _index) external view returns(string memory, bool){
        List memory list= lists[_index];
        return (list.task,list.isCompleted);
    }
    function checkCompleted(uint _index) public{
        List storage list = lists[_index];
        list.isCompleted = !list.isCompleted;
    }

}