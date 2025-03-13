// SPDX-License-Identifier: MIT 

pragma solidity ^0.8.7;

contract BasicCalculator{

    //int allows for negative  integers
    int256 public result;

    function add() public {
        //Adds 20 to the result
        result += 20;
    }

    function subtraction() public {
        //Code
        //Subtracts 10 from the result
        result -= 10;
    }

    function multiply() public {
        //Code
        //Multiplies the result by 2
        result *= 2;
    }

    function division() public {
        //Code
        //Divides the result by 5
        result /= 5;
    }

    function get() public view returns(int256) {
        //Returns the value of calculation done
        return result;
    }
}
