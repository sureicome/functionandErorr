// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


error CANT_WIDTHDREW_THIS_AMOUNT();
error BALANCEOF_OWNER_MOST_BE_MORE_THAN_ZERO();

contract FunctionANDError {
    mapping(address => uint256) user;
    address owner;
    
    modifier onlyowner() {
        require(msg.sender == owner, "your not the owner on this contract");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function chick(address _userIf, uint256 _num) external payable {
        require(_userIf == address(0), 'address zero not valid');
        require(msg.value > 0, "amount most be more than zero");
        user[_userIf] += _num;
    }

    function merro(address _address) public view returns (uint256) {
        if (_address == address(0)) {
            revert("adderss zero not valid");
        }
        return user[_address];
    }

    function payuser(uint256 _amount) external onlyowner{
        assert(user[msg.sender] >= _amount);

        user[msg.sender] -= _amount;
        payable(msg.sender).transfer(_amount);
    }
}