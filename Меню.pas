unit Меню;

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

uses Первый, Просмотр;

procedure TForm1.FormShow(Sender: TObject);
const
Fn='бд.mdb';
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
number:=strtoint(inputbox('','Укажите номер договора для печати:',''));
with adoquery1 do
  begin
    close;
    sql.Clear;
    sql.Add('select * from Договор where Номер = :a');
    parameters.ParamByName('a').Value:=number;
    open;
  end;
  if adoquery1.IsEmpty then
  begin
    messagebox(handle,pchar('Не найдено договора с указанным номером!'),pchar(''),MB_OK);
  end
  else
  begin
    ust_pok:=adoquery1.Fields[1].AsString;
    ust_arend:=adoquery1.Fields[2].AsString;
    print:=CreateOleObject('Word.Application');
    print.Visible:=Visible;
    print.Activate;
    print.Documents.Add;
    print.ActiveDocument.Range.InsertBefore('                                              ДОГОВОР ЛИЗИНГА №'+inttostr(number)+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('  г. Санкт-Петербург                                                "23" ___мая_____  2020 года'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('ООО "Рога и копыта", именуемый в дальнейшем "Лизингодатель", действующий на основании 333659921555, с одной стороны, и ООО "Атыпок и Агор", именуемый в дальнейшем "Лизингополучатель", действующий ');
    print.ActiveDocument.Range.InsertAfter('на основании 223444322002, с другой стороны, именуемые вместе "Стороны", а по отдельности "Сторона", заключили настоящий договор (далее - Договор) о нижеследующем.'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     1. ОПРЕДЕЛЕНИЯ'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('Предмет лизинга - имущество, обозначенное в Спецификации предмета лизинга, являющейся неотъемлемой частью настоящего Договора (Приложение N 1).'+#13+#10);
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from Продавец where Устав = :a');
      parameters.ParamByName('a').Value:=ust_pok;
      open;
    end;
    print.ActiveDocument.Range.InsertAfter('Продавец - '+adoquery1.Fields[2].asstring+', зарегистрирован по адресу: '+adoquery1.Fields[9].asstring+', ОГРН '+adoquery1.Fields[5].asstring+', ИНН '+adoquery1.Fields[6].asstring+'.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('Договор купли-продажи - договор, подлежащий заключению между Лизингодателем и Продавцом, в соответствии с которым Продавец обязуется передать в собственность Лизингодателя Предмет лизинга, предназначенный для передачи в аренду ');
    print.ActiveDocument.Range.InsertAfter('Лизингополучателю, а Лизингодатель обязуется его принять и уплатить за него определенную договором цену.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('Акт приемки-передачи - акт, фиксирующий факт передачи Предмета лизинга во временное владение и пользование Лизингополучателя.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('Сопроводительные и транспортные документы - товарная накладная, товарно-транспортная накладная или иной транспортный документ.'+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     2. ПРЕДМЕТ ДОГОВОРА'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.1. Лизингодатель обязуется приобрести в собственность Предмет лизинга у Продавца и предоставить его Лизингополучателю за плату во временное владение и пользование для предпринимательских целей.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2. Для выполнения своих обязательств Лизингодатель обязуется в течение 30 дней со дня заключения Договора заключить Договор купли-продажи с Продавцом на следующих условиях:'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.1. Предмет Договора купли-продажи указывается в соответствии с разд. 1 "Определения" Договора.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.2. Приобретаемый Предмет лизинга предназначен для передачи в аренду Лизингополучателю.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.3. Срок поставки Предмета лизинга устанавливается до "___" __________ _____ г. О конкретной дате поставки Продавец обязан уведомить Лизингодателя и Лизингополучателя _______________ не позднее чем за _____ дней'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.4. Передача Предмета лизинга осуществляется (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- путем его доставки Продавцом на склад Лизингополучателя, расположенный по адресу: ______________________________.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- путем его выборки Лизингополучателем со склада Продавца, расположенного по адресу: ______________________________.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('2.2.5. Приемка Предмета лизинга по количеству, качеству, ассортименту, комплектности и тары под ним производится при его вручении Лизингополучателю.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                        3. ПОРЯДОК ПЕРЕДАЧИ, ПРИЕМКИ И '+#13+#10);
        print.ActiveDocument.Range.InsertAfter('                                      ОБСЛУЖИВАНИЯ ПРЕДМЕТА ЛИЗИНГА'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.1. Передача и приемка Предмета лизинга производятся в порядке и сроки, которые предусмотрены Договором купли-продажи.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.2. Лизингодатель обязан в день поставки Предмета лизинга, указанный в уведомлении Продавца (п. 2.2.3 Договора), направить своего представителя для участия в приемке Предмета лизинга и для его последующей передачи Лизингополучателю.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.3. По завершении приемки Предмета лизинга Продавец, Лизингодатель и Лизингополучатель подписывают соответствующие сопроводительные и транспортные документы, а также акт приемки-передачи.'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('3.4. Предмет лизинга, переданный Лизингополучателю, учитывается на балансе (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингодателя.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингополучателя.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('Сторона, на балансе которой учитывается Предмет лизинга (выбрать нужное),'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- вправе'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- не вправе'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('применять к основной норме амортизации специальный коэффициент, предусмотренный пп. 1 п. 2 ст. 259.3 НК РФ. '+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.5. Техническое обслуживание Предмета лизинга осуществляется (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Продавцом в соответствии с условиями Договора купли-продажи.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингодателем.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингополучателем.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('3.6. Обязанности по проведению:'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('- капитального ремонта Предмета лизинга несет (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингодатель;'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингополучатель;'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- текущего ремонта Предмета лизинга несет (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингодатель.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- Лизингополучатель.'+#13+#10);
     print.ActiveDocument.Range.InsertAfter('                                       4. РАЗМЕР, СРОКИ И ПОРЯДОК'+#13+#10);
          print.ActiveDocument.Range.InsertAfter('                               ВНЕСЕНИЯ ЛИЗИНГОВЫХ ПЛАТЕЖЕЙ'+#13+#10);
    with adoquery1 do
    begin
      close;
      sql.Clear;
      sql.Add('select * from Договор where Устав_прод = :a');
      parameters.ParamByName('a').Value:=ust_pok;
      open;
    end;
    print.ActiveDocument.Range.InsertAfter('4.1. Сумма лизингового платежа составляет '+adoquery1.Fields[13].asstring+' руб. Общая сумма платежей по Договору составляет '+adoquery1.Fields[12].asstring+' руб.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.2. Лизинговый платеж вносится (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- не позднее _____ дней по истечении очередного __________ (указывается расчетный период: месяц, квартал и т.д.).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- не позднее _____ дней до начала очередного __________ (указывается расчетный период: месяц, квартал и т.д.).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- в соответствии с Графиком платежей, являющимся неотъемлемой частью Договора (Приложение N 2).'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.3. Досрочная уплата лизинговых платежей (выбрать нужное)'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- допускается.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('- не допускается.'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('4.4. Все расчеты по Договору производятся в безналичном порядке путем перечисления денежных средств на указанный Лизингодателем расчетный счет. Обязательство Лизингополучателя по оплате ');
    print.ActiveDocument.Range.InsertAfter('считается исполненным в момент зачисления денежных средств на корреспондентский счет банка Лизингодателя.'+#13+#10+#13+#10+#13+#10+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                                     ПОДПИСИ СТОРОН'+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                Лизингодатель                            Лизингополучатель'+#13+#10);
    print.ActiveDocument.Range.InsertAfter(' ____________________ (__________)        ___________________ (_________) '+#13+#10);
    print.ActiveDocument.Range.InsertAfter('                                М.П.                                     М.П.'+#13+#10);
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
form1.Close;
end;

end.
