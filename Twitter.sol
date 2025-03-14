// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Twitter{

    // Declaration of variables
    address public authorAddress;
    string public tweet;

    // Assigns a tweet to the user of the account
    mapping(address => string) public authorToTweet;

    //Function that requires a parameter and create a tweet with that parameter
   function createTweet(string memory _tweet) public {

      tweet = _tweet;
      
      //msg.sender gives us an access to the address of the sender.
      authorAddress = msg.sender;

      //Mapping that assigns the sender address to their tweets from declaration of line 11
      authorToTweet[msg.sender] = _tweet;
   }

}