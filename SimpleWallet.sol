pragma solidity ^0.6.0;

import "./Allowance.sol";

contract SimpleWallet is Allowance {
    event MoneySent(address indexed _beneficiary, uint _amount);
    event MoneyRecieved(address indexed _from, uint _amount);
    
    function renounceOwnership() public override onlyOwner{
        revert("cant renounce ownership here");
    }
    
    function widthdrawMoney(address payable _to, uint _amount) public ownerOrAllowed(_amount) {
        require(_amount <= address(this).balance, "There are not enough funds stored in the smart contract");
        if(msg.sender != owner()){
            reduceAllowance(msg.sender, _amount);
        }
        
        emit MoneySent(_to, _amount);
        
        _to.transfer(_amount);
    }
    
    
    fallback() external payable {
        emit MoneyRecieved(msg.sender, msg.value);
    }
}