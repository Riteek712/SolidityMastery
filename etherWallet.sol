// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;
//ETHER WALLET Smart Contract:-> Anyone can send ETH, but only owner can withdraw.
contract EtherWallet {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    receive() external payable {}

    function withdraw(uint _amount) external {
        require(msg.sender == owner, "caller is not owner");
        // This is to check that only the contract owner can withdraw funds from the contract.
        payable(msg.sender).transfer(_amount);
        // This is to transfer the specified amount to the owner's address.
    }

    function getBalance() external view returns (uint) {
        // To check the funds in the Account.
        return address(this).balance;
    }
}