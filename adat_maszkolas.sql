CREATE TABLE vendeg_mask (
    usernev VARCHAR(100) MASKED WITH (Function = 'default()'),
    nev VARCHAR(100) MASKED WITH (Function = 'partial(1,"XXX",1)'),
    email VARCHAR(100) MASKED WITH (Function = 'email()'),
    szaml_cim VARCHAR(100),
    szul_datum DATE
);

INSERT INTO vendeg_mask (usernev, nev, email, szaml_cim, szul_datum)
VALUES
('adam1','Kiss Ádám','ádám.kiss@mail.hu','5630 Békés Szolnoki út 8.','1991-12-28'),
('adam3','Barkóci Ádám','adam3@gmail.com','3910 Tokaj Dózsa György utca 37.','1970-06-07'),
('adam4','Bieniek Ádám','ádám.bieniek@mail.hu','8630 Balatonboglár Juhászföldi út 1.', '1976-08-01')
('agnes','Lengyel Ágnes','agnes@gmail.com','5200 Törökszentmiklós Deák Ferenc út 5.','1979-12-10')
('agnes3','Hartyánszky Ágnes','agnes3@gmail.com','6430 Bácsalmás Posta köz 2.','1967-04-11')
('AGNESH','Horváth Ágnes','AGNESH@gmail.com','8200 Veszprém Rákóczi utca 21.','1981-12-24');

CREATE USER MaskUser WITHOUT Login;
GRANT SELECT ON vendeg_mask TO MaskUser

EXECUTE AS User= 'MaskUser';
SELECT * FROM vendeg_mask
REVERT
