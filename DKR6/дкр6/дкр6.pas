program DequeExample;

const
MAXSIZE = 5; // Максимальный размер дека

type
Deque = record
data: array[1..MAXSIZE] of integer;
front: integer;
rear: integer;
size: integer;
end;

var
d: Deque;

procedure InitializeDeque(var d: Deque);
begin
d.front := 1;
d.rear := 0;
d.size := 0;
end;

procedure PrintDeque(var d: Deque);
var
i, idx: integer;
begin
if d.size = 0 then
writeln('Дек пустой')
else
begin
writeln('Текущее содержимое дека:');
idx := d.front;
for i := 1 to d.size do
begin
write(d.data[idx], ' ');
idx := (idx mod MAXSIZE) + 1;
end;
writeln;
end;
end;

procedure AddFront(var d: Deque; x: integer);
begin
if d.size = MAXSIZE then
writeln('Дек полностью заполнен')
else
begin
d.front := ((d.front + MAXSIZE - 2) mod MAXSIZE) + 1;
d.data[d.front] := x;
inc(d.size);
writeln('Элемент добавлен в начало: ', x);
end;
end;

procedure AddRear(var d: Deque; x: integer);
begin
if d.size = MAXSIZE then
writeln('Дек полностью заполнен')
else
begin
d.rear := (d.rear mod MAXSIZE) + 1;
d.data[d.rear] := x;
inc(d.size);
writeln('Элемент добавлен в конец: ', x);
end;
end;

procedure RemoveFront(var d: Deque);
begin
if d.size = 0 then
writeln('Дек очищен')
else
begin
writeln('Элемент удален из начала: ', d.data[d.front]);
d.front := (d.front mod MAXSIZE) + 1;
dec(d.size);
end;
end;

procedure RemoveRear(var d: Deque);
begin
if d.size = 0 then
writeln('Дек очищен')
else
begin
writeln('Элемент удален из конца: ', d.data[d.rear]);
d.rear := ((d.rear + MAXSIZE - 2) mod MAXSIZE) + 1;
dec(d.size);
end;
end;

var
choice, x: integer;
begin
InitializeDeque(d);
repeat
writeln('1. Добавить элемент в начало');
writeln('2. Добавить элемент в конец');
writeln('3. Удалить элемент из начала');
writeln('4. Удалить элемент из конца');
writeln('5. Показать дек');
writeln('0. Выход');
writeln('Выбери опцию:');
readln(choice);
case choice of
1: begin
writeln('Введи элемент:');
readln(x);
AddFront(d, x);
end;
2: begin
writeln('Введи элемент:');
readln(x);
AddRear(d, x);
end;
3: RemoveFront(d);
4: RemoveRear(d);
5: PrintDeque(d);
0: writeln('Выход из программы...');
else
writeln('Неверный выбор, попробуй снова.');
end;
until choice = 0;
end.
