// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;
contract EtherWallet{

    address payable  public  owner;
    constructor(){
        // 只有创建者才能提现
        owner=payable(msg.sender);
    }
    function withdraw(uint256 amount) external {
        // 切换其他合约·地址无法·提现
        require(msg.sender == owner, "Only owner can withdraw");
        // 提现1
        // bool sent = payable(msg.sender).send(amount);
        // require(sent, "Failed to send Ether");
        // 提现2
        // payable(msg.sender).transfer(amount);
        //提现3
        (bool sent, ) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send Ether"); 
    }

    // 钱包可接受代币
    receive() external payable { }

    function getBalance() external view returns (uint256) {
        return address(this).balance; 
    }
}