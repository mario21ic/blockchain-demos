pragma solidity >=0.5.0 <0.6.0;

/*
Structs
Sometimes you need a more complex data type. For this, Solidity provides structs:

struct Person {
  uint age;
  string name;
}

Structs allow you to create more complicated data types that have multiple properties.

Note that we just introduced a new type, string. Strings are used for arbitrary-length UTF-8 data. Ex. string greeting = "Hello world!"
*/


contract ZombieFactory {

    uint myUnsignedInteger = 100; // is equal to uint256, others uint8, uint16, uint32.
    uint dnDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;

    struct Zombie {
        string name;
        uint dna;
    }
}

