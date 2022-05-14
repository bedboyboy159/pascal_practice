Program main(input, output);
uses
    Sysutils;

//this function take in a input and what type of input it is to return
//the correct number according to their type
//it's a double because there are some percentage that I would have to
//convert, if the type is something other than figure or mult(multiplier)
//it would be default to become the tolerance, if there are no tolerance
//it will return nothing.
function checkFigure(input, inputType: String): double;
begin
    //check for input type in the helper function
    if(input = 'k') then        // Black
        begin
            if(inputType  = 'figure') then
                checkFigure := 0
            else if(inputType = 'mult') then
                checkFigure := 1;
        end;
    if(input = 'n') then   // Brown
        begin
            if(inputType  = 'figure') then
                checkFigure := 1
            else if(inputType = 'mult') then
                checkFigure := 10
            else
                checkFigure := 1;
        end;
    if(input = 'r') then   // Red
        begin
            if(inputType  = 'figure') then
                checkFigure := 2
            else if(inputType = 'mult') then
                checkFigure := 100
            else
                checkFigure := 2;
        end;
    if(input = 'o') then   // Orange
        begin
            if(inputType  = 'figure') then
                checkFigure := 3
            else if(inputType = 'mult') then
                checkFigure := 1000
        end;
    if(input = 'w') then   // Yellow
        begin
            if(inputType  = 'figure') then
                checkFigure := 4
            else if(inputType = 'mult') then
                checkFigure := 10000
            else
                checkFigure := 5;
        end;
    if(input = 'g') then   // Green
        begin
            if(inputType  = 'figure') then
                checkFigure := 5
            else if(inputType = 'mult') then
                checkFigure := 100000
            else
                checkFigure := 0.5;
        end;
    if(input = 'b') then   // Blue
        begin
            if(inputType  = 'figure') then
                checkFigure := 6
            else if(inputType = 'mult') then
                checkFigure := 1000000
            else
                checkFigure := 0.25;
        end;
    if(input = 'v') then   // Violet
        begin
            if(inputType  = 'figure') then
                checkFigure := 7
            else if(inputType = 'mult') then
                checkFigure := 10000000
            else
                checkFigure := 0.1;
        end;
    if(input = 'y') then   // Gray
        begin
            if(inputType  = 'figure') then
                checkFigure := 8
            else if(inputType = 'mult') then
                checkFigure := 100000000
            else
                checkFigure := 0.05;
        end;
    if(input = 'e') then   // White
        begin
            if(inputType  = 'figure') then
                checkFigure := 9
            else if(inputType = 'mult') then
                checkFigure := 1000000000;
        end;
    if(input = 'd') then   // Gold
        begin
            if(inputType = 'mult') then
                checkFigure := 0.1
            else
                checkFigure := 5;
        end;
    if(input = 's') then   // Silver
        begin
            if(inputType = 'mult') then
                checkFigure := 0.01
            else
                checkFigure := 10;
        end;
end;

//the global variable to set the type of answer

var 
    out      : TextFile;
    fin      : TextFile;
    resistor : String;
    ans      : Longint;
    tempNum, num1, num2, num3, num4, num5: double;
    lower    : Longint;
    upper    : Longint;
    format   : String;

begin
    //checking the input to make sure it match the stdin
    if ( paramCount() <> 2 ) then
        begin
        writeln( 'Usage: test-main <input> <output>' );
        end
    else
        begin {begin for main else branch}
        Assign( out, paramStr(2) );
        Assign( fin, paramStr(1) );
        Reset(fin);
        Rewrite(out);
        { while there are more strings}
        writeln(out, 'Bands       Value        Lower        Upper');
        while not EOF(fin) do
            begin
            Readln(fin, resistor);
            //checking to see if the resister have 3 input
            if(Length(resistor) = 3) then
                begin
                //calling the helper function to get the correct type according to the input
                num1 := checkFigure(resistor[1], 'figure');
                num2 := checkFigure(resistor[2], 'figure');
                num3 := checkFigure(resistor[3], 'mult');
                //calculation to get the number 
                tempNum := (num1 * 10 + num2) * num3;
                //convert it to integer to remove trailing zeroes
                ans := Trunc(tempNum);
                //calculating the lower bound with it resistance
                tempNum := ans - ((ans * 20) / 100);
                //convert to integer to remove trailing zeroes
                lower := Trunc(tempNum);
                //calculating the upper bound with it resistance
                tempNum := ans + ((ans * 20) / 100);
                //convert to integer to remove trailing zeroes
                upper := Trunc(tempNum);
                //buffering the answer into the column to format it
                write(out, resistor);
                write(out, ans:13);
                write(out, lower: 13);
                write(out, upper: 13);
                end;
            //checking to see if the resister have 4 input
            if(Length(resistor) = 4) then
                begin
                //calling the helper function to get the correct type according to the input
                num1 := checkFigure(resistor[1], 'figure');
                num2 := checkFigure(resistor[2], 'figure');
                num3 := checkFigure(resistor[3], 'mult');
                num4 := checkFigure(resistor[4], 'tol');

                //calculating the answer
                tempNum := (num1 * 10 + num2) * num3;
                //converting it to integer
                ans := Trunc(tempNum);
                //calculating the lower bound
                tempNum := ans - (ans * (num4 / 100));
                //converting to integer
                lower := Trunc(tempNum);
                //calculating the upper bound
                tempNum := ans + (ans * (num4 / 100));
                //converting to integer
                upper := Trunc(tempNum);
                //format the output
                write(out, resistor);
                write(out, ans:12);
                write(out, lower: 13);
                write(out, upper: 13);
                end;
            //checking if the resister is have 5 input
            if(Length(resistor) = 5) then
                begin
                //calling the helper function to get the correct type according to the input
                num1 := checkFigure(resistor[1], 'figure');
                num2 := checkFigure(resistor[2], 'figure');
                num3 := checkFigure(resistor[3], 'figure');
                num4 := checkFigure(resistor[4], 'mult');
                num5 := checkFigure(resistor[5], 'tol');
                //calculating the answer
                tempNum := (num1 * 100 + num2 * 10 + num3) * num4;
                //converting to integer
                ans := Trunc(tempNum);
                //calculating the lower bound
                tempNum := ans - (ans * (num5 / 100));
                //converting to integer
                lower := Trunc(tempNum);
                //calculating the upper bound
                tempNum := ans + (ans * (num5 / 100));
                //converting to integer
                upper := Trunc(tempNum);
                //format the output
                write(out, resistor);
                write(out, ans:11);
                write(out, lower: 13);
                write(out, upper: 13);
                end;
            writeln(out, '');
            end;
        //closing the file
        Close(fin);
        Close(out);
        end
end.    