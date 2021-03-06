unit Mskedit.Helpers;

interface
  uses
    System.SysUtils,
    System.Classes;

const
  REGEX_MAIL            = '([a-z][a-z0-9\-\_]+\.?[a-z0-9\-\_]+)@((?![0-9]+\.)([a-z][a-z0-9\-]{0,24}[a-z0-9])\.)[a-z]{3}(\.[a-z]{2,3})?';
  REGEX_URL             = '(https?:\/\/)?((www|w3)\.)?([-a-zA-Z0-9@:%._\+~#=]{1,256}\.[a-zA-Z0-9()]{1,6}\b([-a-zA-Z0-9()@:%_\+.~#?&\/=]*))';
  REGEX_PHONE           = '^[1-9]{2}(?:[6-9]|9[1-9])[0-9]{3}[0-9]{4}$';

  MASK_Phone            = '!\(999\)9999-9999;0;_';
  MASK_CPF              = '999.999.999-99;0';
  MASK_CNPJ             = '99.999.999/9999-99;0';
  MASK_CEP              = '99.999-999;0';
  MASK_KEY_NUMBERS      = '9';

  MSG_VALID             = 'V?lido';
  MSG_INVALID           = 'Inv?lido';

  COLOR_VALID           = $00D9FFD9;
  COLOR_INVALID         = $00C4C4FF;

  VALIDATION_SIZE_EMAIL = 5;
  VALIDATION_SIZE_URL   = 8;
  NUMBERS               = ['0'..'9'];
  VERSION_NUMBER        = '1.0.3';

  function CPFValid(AValue: string): Boolean;
  function CNPJValid(AValue: string): Boolean;
  function CEPValid(AValue: string): Boolean;

implementation

function CPFValid(AValue: string): Boolean;
var
  FPos1, FPos2, FPos3,
  FPos4, FPos5, FPos6,
  FPos7, FPos8, FPos9 : integer;

  FDig1,
  FDig2 : integer;

  FValue,
  FCalculated : string;

  FEqual : Boolean;
begin
  try
    if Trim(AValue) = EmptyStr then
      Exit(False);

    FPos1 := StrToInt(AValue[1]);
    FPos2 := StrToInt(AValue[2]);
    FPos3 := StrToInt(AValue[3]);
    FPos4 := StrToInt(AValue[4]);
    FPos5 := StrToInt(AValue[5]);
    FPos6 := StrToInt(AValue[6]);
    FPos7 := StrToInt(AValue[7]);
    FPos8 := StrToInt(AValue[8]);
    FPos9 := StrToInt(AValue[9]);

    FDig1 :=
        FPos9*2
      + FPos8*3
      + FPos7*4
      + FPos6*5
      + FPos5*6
      + FPos4*7
      + FPos3*8
      + FPos2*9
      + FPos1*10;

    FDig1 := 11-(FDig1 mod 11);

    if FDig1 >= 10 then
      FDig1 := 0;

    FDig2   :=
        FDig1*2
      + FPos9*3
      + FPos8*4
      + FPos7*5
      + FPos6*6
      + FPos5*7
      + FPos4*8
      + FPos3*9
      + FPos2*10
      + FPos1*11;

    FDig2 := 11-(FDig2 mod 11);

    if FDig2 >= 10 then
      FDig2 := 0;

    FCalculated := IntToStr(FDig1) + IntToStr(FDig2);
    FValue      := AValue[10] + AValue[11];

    FEqual :=
        (FPos1 = FPos2)
    and (FPos2 = FPos3)
    and (FPos3 = FPos4)
    and (FPos4 = FPos5)
    and (FPos5 = FPos6)
    and (FPos6 = FPos7)
    and (FPos7 = FPos8)
    and (FPos8 = FPos9);

    Result := (FCalculated = FValue) and (not FEqual);

  except
    Result := False;
  end;
end;

function CNPJValid(AValue: string): Boolean;
var
  FPos1, FPos2, FPos3,
  FPos4, FPos5, FPos6,
  FPos7, FPos8, FPos9,
  FPos10,FPos11,FPos12 : Integer;

  FDig,
  FDig2 : Integer;

  FValue,
  FCalculated : string;
  FEqual : Boolean;
begin
  try
    if Trim(AValue) = EmptyStr then
       Exit(False);

    FPos1  := StrToInt(AValue[1]);
    FPos2  := StrToInt(AValue[2]);
    FPos3  := StrToInt(AValue[3]);
    FPos4  := StrToInt(AValue[4]);
    FPos5  := StrToInt(AValue[5]);
    FPos6  := StrToInt(AValue[6]);
    FPos7  := StrToInt(AValue[7]);
    FPos8  := StrToInt(AValue[8]);
    FPos9  := StrToInt(AValue[9]);
    FPos10 := StrToInt(AValue[10]);
    FPos11 := StrToInt(AValue[11]);
    FPos12 := StrToInt(AValue[12]);

    FDig  :=
        FPos12*2
      + FPos11*3
      + FPos10*4
      + FPos9*5
      + FPos8*6
      + FPos7*7
      + FPos6*8
      + FPos5*9
      + FPos4*2
      + FPos3*3
      + FPos2*4
      + FPos1*5;

    FDig := 11 - (FDig mod 11);

    if FDig >= 10 then
      FDig := 0;

    FDig2 :=
        FDig*2
      + FPos12*3
      + FPos11*4
      + FPos10*5
      + FPos9*6
      + FPos8*7
      + FPos7*8
      + FPos6*9
      + FPos5*2
      + FPos4*3
      + FPos3*4
      + FPos2*5
      + FPos1*6;

    FDig2 := 11-(FDig2 mod 11);
    if FDig2 >= 10 then
      FDig2 := 0;

    FCalculated := IntToStr(FDig) + IntToStr(FDig2);
    FValue      := AValue[13] + AValue[14];

    FEqual :=
        (FPos1  = FPos2)
    and (FPos2  = FPos3)
    and (FPos3  = FPos4)
    and (FPos4  = FPos5)
    and (FPos5  = FPos6)
    and (FPos6  = FPos7)
    and (FPos7  = FPos8)
    and (FPos8  = FPos9)
    and (FPos9  = FPos10)
    and (FPos10 = FPos11)
    and (FPos11 = FPos12);

    Result := (FCalculated = FValue) and (not FEqual);
  except
    Result := false;
  end;
end;

function CEPValid(AValue: string): Boolean;
begin
  if AValue = EmptyStr then
    Exit(False);

  Result := (StrToInt(AValue) >= 1001000) and (StrToInt(AValue) <= 99999999);
end;

end.

