// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract InvestmentToken is ERC20 {
    address public owner;

    constructor(uint256 initialSupply) ERC20("InvestmentToken", "ITK") {
        owner = msg.sender;
        _mint(owner, initialSupply);
    }

    function buyTokens(uint256 amount) public payable {
        require(msg.value == amount * 1 ether, "Incorrect Ether sent.");
        _mint(msg.sender, amount);
    }

    function sellTokens(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "Insufficient balance.");
        _burn(msg.sender, amount);
        payable(msg.sender).transfer(amount * 1 ether);
    }

    // Function to withdraw contract's Ether balance (for owner)
    function withdraw() public {
        require(msg.sender == owner, "Only the owner can withdraw.");
        payable(owner).transfer(address(this).balance);
    }

    // Fallback function to accept Ether
    receive() external payable {}
}