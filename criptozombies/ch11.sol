pragma solidity >=0.5.0 <0.6.0;

/*
Keccak256 and Typecasting

We want our _generateRandomDna function to return a (semi) random uint. How can we accomplish this?

Ethereum has the hash function keccak256 built in, which is a version of SHA3. A hash function basically maps an input into a random 256-bit hexadecimal number. A slight change in the input will cause a large change in the hash.

It's useful for many purposes in Ethereum, but for right now we're just going to use it for pseudo-random number generation.

Also important, keccak256 expects a single parameter of type bytes. This means that we have to "pack" any parameters before calling keccak256:

Example:
//6e91ec6b618bb462a4a6ee5aa2cb0e9cf30f7a052bb467b0ba58b8748c00d2e5
keccak256(abi.encodePacked("aaaab"));
//b1f078126895a1424524de5321b339ab00408010b7cf0e6ed451514981e58aa9
keccak256(abi.encodePacked("aaaac"));
As you can see, the returned values are totally different despite only a 1 character change in the input.

Note: Secure random-number generation in blockchain is a very difficult problem. Our method here is insecure, but since security isn't top priority for our Zombie DNA, it will be good enough for our purposes.

Typecasting
Sometimes you need to convert between data types. Take the following example:

uint8 a = 5;
uint b = 6;
// throws an error because a * b returns a uint, not uint8:
uint8 c = a * b;
// we have to typecast b as a uint8 to make it work:
uint8 c = a * uint8(b);
In the above, a * b returns a uint, but we were trying to store it as a uint8, which could cause potential problems. By casting it as a uint8, it works and the compiler won't throw an error.
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
        uint rand = uint(keccak256(abi.encodePacked(_str)));

        return rand % dnaModulus;
    }

}

