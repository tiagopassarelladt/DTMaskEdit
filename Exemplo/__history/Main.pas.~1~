unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, MultEdit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  HtecClasses, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, HtecDataset,
  cxClasses, cxLocalization;

type
  TMainForm = class(TForm)
    lblStatus: TLabel;
    MultEdit1: TMultEdit;
    MultEdit2: TMultEdit;
    procedure MultEdit1Validate(Sender: TObject; AValid: Boolean; AMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.MultEdit1Validate(Sender: TObject; AValid: Boolean;  AMessage: string);
begin
  lblStatus.Caption := AMessage;
end;


end.
