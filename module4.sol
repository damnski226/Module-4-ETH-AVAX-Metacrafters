// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract TekkenCharacters is ERC20, Ownable {

    mapping(uint256 => uint256) public TekkenCharacterItems;
    mapping(address => uint256) public redeemedItems;

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {
        TekkenCharacterItems[1] = 3000;
        TekkenCharacterItems[2] = 2000;
        TekkenCharacterItems[3] = 800;
        TekkenCharacterItems[4] = 500;
    }


    function mintDGN(address _to, uint256 _amount) public onlyOwner {
        _mint(_to, _amount);
    }

    function transferDGN(address _to, uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Transfer Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        transferFrom(msg.sender, _to, _amount);
    }

    function showTekkenCharacterItems() external pure returns (string memory) {
        string memory saleOptions = "The items on sale: {1} TekkenCharacterItems [AngelJin (3000)] {2} TekkenCharacterItems [TrueDevilKazuya (2000)] {3} TekkenCharacterItems [ Zafina (800)] {4} TekkenCharacterItems [ Lili (500)]";
        return saleOptions;
    }

    function buyTekkenCharacterItem(uint256 _item, address _recipient) public {
        require(TekkenCharacterItems[_item] > 0, "Item is not available.");
        require(_item <= 4, "Item is not available.");
        require(balanceOf(msg.sender) >= TekkenCharacterItems[_item], "Buy Failed: Insufficient balance.");
        
        redeemedItems[_recipient] = _item;
        transfer(owner(), TekkenCharacterItems[_item]);
    }
    
    function burnDGN(uint256 _amount) public {
        require(balanceOf(msg.sender) >= _amount, "Burn Failed: Insufficient balance.");
        approve(msg.sender, _amount);
        _burn(msg.sender, _amount);
    }

    function getBalance() external view returns (uint256) {
        return balanceOf(msg.sender);
    }

    function decimals() override public pure returns (uint8) {
        return 0;
    }

}
