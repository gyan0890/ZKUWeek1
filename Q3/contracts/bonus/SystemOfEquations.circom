pragma circom 2.0.0;

include "../../node_modules/circomlib/circuits/comparators.circom";
include ""; // hint: you can use more than one templates in circomlib-matrix to help you

template SystemOfEquations(n) { // n is the number of variables in the system of equations
    signal input x[n]; // this is the solution to the system of equations
    signal input A[n][n]; // this is the coefficient matrix
    signal input b[n]; // this are the constants in the system of equations
    signal output out; // 1 for correct solution, 0 for incorrect solution

    var op[n];
    var finaloutput;
    component result[n];

    // [bonus] insert your code here
    for(var i = 0; i < n; i++) {
        result[i] = IsEqual();
        var equ = 0;
        for(var j = 0; j < n; j++) {
            equ += A[i][j]*x[i]; 
        }
        result[i].in[0] <== equ;
        result[i].in[1] <== b[i];

        result[i].out ==> op[i];

        finaloutput *= op[i];
    }

    out <== finaloutput;

}

component main {public [A, b]} = SystemOfEquations(3);