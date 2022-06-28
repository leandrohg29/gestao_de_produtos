program areco_produtos;

uses
  Vcl.Forms,
  u_principal in 'u_principal.pas' {fprincipal},
  u_dm in 'u_dm.pas' {DM: TDataModule},
  u_produtos in 'Classes\u_produtos.pas',
  u_inicial in 'u_inicial.pas' {finicial};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tfinicial, finicial);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.
