# Escrow Smart Contract 101

This smart contract implements a simple escrow service in which a depositor sends funds to a contract, and the funds can only be transferred to a beneficiary after the transfer has been approved by an arbiter.

## **Contract Variables**

- **`depositor`**: The address of the depositor who sent the funds to the contract.
- **`beneficiary`**: The address of the beneficiary who will receive the funds.
- **`arbiter`**: The address of the arbiter who will approve the transfer of funds.
- **`isApproved`**: A boolean value indicating whether the transfer of funds has been approved by the arbiter.

## **Events**

- **`Approved(uint _balance)`**: Event emitted when the transfer of funds has been approved by the arbiter. The **`_balance`** parameter is the amount of ether transferred.

## **Constructor**

The constructor function sets the **`depositor`**, **`arbiter`**, and **`beneficiary`** variables of the contract.

## **Functions**

### **`approve()`**

Function that allows the arbiter to approve the transfer of funds to the beneficiary. The function can only be called by the arbiter. When called, the function gets the balance of the contract and sends it to the beneficiary. If the transfer is successful, the function sets the **`isApproved`** flag to true and emits the **`Approved`** event.
