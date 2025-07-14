const Escrow = artifacts.require("Escrow");
const TestToken = artifacts.require("TestToken"); // ERC20 token for testing

contract("Escrow", (accounts) => {
    const [buyer, seller] = accounts;

    it("should deposit ETH and release it after both parties confirm", async () => {
        const escrow = await Escrow.new(seller, "0x0000000000000000000000000000000000000000", 0, { from: buyer, value: web3.utils.toWei("1", "ether") });

        // Deposit ETH
        await escrow.depositETH({ from: buyer, value: web3.utils.toWei("1", "ether") });

        // Check initial balance
        let balance = await escrow.getBalance();
        assert.equal(balance.toString(), web3.utils.toWei("1", "ether"), "Initial balance should be 1 ether");

        // Buyer confirms transaction
        await escrow.confirmTransaction({ from: buyer });

        // Seller confirms transaction
        await escrow.confirmTransaction({ from: seller });

        // Check final balance
        balance = await escrow.getBalance();
        assert.equal(balance.toString(), "0", "Final balance should be 0");
    });

    it("should deposit ERC20 tokens and release them after both parties confirm", async () => {
        const token = await TestToken.new(); // Deploy test ERC20 token
        const amount = web3.utils.toWei("100", "ether");

        // Mint tokens to buyer
        await token.mint(buyer, amount);

        // Approve escrow contract to spend tokens
        await token.approve(escrow.address, amount, { from: buyer });

        // Create escrow with ERC20 token
        const escrow = await Escrow.new(seller, token.address, amount, { from: buyer });

        // Deposit ERC20 tokens
        await escrow.depositERC20(amount, { from: buyer });

        // Check token balance in escrow
        let balance = await token.balanceOf(escrow.address);
        assert.equal(balance.toString(), amount, "Escrow should hold 100 tokens");

        // Buyer confirms transaction
        await escrow.confirmTransaction({ from: buyer });

        // Seller confirms transaction
        await escrow.confirmTransaction({ from: seller });

        // Check final token balance
        balance = await token.balanceOf(escrow.address);
        assert.equal(balance.toString(), "0", "Escrow should release all tokens");
    });
});
