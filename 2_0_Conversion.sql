-- Implicit Conversion

Declare @IntVar int = 90

Declare @VarcharVar Varchar(20) = 9

select @IntVar+@VarcharVar+1 as Total

---


Declare @variable1  datetime = GETDATE()

Declare @variable2 bigint = 100

select @variable1 as Variable1

select @variable2 as Variable2

-- Will throw an error 

set @variable2 = @variable1

--

-- Explicit Conversion

set @variable2 = cast( @variable1 as BIGINT)

select @variable2 as  Variable2withCasting

set @variable2 = Convert( BIGINT,@variable1 )

select @variable2 as  Variable2withConversion









