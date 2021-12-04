unit Просмотр;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Data.Win.ADODB;

type
  TForm6 = class(TForm)
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    DataSource1: TDataSource;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    DataSource2: TDataSource;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    DBGrid1: TDBGrid;
    DataSource3: TDataSource;
    DBGrid3: TDBGrid;
    Label18: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    DBGrid4: TDBGrid;
    ADOQuery2: TADOQuery;
    ComboBox3: TComboBox;
    ComboBox5: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses Меню;

procedure TForm6.Button3Click(Sender: TObject);
Begin
combobox1.Text:='Сортировать...';
combobox2.Text:='Фильтровать...';
combobox3.Text:='Сортировать...';
combobox5.Text:='Сортировать...';
  with form1.ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from Договор');
      open;
    end;
  with ADOQuery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from Продавец');
      open;
    end;
  with ADOQuery2 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from Арендатор');
      open;
    end;
end;

procedure TForm6.ComboBox1Change(Sender: TObject);
begin
  case combobox1.ItemIndex of
    0:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор order by Сумма ASC');
        open;
      end;
    end;
    1:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор order by Сумма DESC');
        open;
      end;
    end;
    2:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор order by Взнос ASC');
        open;
      end;
    end;
    3:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор order by Взнос DESC');
        open;
      end;
    end;
  end;
end;

procedure TForm6.ComboBox2Change(Sender: TObject);
begin
  case combobox2.ItemIndex of
    0:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='1';
        open;
      end;
    end;
    1:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='2';
        open;
      end;
    end;
    2:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='3';
        open;
      end;
    end;
    3:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='4';
        open;
      end;
    end;
    4:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='5';
        open;
      end;
    end;
    5:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='6';
        open;
      end;
    end;
    6:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='7';
        open;
      end;
    end;
    7:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='8';
        open;
      end;
    end;
    8:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='9';
        open;
      end;
    end;
    9:
    begin
    with form1.ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Договор where Срок = :1');
        parameters.ParamByName('1').Value:='10';
        open;
      end;
    end;
  end;
end;

procedure TForm6.ComboBox3Change(Sender: TObject);
begin
  case combobox1.ItemIndex of
    0:
    begin
    with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Продавец order by Наименование ASC');
        open;
      end;
    end;
    1:
    begin
    with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Продавец order by Наименование DESC');
        open;
      end;
    end;
    2:
    begin
    with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Продавец order by Устав ASC');
        open;
      end;
    end;
    3:
    begin
    with ADOQuery1 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Продавец order by Устав DESC');
        open;
      end;
    end;
  end;
end;

procedure TForm6.ComboBox5Change(Sender: TObject);
begin
  case combobox1.ItemIndex of
    0:
    begin
    with adoquery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Арендатор order by Наименование ASC');
        open;
      end;
    end;
    1:
    begin
    with adoquery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Арендатор order by Наименование DESC');
        open;
      end;
    end;
    2:
    begin
    with adoquery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Арендатор order by Устав ASC');
        open;
      end;
    end;
    3:
    begin
    with adoquery2 do
      begin
        close;
        sql.Clear;
        sql.Add('select * from Арендатор order by Устав DESC');
        open;
      end;
    end;
  end;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
combobox1.Text:='Сортировать...';
combobox2.Text:='Фильтровать...';
combobox3.Text:='Сортировать...';
combobox5.Text:='Сортировать...';
with form1.ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Договор');
    open;
  end;
with ADOQuery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Продавец');
    open;
  end;
with ADOQuery2 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Арендатор');
    open;
  end;
end;

end.
