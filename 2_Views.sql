INSERT INTO [dbo].[Country] ([Name])
VALUES ('United States'),
       ('Canada'),
       ('United Kingdom'),
       ('Australia'),
       ('Germany'),
       ('France'),
       ('Japan'),
       ('Brazil'),
       ('India');
	

	   INSERT INTO [dbo].[State] ([Name],CountryID)
VALUES ('California',1),
       ('New York',1),
       ('Texas',1),
       ('Ontario',1),
       ('Queensland',1),
   
       ('Maharashtra',9);


	   INSERT INTO [dbo].[City] ([Name],[StateID])
VALUES ('Los Angeles',1),
       ('New York City',2),
       ('Houston',3),

       ('Mumbai',6);



	   INSERT INTO [dbo].[User] ([FirstName], [LastName], [email], [Password], [GenderID], [Phone], [DOB], [SSN], [AADHARNumber], [CountryID], [StateID], [CityID])
VALUES ('John', 'Doe', 'johndoe@example.com', 'password123', 1, '+1234567890', '1990-05-15', '123-45-6789', '1234 5678 9012', 1, 1, 1),
       ('Alice', 'Smith', 'alice.smith@example.com', 'alicepassword', 2, '+1987654321', '1985-10-20', '987-65-4321', '9876 5432 1098', 1, 2, 2),
       ('Michael', 'Johnson', 'michael.johnson@example.com', 'michaelpass', 1, '+1654321879', '1982-03-25', '456-78-9123', '4567 8912 3456', 1, 2, 2),
       ('Emily', 'Brown', 'emily.brown@example.com', 'emilypassword', 2, '+1765432890', '1995-08-12', '789-12-3456', '7890 1234 5678', 1, 3,3),
       ('David', 'Wilson', 'david.wilson@example.com', 'davidpass123', 1, '+1876543210', '1988-12-30', '234-56-7890', '2345 6789 0123', 1,2, 2),
       ('Maria', 'Garcia', 'maria.garcia@example.com', 'mariapass', 2, '+1654321879', '1992-07-18', '567-89-0123', '5678 9012 3456', 1, 3, 3),
       ('Takeshi', 'Yamamoto', 'takeshi.yamamoto@example.com', 'takeshipass', 1, '+1987654321', '1989-11-02', '901-23-4567', '9012 3456 7890', 1, 3, 3),
       ('Ana', 'Silva', 'ana.silva@example.com', 'anapassword', 2, '+1765432890', '1993-04-05', '234-56-7890', '2345 6789 0123', 1, 1, 1),
       ('Rahul', 'Sharma', 'rahul.sharma@example.com', 'rahulpass123', 1, '+1876543210', '1987-09-22', '678-90-1234', '6789 0123 4567', 9, 6,4);


