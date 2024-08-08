// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ErrorHandlingDemo {
    
    uint256 public positiveNumber;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function setPositiveNumber(uint256 _number) public {
        require(_number > 0, "Number must be positive");
        
        positiveNumber = _number;
    }

    function divideNumbers(uint256 _numerator, uint256 _denominator) public pure returns (uint256) {
        require(_denominator != 0, "Denominator cannot be zero");

        uint256 result = _numerator / _denominator;

        assert(result * _denominator == _numerator);

        return result;
    }

    function withdraw() public {
        if (msg.sender != owner) {
            revert("Only the owner can withdraw funds");
        }

        payable(owner).transfer(address(this).balance);
    }

    receive() external payable {}
}
