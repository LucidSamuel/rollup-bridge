pragma solidity ^0.8.0;

interface IERC20 {
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);
    function balanceOf(address account) external view returns (uint256);
}

contract MyDeFiSwap {
    IERC20 public token;

    constructor(address _token) {
        token = IERC20(_token);
    }

    function swap(uint amount) public {
        // Transfer tokens from user to contract
        require(token.transferFrom(msg.sender, address(this), amount), "Transfer failed");

        // Perform swap logic here
        // ...

        // Transfer swapped tokens back to user
        require(token.transfer(msg.sender, swappedAmount), "Transfer failed");
    }
}
