pragma solidity >=0.5.0 <0.6.0;

/*
Working With Structs and Arrays

Creating New Structs
Remember our Person struct in the previous example?

struct Person {
  uint age;
  string name;
}

Person[] public people;
Now we're going to learn how to create new Persons and add them to our people array.

// create a New Person:
Person satoshi = Person(172, "Satoshi");

// Add that person to the Array:
people.push(satoshi);
We can also combine these together and do them in one line of code to keep things clean:

people.push(Person(16, "Vitalik"));
Note that array.push() adds something to the end of the array, so the elements are in the order we added them. See the following example:

uint[] numbers;
numbers.push(5);
numbers.push(10);
numbers.push(15);
// numbers is now equal to [5, 10, 15]

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

    function createZombie(string memory _name, uint _dna) public {
        //Zombie zombie1 = Zombie(_name, _dna);
        //zombies.push(zombie1);
        zombies.push(Zombie(_name, _dna));
    }

}

