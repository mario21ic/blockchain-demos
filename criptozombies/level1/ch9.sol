pragma solidity >=0.5.0 <0.6.0;

/*
Private / Public Functions

In Solidity, functions are public by default. This means anyone (or any other contract) can call your contract's function and execute its code.

Obviously this isn't always desirable, and can make your contract vulnerable to attacks. Thus it's good practice to mark your functions as private by default, and then only make public the functions you want to expose to the world.

Let's look at how to declare a private function:

uint[] numbers;

function _addToArray(uint _number) private {
  numbers.push(_number);
}
This means only other functions within our contract will be able to call this function and add to the numbers array.

As you can see, we use the keyword private after the function name. And as with function parameters, it's convention to start private function names with an underscore (_).

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

}

