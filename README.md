# Module-4-ETH-AVAX-Metacrafters
# DegenToken README

## Description:
DegenToken is a Solidity smart contract that implements a simple ERC20 token called "Degen" (DGN). This token is designed for use within a gaming platform, allowing players to earn, transfer, redeem, and burn tokens for various in-game items and rewards. The contract also includes functionalities for minting new tokens and checking token balances.

## Technologies Used:
- Solidity: The programming language used for writing smart contracts on the Ethereum blockchain.
- ERC20: A standard interface for fungible tokens on the Ethereum blockchain.
- OpenZeppelin Contracts: A library for secure smart contract development.

## Contract Details:
- **Name:** DegenToken (Symbol: DGN)
- **Decimals:** 18 (Tokens are whole numbers)
- **Initial Distribution:** The contract owner can mint tokens initially.
- **CoffeePrices:** Coffee items are priced in DGN tokens.

## Setup:
1. Deploy the `DegenToken.sol` smart contract to the Ethereum blockchain.
2. Configure the initial token distribution and Coffee item prices according to your requirements.
3. Interact with the contract using Ethereum wallets or other smart contracts.

## Usage:
1. **Minting Tokens:**
   - Only the owner can mint new tokens using the `mintDGN` function.
2. **Transferring Tokens:**
   - Customers/Players can transfer their tokens to others using the `transferDGN` function.
3. **Redeeming Tokens:**
   - Customers/Players can redeem their tokens for Coffee items by calling the `redeemDGN` function with the item ID as a parameter.
4. **Checking Token Balance:**
   - Customers/Players can check their token balance at any time using the `getBalance` function.
5. **Burning Tokens:**
   - Anyone can burn their own tokens using the `burnDGN` function.

## Contributors:
- Adam Mari Amplayo 8213998@ntc.edu.ph
