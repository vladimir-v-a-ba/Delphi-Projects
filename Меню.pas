unit ����;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, ComObj, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    ADOConnection1: TADOConnection;
    ADOQuery1: TADOQuery;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ������, ��������;

procedure TForm1.FormShow(Sender: TObject);
const
Fn='��.mdb';
var
S,FileName:String;
begin
ADOConnection1.Close;
FileName := ExtractFilePath(ParamStr(0)) + Fn;
S :=
    'Provider=Microsoft.Jet.OLEDB.4.0;'
    + 'Data Source="' + FileName + '";'
    + 'Mode=Share Deny None;'
    + 'User Id=;'
    + 'Password=;';
ADOConnection1.ConnectionString := S;
ADOConnection1.Open;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
form2.showmodal;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  form6.showmodal;
end;

procedure TForm1.N4Click(Sender: TObject);
var
print:variant;
number:integer;
ust_pok:string;
ust_arend:string;
begin
number:=strtoint(inputbox('','������� ����� �������� ��� ������:',''));
with adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from ������� where ����� = :a');
    parameters.ParamByName('a').Value:=number;
    open;
  end;
  if adoquery1.IsEmpty then
  begin
    messagebox(handle,pchar('�� ������� �������� � ��������� �������!'),pchar(''),MB_OK);
  end
  else
  begin
    ust_pok:=adoquery1.Fields[1].AsString;
    ust_arend:=adoquery1.Fields[2].AsString;
    print:=CreateOleObject('Word.Application');
    print.Visible:=Visible;
    print.Activate;
    print.Documents.Add;
    print.ActiveDocument.Range.InsertBefore('                                              ������� ������� �'+inttostr(number)+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('  �. �����-���������                                                "23" ___���_____  2020 ����'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('��� "���� � ������", ��������� � ���������� "�������������", ����������� �� ��������� 333659921555, � ����� �������, � ��� "������ � ����", ��������� � ���������� "�����������������", ����������� ');
    print.ActiveDocument.Range.InsertAfter('�� ��������� 223444322002, � ������ �������, ��������� ������ "�������", � �� ����������� "�������", ��������� ��������� ������� (����� - �������) � �������������.'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     1. �����������'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('������� ������� - ���������, ������������ � ������������ �������� �������, ���������� ������������ ������ ���������� �������� (���������� N 1).'+#13+#10);
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from �������� where ����� = :a');
      parameters.ParamByName('a').Value:=ust_pok;
      open;
    end;
    print.ActiveDocument.Range.InsertAfter('�������� - '+adoquery1.Fields[2].asstring+', ��������������� �� ������: '+adoquery1.Fields[9].asstring+', ���� '+adoquery1.Fields[5].asstring+', ��� '+adoquery1.Fields[6].asstring+'.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('������� �����-������� - �������, ���������� ���������� ����� �������������� � ���������, � ������������ � ������� �������� ��������� �������� � ������������� ������������� ������� �������, ��������������� ��� �������� � ������ ');
    print.ActiveDocument.Range.InsertAfter('�����������������, � ������������� ��������� ��� ������� � �������� �� ���� ������������ ��������� ����.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('��� �������-�������� - ���, ����������� ���� �������� �������� ������� �� ��������� �������� � ����������� �����������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('���������������� � ������������ ��������� - �������� ���������, �������-������������ ��������� ��� ���� ������������ ��������.'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     2. ������� ��������'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.1. ������������� ��������� ���������� � ������������� ������� ������� � �������� � ������������ ��� ����������������� �� ����� �� ��������� �������� � ����������� ��� ������������������� �����.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2. ��� ���������� ����� ������������ ������������� ��������� � ������� 30 ���� �� ��� ���������� �������� ��������� ������� �����-������� � ��������� �� ��������� ��������:'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.1. ������� �������� �����-������� ����������� � ������������ � ����. 1 "�����������" ��������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.2. ������������� ������� ������� ������������ ��� �������� � ������ �����������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.3. ���� �������� �������� ������� ��������������� �� "___" __________ _____ �. � ���������� ���� �������� �������� ������ ��������� ������������� � ����������������� _______________ �� ������� ��� �� _____ ����'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.4. �������� �������� ������� �������������� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ����� ��� �������� ��������� �� ����� �����������������, ������������� �� ������: ______________________________.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ����� ��� ������� ������������������ �� ������ ��������, �������������� �� ������: ______________________________.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.5. ������� �������� ������� �� ����������, ��������, ������������, ������������� � ���� ��� ��� ������������ ��� ��� �������� �����������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                        3. ������� ��������, ������� � '+#13+#10);
        print.ActiveDocument.Range.InsertAfter('                                      ������������ �������� �������'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.1. �������� � ������� �������� ������� ������������ � ������� � �����, ������� ������������� ��������� �����-�������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.2. ������������� ������ � ���� �������� �������� �������, ��������� � ����������� �������� (�. 2.2.3 ��������), ��������� ������ ������������� ��� ������� � ������� �������� ������� � ��� ��� ����������� �������� �����������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.3. �� ���������� ������� �������� ������� ��������, ������������� � ����������������� ����������� ��������������� ���������������� � ������������ ���������, � ����� ��� �������-��������.'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('3.4. ������� �������, ���������� �����������������, ����������� �� ������� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �����������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('�������, �� ������� ������� ����������� ������� ������� (������� ������),'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ������'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �� ������'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('��������� � �������� ����� ����������� ����������� �����������, ��������������� ��. 1 �. 2 ��. 259.3 �� ��. '+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.5. ����������� ������������ �������� ������� �������������� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ��������� � ������������ � ��������� �������� �����-�������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ��������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- ������������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.6. ����������� �� ����������:'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('- ������������ ������� �������� ������� ����� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �������������;'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �����������������;'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �������� ������� �������� ������� ����� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �������������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �����������������.'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('                                       4. ������, ����� � �������'+#13+#10);
          print.ActiveDocument.Range.InsertAfter('                               �������� ���������� ��������'+#13+#10);
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from ������� where �����_���� = :a');
      parameters.ParamByName('a').Value:=ust_pok;
      open;
    end;
    print.ActiveDocument.Range.InsertAfter('4.1. ����� ����������� ������� ���������� '+adoquery1.Fields[13].asstring+' ���. ����� ����� �������� �� �������� ���������� '+adoquery1.Fields[12].asstring+' ���.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.2. ���������� ������ �������� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �� ������� _____ ���� �� ��������� ���������� __________ (����������� ��������� ������: �����, ������� � �.�.).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �� ������� _____ ���� �� ������ ���������� __________ (����������� ��������� ������: �����, ������� � �.�.).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- � ������������ � �������� ��������, ���������� ������������ ������ �������� (���������� N 2).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.3. ��������� ������ ���������� �������� (������� ������)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �����������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- �� �����������.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.4. ��� ������� �� �������� ������������ � ����������� ������� ����� ������������ �������� ������� �� ��������� �������������� ��������� ����. ������������� ����������������� �� ������ ');
    print.ActiveDocument.Range.InsertAfter('��������� ����������� � ������ ���������� �������� ������� �� ����������������� ���� ����� �������������.'+#13+#10+#13+#10+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     ������� ������'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                �������������                            �����������������'+#13+#10);
    print.ActiveDocument.Range.InsertAfter(' ____________________ (__________)        ___________________ (_________) '+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                �.�.                                     �.�.'+#13+#10);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
form1.Close;
end;

end.
