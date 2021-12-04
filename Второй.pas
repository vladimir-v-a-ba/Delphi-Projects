unit Второй;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask;

type
  TForm3 = class(TForm)
    GroupBox1: TGroupBox;
    Edit2: TEdit;
    Edit3: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label18: TLabel;
    GroupBox2: TGroupBox;
    Edit4: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Memo1: TMemo;
    Edit1: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Label12: TLabel;
    Edit9: TEdit;
    Label4: TLabel;
    Button3: TButton;
    Button1: TButton;
    Button2: TButton;
    Label10: TLabel;
    Edit10: TEdit;
    Label11: TLabel;
    Edit11: TEdit;
    procedure Button2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses Меню, Первый;

procedure TForm3.Button1Click(Sender: TObject);
begin
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('insert into Договор(Устав_прод,Устав_аренд,Дата_оформл,Описание,Полная_стоим,Срок,Полезн_исп,Проц_став,Велич_исп,Проц_комис,Доп,Сумма,Взнос) values (:1,:2,:3,:4,:5,:6,:7,:8,:9,:10,:11,:12,:13)');
    parameters.ParamByName('1').Value:=form2.MaskEdit1.Text;
    parameters.ParamByName('2').Value:=form2.MaskEdit2.Text;
    parameters.ParamByName('3').Value:=datetostr(now());
    parameters.ParamByName('4').Value:=memo1.Text;
    parameters.ParamByName('5').Value:=edit2.Text;
    parameters.ParamByName('6').Value:=edit3.Text;
    parameters.ParamByName('7').Value:=edit1.Text;
    parameters.ParamByName('8').Value:=edit6.Text;
    parameters.ParamByName('9').Value:=edit7.Text;
    parameters.ParamByName('10').Value:=edit8.Text;
    parameters.ParamByName('11').Value:=edit9.Text;
    parameters.ParamByName('12').Value:=edit10.Text;
    parameters.ParamByName('13').Value:=edit11.Text;
    execsql;
  end;
  messagebox(handle,pchar('Завершено'),pchar(''),MB_OK);
  form2.close;
  form3.Close;
end;

procedure TForm3.Button2Click(Sender: TObject);
begin
form2.close;
form3.Close;
end;

procedure TForm3.Button3Click(Sender: TObject);
var
stoimNach:double;
stoimKon:double;
stoimSred:double;
AO:double;
PK:double;
KV:double;
DU:double;
V:double;
NDS:double;
LPS: array of double;
i: Integer;
temp:double;
sum:double;
vzn:double;
begin
sum:=0;
vzn:=0;
AO:=0;
PK:=0;
KV:=0;
DU:=0;
V:=0;
NDS:=0;
setlength(LPS,strtoint(edit3.Text));
  for i:=0 to strtoint(edit3.Text)-1 do
  begin
  AO:=strtoint(edit2.Text)/strtoint(edit1.Text);
    if i=0 then
    begin
      stoimNach:=strtoint(edit2.Text);
      stoimKon:=strtoint(edit2.Text)-AO;
      stoimSred:=(stoimNach+stoimKon)/2;
    end
    else
    begin
      stoimNach:=stoimKon;
      stoimKon:=stoimNach-AO;
      stoimSred:=(stoimNach+stoimKon)/2;
    end;
  PK:=(stoimSred*strtoint(edit6.Text))/100;
  KV:=(stoimSred*strtoint(edit8.Text))/100;
  DU:=strtoint(edit9.Text)/2;
  V:=AO+PK+KV+DU;
  NDS:=(V*18)/100;
  temp:=V+NDS;
  LPS[i]:=temp;
  sum:=sum+temp;
  end;
vzn:=(sum/strtoint(edit3.Text))/4;
edit10.Text:=floattostr(sum);
edit11.Text:=floattostr(vzn)+' / квартал';
button1.Enabled:=true;
end;

procedure TForm3.Edit9Change(Sender: TObject);
begin
if edit9.Text<>'' then
button3.Enabled:=true
else
button3.Enabled:=false;
end;

procedure TForm3.FormShow(Sender: TObject);
begin
edit4.Text:=form2.Edit1.Text;
edit5.Text:=form2.Edit2.Text;
memo1.Clear;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit6.Clear;
edit7.Clear;
edit8.Clear;
edit9.Clear;
edit10.Clear;
edit11.Clear;
button3.Enabled:=false;
button1.Enabled:=false;
end;

end.
