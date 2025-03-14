// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Twitter{

   // Declaration of variables
   address public authorAddress;
   string public tweet;

   // Declaration of mapping(Unlike the prevous declaration, this mapping has an array)
   // string[] rep an array, to get a response when the mapping is called, you need to give it an address of the sender ansd also an index number(0,1,2,3) for a particular element
   mapping(address => string[]) public authorToTweet;


   //Function that requires a parameter and create a tweet with that parameter
   function createTweet(string memory _tweet) public {

      tweet = _tweet;
      //msg.sender gives us an access to the address of the sender.
      authorAddress = msg.sender;

      //Mapping that assigns the sender address to their tweets from declaration of line 11
      //1. Without string[](array of string)
      // authorToTweet[msg.sender] = _tweet;

      //2. with string[]
      authorToTweet[msg.sender].push(_tweet);
   }

   //Function that get all tweets of a particular user
   function getTweetsByUserAddress(address _user) public view returns(string[] memory ){
      
      //goes to the mapping and get all the tweet by a particular user
      return authorToTweet[_user];
   }

}