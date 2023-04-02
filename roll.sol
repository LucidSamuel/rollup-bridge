pragma solidity ^0.8.0;

contract MyRollup {
    struct Transaction {
        address from;
        address to;
        uint amount;
    }

    Transaction[] public transactions;

    function batchTransfer(Transaction[] memory _txs) public {
        for (uint i = 0; i < _txs.length; i++) {
            transactions.push(_txs[i]);
        }
    }

    function processBatch() public {
        for (uint i = 0; i < transactions.length; i++) {
            Transaction memory tx = transactions[i];
            tx.to.transfer(tx.amount);
        }
        delete transactions;
    }
}
