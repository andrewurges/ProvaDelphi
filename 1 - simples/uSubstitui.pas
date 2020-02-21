unit uSubstitui;

interface

uses
  uISubstitui, SysUtils;

type

  TSubstitui = class(TInterfacedObject, ISubstitui)
  public
    function Substituir(aStr, aVelho, aNovo: String): String;
  end;

implementation

function TSubstitui.Substituir(aStr, aVelho, aNovo: String): String;
var
  I, Y, vControle: Integer;
  vResultado, vAux: String;
begin
  vResultado := '';
  vControle := -1;
  
  for I := 0 to Length(aStr) - 1 do
  begin
    if I > vControle then
    begin
      vAux := '';

      for Y := I to (I + Length(aVelho)) - 1 do
      begin
        vAux := vAux + aStr[Y];
      end;

      if (vAux = aVelho) then
      begin
        vControle := (I + Length(aVelho)) - 1;
        vResultado := vResultado + aNovo;
      end
      else
      begin
        vResultado := vResultado + aStr[I];
      end;
    end;
  end;

  Result := Trim(vResultado);
end;
  
end.

