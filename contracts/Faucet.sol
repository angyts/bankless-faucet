// SPDX-License-Identifier: CC-BY-SA-4.0

// Version of Solidity compiler this program was written for
pragma solidity >=0.7.6;

import "@opengsn/contracts/src/BaseRelayRecipient.sol";

// Our first contract is a faucet!
contract Faucet is BaseRelayRecipient {
    address payable private owner;
    string public override versionRecipient = "2.0.0";

    // Saves the owner
    constructor() public {
        owner = payable(_msgSender());
    }

    // Accept any incoming amount
    receive() external payable {}

    // Give out ether to anyone who asks
    function withdraw(uint withdraw_amount) public payable {
        // Limit withdrawal amount
        require (withdraw_amount <= 0.01 ether);

        // Send the amount to the address that requested it
        // Need to type cast it to payable after solidity 0.5
        payable(_msgSender()).transfer(withdraw_amount);
    }

    // Allow contract to self destruct
    function destroy() public {
        require (payable(_msgSender()) == owner, "Only the owner can destroy this!");
        selfdestruct(owner);
    }
}