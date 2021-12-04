unit Первый;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label18: TLabel;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    Label10: TLabel;
    Edit3: TEdit;
    Label7: TLabel;
    MaskEdit7: TMaskEdit;
    Label12: TLabel;
    MaskEdit9: TMaskEdit;
    Label14: TLabel;
    Edit4: TEdit;
    Label11: TLabel;
    MaskEdit8: TMaskEdit;
    Label13: TLabel;
    MaskEdit10: TMaskEdit;
    Label15: TLabel;
    MaskEdit11: TMaskEdit;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Edit2: TEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit6: TMaskEdit;
    RadioGroup2: TRadioGroup;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    Edit5: TEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses Меню, Второй;

procedure TForm2.Button1Click(Sender: TObject);
begin
  if radiogroup1.ItemIndex = 0 then
  begin
    with form1.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('insert into Продавец(Устав,Наименование,Гос_рег,Паспорт,ОГРН,ИНН,ОКПО,КПП,Адрес,Телефон) values(:a,:b,:c,:d,:e,:f,:j,:k,:m,:n)');
      parameters.ParamByName('a').Value:=maskedit1.Text;
      parameters.ParamByName('b').Value:=edit1.Text;
      parameters.ParamByName('c').Value:=maskedit5.Text;
      parameters.ParamByName('d').Value:=maskedit3.Text;
      parameters.ParamByName('e').Value:=maskedit7.Text;
      parameters.ParamByName('f').Value:=maskedit9.Text;
      parameters.ParamByName('j').Value:=maskedit8.Text;
      parameters.ParamByName('k').Value:=maskedit10.Text;
      parameters.ParamByName('m').Value:=edit4.Text;
      parameters.ParamByName('n').Value:=maskedit11.Text;
      execsql;
    end;
  end;
  if radiogroup2.ItemIndex = 0 then
  begin
    with form1.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('insert into Арендатор(Устав,Наименование,Гос_рег,Паспорт,ОГРН,ИНН,ОКПО,КПП,Адрес,Телефон) values(:a,:b,:c,:d,:e,:f,:j,:k,:m,:n)');
      parameters.ParamByName('a').Value:=maskedit2.Text;
      parameters.ParamByName('b').Value:=edit2.Text;
      parameters.ParamByName('c').Value:=maskedit6.Text;
      parameters.ParamByName('d').Value:=maskedit4.Text;
      parameters.ParamByName('e').Value:=maskedit12.Text;
      parameters.ParamByName('f').Value:=maskedit13.Text;
      parameters.ParamByName('j').Value:=maskedit14.Text;
      parameters.ParamByName('k').Value:=maskedit15.Text;
      parameters.ParamByName('m').Value:=edit5.Text;
      parameters.ParamByName('n').Value:=maskedit16.Text;
      execsql;
    end;
  end;
  form3.showmodal;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
form2.Close;
end;

procedure TForm2.ComboBox1Change(Sender: TObject);
begin
maskedit1.enabled:=true;
maskedit3.enabled:=true;
maskedit5.enabled:=true;
maskedit7.enabled:=true;
maskedit8.enabled:=true;
maskedit9.enabled:=true;
maskedit10.enabled:=true;
maskedit11.enabled:=true;
maskedit1.Clear;
maskedit5.Clear;
maskedit3.Clear;
maskedit7.Clear;
maskedit9.Clear;
maskedit8.Clear;
maskedit10.Clear;
maskedit11.Clear;
edit1.Enabled:=true;
edit4.Enabled:=true;
edit1.Clear;
edit4.Clear;
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Продавец where Устав = :1');
    parameters.ParamByName('1').Value:=combobox1.Text;
    open;
  end;
  edit1.Text:=form1.ADOQuery1.Fields[2].AsString;
  edit4.Text:=form1.ADOQuery1.Fields[9].AsString;
  maskedit1.Text:=form1.ADOQuery1.Fields[1].AsString;
  maskedit5.Text:=form1.ADOQuery1.Fields[3].AsString;
  maskedit3.Text:=form1.ADOQuery1.Fields[4].AsString;
  maskedit7.Text:=form1.ADOQuery1.Fields[5].AsString;
  maskedit9.Text:=form1.ADOQuery1.Fields[6].AsString;
  maskedit8.Text:=form1.ADOQuery1.Fields[7].AsString;
  maskedit10.Text:=form1.ADOQuery1.Fields[8].AsString;
  maskedit11.Text:=form1.ADOQuery1.Fields[10].AsString;
end;

procedure TForm2.ComboBox2Change(Sender: TObject);
begin
maskedit2.enabled:=true;
maskedit4.enabled:=true;
maskedit6.enabled:=true;
maskedit12.enabled:=true;
maskedit13.enabled:=true;
maskedit14.enabled:=true;
maskedit15.enabled:=true;
maskedit16.enabled:=true;
maskedit2.Clear;
maskedit6.Clear;
maskedit4.Clear;
maskedit12.Clear;
maskedit13.Clear;
maskedit14.Clear;
maskedit15.Clear;
maskedit16.Clear;
edit2.Enabled:=true;
edit5.Enabled:=true;
edit2.Clear;
edit5.Clear;
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Арендатор where Устав = :1');
    parameters.ParamByName('1').Value:=combobox2.Text;
    open;
  end;
  edit2.Text:=form1.ADOQuery1.Fields[2].AsString;
  edit5.Text:=form1.ADOQuery1.Fields[9].AsString;
  maskedit2.Text:=form1.ADOQuery1.Fields[1].AsString;
  maskedit6.Text:=form1.ADOQuery1.Fields[3].AsString;
  maskedit4.Text:=form1.ADOQuery1.Fields[4].AsString;
  maskedit12.Text:=form1.ADOQuery1.Fields[5].AsString;
  maskedit13.Text:=form1.ADOQuery1.Fields[6].AsString;
  maskedit14.Text:=form1.ADOQuery1.Fields[7].AsString;
  maskedit15.Text:=form1.ADOQuery1.Fields[8].AsString;
  maskedit16.Text:=form1.ADOQuery1.Fields[10].AsString;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
maskedit1.Clear;
maskedit2.Clear;
maskedit3.Clear;
maskedit4.Clear;
maskedit5.Clear;
maskedit6.Clear;
maskedit7.Clear;
maskedit8.Clear;
maskedit9.Clear;
maskedit10.Clear;
maskedit11.Clear;
maskedit12.Clear;
maskedit13.Clear;
maskedit14.Clear;
maskedit15.Clear;
maskedit1.enabled:=false;
maskedit2.enabled:=false;
maskedit3.enabled:=false;
maskedit4.enabled:=false;
maskedit5.enabled:=false;
maskedit6.enabled:=false;
maskedit7.enabled:=false;
maskedit8.enabled:=false;
maskedit9.enabled:=false;
maskedit10.enabled:=false;
maskedit11.enabled:=false;
maskedit12.enabled:=false;
maskedit13.enabled:=false;
maskedit14.enabled:=false;
maskedit15.enabled:=false;
maskedit16.enabled:=false;
edit1.Clear;
edit2.Clear;
edit3.Clear;
edit4.Clear;
edit5.Clear;
edit1.enabled:=false;
edit2.enabled:=false;
edit3.enabled:=false;
edit4.enabled:=false;
edit5.enabled:=false;
radiogroup1.ItemIndex:=-1;
radiogroup2.ItemIndex:=-1;
combobox1.Items.Clear;
combobox1.Text:='Выберите...';
combobox2.Items.Clear;
combobox2.Text:='Выберите...';
edit3.Text:=datetostr(now());
combobox1.Enabled:=false;
combobox2.Enabled:=false;
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select Устав from Продавец');
    open;
  end;
  while not form1.ADOQuery1.Eof do
  begin
    combobox1.Items.Add(form1.ADOQuery1.Fields[0].asstring);
    form1.ADOQuery1.Next;
  end;
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select Устав from Арендатор');
    open;
  end;
  while not form1.ADOQuery1.Eof do
  begin
    combobox2.Items.Add(form1.ADOQuery1.Fields[0].asstring);
    form1.ADOQuery1.Next;
  end;
end;

procedure TForm2.RadioGroup1Click(Sender: TObject);
begin
  case radiogroup1.ItemIndex of
    0:
    begin
      combobox1.Enabled:=false;
      edit1.enabled:=true;
      edit4.enabled:=true;
      maskedit1.enabled:=true;
      maskedit5.enabled:=true;
      maskedit3.enabled:=true;
      maskedit7.enabled:=true;
      maskedit8.enabled:=true;
      maskedit9.enabled:=true;
      maskedit10.enabled:=true;
      maskedit11.enabled:=true;
      maskedit1.Clear;
      maskedit5.Clear;
      maskedit3.Clear;
      maskedit7.Clear;
      maskedit9.Clear;
      maskedit8.Clear;
      maskedit10.Clear;
      maskedit11.Clear;
      edit1.Clear;
      edit4.Clear;
      combobox1.Text:='Выберите...';
    end;
    1:
    begin
      combobox1.Enabled:=true;
      edit1.enabled:=false;
      edit4.enabled:=false;
      maskedit1.enabled:=false;
      maskedit5.enabled:=false;
      maskedit3.enabled:=false;
      maskedit7.enabled:=false;
      maskedit8.enabled:=false;
      maskedit9.enabled:=false;
      maskedit10.enabled:=false;
      maskedit11.enabled:=false;
      maskedit1.Clear;
      maskedit5.Clear;
      maskedit3.Clear;
      maskedit7.Clear;
      maskedit9.Clear;
      maskedit8.Clear;
      maskedit10.Clear;
      maskedit11.Clear;
      edit1.Clear;
      edit4.Clear;
      combobox1.Text:='Выберите...';
    end;
  end;
end;

procedure TForm2.RadioGroup2Click(Sender: TObject);
begin
  case radiogroup2.ItemIndex of
    0:
    begin
      combobox2.Enabled:=false;
      edit2.enabled:=true;
      edit5.enabled:=true;
      maskedit2.enabled:=true;
      maskedit6.enabled:=true;
      maskedit4.enabled:=true;
      maskedit12.enabled:=true;
      maskedit13.enabled:=true;
      maskedit14.enabled:=true;
      maskedit15.enabled:=true;
      maskedit16.enabled:=true;
      maskedit2.Clear;
      maskedit6.Clear;
      maskedit4.Clear;
      maskedit12.Clear;
      maskedit13.Clear;
      maskedit14.Clear;
      maskedit15.Clear;
      maskedit16.Clear;
      edit2.Clear;
      edit5.Clear;
      combobox2.Text:='Выберите...';
    end;
    1:
    begin
      combobox2.Enabled:=true;
      edit2.enabled:=false;
      edit5.enabled:=false;
      maskedit2.enabled:=false;
      maskedit6.enabled:=false;
      maskedit4.enabled:=false;
      maskedit12.enabled:=false;
      maskedit13.enabled:=false;
      maskedit14.enabled:=false;
      maskedit15.enabled:=false;
      maskedit16.enabled:=false;
      maskedit2.Clear;
      maskedit6.Clear;
      maskedit4.Clear;
      maskedit12.Clear;
      maskedit13.Clear;
      maskedit14.Clear;
      maskedit15.Clear;
      maskedit16.Clear;
      edit2.Clear;
      edit5.Clear;
      combobox2.Text:='Выберите...';
    end;
  end;
end;

end.
