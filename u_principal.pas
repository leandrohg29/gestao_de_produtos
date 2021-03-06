unit u_principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, u_dm, u_produtos, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Mask, ppCtrls, ppDB,
  ppDBPipe, ppPrnabl, ppClass, ppBands, ppCache, ppDesignLayer, ppParameter,
  ppComm, ppRelatv, ppProd, ppReport, Vcl.Imaging.pngimage, ppVar;

type
  Tfprincipal = class(TForm)
    bt_inserir: TBitBtn;
    bt_alterar: TBitBtn;
    bt_excluir: TBitBtn;
    bt_imprimir: TBitBtn;
    DBGrid1: TDBGrid;
    DbNav: TDBNavigator;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    bt_salvar: TBitBtn;
    Listagem_Rep: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    Listagem_Rep_DB: TppDBPipeline;
    ppLabel2: TppLabel;
    ppDBText1: TppDBText;
    ppLabel3: TppLabel;
    ppDBText2: TppDBText;
    ppLabel4: TppLabel;
    ppDBText3: TppDBText;
    ppLabel5: TppLabel;
    ppDBText4: TppDBText;
    ppLabel6: TppLabel;
    ppDBText5: TppDBText;
    ppLabel7: TppLabel;
    bt_cancelar: TBitBtn;
    bt_sair: TBitBtn;
    ppImage1: TppImage;
    ppSystemVariable1: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppLabel9: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    procedure bt_inserirClick(Sender: TObject);
    procedure bt_imprimirClick(Sender: TObject);
    procedure bt_salvarClick(Sender: TObject);
    procedure bt_excluirClick(Sender: TObject);
    procedure bt_alterarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bt_cancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure bt_sairClick(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fprincipal: Tfprincipal;

implementation

{$R *.dfm}

procedure Tfprincipal.bt_alterarClick(Sender: TObject);
var
   Produto : TProduto;
   codigo : integer;
begin

  Produto.AlterarProduto(codigo);
  Dbedit2.SetFocus;


  bt_inserir.Enabled := false;
  bt_alterar.Enabled := false;
  bt_salvar.Enabled := true;
  bt_excluir.Enabled := false;
  bt_cancelar.Enabled := true;
  bt_imprimir.Enabled := false;
  DbNav.Enabled := false;

end;

procedure Tfprincipal.bt_cancelarClick(Sender: TObject);
var
   Produto : TProduto;
   codigo : integer;
begin

  Produto.CancelarProduto(codigo);


  bt_inserir.Enabled := true;
  bt_alterar.Enabled := true;
  bt_salvar.Enabled := false;
  bt_excluir.Enabled := true;
  bt_cancelar.Enabled := false;
  bt_imprimir.Enabled := true;
  DbNav.Enabled := true;

end;

procedure Tfprincipal.bt_excluirClick(Sender: TObject);
var
   Produto : TProduto;
   codigo : integer;
begin

  Produto.ExcluirProduto(codigo);

  bt_inserir.Enabled := true;
  bt_alterar.Enabled := true;
  bt_salvar.Enabled := false;
  bt_excluir.Enabled := true;
  bt_cancelar.Enabled := false;
  bt_imprimir.Enabled := true;
  DbNav.Enabled := true;

end;

procedure Tfprincipal.bt_imprimirClick(Sender: TObject);
begin

  Listagem_Rep.Print;

end;

procedure Tfprincipal.bt_inserirClick(Sender: TObject);
var
   Produto : TProduto;
   codigo : integer;
begin

  Produto.InserirProduto(codigo);
  Dbedit2.SetFocus;

  bt_inserir.Enabled := false;
  bt_alterar.Enabled := false;
  bt_salvar.Enabled := true;
  bt_excluir.Enabled := false;
  bt_cancelar.Enabled := true;
  bt_imprimir.Enabled := false;
  DbNav.Enabled := false;

end;

procedure Tfprincipal.bt_sairClick(Sender: TObject);
begin

  fprincipal.Close;

end;

procedure Tfprincipal.bt_salvarClick(Sender: TObject);
var
   Produto : TProduto;
   codigo : integer;
begin

  Produto.SalvarProduto(codigo);


  bt_inserir.Enabled := true;
  bt_alterar.Enabled := true;
  bt_salvar.Enabled := false;
  bt_excluir.Enabled := true;
  bt_cancelar.Enabled := false;
  bt_imprimir.Enabled := true;
  DbNav.Enabled := true;

end;

procedure Tfprincipal.DBGrid1DblClick(Sender: TObject);
begin

  Showmessage('Por favor, fa?a a edi??o pelo formul?rio acima!');

end;

procedure Tfprincipal.FormActivate(Sender: TObject);
begin

  bt_inserir.Enabled := true;
  bt_alterar.Enabled := true;
  bt_salvar.Enabled := false;
  bt_excluir.Enabled := true;
  bt_cancelar.Enabled := false;
  bt_imprimir.Enabled := true;
  DbNav.Enabled := true;

end;

procedure Tfprincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin

  if ((DM.QRY_PRODUTOS.State = dsedit) or (DM.QRY_PRODUTOS.State = dsinsert)) then
    DM.QRY_PRODUTOS.Cancel;

end;

end.
