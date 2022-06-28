unit u_produtos;

interface

uses
  Windows, SysUtils, Classes, Controls, Forms, ComCtrls, dialogs, u_dm;

 type

 TProduto = class

 private
  FNome: string;
  FMarca: string;
  FQuantidade: integer;
  FValor : string;

 public
    constructor Create();
    destructor Destroy; override;

    function InserirProduto(id: integer)   : Boolean;
    function SalvarProduto(id: integer)   : Boolean;
    function AlterarProduto(id: integer)   : Boolean;
    function ExcluirProduto(id: integer)   : Boolean;
    function CancelarProduto(id: integer)  : Boolean;

 end;


implementation

constructor TProduto.Create();
begin

end;

destructor Tproduto.Destroy;
begin
 inherited;
end;

function TProduto.AlterarProduto(id: integer): Boolean;
begin

  DM.QRY_PRODUTOS.Edit;


  try
    Result := True;
  except
    Result := False;
  end;
end;



function TProduto.ExcluirProduto(id: integer): Boolean;
begin
  DM.QRY_PRODUTOS.Delete;
  try
    Result := True;
  except
    Result := False;
  end;
end;


function TProduto.InserirProduto(id: integer)   : Boolean;
var
   codigo_novo : integer;
begin
  DM.QRY_PRODUTOS.Last;
  codigo_novo := DM.QRY_PRODUTOSID.Value + 1;
  DM.QRY_PRODUTOS.Append;

  try
    DM.QRY_PRODUTOSID.Text := inttostr(codigo_novo);
    Result := True;
  except
    Result := False;
  end;
end;

function TProduto.SalvarProduto(id: integer)   : Boolean;

begin
  DM.QRY_PRODUTOS.Post;

  try
    Result := True;
  except
    Result := False;
  end;
end;

function TProduto.CancelarProduto(id: integer)   : Boolean;

begin
  DM.QRY_PRODUTOS.Cancel;

  try
    Result := True;
  except
    Result := False;
  end;
end;


end.

