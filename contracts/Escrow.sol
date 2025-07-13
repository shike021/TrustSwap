// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Escrow {
    address public buyer;
    address public seller;
    uint public amount;
    bool public buyerConfirmed;
    bool public sellerConfirmed;

    event BuyerConfirmed(address indexed buyer);
    event SellerConfirmed(address indexed seller);

    constructor(address _seller) payable {
        buyer = msg.sender;
        seller = _seller;
        amount = msg.value;
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
