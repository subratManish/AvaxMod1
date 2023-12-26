// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VotingSystem {
    address public owner;
    uint public totalVotes;
    uint public maxGroupSize = 5;

    // Mapping to keep track of whether an address has voted
    mapping(address => bool) public hasVoted;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function vote() public {
        // Basic input validation using require
        require(msg.sender != address(0), "Invalid address");
        require(!hasVoted[msg.sender], "You have already voted");
        
        // Additional checks, if needed, can be added here
        
        // Logic to verify age (18 or older)
        if (!ageVerification()) {
            revert("You must be 18 or older to vote");
        }

        // Logic to check group size
        if (!checkGroupSize()) {
            revert("Group size exceeded");
        }

        // Perform voting action
        // (For simplicity, let's just increment the totalVotes counter)
        totalVotes++;
        
        // Mark the sender as voted
        hasVoted[msg.sender] = true;
    }

    function ageVerification() internal pure returns (bool) {
        // Implement your logic to verify age here (18 or older)
        // For simplicity, we assume everyone is eligible in this example.
        return true;
    }

    function checkGroupSize() internal view returns (bool) {
        // Implement your logic to check the group size here
        // For simplicity, we assume that the totalVotes should not exceed the maxGroupSize.
        
        // Using assert to ensure maxGroupSize is greater than 0
        assert(maxGroupSize > 0);

        // Using require to check the group size limit
        require(totalVotes < maxGroupSize, "Group size exceeded");

        return true;
    }

    // Function to change the maximum group size, only callable by the owner
    function setMaxGroupSize(uint newSize) public onlyOwner {
        // Using require for input validation
        require(newSize > 0, "Group size must be greater than 0");
        maxGroupSize = newSize;
    }
}
