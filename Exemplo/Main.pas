unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Mskedit,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TMainForm = class(TForm)
    lblStatus: TLabel;
    DTMaskedit1: TDTMaskedit;
    DTMaskedit2: TDTMaskedit;
    Label1: TLabel;
    Label2: TLabel;
    procedure DTMaskedit1Validate(Sender: TObject; AValid: Boolean;
      AMessage: string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.dfm}


procedure TMainForm.DTMaskedit1Validate(Sender: TObject; AValid: Boolean;
  AMessage: string);
begin
    lblStatus.Caption := AMessage;
end;

end.
