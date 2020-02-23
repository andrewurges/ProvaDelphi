unit uComponente;

interface

uses
  SysUtils;

type
  TComponente = class;

  TComponenteArray = array of TComponente;

  TComponente = class
  private
    FX: Integer;
    FY: Integer;
    FAltura: Integer;
    FLargura: Integer;
    FComponentes: TComponenteArray;

    FQuantidadeComponente: Integer;

    procedure SetAltura(Value: Integer);
    procedure SetLargura(Value: Integer);

    procedure RedimensionarComponentes(aDiferencaAltura: Integer; aDiferencaLargura: Integer);
    function RetornarIndicePorComponente(aComponente: TComponente): Integer;
  public
    procedure AdicionaComponente(aComponente: TComponente); virtual;
    procedure RemoveComponente(aComponente: TComponente); virtual;

    property Altura: Integer read FAltura write SetAltura;
    property Largura: Integer read FLargura write SetLargura;
  end;

implementation

uses
  uFrame, uBotao, uLabel, uMemo;

procedure TComponente.AdicionaComponente(aComponente: TComponente);
begin
  if not (Self is TFrame) then
  begin
    raise Exception.Create('Não é possível adicionar componentes em objetos que não são do tipo TFrame.');
  end;

  Inc(FQuantidadeComponente);
  SetLength(FComponentes, FQuantidadeComponente);
  FComponentes[FQuantidadeComponente - 1] := aComponente;
end;

procedure TComponente.RedimensionarComponentes(aDiferencaAltura: Integer; aDiferencaLargura: Integer);

  procedure Redimensionar(aComponente: TComponente);
  var
    I: Integer;
  begin
    for I := Low(aComponente.FComponentes) to High(aComponente.FComponentes) do
    begin
      if aComponente.FComponentes[I] is TBotao then
      begin
        aComponente.FComponentes[I].Largura := aComponente.FComponentes[I].Largura + aDiferencaLargura;
      end
      else
      if aComponente.FComponentes[I] is TMemo then
      begin
        aComponente.FComponentes[I].Largura := aComponente.FComponentes[I].Largura + aDiferencaLargura;
        aComponente.FComponentes[I].Altura := aComponente.FComponentes[I].Altura + aDiferencaAltura;
      end
      else
      if aComponente.FComponentes[I] is TLabel then
      begin

      end
      else
      if aComponente.FComponentes[I] is TFrame then
      begin
        aComponente.FComponentes[I].Largura := aComponente.FComponentes[I].Largura + aDiferencaLargura;
        aComponente.FComponentes[I].Altura := aComponente.FComponentes[I].Altura + aDiferencaAltura;

        Redimensionar(aComponente.FComponentes[I]);
      end;
    end;
  end;

begin
  Redimensionar(Self);
end;

procedure TComponente.RemoveComponente(aComponente: TComponente);
var
  vIndice: Integer;
begin
  vIndice := RetornarIndicePorComponente(aComponente);

  if vIndice = High(FComponentes) then
  begin
    SetLength(FComponentes, Length(FComponentes) - 1);
    Exit;
  end;

  Finalize(FComponentes[vIndice]);
  Move(FComponentes[vIndice + 1], FComponentes[vIndice], (Length(FComponentes) - vIndice - 1) * SizeOf(TComponente) + 1);
  SetLength(FComponentes, Length(FComponentes) - 1);
end;
  
function TComponente.RetornarIndicePorComponente(aComponente: TComponente): Integer;
var
  I: Integer;
begin
  Result := -1;

  for I := Low(FComponentes) to High(FComponentes) do
  begin
    if FComponentes[I] = aComponente then
    begin
      Result := I;
      Break;
    end;
  end;
end;

procedure TComponente.SetAltura(Value: Integer);
var
  vDiferenca: Integer;
begin
  if Value <> Altura then
  begin
    vDiferenca := FAltura - Value;

    FAltura := Value;

    if Self is TFrame then
    begin
      RedimensionarComponentes(vDiferenca, 0);
    end;
  end;
end;

procedure TComponente.SetLargura(Value: Integer);
var
  vDiferenca: Integer;
begin
  if Value <> Largura then
  begin
    vDiferenca := FLargura - Value;

    FLargura := Value;

    if Self is TFrame then
    begin
      RedimensionarComponentes(0, vDiferenca);
    end;
  end;
end;

end.

