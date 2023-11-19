// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ErrorHandler {
    uint public balance;

    function deposit(uint amount) public payable {
        require(amount > 0, "Amount must be greater than 0");
        balance += amount;
    }

    function withdraw(uint amount) public {
        assert(balance >= amount);
        balance -= amount;
        if (!payable(msg.sender).send(amount)) {
            revert("Failed to send funds");
        }
    }
}
