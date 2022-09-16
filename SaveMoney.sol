pragma solidity ^0.8.10;

error SaveMoney__ZeroBalance();

contract SaveMoney {
    mapping(address => uint) public userBalance;

    function sendMoney() external payable {
        userBalance[msg.sender] += msg.value;
    }

    function withdrawMoney() external {
        uint balance = userBalance[msg.sender];
        if (balance == 0) revert SaveMoney__ZeroBalance();

        (bool success, bytes memory result) = payable(msg.sender).call{value: balance}(new bytes(0));
        if (!success) revert(decode(result));

        userBalance[msg.sender] = 0;
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
    
    function decode(bytes memory result_) internal pure returns (string memory) {
        if (result_.length < 68) return "";
        assembly {
            result_ := add(result_, 0x04)
        }
        return abi.decode(result_, (string));
    }
}
