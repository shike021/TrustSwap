const Escrow = artifacts.require("Escrow");

contract("Escrow", (accounts) => {
    const [buyer, seller] = accounts;

    it("should deposit funds and release them after both parties confirm", async () => {
        const escrow = await Escrow.new(seller, { from: buyer, value: web3.utils.toWei("1", "ether") });

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
});
