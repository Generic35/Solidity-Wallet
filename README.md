# Solidity smart contact wallet

An Ethereum smart contract wallet coded in solidity

So far this wallet allows the owner of the contract to transfer ether to the contract via a fallback payable function.

It then allows this owner to allocate an allowance to another address in the wallet.

This address can then come widthraw the amount.

Events are emited when each of these transactions occur.

The contract checks if the sender is autorized and also checks for safe math to avoir wrap arounds.
