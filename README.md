ErrorHandlingDemo Smart Contract
Overview
The ErrorHandlingDemo smart contract demonstrates the use of Solidity's error-handling mechanisms: require(), assert(), and revert(). These functions are essential for ensuring that specific conditions are met during contract execution, providing robust error handling and security.

Features
Store a Positive Number: Allows users to store a positive number in the contract.
Divide Numbers: Provides a safe division function that ensures the denominator is non-zero and validates the operation using assertions.
Withdraw Ether: Allows the contract owner to withdraw all Ether from the contract.
Receive Ether: The contract can receive Ether from external accounts.
Contract Details
State Variables
positiveNumber: A uint256 variable that stores a positive number set by the user.
owner: An address variable that stores the contract owner's address. It is set to the deployer's address during contract creation.
Constructor
solidity
Copy code
constructor() {
    owner = msg.sender;
}
Purpose: The constructor sets the deployer as the contract owner.
Functions
setPositiveNumber
solidity
Copy code
function setPositiveNumber(uint256 _number) public
Purpose: Sets the positiveNumber variable to the input value, but only if the input is greater than zero.
Error Handling: Uses require() to ensure the number is positive. If _number is not positive, the transaction reverts with the message "Number must be positive".
divideNumbers
solidity
Copy code
function divideNumbers(uint256 _numerator, uint256 _denominator) public pure returns (uint256)
Purpose: Divides the numerator by the denominator and returns the result.
Error Handling:
Uses require() to ensure the denominator is not zero, reverting with "Denominator cannot be zero" if it is.
Uses assert() to confirm that the multiplication of the result by the denominator equals the numerator, catching any unexpected internal errors.
withdraw
solidity
Copy code
function withdraw() public
Purpose: Allows the contract owner to withdraw all Ether stored in the contract.
Error Handling:
Uses revert() within an if statement to ensure that only the owner can withdraw funds. If the caller is not the owner, the transaction reverts with "Only the owner can withdraw funds".
receive
solidity
Copy code
receive() external payable {}
Purpose: Allows the contract to accept Ether payments.
Usage
Prerequisites
Solidity development environment (Remix, Hardhat, Truffle, etc.).
Access to a Web3 wallet (e.g., MetaMask) for interacting with the deployed contract.
Deployment
Compile the Contract: Use Remix IDE, Hardhat, or any Solidity-compatible environment.
Deploy the Contract: Deploy the contract without any constructor parameters.
Interact with the Contract:
setPositiveNumber: Call this function with a positive number. If the input is not positive, the transaction will revert with an error.
divideNumbers: Call this function with two numbers, ensuring the denominator is not zero.
withdraw: Call this function from the owner’s address to withdraw the contract's balance. Only the owner can successfully execute this function.
Send Ether: Send Ether to the contract using the receive function by sending a transaction to the contract address.
Security Considerations
Ownership: The contract owner has exclusive rights to withdraw funds, making the ownership account critical. Ensure the owner account is secure.
Assertions: assert() is used to catch internal errors that should never happen. If an assert() fails, it indicates a serious issue that could imply a bug in the contract.
Error Handling: The require() and revert() statements provide clear error messages, helping users understand why their transactions might fail.
License
This contract is licensed under the MIT License.








