pragma solidity ^0.6.0;
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/8176a901a9edfac52391315296fb8b7784454ecd/contracts/access/Ownable.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/8176a901a9edfac52391315296fb8b7784454ecd/contracts/math/SafeMath.sol";

contract Allowance is Ownable {
    
    using SafeMath for uint;
    event AllowanceChanged(address _forWho, address _fromWhom, uint _oldAmount, uint _newAmount);
    
    mapping(address => uint) public allowance; 
    
    function addAllowance(address _who, uint _amount) public onlyOwner{
        emit AllowanceChanged(_who, msg.sender, allowance[_who], _amount );
        allowance[_who] = _amount;
    }
    
    
    modifier ownerOrAllowed(uint _amount) {
        require(msg.sender == owner() || allowance[msg.sender] >= _amount, "you are not allowed");
        _;
    }
    
    function reduceAllowance(address _who, uint _amount) internal{
        emit AllowanceChanged(_who, msg.sender, allowance[_who], allowance[_who].sub(_amount));
        allowance[_who].sub(_amount);
    }
}