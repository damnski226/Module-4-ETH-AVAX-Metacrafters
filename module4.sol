// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AdamsKoppi is ERC20, Ownable {

    mapping(uint256 => uint256) public CoffeePrices;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        CoffeePrices[1] = 180;
        CoffeePrices[2] = 160;
        CoffeePrices[3] = 120;
        CoffeePrices[4] = 100;
    }


    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function showCoffeeItems() external pure returns (string memory) {
        string memory saleOptions = "Iced Coffees on Sale: {1} Caramel Macchiato (180) {2} Frappucino (160) {3} Vanila Latte (120) {4} Coffee Fudge (100)";
        return saleOptions;
    }

    function redeemDGN(uint256 _item) public {
        require(CoffeePrices[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= CoffeePrices[_item], "Redeem Failed: Insufficient balance.");
        transfer(owner(), CoffeePrices[_item]);
    }
    
    function burnDGN(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return this.balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 18;
    }

    
}

