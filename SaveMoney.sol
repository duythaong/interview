// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract SaveMoney {
    mapping(address => uint) public userBalance;

    function sendMoney() public payable {
        userBalance[msg.sender] += msg.value;
    }

    function withdrawMoney() public {
        uint balanace = userBalance[msg.sender];
        require(balanace > 0);

        (bool sent, ) = msg.sender.call{value: balanace}("");
        require(sent, "Failed to send Ether");

        userBalance[msg.sender] = 0;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}