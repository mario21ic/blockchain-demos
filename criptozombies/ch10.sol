pragma solidity >=0.5.0 <0.6.0;

/*
More on Functions

In this chapter, we're going to learn about function return values, and function modifiers.

Return Values
To return a value from a function, the declaration looks like this:

string greeting = "What's up dog";

function sayHello() public returns (string memory) {
  return greeting;
}
In Solidity, the function declaration contains the type of the return value (in this case string).

Function modifiers
The above function doesn't actually change state in Solidity — e.g. it doesn't change any values or write anything.

So in this case we could declare it as a view function, meaning it's only viewing the data but not modifying it:

function sayHello() public view returns (string memory) {
Solidity also contains pure functions, which means you're not even accessing any data in the app. Consider the following:

function _multiply(uint a, uint b) private pure returns (uint) {
  return a * b;
}
This function doesn't even read from the state of the app — its return value depends only on its function parameters. So in this case we would declare the function as pure.

Note: It may be hard to remember when to mark functions as pure/view. Luckily the Solidity compiler is good about issuing warnings to let you know when you should use one of these modifiers.

*/


contract ZombieFactory {

    uint myUnsignedInteger = 100; // is equal to uint256, others uint8, uint16, uint32.
    uint dnDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    Zombie[] public zombies;

    struct Zombie {
        string name;
        uint dna;
    }

    //function createZombie(string memory _name, uint _dna) public {
    function _createZombie(string memory _name, uint _dna) private {
        //Zombie zombie1 = Zombie(_name, _dna);
        zombies.push(Zombie(_name, _dna));
    }

    function _generateRandomDna(string memory _str) private view returns (uint) {
    }

}

