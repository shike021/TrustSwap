// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract Escrow is ReentrancyGuard {
    address public buyer;
    address public seller;
    uint public ethAmount; // Amount in ETH
    IERC20 public tokenContract; // ERC20 token contract
    uint public tokenAmount; // Amount in ERC20 tokens
    bool public buyerConfirmed;
    bool public sellerConfirmed;
    uint public deadline; // Transaction deadline timestamp

    event BuyerConfirmed(address indexed buyer);
    event SellerConfirmed(address indexed seller);

    constructor(address _seller, address _tokenAddress, uint _tokenAmount) {
        buyer = msg.sender;
        seller = _seller;
        tokenContract = IERC20(_tokenAddress);
        tokenAmount = _tokenAmount;
        deadline = block.timestamp + 7 days; // Set a 7-day deadline
    }

    function depositETH() public payable {
        require(msg.value > 0, "Deposit amount must be greater than zero.");
        ethAmount = msg.value;
    }

    function depositERC20(uint _amount) public {
        require(_amount > 0, "Deposit amount must be greater than zero.");
        require(
            tokenContract.transferFrom(msg.sender, address(this), _amount),
            "Token transfer failed."
        );
        tokenAmount = _amount;
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

        if (ethAmount > 0) {
            payable(buyer).transfer(ethAmount);
        } else if (tokenAmount > 0) {
            require(
                tokenContract.transfer(buyer, tokenAmount),
                "Token refund failed."
            );
        }
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
            if (ethAmount > 0) {
                payable(seller).transfer(ethAmount);
            } else if (tokenAmount > 0) {
                require(
                    tokenContract.transfer(seller, tokenAmount),
                    "Token release failed."
                );
            }
        }
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}
