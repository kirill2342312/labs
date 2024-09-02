unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFmain }

  TFmain = class(TForm)
    TitleEdit: TEdit;
    Nextt: TButton;
    HZhz: TLabel;
    Previouss: TButton;
    ProducerEdit: TEdit;
    HZ: TEdit;
    DiagonalEdit: TEdit;
    MaxSpeed: TLabel;
    LightCheckbox: TCheckBox;
    NameMouse: TLabel;
    Proizvod: TLabel;
    Podsvetka: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure HZChange(Sender: TObject);
    procedure PodsvetkaClick(Sender: TObject);
    procedure HZhzClick(Sender: TObject);
    procedure LightCheckboxChange(Sender: TObject);
    procedure NexttClick(Sender: TObject);
    procedure PrevioussClick(Sender: TObject);
    procedure ProducerEditChange(Sender: TObject);
    procedure ProizvodClick(Sender: TObject);
    procedure NameMouseClick(Sender: TObject);
    procedure TitleEditChange(Sender: TObject);
  private
    procedure GetRow(i: integer);
    procedure editdata(i:integer);
  public

  end;

var
  Fmain: TFmain;
  Data: TStringList;
  cur_row: integer;

implementation

{$R *.lfm}

{ TFmain }


procedure TFmain.FormShow(Sender: TObject);
Begin
  Data := TStringList.create;
  cur_row := 0;
  if FileExists('Mouses.txt') then begin
     Data.LoadFromFile('Mouses.txt');
      getRow(cur_row);
  end;
end;

procedure TFmain.HZChange(Sender: TObject);
begin

end;

procedure TFmain.PodsvetkaClick(Sender: TObject);
begin

end;

procedure TFmain.HZhzClick(Sender: TObject);
begin

end;

procedure TFmain.LightCheckboxChange(Sender: TObject);
begin

end;

procedure TFmain.NexttClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row < data.count-1 then
    begin
      cur_row := cur_row + 1;
      getRow(cur_row);
    end
    else
   begin
     data.add('');
     cur_row += 1;
     titleedit.Clear;
     produceredit.clear;
     lightcheckbox.checked := False;
     HZ.clear;
     DiagonalEdit.clear;
   end;
end;

procedure TFmain.PrevioussClick(Sender: TObject);
begin
 editdata(cur_row);
 if cur_row > 0 then
    begin
      cur_row := cur_row - 1;
      getRow(cur_row);
    end;
end;

procedure TFmain.ProducerEditChange(Sender: TObject);
begin

end;

procedure TFmain.ProizvodClick(Sender: TObject);
begin

end;

procedure TFmain.NameMouseClick(Sender: TObject);
begin

end;

procedure TFmain.TitleEditChange(Sender: TObject);
begin

end;

procedure TFmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  editdata(cur_row);
  data.saveToFile('Mouses.txt')
end;

procedure TFmain.FormCreate(Sender: TObject);
begin

end;

procedure TFmain.GetRow(i: integer);
var str: string;
begin
   str := Data.Strings[i];

   TitleEdit.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   ProducerEdit.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   if copy(str, 1, pos(',',str)-1) = 'True' then
      LightCheckbox.checked := True
   else
      LightCheckbox.checked := False;
   delete(str,1,pos(',',str));

   HZ.text:=copy(str, 1, pos(',',str)-1);
   delete(str,1,pos(',',str));

   DiagonalEdit.text:=str;
end;

procedure TFmain.editdata(i:integer);
var str:string;
begin
   if LightCheckbox.checked = True then
      str:= 'True'
   else str:='False';
   data.strings[i]:= TitleEdit.text + ',' + ProducerEdit.text + ',' +  str + ',' + HZ.text + ',' + DiagonalEdit.Text;
end;

end.

