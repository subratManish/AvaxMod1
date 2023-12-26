# Voting System Smart Contract

This Solidity smart contract implements a basic voting system, allowing individuals to cast votes with age verification and group size limits.

## Features

- **Age Verification:** Voters must be 18 years or older to participate.
- **Group Size Limit:** The total number of votes is limited to a specified group size.
- **Owner Control:** The owner can adjust the maximum group size.

## Contract Functions

### `vote()`

Allows individuals to cast their votes after passing age verification and group size checks.

### `setMaxGroupSize(uint newSize)`

Allows the owner to change the maximum group size.

## Usage

1. Deploy the smart contract to a blockchain network.
2. Call the `vote` function to cast a vote, ensuring age verification and group size limits are met.
3. Optionally, the owner can call `setMaxGroupSize` to adjust the maximum group size.

## Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/your-username/voting-system-smart-contract.git
