#!/bin/bash

# [assignment] create your own bash script to compile Multipler3.circom using PLONK below

#!/bin/bash

# [assignment] create your own bash script to compile Multipler3.circom modeling after compile-HelloWorld.sh below

#!/bin/bash

cd contracts/circuits

mkdir _plonkHelloWorld

if [ -f ./powersOfTau28_hez_final_10.ptau ]; then
    echo "powersOfTau28_hez_final_10.ptau already exists. Skipping."
else
    echo 'Downloading powersOfTau28_hez_final_10.ptau'
    wget https://hermez.s3-eu-west-1.amazonaws.com/powersOfTau28_hez_final_10.ptau
fi

echo "Compiling HelloWorld.circom..."

# compile circuit

circom Multiplier3.circom --r1cs --wasm --sym -o _plonkHelloWorld
snarkjs r1cs info _plonkHelloWorld/Multiplier3.r1cs

# Start a new zkey and make a contribution

snarkjs plonk setup _plonkHelloWorld/Multiplier3.r1cs powersOfTau28_hez_final_10.ptau _plonkHelloWorld/circuit_0000.zkey
#snarkjs zkey contribute _plonkHelloWorld/circuit_0000.zkey HelloWorld/circuit_final.zkey --name="1st Contributor Name" -v -e="random text"
snarkjs zkey export verificationkey _plonkHelloWorld/circuit_0000.zkey _plonkHelloWorld/verification_key.json

# generate solidity contract
snarkjs zkey export solidityverifier _plonkHelloWorld/circuit_0000.zkey ../plonkMultiplier3.sol

cd ../..