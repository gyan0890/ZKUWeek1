pragma circom 2.0.0;

// [assignment] Modify the circuit below to perform a multiplication of three signals

template Multiplier2() {
   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal output c;  

   // Constraints.

   c <== a * b; 
}



template Multiplier3() {  

   // Declaration of signals.  
   signal input a;  
   signal input b;
   signal input c;
   signal output d;  

   component comp1 = Multiplier2();
   component comp2 = Multiplier2();
   comp1.a <== a;
   comp1.b <== b;
   comp2.a <== comp1.c;
   comp2.b <== c;
   
   // Constraints.
   d <== comp2.c;  
}

component main = Multiplier3();