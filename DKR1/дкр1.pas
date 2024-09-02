uses 
    graphabc, 
    System,
    Program2;
var
    Depth: integer = 8;
    ScaleFactor: double = 1.0;
    OffsetX, OffsetY: integer;

procedure levy(x, y, a, r: real; k: integer);
begin
    if k > 0 then 
    begin
        r := r * Sin(pi / 4);
        levy(x, y, a + pi / 4, r, k - 1);
        levy(x + r * Cos(a + pi / 4), y - r * Sin(a + pi / 4), a - pi / 4, r, k - 1);
    end 
    else
        Line(round(x * ScaleFactor + OffsetX), round(y * ScaleFactor + OffsetY),
             round((x + r * Cos(a)) * ScaleFactor + OffsetX), 
             round((y - r * Sin(a)) * ScaleFactor + OffsetY));
end; 
procedure drawkrivaiaLevy;
begin
    LockDrawing;
    levy(200, 300, 0, 250, Depth); 
    Redraw;
    UnlockDrawing;
end;
procedure redrawkrivaiaLevy;
begin
    LockDrawing;
    ClearWindow;
    drawkrivaiaLevy;
    Redraw;
    UnlockDrawing;
end;
procedure ScaleAndRedraw(factor: double);
begin
    ScaleFactor := ScaleFactor * factor;
    redrawkrivaiaLevy;
end;
procedure ChangeDepth(delta: integer);
begin
    Depth := Math.Max(1, Depth + delta);
    redrawkrivaiaLevy;
end;
procedure MoveOffset(dx, dy: integer);
begin
    OffsetX := OffsetX + dx;
    OffsetY := OffsetY + dy;
    redrawkrivaiaLevy;
end; 
procedure KeyDown(key: integer);
begin
     
        VK_UP: MoveOffset(0, -10);
        VK_DOWN: MoveOffset(0, 10);
        VK_LEFT: MoveOffset(-10, 0);
        VK_RIGHT: MoveOffset(10, 0);
        VK_ADD: ScaleAndRedraw(1.1);
        VK_SUBTRACT: ScaleAndRedraw(1 / 1.1);
        VK_W: ScaleAndRedraw(1.1);
        VK_S: ScaleAndRedraw(0.9);
        90: ChangeDepth(1); // клавиша Z
        88: ChangeDepth(-1); // клавиша X
    end;
end;
begin
    SetWindowSize(800, 600);
    OnKeyDown := KeyDown;
    OffsetX := WindowWidth div 2;
    OffsetY := WindowHeight div 2;
    redrawkrivaiaLevy;
end.
