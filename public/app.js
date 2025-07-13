const contractAddress = "YOUR_CONTRACT_ADDRESS"; // 替换为实际部署的合约地址
const abi = [ /* 替换为实际的 ABI */ ];

let escrowContract;
let accounts;

window.addEventListener('load', async () => {
    if (window.ethereum) {
        window.web3 = new Web3(ethereum);
        try {
            await ethereum.enable();
            accounts = await web3.eth.getAccounts();
            escrowContract = new web3.eth.Contract(abi, contractAddress);
        } catch (error) {
            console.error("User denied account access");
        }
    } else {
        console.error("No Ethereum provider detected");
    }
});

async function deposit() {
    const sellerAddress = document.getElementById('sellerAddress').value;
    await escrowContract.methods.constructor(sellerAddress).send({ from: accounts[0], value: web3.utils.toWei("1", "ether") });
    document.getElementById('status').innerText = "Funds deposited";
}

async function confirmBuyer() {
    await escrowContract.methods.confirmTransaction().send({ from: accounts[0] });
    document.getElementById('status').innerText = "Buyer confirmed transaction";
}

async function confirmSeller() {
    await escrowContract.methods.confirmTransaction().send({ from: accounts[0] });
    document.getElementById('status').innerText = "Seller confirmed transaction";
}
