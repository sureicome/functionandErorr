# SimpleWallet Contract

## Overview

The `SimpleWallet` contract is a basic Ethereum smart contract that allows the owner to deposit, withdraw, and manage Ether. The contract also provides a way to check the balance and transfer ownership of the wallet to another address. The contract ensures security and correct behavior using `require()`, `assert()`, and `revert()` statements.

## Features

- **Deposit Ether:** Anyone can deposit Ether into the contract.
- **Withdraw Ether:** Only the owner can withdraw Ether from the contract.
- **Check Balance:** Anyone can check the current balance of the contract.
- **Change Owner:** The owner can transfer ownership of the contract to another address.

## Prerequisites

- Solidity ^0.8.20
- An Ethereum development environment like [Remix](https://remix.ethereum.org/), [Truffle](https://www.trufflesuite.com/truffle), or [Hardhat](https://hardhat.org/).

## Functions

### `constructor()`

- **Description:** Initializes the contract by setting the deployer as the owner.

### `deposit() public payable`

- **Description:** Allows users to deposit Ether into the contract.
- **Requires:** The deposit amount (`msg.value`) must be greater than zero.
- **Usage:** Send Ether along with the function call to deposit it into the contract.

### `withdraw(uint256 amount) public`

- **Description:** Allows the owner to withdraw a specified amount of Ether from the contract.
- **Requires:**
  - The caller must be the owner.
  - The contract must have sufficient balance to withdraw the specified amount.
- **Usage:** Call this function with the desired amount of Ether to withdraw.

### `getBalance() public view returns (uint256)`

- **Description:** Returns the current balance of the contract.
- **Usage:** Call this function to check how much Ether is currently stored in the contract.

### `changeOwner(address newOwner) public`

- **Description:** Allows the current owner to transfer ownership to another address.
- **Requires:**
  - The caller must be the current owner.
  - The `newOwner` address must not be the zero address.
- **Usage:** Call this function with the new owner's address to transfer ownership.

## Usage

1. **Deploy the Contract:** 
   - Deploy the contract on an Ethereum network (e.g., via Remix).
   - The deployer will automatically become the contract owner.

2. **Deposit Ether:**
   - Call the `deposit()` function from any address with the desired amount of Ether attached to the transaction.

3. **Withdraw Ether:**
   - The owner can call the `withdraw()` function with the amount of Ether to withdraw from the contract.

4. **Check Balance:**
   - Call the `getBalance()` function to check the current Ether balance in the contract.

5. **Change Owner:**
   - The current owner can call the `changeOwner()` function with a new address to transfer ownership.

## Example

```solidity
// Example of deploying and interacting with the SimpleWallet contract:

// 1. Deploy the contract
SimpleWallet wallet = new SimpleWallet();

// 2. Deposit Ether
wallet.deposit{value: 1 ether}();

// 3. Withdraw Ether (only owner)
wallet.withdraw(0.5 ether);

// 4. Check balance
uint256 balance = wallet.getBalance();

// 5. Change owner (only current owner)
wallet.changeOwner(newOwnerAddress);
