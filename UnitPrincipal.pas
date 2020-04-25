unit UnitPrincipal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ACBrBase, ACBrFala, StdCtrls, Printers;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    PrintDialog1: TPrintDialog;
    PrinterSetupDialog1: TPrinterSetupDialog;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    MemoResposta: TMemo;
    Button8: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
  private
    { Private declarations }
    procedure Log(acao: String; retorno: Integer);
  public
    { Public declarations }

  end;

var
  Form1: TForm1;
  aPrinter: tprinter; // necessario
  x, y: integer; // necessario;

implementation

uses InterfaceEpsonNF;

{$R *.dfm}

procedure TForm1.Button4Click(Sender: TObject);
var szTexto : String;
begin
  Screen.Cursor := crSQLWait;
  Log('Configura taxa', ConfiguraTaxaSerial(115200));
  Log('Inicia porta', IniciaPorta('COM9'));

  szTexto := '';
  //szTexto := Concat(szTexto, '<bmp></bmp>'#10);
  //szTexto := Concat(szTexto, '<xl><bmp></bmp></xl>'#10);
  //szTexto := Concat(szTexto, '<bmp><xl></xl></bmp>'#10);

  szTexto := Concat(szTexto, '<ce><xl><b>Gladius consultoria</b></xl></ce>'#10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, '<ce><b>Procurador: </b>Victor Matheus Mendes</ce>'#10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, '<c><ce><b>Observação</b></ce></c>'#10);
  szTexto := Concat(szTexto, '<c><ce>Utilize este cupom no momento da votação!</ce></c>'#10);
  Log('Imprime texto', ImprimeTextoTag(PChar(szTexto)));

  Log('Configura codigo de barras', ConfiguraCodigoBarras(200, 2, 2, 0, 5));
  Log('Imprime CODE 128', ImprimeCodigoBarrasCODE128('123456789012'));

  szTexto := '';
  szTexto := Concat(szTexto, '<ce><b>Previsão de inicio: </b>10/03/2019 - 15:00:00</ce>'#10);
  Log('Imprime texto', ImprimeTextoTag(PChar(szTexto)));

  Log('Gilhotina', AcionaGuilhotina(0));

  Sleep(800);

  szTexto := '';
  szTexto := Concat(szTexto, '<ce><xl><b>Confirmação de presença</b></xl></ce>'#10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, '<ce><b>Procurador: </b>Victor Matheus Mendes</ce>'#10);
  szTexto := Concat(szTexto, #10);  
  szTexto := Concat(szTexto, '<ce><c><b>Credor                          Classe            Vlr.Crédito</b></c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>Victor Matheus Mendes           QUIROGRAFÁRIO   R$ 100.000,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>Gessica Simon Rabello           QUIROGRAFÁRIO   R$ 140.600,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>Roselaine da Silva Mendes       QUIROGRAFÁRIO   R$ 160.400,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>Vilmar Mendes                   QUIROGRAFÁRIO   R$ 190.100,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>João da Silva                   QUIROGRAFÁRIO   R$ 190.100,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c>Maria José                      QUIROGRAFÁRIO   R$ 190.100,00</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><c><b>Total 6                                     R$ 1.190.100,00</b></c></ce>'#10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, #10);
  szTexto := Concat(szTexto, '<ce><c>___________________________________________</c></ce>'#10);
  szTexto := Concat(szTexto, '<ce><b>Victor Matheus Mendes</b></ce>'#10);

  Log('Imprime texto', ImprimeTextoTag(PChar(szTexto)));
  Log('Gilhotina', AcionaGuilhotina(0));
  
  Log('Fecha porta', FechaPorta());

  Screen.Cursor := crDefault;
end;

procedure SelecionarImpresora(Nome: String); // seleciona uma impressora pelo nome 
var 
  Device, Driver, Port: array [0 .. 255] of char; 
  hDMode: THandle; 
  i: integer; 
  tmpnome: string; 
begin 
  Printer.PrinterIndex := -1; 
  if aPrinter = nil then 
    aPrinter := tprinter.Create; 
  for i := 0 to (Printer.printers.Count - 1) do 
  begin 
    tmpnome := Printer.printers[i]; 
    if tmpnome = Nome then 
    begin 
      aPrinter.PrinterIndex := i; 
      aPrinter.GetPrinter(Device, Driver, Port, hDMode); 
    end; 
  end; 
end; 

procedure TForm1.Button1Click(Sender: TObject);
var
  Porta:String;
  F: TextFile;
begin
  Porta := 'USB1';
  
  AssignFile(F, Porta);
  Rewrite(F);

  WriteLn(F, trim('TEXTO'));
  // WriteLn(F,'Vendedor '+FrmFimVenda.Label6.Caption);
  WriteLn(F, StringOfChar('-', 40));
  WriteLn(F, DateToStr(Date) + ' ' + TimeToStr(Time));
  WriteLn(F, 'Pedido nº' + ' ' + '1');
  WriteLn(F, '----------------------------------------');
  CloseFile(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  Arq : TextFile;
Begin

if PrintDialog1.Execute then begin
  AssignPrn(Arq);
  ReWrite(arq);
  Writeln(Arq, 'Este é um teste !!');
  CloseFile(Arq);
end;

end;


procedure ExibirImpressoras(list: tstrings); // exibe lista de imprassora do windows 
begin 
  list.Text := Printer.printers.Text; 
end; 



procedure IniciarImpresao(x, y: integer; impressora: string); // inicia a impresora 
begin 
  SelecionarImpresora(impressora); 
  Printer.BeginDoc; 
end; 

procedure ImprimirLinha(linha: string); // imprime uma unica linha 
begin 
  inc(y, Printer.Canvas.TextHeight('W')); 
  Printer.Canvas.TextOut(x, y, linha); 
end; 

procedure FinalizarImpresao; // finaliza a impressão 
begin 
  Printer.EndDoc; 
end; 

procedure TForm1.Button3Click(Sender: TObject);
begin
  IniciarImpresao(10, 10, 'TM-T20');
  ImprimirLinha('outros texto');
  ImprimirLinha(Chr(27)+Chr(109));
  ImprimirLinha('<b>outros texto</b>'); 
  ImprimirLinha('N.  ' + inttostr(3333) + ' ' + formatdatetime('DD/MM/YY', Date)); 
  ImprimirLinha('----------------------------------------');
  FinalizarImpresao;
end;


procedure TForm1.Button5Click(Sender: TObject);
begin
  Screen.Cursor := crSQLWait;
  MemoResposta.Lines.Add('Inicia porta: '+IntToStr(IniciaPorta('COM9')));
  MemoResposta.Lines.Add('Le status: '+IntToStr(Le_Status()));
  MemoResposta.Lines.Add('Fecha porta: '+IntToStr(FechaPorta()));
  Screen.Cursor := crDefault;
  //
end;

procedure TForm1.Button6Click(Sender: TObject);
var
  Arq : TextFile;
Begin
  SelecionarImpresora('TM-T20');
  AssignPrn(Arq);
  ReWrite(arq);
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, 'Este é um teste !!');
  CloseFile(Arq);
end;

procedure TForm1.Button7Click(Sender: TObject);
var
  Arq : TextFile;
  numero : String;
  codigoEnviar : String;
Begin
  numero := '9999999999999';
  codigoEnviar := CHR(29)+CHR(107)+CHR(50)+numero+chr(0);

  SelecionarImpresora('TM-T20');
  AssignPrn(Arq);
  ReWrite(arq);
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, Chr(27)+Chr(109));
  Writeln(Arq, codigoEnviar);
  Writeln(Arq, 'Este é um teste !!');
  Writeln(Arq, 'Este é um teste !!');  
  CloseFile(Arq);
end;

procedure TForm1.Button8Click(Sender: TObject);
var
Arquivo : TextFile;
  numero : String;
  codigoEnviar : String;
begin
  numero := '9999999999999';
  codigoEnviar := CHR(29)+CHR(75)+CHR(2)+numero+chr(0);

  AssignFile(Arquivo, 'LPT1');
  Rewrite(Arquivo);

  //Writeln(Arquivo,Chr(16)+Chr(4)+Chr(1));


  Writeln(Arquivo,'IMPRESSÃO MATRICIAL');
  Writeln(Arquivo,'');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 1');
  Writeln(Arquivo,'');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 1');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 2');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 3');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 4');
  Writeln(Arquivo,'IMPRESSÃO MATRICIAL - Linha 5');
  Writeln(Arquivo,'');
  Writeln(Arquivo,'');
  Writeln(Arquivo, Chr(27)+Chr(109));
  Writeln(Arquivo, codigoEnviar);
  Writeln(Arquivo,'');
  Writeln(Arquivo,'TESTE');
  Writeln(Arquivo,'');

  CloseFile(Arquivo);
end;

procedure TForm1.Log(acao: String; retorno: Integer);
begin
  MemoResposta.Lines.Add(TimeToStr(now)+' - '+acao+': '+IntToStr(retorno));
end;

end.

