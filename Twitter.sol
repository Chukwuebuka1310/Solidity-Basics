// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract Twitter{

   // Declaration of variables
   address public authorAddress;
   string public tweet;

   // Declaration of mapping(Unlike the prevous declaration, this mapping has an array)
   // string[] rep an array, to get a response when the mapping is called, you need to give it an address of the sender ansd also an index number(0,1,2,3) for a particular element
   mapping(address => string[]) public authorToTweet;

   //Array declaration, this is an array of address called users
   address[] users;


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

      //Populating the users array with address
      if(authorToTweet[msg.sender].length == 1){ //After line 30, its expected that the map(authorToTweet) is to be equal to 1
         users.push(msg.sender); //Therefore push the address(msg.sender) to the user array
      }
   }

   //Function that get all tweets of a particular user
   function getTweetsByUserAddress(address _user) public view returns(string[] memory ){
      
      //goes to the mapping and get all the tweet by a particular user
      return authorToTweet[_user];
   }

   //Function that get user's Address by their tweet
   function getUserAddressByTweet(string memory _tweet) public view returns(address){

      //Create loop starting count from 0 and increasing by 1 with its limit as the length of the users array
      for(uint256 i = 0; i < users.length; i++){

         // In all the count do the foolowwin

         //Declare an address called user and assign it the the present count of the users array 
         address user = users[i];

         //Delare an array of string called tweets and assign it to all the tweet made by the present user variable from line 54
         string[] memory tweets = authorToTweet[user];

         //Then, create another loop and start count from 0 and increasing by 1 with its limit as the length of tweets array(declaerd in line 57) 
         for(uint256 j = 0; j < tweets.length; i++){

            //Check if the present index(j) of the tweets array is equal to the _tweet passed from the getUserAddressByTweet call
            if(keccak256(abi.encodePacked(tweets[j])) == keccak256(abi.encodePacked(_tweet))){

            //If it is tthen retun the user address
            return user;
         }
      }
      }
      //else revert(Send this)
      revert("No record of this tweet");
   }

}