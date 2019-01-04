--------------------------------------------
-- A half-adder using dataflow description.
--------------------------------------------

ENTITY half_adder IS
  PORT( a,b: IN bit;
        s,c: OUT bit); 
END ENTITY half_adder;

ARCHITECTURE  dataflow OF half_adder IS
BEGIN
  s <= a XOR b;
  c <= a AND b;
END ARCHITECTURE dataflow;