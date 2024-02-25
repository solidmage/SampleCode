pragma solidity ^0.8.0;

contract Voting {

    // Structure to store candidate information
    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Mapping to store candidates
    mapping(uint => Candidate) public candidates;

    // Array to store candidate IDs
    uint[] public candidateIds;

    // Constructor to initialize candidates
    constructor(string[] memory _names) public {
        for (uint i = 0; i < _names.length; i++) {
            candidates[i + 1] = Candidate(i + 1, _names[i], 0);
            candidateIds.push(i + 1);
        }
    }

    // Function to vote for a candidate
    function vote(uint candidateId) public {
        // Check if candidate exists
        require(candidates[candidateId].id > 0, "Invalid candidate ID");

        // Increase vote count for the candidate
        candidates[candidateId].voteCount++;
    }

    // Function to get the total number of votes for a candidate
    function getVotes(uint candidateId) public view returns (uint) {
        require(candidates[candidateId].id > 0, "Invalid candidate ID");

        return candidates[candidateId].voteCount;
    }

    // Function to get all candidate details
    function getAllCandidates() public view returns (Candidate[] memory) {
        Candidate[] memory allCandidates = new Candidate[](candidateIds.length);
        for (uint i = 0; i < candidateIds.length; i++) {
            allCandidates[i] = candidates[candidateIds[i]];
        }
        return allCandidates;
    }
}
