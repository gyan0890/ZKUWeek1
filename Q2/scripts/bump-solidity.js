const fs = require("fs");
const solidityRegex = /pragma solidity \^\d+\.\d+\.\d+/

const verifierRegex = /contract Verifier/

let content = fs.readFileSync("./contracts/HelloWorldVerifier.sol", { encoding: 'utf-8' });
let bumped = content.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumped = bumped.replace(verifierRegex, 'contract HelloWorldVerifier');

fs.writeFileSync("./contracts/HelloWorldVerifier.sol", bumped);

// [assignment] add your own scripts below to modify the other verifier contracts you will build during the assignment

let contentmul = fs.readFileSync("./contracts/Multiplier3.sol", { encoding: 'utf-8' });
let bumpedmul = contentmul.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumpedmul = bumpedmul.replace(verifierRegex, 'contract Multiplier3');

fs.writeFileSync("./contracts/Multiplier3.sol", bumpedmul);

//Modifying the plonk script
let contentmulp = fs.readFileSync("./contracts/plonkMultiplier3.sol", { encoding: 'utf-8' });
let bumpedmulp = contentmulp.replace(solidityRegex, 'pragma solidity ^0.8.0');
bumpedmulp = bumpedmulp.replace(verifierRegex, 'contract PlonkVerifier');

fs.writeFileSync("./contracts/plonkMultiplier3.sol", bumpedmulp);