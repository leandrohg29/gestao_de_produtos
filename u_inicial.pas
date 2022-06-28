unit u_inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  Tfinicial = class(TForm)
    Label1: TLabel;
    Image1: TImage;
    Label3: TLabel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  finicial: Tfinicial;

implementation

{$R *.dfm}

uses u_principal;

procedure Tfinicial.BitBtn1Click(Sender: TObject);
begin

try
  fprincipal := Tfprincipal.Create(self);
  fprincipal.ShowModal;
  finally
    FreeAndNil(fprincipal);
  end;

end;

procedure Tfinicial.BitBtn2Click(Sender: TObject);
begin

halt;

end;

end.
