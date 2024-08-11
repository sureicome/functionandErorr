// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract SimpleWallet {
    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function deposit() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero");
    }

    function withdraw(uint256 amount) public {
        require(msg.sender == owner, "Only the owner can withdraw funds");

        require(address(this).balance >= amount, "Insufficient balance in the contract");

        payable(owner).transfer(amount);

        assert(address(this).balance >= 0);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function changeOwner(address newOwner) public {
        require(msg.sender == owner, "Only the current owner can change the owner");

        if (newOwner == address(0)) {
            revert("New owner cannot be the zero address");
        }

        owner = newOwner;
    }
}
