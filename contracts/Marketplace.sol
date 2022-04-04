pragma solidity ^0.5.0;

contract Marketplace {
    address payable buyer;
    address payable seller;
    string public name;
    uint public product_count = 0;

    mapping(uint => Product) public products;

    struct Product {
        uint product_id;
        string name;
        uint price;
        address payable owner;
        bool purchased;
    }
    
    modifier notSeller(uint _index) {
        require(msg.sender != products[_index].owner, "Seller cant buy own product");
        _;
    }

    modifier enoughEth(uint _index) {
        require(msg.value >= products[_index].price, "Not enough Ether in your wallet");
        _;
    }

    modifier productNotPurchased(uint _index) {
        require(!products[_index].purchased);
        _;
    }

    modifier productExists(uint _index) {
        // Make sure the product has a valid id
        require(products[_index].product_id > 0 && products[_index].product_id <= product_count);
        _;
    }

    function purchaseProduct(uint _index) public payable notSeller(_index) enoughEth(_index) productNotPurchased(_index) productExists(_index){
        require(msg.sender != address(0));
        Product memory _product = products[_index]; // Fetch the product
        address payable _seller = _product.owner;
        _product.owner = msg.sender; // Transfer ownership to the buyer
        _product.purchased = true; // Mark as purchased
        products[_index] = _product; // Update the product
        address(_seller).transfer(msg.value); // Pay the seller by sending them Ether
        emit ProductPurchased(product_count, _product.name, _product.price, msg.sender, true); // Trigger an event
    }

    event ProductCreated(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );
    event ProductPurchased(
        uint id,
        string name,
        uint price,
        address payable owner,
        bool purchased
    );
    constructor() public {
        name = "The Marketplace";
    }

    function createProduct(string memory _name, uint _price) public {
        // Require a valid name
        require(bytes(_name).length > 0);
        // Require a valid price
        require(_price > 0);
        // Increment product count
        product_count ++;
        // Create the product
        products[product_count] = Product(product_count, _name, _price, msg.sender, false);
        // Trigger an event
        emit ProductCreated(product_count, _name, _price, msg.sender, false);
    }
    
}