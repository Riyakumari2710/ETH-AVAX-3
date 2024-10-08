// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyCustomToken {
uint public totalSupply = 0;
mapping(address => uint) public balances;
address public owner;
event Transfer(address indexed from, address indexed to, uint value);
event Burn(address indexed burner, uint value);
event Mint(address indexed minter, uint value);
modifier onlyOwner() {
require(msg.sender == owner, "Only the contract owner can call this function");
  _;
 }
 constructor() {
 owner = msg.sender;
}
function mint(address _receiver, uint _amount) public onlyOwner {
require(_receiver != address(0), "Invalid address");
totalSupply += _amount;
balances[_receiver] += _amount;
emit Mint(_receiver, _amount);
}
function burn(uint _amount) public {
require(balances[msg.sender] >= _amount, "Insufficient balance");
totalSupply -= _amount;
balances[msg.sender] -= _amount;
emit Burn(msg.sender, _amount);
}
function transfer(address _to, uint _amount) public {
require(_to != address(0), "Invalid address");
require(balances[msg.sender] >= _amount, "Insufficient balance");
balances[msg.sender] -= _amount;
balances[_to] += _amount;
emit Transfer(msg.sender, _to, _amount);
}
}
