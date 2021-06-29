// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity 0.8.4;

// Our first contract is a faucet!
contract Faucet {
    address payable private owner;

    // Saves the owner
    constructor () public {
        owner = payable(msg.sender);
    }

    // Accept any incoming amount
    receive() external payable {}

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public payable {
        // Limit withdrawal amount
        require(withdraw_amount <= 0.01 ether );

        // Send the amount to the address that requested it
        // Need to type cast it to payable after solidity 0.5
        payable(msg.sender).transfer(withdraw_amount);
    }

    // Allow contract to self destruct
    function destroy() public {
        require (msg.sender == owner, "Only the owner can destroy this!");
        selfdestruct(owner);
    }
}