// contracts/WETHMock.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract WETHMock {
    mapping(address => uint256) public balance;
    event Deposit(address indexed user, uint256 amount);
    event Withdraw(address indexed user, uint256 amount);

    function deposit() external payable {
        balance[msg.sender] += msg.value;
        emit Deposit(msg.sender, msg.value);
    }

    function withdraw(uint256 amt) external {
        require(balance[msg.sender] >= amt);
        balance[msg.sender] -= amt;
        payable(msg.sender).transfer(amt);
        emit Withdraw(msg.sender, amt);
    }
}
