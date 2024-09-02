unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TForm2 }

  TForm2 = class(TForm)
    btnOK: TBitBtn;
    btnCancel: TBitBtn;
    edtHint: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lblTimeHint: TLabel;
    lstHour: TListBox;
    lstMinute: TListBox;
    lstampm: TListBox;
    procedure btnCancelClick(Sender: TObject);
    procedure btnOKClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure lstHourClick(Sender: TObject);
    procedure lstHourSelectionChange(Sender: TObject; User: boolean);
  private

  public

  end;

var
  Form2: TForm2;

implementation

{$R *.lfm}

{ TForm2 }

procedure TForm2.btnOKClick(Sender: TObject);
begin
  ModalResult := mrOK;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.FormShow(Sender: TObject);
var
  parts: TStringArray;
begin
  edtHint.Text := '';

  parts := FormatDateTime('h|m|am/pm', Time).Split('|');

  lstHour.Selected[ StrToInt( parts[0] ) - 1 ] := True;

  lstMinute.Selected[ StrToInt( parts[1] ) - 1 ] := True;

  if parts[2] = 'am' then
    lstampm.Selected[ 0 ] := True // select am
  else
    lstampm.Selected[ 1 ] := True; // select pm
end;

procedure TForm2.lstHourClick(Sender: TObject);
begin

end;

procedure TForm2.lstHourSelectionChange(Sender: TObject; User: boolean);
begin
  lblTimeHint.Caption := lstHour.GetSelectedText + ':'
                         + lstMinute.GetSelectedText + ' '
                         + lstampm.GetSelectedText;
end;

procedure TForm2.btnCancelClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

end.

