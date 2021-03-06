unit MskEditProperty;

interface
  uses
    DesignIntf,
    DesignEditors,
    System.Classes,
    System.SysUtils,
    VCL.Dialogs,
    System.TypInfo,
    Mskedit;

type
  TMaskEditPropertyEditor = class(TComponentEditor)
  private
    function Instance: TDTMaskedit;
  public
    function GetVerbCount: Integer; override;
    function GetVerb(Index: Integer): String; override;
    procedure ExecuteVerb(Index: Integer); override;
    procedure Edit; override;
    procedure SetDefault;
    procedure TestValidation;
    procedure TestValidationInput;
  end;

procedure Register;

implementation

procedure register;
begin
  RegisterComponentEditor(TDTMaskedit, TMaskEditPropertyEditor);
end;

procedure TMaskEditPropertyEditor.Edit;
begin
  ExecuteVerb(0);
end;

procedure TMaskEditPropertyEditor.ExecuteVerb(Index: Integer);
begin
  case Index of
    0: MessageDlg('Component Mask Editor ' + Instance.Version, mtInformation, [mbOk], 0);
    1: SetDefault;
    2: TestValidation;
    3: TestValidationInput;
  end;
  Designer.Modified;

  inherited;
end;

function TMaskEditPropertyEditor.GetVerb(Index: Integer): String;
begin
  case Index of
    0: Result := 'About MaskEditor...';
    1: Result := 'Reset Default Properties';
    2: Result := 'Test Validation';
    3: Result := 'Test Validation Input';
  end;
end;

function TMaskEditPropertyEditor.GetVerbCount: Integer;
begin
  Result := 4;
end;

function TMaskEditPropertyEditor.Instance: TDTMaskedit;
begin
  Result := (Component as TDTMaskedit);
end;

procedure TMaskEditPropertyEditor.SetDefault;
begin
  if MessageDlg('Reset Default Properties?', mtConfirmation, [mbYes, mbNo], 0) = 6 then
    Instance.ResetDefaults;
end;

procedure TMaskEditPropertyEditor.TestValidation;
begin
  Instance.Test;
end;

procedure TMaskEditPropertyEditor.TestValidationInput;
begin
  Instance.TestInput;
end;

end.
