Program zad1;
var n: integer;
  ptr, pI: ^integer;
begin
  n:=2;
  pI:=@n;
  ptr:=pI;
  writeln('Значение, находящееся по адресу ptr = ', ptr^);
end.