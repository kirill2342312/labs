unit Program2;
const
  VK_UP = 38;
  VK_DOWN = 40;
  VK_LEFT = 37;
  VK_RIGHT = 39;
var
  Depth: Integer = 8;
  ScaleFactor: Double = 1.0;
  OffsetX, OffsetY: Integer;
procedure Levy(x, y, a, r: real; k: integer);
begin
  if k > 0 then
  begin
    r := r * Sin(pi / 4);
    Levy(x, y, a + pi / 4, r, k - 1);//Декомпозиция
    Levy(x + r * Cos(a + pi / 4), y - r * Sin(a + pi / 4), a - pi / 4, r, k - 1);//Декомпозиция
  end
  else
    WriteLn('Draw line from (', round(x * ScaleFactor + OffsetX), ', ', round(y * ScaleFactor + OffsetY), ') to (',
             round((x + r * Cos(a)) * ScaleFactor + OffsetX), ', ', round((y - r * Sin(a)) * ScaleFactor + OffsetY), ')'); //База рекурсии
end;
procedure DrawLevyFractal(Depth: Integer; ScaleFactor: Double; OffsetX, OffsetY: Integer);
begin
  Levy(200, 300, 0, 250, Depth);//Параметризация
end;
begin
end.
