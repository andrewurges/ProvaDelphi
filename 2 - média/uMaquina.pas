unit uMaquina;

interface

uses
  uIMaquina, Classes, uTroco, Math;

type

  TMaquina = class(TInterfacedObject, IMaquina)
  public
    function MontarTroco(aTroco: Double): TList;
  end;

implementation

function TMaquina.MontarTroco(aTroco: Double): TList;

  procedure AdicionarTroco(pTipo: TCedula);
  var
    vTroco: TTroco;
    I: Integer;
  begin
    vTroco := nil;

    for I := 0 to Result.Count - 1 do
    begin
      if (TTroco(Result.Items[I]).Tipo = pTipo) then
      begin
        vTroco := TTroco(Result.Items[I]);
        Break;
      end;
    end;

    if vTroco = nil then
    begin
      vTroco := TTroco.Create(pTipo, 1);
      Result.Add(vTroco);
    end
    else
    begin
      vTroco.Quantidade := vTroco.Quantidade + 1;
    end;
  end;

var
  I: TCedula;
  vValor, vResto: Double;
  vTroco: TTroco;
begin
  Result := TList.Create;

  vResto := aTroco;
  while (vResto > 0) do
  begin
    for I := Low(TCedula) to High(TCedula) do
    begin
      vValor := CValorCedula[I];
      if (vResto - vValor) >= 0 then
      begin
        vResto := RoundTo(vResto - vValor, - 2);
        AdicionarTroco(I);
        Break;
      end;
    end;
  end;
end;

end.

