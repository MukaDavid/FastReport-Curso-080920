unit FastReport.Preview;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls, frxClass, frxPreview;

type
  TfrmPreview = class(TForm)
    Panel1: TPanel;
    Button1: TButton;
    StatusBar1: TStatusBar;
    frxPreview1: TfrxPreview;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure frxPreview1PageChanged(Sender: TfrxPreview; PageNo: Integer);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreview: TfrmPreview;

implementation

{$R *.dfm}

procedure TfrmPreview.Button1Click(Sender: TObject);
begin
  frxPreview1.Next;
end;

procedure TfrmPreview.Button2Click(Sender: TObject);
begin
  frxPreview1.Print;
end;

procedure TfrmPreview.frxPreview1PageChanged(Sender: TfrxPreview; PageNo: Integer);
begin
  StatusBar1.Panels[0].Text := frxPreview1.PageNo.ToString;
end;

end.
