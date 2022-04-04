# SOLIDITY LEARNING EXPERIENCE

## This application shows how to write a solidity app with modifiers and functions.

### Folder contracts
1. The place to hold the solidity contracts
2. In this example, I will be using a market place to buy and sell things
3. Marketplace will have buyers, sellers and a name (name of the marketplace, in this case, "The Marketplace")
4. Mappings can be seen as hash tables which are virtually initialized such that every possible key exists and is mapped to a value whose byte-representation is all zeros: a type’s default value. (as shown in solidity docs, [Solidity Mapping](https://docs.soliditylang.org/en/v0.4.21/types.html#mappings)
5. Mappings can be used to get the data (as per hash table)
6. Solidity provides a way to define new types in the form of structs (https://docs.soliditylang.org/en/v0.4.21/types.html#structs)
7. Modifiers can be used to easily change the behaviour of functions. For example, they can automatically check a condition prior to executing the function. Modifiers are inheritable properties of contracts and may be overridden by derived contracts. [contracts](https://docs.soliditylang.org/en/v0.4.24/contracts.html#function-modifiers)
8. Events allow the convenient usage of the EVM logging facilities, which in turn can be used to “call” JavaScript callbacks in the user interface of a dapp, which listen for these events. [events](https://docs.soliditylang.org/en/v0.4.24/contracts.html#events)
9. Events are emitted using `emit`, followed by the name of the event and the arguments (if any) in parentheses. Any such invocation (even deeply nested) can be detected from the JavaScript API by filtering for `ProductCreated` or `ProductPurchased`.
10. [Functions](https://docs.soliditylang.org/en/v0.4.24/contracts.html#functions)

### Steps to run the app
1. git clone
2. truffle compile
3. truffle migrate
    - This file tells Truffle to to deploy our smart contract to the blockchain.
        - Make sure you have ganache set up
    - The migration files are numbered so that Truffle knows which order to run them in
4. truffle test -> all success