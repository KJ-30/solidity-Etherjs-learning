// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.4.0
pragma solidity ^0.8.27;

import {ERC20} from "@openzeppelin/contracts@5.4.0/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts@5.4.0/access/Ownable.sol";

contract KingkingCoin is ERC20, Ownable {
    constructor(address recipient, address initialOwner)
        ERC20("KingkingCoin", "KKC")
        Ownable(initialOwner)
    {
        _mint(recipient, 1000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}
