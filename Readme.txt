*in logisim the ad and bd refers to input of donor antigens and +/- is 1 and 0 respectively,
and for the inputs of patients d0=AB+, d1=A+, d2=B+,d3=O+, d4=AB-, d5=A-, d6=B-, d7=O-.
x refers to the compatibility 1 if yes else 0.




*in verilog code, the a and b refers to input of donor antigens and rh is 1 and 0 respectively,
and for the inputs of patients d0=AB+, d1=A+, d2=B+,d3=O+, d4=AB-, d5=A-, d6=B-, d7=O-.
x refers to the compatibility 1 if yes else 0.
used 4 modules and one testbench module in the same verilog code, 
the modules are
bprio ,candonate,bdec,bmatch

the testbench module is pro.
where you can test by changing the variable values corresponding to inputs.