unit DelphiAIDev.Test;

interface

type
  TDelphiAIDevTest = class
  private
    FNome: string;
    FEndereco: string;
    FBairro: string;
    FNumero: Integer;
    FTelefone: string;
    FEmail: string;
    FDataNascimento: TDateTime;
    FApelido: string;
  public
    property Nome: string read FNome write FNome;
    property Endereco: string read FEndereco write FEndereco;
    property Bairro: string read FBairro write FBairro;
    property Numero: Integer read FNumero write FNumero;
    property Telefone: string read FTelefone write FTelefone;
    property Email: string read FEmail write FEmail;
    property DataNascimento: TDateTime read FDataNascimento write FDataNascimento;
    //Suggestion
    property Apelido: string read FApelido write FApelido;

    procedure Clear;
  end;

implementation

procedure TDelphiAIDevTest.Clear;
begin

end;

end.
