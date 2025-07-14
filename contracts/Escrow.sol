// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";

contract Escrow is ReentrancyGuard {
    address public buyer;
    address public seller;
    uint public amount;
    bool public buyerConfirmed;
    bool public sellerConfirmed;
    uint public deadline; // Transaction deadline timestamp

    event BuyerConfirmed(address indexed buyer);
    event SellerConfirmed(address indexed seller);

    constructor(address _seller) payable {
        buyer = msg.sender;
        seller = _seller;
        amount = msg.value;
        deadline = block.timestamp + 7 days; // Set a 7-day deadline
    }

    function refund() public {
        require(msg.sender == buyer, "Only the buyer can request a refund.");
        require(
            block.timestamp > deadline,
            "Refund can only be requested after the deadline."
        );
        require(
            !buyerConfirmed || !sellerConfirmed,
            "Both parties have already confirmed the transaction."
        );

        payable(buyer).transfer(amount);
    }

    function confirmTransaction() public {
        require(
            msg.sender == buyer || msg.sender == seller,
            "Only buyer or seller can confirm the transaction."
        );

        if (msg.sender == buyer) {
            buyerConfirmed = true;
            emit BuyerConfirmed(buyer);
        } else if (msg.sender == seller) {
            sellerConfirmed = true;
            emit SellerConfirmed(seller);
        }

        if (buyerConfirmed && sellerConfirmed) {
            payable(seller).transfer(amount);
        }
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
