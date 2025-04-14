CREATE TABLE ugyfel_maszkolt (
  LOGIN NVARCHAR(50),
  NEV NVARCHAR(100) ,
  EMAIL NVARCHAR(100) MASKED WITH (function = 'email()'),
  SZULEV INT MASKED WITH (FUNCTION = 'random(1,5)'),
  NEM CHAR(1),
  CIM NVARCHAR(200) MASKED WITH (Function = 'partial(1,"XXX",1)')
);
