// SPDX-License-Identifier: MIT
pragma solidity 0.8.4;

contract Escrow {
    // The address of the depositor who sent the funds to the contract.
    address public depositor;
    // The address of the beneficiary who will receive the funds.
    address public beneficiary;
    // The address of the arbiter who will approve the transfer of funds.
    address public arbiter;

    // A boolean value indicating whether the transfer of funds has been approved by the arbiter.
    bool public isApproved;

    // Event emitted when the transfer of funds has been approved by the arbiter.
    event Approved (uint _balance);

    // Constructor function that sets the depositor, arbiter, and beneficiary of the contract.
    constructor(address _arbiter, address _beneficiary) payable {
        // Set the depositor to the address of the account that deployed the contract.
        depositor = msg.sender;
        // Set the arbiter to the specified address.
        arbiter = _arbiter;
        // Set the beneficiary to the specified address.
        beneficiary = _beneficiary;
    }

    // Function that allows the arbiter to approve the transfer of funds to the beneficiary.
    function approve() external {
        // Check that the caller of the function is the arbiter.
        require(msg.sender == arbiter, "Only the arbiter can approve the transfer.");

        // Get the balance of the contract.
        uint balance = address(this).balance;
        
        // Send the balance of the contract to the beneficiary.
        (bool sent, ) = beneficiary.call{ value: balance }("");
        
        // Check that the transfer of funds was successful.
        require(sent, "Failed to send ether");
        
        // Set the isApproved flag to true.
        isApproved = true;

        // Emit the Approved event to signal that the arbiter has approved the transfer of funds.
        emit Approved(balance);
    }
}