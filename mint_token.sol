// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Token {

    // Public variables for token details
    string public name = "MINTERS";
    string public symbol = "MTR";
    uint public totalSupply;

    // Mapping to track balances
    mapping(address => uint) public balanceOf;

    // Event for Mint
    event Mint(address indexed to, uint amount);

    // Event for Burn
    event Burn(address indexed from, uint amount);

    // Constructor to initialize the total supply to 0
    constructor() {
        totalSupply = 0;
    }

    // Function to mint new tokens
    function mint(address _to, uint _amount) public {
        totalSupply += _amount;
        balanceOf[_to] += _amount;
        emit Mint(_to, _amount);
    }

    // Function to burn existing tokens
    function burn(address _from, uint _amount) public {
        require(balanceOf[_from] >= _amount, "Insufficient balance to burn");
        totalSupply -= _amount;
        balanceOf[_from] -= _amount;
        emit Burn(_from, _amount);
    }
}

