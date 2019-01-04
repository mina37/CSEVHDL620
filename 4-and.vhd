--------------------------------------------------------
-- A two-input and gate with a specified delay and then 
-- instantiating it in building a four-input and gate.
--------------------------------------------------------

ENTITY and2 IS 
  GENERIC( delay: time := 1 ns);
  PORT( a,b : IN bit;
        c: OUT bit);
END ENTITY and2;

ARCHITECTURE simple OF and2 IS 
BEGIN
  c <= a AND b AFTER delay;
END ARCHITECTURE simple;

ENTITY and4 IS 
  PORT( x1, x2, x3, x4 : IN bit;
        y: OUT bit);
END ENTITY and4;

ARCHITECTURE struct OF and4 IS 
  COMPONENT and2 IS
    GENERIC( delay: time := 1 ns);
    PORT( a,b : IN bit;
          c: OUT bit);
  END COMPONENT and2;
  FOR ALL: and2 USE ENTITY work.and2(simple);
  SIGNAL z1, z2: bit;
BEGIN
  gate1: and2 GENERIC MAP( delay => 1 ns)
              PORT MAP( x1, x2, z1);
  gate2: and2 GENERIC MAP( delay => 1 ns)
              PORT MAP( x3, x4, z2);
  gate3: and2 GENERIC MAP( delay => 1 ns)
              PORT MAP( z1, z2, y);
END ARCHITECTURE struct;