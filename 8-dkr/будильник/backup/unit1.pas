unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls,MMSystem;

type

  { TAlerm }

  TAlerm = class(TForm)
    btnAdd: TBitBtn;
    btnRemove: TBitBtn;
    Label2: TLabel;
    lTimeNow: TLabel;
    lblTime: TLabel;
    lblDate: TLabel;
    lstAlarms: TListBox;
    Timer1: TTimer;
    TraySignal: TTrayIcon;
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormWindowStateChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure lblDateClick(Sender: TObject);
    procedure lblTimeClick(Sender: TObject);
    procedure lstAlarmsClick(Sender: TObject);
    procedure lTimeNowClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TraySignalClick(Sender: TObject);
  private

  public

  end;

var
  Alerm: TAlerm;

implementation

uses
  Unit2;

{$R *.lfm}

{ TAlerm }

procedure TAlerm.btnAddClick(Sender: TObject);
var
  AlarmText: string;
begin
  if Form2.ShowModal = mrOK then begin
    AlarmText := Form2.lstHour.GetSelectedText + ':'
        + Form2.lstMinute.GetSelectedText + ' ' + Form2.lstampm.GetSelectedText
        + ' - ' + Form2.edtHint.Text;
    lstAlarms.Items.Add(AlarmText);
  end;
end;

procedure TAlerm.btnRemoveClick(Sender: TObject);
begin
  lstAlarms.DeleteSelected;
end;

procedure TAlerm.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  lstAlarms.Items.SaveToFile(Application.Location + DirectorySeparator + 'alarmlist.dat');
end;

procedure TAlerm.FormCreate(Sender: TObject);
begin
  if FileExists(Application.Location + DirectorySeparator + 'alarmlist.dat') then
    lstAlarms.Items.LoadFromFile(Application.Location + DirectorySeparator + 'alarmlist.dat');

  Timer1Timer(Sender);
end;

procedure TAlerm.FormWindowStateChange(Sender: TObject);
begin
  Visible := not (WindowState = wsMinimized);
end;

procedure TAlerm.Label2Click(Sender: TObject);
begin

end;

procedure TAlerm.lblDateClick(Sender: TObject);
begin

end;

procedure TAlerm.lblTimeClick(Sender: TObject);
begin

end;

procedure TAlerm.lstAlarmsClick(Sender: TObject);
begin

end;

procedure TAlerm.lTimeNowClick(Sender: TObject);
begin

end;

procedure TAlerm.Timer1Timer(Sender: TObject);
var
  i: Integer;
  TimeStamp: string;
  AlarmData: TStringArray;
begin
  lblTime.Caption := FormatDateTime('hh:nn am/pm', Time);
  lblDate.Caption := FormatDateTime('ddd, d mmm yyyy', Date);
  TimeStamp := FormatDateTime('hh:nn am/pm', Time);
  for i := 0 to lstAlarms.Items.Count - 1 do
  begin

    if i < lstAlarms.Items.Count then
    begin
      AlarmData := lstAlarms.Items[i].Split('-');
      if Trim(AlarmData[0]) = TimeStamp then
      begin
        lstAlarms.Items.Delete(i);
        PlaySound('signal-elektronnyih-chasov-budilnik-33058.wav', 0, SND_FILENAME or SND_ASYNC);
        ShowMessage('Подъем!'#13#10#13#10 +
          'Время: ' + AlarmData[0] + #13#10 +
          'Название: ' + AlarmData[1]);
      end;
    end;
  end;
end;


procedure TAlerm.TraySignalClick(Sender: TObject);
begin
  WindowState := wsNormal;
  Visible := True;
end;

end.

