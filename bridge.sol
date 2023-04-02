pragma solidity ^0.8.0;

interface IMyRollup {
    function batchTransfer(Transaction[] memory _txs) external;
    function processBatch() external;
}

interface IMyDeFiSwap {
    function swap(uint amount) external;
}

contract MyBridge {
    IMyRollup public rollup;
    IMyDeFiSwap public swap;

    constructor(address _rollup, address _swap) {
        rollup = IMyRollup(_rollup);
        swap = IMyDeFiSwap(_swap);
    }

    function swapAndBatchTransfer(Transaction[] memory _txs, uint swapAmount) public {
        swap.swap(swapAmount);
        rollup.batchTransfer(_txs);
        rollup.processBatch();
    }
}
