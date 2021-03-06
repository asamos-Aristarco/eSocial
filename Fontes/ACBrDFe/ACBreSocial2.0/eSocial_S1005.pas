{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       Andr� Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Voc� pode obter a �ltima vers�o desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca � software livre; voc� pode redistribu�-la e/ou modific�-la }
{ sob os termos da Licen�a P�blica Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a vers�o 2.1 da Licen�a, ou (a seu crit�rio) }
{ qualquer vers�o posterior.                                                   }
{                                                                              }
{  Esta biblioteca � distribu�da na expectativa de que seja �til, por�m, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia impl�cita de COMERCIABILIDADE OU      }
{ ADEQUA��O A UMA FINALIDADE ESPEC�FICA. Consulte a Licen�a P�blica Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICEN�A.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Voc� deve ter recebido uma c�pia da Licen�a P�blica Geral Menor do GNU junto}
{ com esta biblioteca; se n�o, escreva para a Free Software Foundation, Inc.,  }
{ no endere�o 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Voc� tamb�m pode obter uma copia da licen�a em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Sim�es de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Pra�a Anita Costa, 34 - Tatu� - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doa��o do componente para o Projeto ACBr
|* 01/03/2016: Guilherme Costa
|*  - Passado o namespace para gera��o no cabe�alho
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S1005;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador, Controls;

type
  TS1005Collection = class;
  TS1005CollectionItem = class;
  TEvtTabEstab = class;

  {Classes espec�ficas deste evento}
  TInfoPCD = class;
  TInfoEntEducCollection = class;
  TInfoEntEducCollectionItem = class;
  TInfoApr = class;
  TInfoTrab = class;
  TInfoObra = class;
  TinfoCaepf = class; //introduzido no layout2.1
  TDadosEstab = class;
  TIdeEstab = class;
  TInfoEstab = class;

  TS1005Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS1005CollectionItem;
    procedure SetItem(Index: Integer; Value: TS1005CollectionItem);
  public
    function Add: TS1005CollectionItem;
    property Items[Index: Integer]: TS1005CollectionItem read GetItem write SetItem; default;
  end;

  TS1005CollectionItem = class(TCollectionItem)
  private
    FIniciais : TComponent;
    FTipoEvento: TTipoEvento;
    FevtTabEstab: TevtTabEstab;
  public
    constructor Create(AOwner: TComponent); reintroduce;
    destructor Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property evtTabEstab: TevtTabEstab read FevtTabEstab write FevtTabEstab;
  end;

  TInfoEntEducCollection = class(TCollection)
  private
    function GetItem(Index: Integer): TInfoEntEducCollectionItem;
    procedure SetItem(Index: Integer; Value: TInfoEntEducCollectionItem);
  public
    constructor Create(AOwner: TPersistent);
    function Add: TInfoEntEducCollectionItem;
    property Items[Index: Integer]: TInfoEntEducCollectionItem read GetItem write SetItem; default;
  end;

  TInfoEntEducCollectionItem = class(TCollectionItem)
  private
    FNrInsc: string;
  published
    constructor Create; reintroduce;
    property nrInsc: string read FNrInsc write FNrInsc;
  end;

  TInfoApr = class(TPersistent)
    private
      FContApr: tpContApr;
      FNrProcJud: string;
      FContEntEd: tpSimNao;
      FInfoEntEduc: TInfoEntEducCollection;
  public
    constructor Create;
    destructor Destroy; override;
    property contApr: tpContApr read FContApr write FContApr;
    property nrProcJud: String read FNrProcJud write FNrProcJud;
    property contEntEd: tpSimNao read FContEntEd write FContEntEd;
    property infoEntEduc: TInfoEntEducCollection read FInfoEntEduc write FInfoEntEduc;
  end;

  TInfoPCD = class(TPersistent)
  private
    FContPCD: tpContPCD;
    FNrProcJud: string;
  public
    property contPCD: tpContPCD read FContPCD write FContPCD;
    property nrProcJud: string read FNrProcJud write FNrProcJud;
  end;

  TInfoTrab = class(TPersistent)
    private
      FRegPt: tpRegPt;
      FInfoApr: TInfoApr;
      FInfoPCD: TInfoPCD;
      function getInfoPCD: TInfoPCD;
  public
    constructor Create;
    destructor Destroy; override;
    function infoPCDInst(): Boolean;
    property regPt: tpRegPt read FRegPt write FRegPt;
    property infoApr: TInfoApr read FInfoApr write FInfoApr;
    property infoPCD: TInfoPCD read getInfoPCD write FInfoPCD;
  end;

  TInfoObra = class(TPersistent)
   private
    FIndSubstPatrObra: tpIndSubstPatronalObra;
  public
    property indSubstPatrObra: tpIndSubstPatronalObra read FIndSubstPatrObra write FIndSubstPatrObra;
  end;

  TinfoCaepf = class(TPersistent)
     private
      FtpCaepf : tpCaepf;
    public
      property tpCaepf : tpCaepf read FtpCaepf write FtpCaepf;
  end;
  
  TDadosEstab = class(TPersistent)
   private
    FCnaePrep: string;
    FAliqGilrat: TAliqGilRat;
    FinfoCaepf : TinfoCaepf;
    FInfoObra: TInfoObra;
    FInfoTrab: TInfoTrab;
    function getInfoObra: TInfoObra;
    function getinfoCaepf : TInfoCaepf;
  public
    constructor create;
    destructor destroy; override;
    function infoObraInst(): Boolean;
    function infoCaepfInst(): Boolean;
    
    property cnaePrep: string read FCnaePrep write FCnaePrep;
    property aliqGilrat: TAliqGilRat read FAliqGilrat write FAliqGilrat;
    property infoObra: TInfoObra read getInfoObra write FInfoObra;
    property infoCaepf : TinfoCaepf read getinfoCaepf write FinfoCaepf;
    property infoTrab: TInfoTrab read FInfoTrab write FInfoTrab;
  end;

  TIdeEstab = class(TPersistent)
   private
    FTpInsc: integer;
    FNrInsc: string;
    FIniValid: string;
    FFimValid: string;
  public
    property tpInsc: integer read FTpInsc write FTpInsc;
    property nrInsc: string read FNrInsc write FNrInsc;
    property iniValid: string read FIniValid write FIniValid;
    property fimValid: string read FFimValid write FFimValid;
  end;

  TInfoEstab = class(TPersistent)
   private
    FIdeEstab: TIdeEstab;
    FDadosEstab: TDadosEstab;
    FNovaValidade: TidePeriodo;
    function getDadosEstab: TDadosEstab;
    function getNovaValidade: TidePeriodo;
  public
    constructor Create;
    destructor Destroy; override;
    function dadosEstabInst(): boolean;
    function NovaValidadeInst(): boolean;

    property IdeEstab: TIdeEstab read FIdeEstab write FIdeEstab;
    property DadosEstab: TDadosEstab read getDadosEstab write FDadosEstab;
    property NovaValidade: TidePeriodo read getNovaValidade write FNovaValidade;
  end;

  TEvtTabEstab = class(TeSocialEvento)
  private
    FIniciais : TComponent;
    FXMLAssinado: String;
    FModoLancamento: TModoLancamento;
    FIdeEvento: TIdeEvento;
    FIdeEmpregador: TIdeEmpregador;
    FInfoEstab: TInfoEstab;

    {. Geradores especificos desta classe .}
    procedure GerarInfoEntEduc();
    procedure GerarInfoApr();
    procedure GerarInfoPCD();
    procedure GerarInfoTrab();
    procedure GerarIdeEstab();
    procedure GerarInfoObra();
    procedure GerarInfoCaepf();
    procedure GerarDadosEstab();
  public
    constructor Create(AACBreSocial: TObject); overload;
    destructor Destroy; override;

    function GerarXML: boolean; override;

    property ModoLancamento: TModoLancamento read FModoLancamento write FModoLancamento;
    property ideEvento: TIdeEvento read FIdeEvento write FIdeEvento;
    property ideEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
    property infoEstab: TInfoEstab read FInfoEstab write FInfoEstab;
  end;

implementation

uses
  eSocial_Iniciais;

{ TDadosEstab }

constructor TDadosEstab.create;
begin
  FAliqGilrat := TAliqGilRat.Create;
  FInfoTrab := TInfoTrab.Create;
  FInfoObra := nil;
  FinfoCaepf := nil;
end;

destructor TDadosEstab.destroy;
begin
  FAliqGilrat.Free;
  FInfoTrab.Free;
  FreeAndNil(FInfoObra);
  FreeAndNil(FinfoCaepf);
  inherited;
end;

function TDadosEstab.getinfoCaepf: TInfoCaepf;
begin
  if Not(Assigned(FinfoCaepf)) then
    FInfoCaepf := TinfoCaepf.Create;
  Result := FinfoCaepf;
end;

function TDadosEstab.getInfoObra: TInfoObra;
begin
  if Not(Assigned(FInfoObra)) then
    FInfoObra := TInfoObra.Create;
  Result := FInfoObra;
end;

function TDadosEstab.infoCaepfInst: Boolean;
begin
  Result := Assigned(FinfoCaepf);
end;

function TDadosEstab.infoObraInst: Boolean;
begin
  Result := Assigned(FInfoObra);
end;

{ TInfoApr }

constructor TInfoApr.Create;
begin
  inherited;
  FInfoEntEduc := TInfoEntEducCollection.Create(Self);
end;

destructor TInfoApr.Destroy;
begin
  FInfoEntEduc.Free;
  inherited;
end;

{ TInfoTrab }

constructor TInfoTrab.Create;
begin
  inherited;
  FInfoApr := TInfoApr.Create;
  FInfoPCD := nil;
end;

destructor TInfoTrab.Destroy;
begin
  FInfoApr.Free;
  FreeAndNil(FInfoPCD);
  inherited;
end;

function TInfoTrab.getInfoPCD: TInfoPCD;
begin
  if not(Assigned(FInfoPCD)) then
    FInfoPCD := TInfoPCD.Create;
  result := FInfoPCD;
end;

function TInfoTrab.infoPCDInst: boolean;
begin
  result := Assigned(FInfoPCD);
end;

{ TInfoEstab }

constructor TInfoEstab.Create;
begin
  FIdeEstab := TIdeEstab.Create;
  FDadosEstab := nil;
  FNovaValidade := nil;
end;

function TInfoEstab.dadosEstabInst: boolean;
begin
  result := Assigned(FDadosEstab);
end;

destructor TInfoEstab.Destroy;
begin
  FIdeEstab.Free;
  FreeAndNil(FDadosEstab);
  FNovaValidade.Free;
  inherited;
end;

function TInfoEstab.getDadosEstab: TDadosEstab;
begin
  if Not(Assigned(FDadosEstab)) then
    FDadosEstab := TDadosEstab.create;
  Result := FDadosEstab;
end;

function TInfoEstab.getNovaValidade: TidePeriodo;
begin
  if Not(Assigned(FNovaValidade)) then
    FNovaValidade := TIdePeriodo.Create;
  Result := FNovaValidade;
end;

function TInfoEstab.NovaValidadeInst: boolean;
begin
  result := Assigned(FNovaValidade);
end;

{ TEvtTabEstab }

constructor TEvtTabEstab.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FInfoEstab := TInfoEstab.Create;
end;

destructor TEvtTabEstab.Destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FInfoEstab.Free;
  inherited;
end;

procedure TEvtTabEstab.GerarDadosEstab;
begin
  Gerador.wGrupo('dadosEstab');
    Gerador.wCampo(tcStr, '', 'cnaePrep', 0, 0, 0, infoEstab.DadosEstab.cnaePrep);
    GerarAliqGilRat(infoEstab.DadosEstab.aliqGilrat, 'aliqGilrat');
    GerarInfoCaepf();
    GerarInfoObra();
    GerarInfoTrab();
  Gerador.wGrupo('/dadosEstab');
end;

procedure TEvtTabEstab.GerarIdeEstab;
begin
  Gerador.wGrupo('ideEstab');
    Gerador.wCampo(tcInt, '', 'tpInsc', 0, 0, 0, Self.infoEstab.ideEstab.tpInsc);
    Gerador.wCampo(tcStr, '', 'nrInsc', 0, 0, 0, Self.infoEstab.ideEstab.nrInsc);
    Gerador.wCampo(tcStr, '', 'iniValid', 0, 0, 0, Self.infoEstab.IdeEstab.iniValid);
    Gerador.wCampo(tcStr, '', 'fimValid', 0, 0, 0, Self.infoEstab.IdeEstab.fimValid);
  Gerador.wGrupo('/ideEstab');
end;

procedure TEvtTabEstab.GerarInfoCaepf;
begin
  if infoEstab.DadosEstab.infoCaepfInst() then
  begin
    Gerador.wGrupo('infoCaepf');
      Gerador.wCampo(tcStr, '', 'tpCaepf', 0, 0, 0, eStpCaepfToStr(infoEstab.DadosEstab.infoCaepf.tpCaepf));
    Gerador.wGrupo('/infoCaepf');
  end;
end;

procedure TEvtTabEstab.GerarInfoObra;
begin
  if infoEstab.DadosEstab.infoObraInst() then
  begin
    Gerador.wGrupo('infoObra');
      Gerador.wCampo(tcStr, '', 'indSubstPatrObra', 0, 0, 0, eSIndSubstPatronalObraToStr(infoEstab.DadosEstab.InfoObra.indSubstPatrObra));
    Gerador.wGrupo('/infoObra');
  end;
end;

procedure TEvtTabEstab.GerarInfoTrab;
begin
  Gerador.wGrupo('infoTrab');
    Gerador.wCampo(tcInt, '', 'regPt', 1, 1, 1, eStpRegPtToStr(infoEstab.DadosEstab.infoTrab.regPt));
    GerarInfoApr();
    GerarInfoPCD();
  Gerador.wGrupo('/infoTrab');
end;

procedure TEvtTabEstab.GerarInfoPCD;
begin
  if infoEstab.DadosEstab.infoTrab.infoPCDInst() then
  begin
    Gerador.wGrupo('infoPCD');
      Gerador.wCampo(tcInt, '','contPCD', 1, 1, 1, eSTpContPCDToStr(infoEstab.DadosEstab.infoTrab.infoPCD.contPCD));
      Gerador.wCampo(tcStr, '', 'nrProcJud', 0, 1, 1, infoEstab.DadosEstab.infoTrab.infoPCD.nrProcJud);
    Gerador.wGrupo('/infoPCD');
  end;
end;

procedure TEvtTabEstab.GerarInfoApr;
begin
  Gerador.wGrupo('infoApr');
    Gerador.wCampo(tcInt, '', 'contApr', 1, 1, 1, eStpContAprToStr(infoEstab.DadosEstab.infoTrab.infoApr.contApr));
    Gerador.wCampo(tcStr, '', 'nrProcJud', 0, 1, 0, infoEstab.DadosEstab.infoTrab.infoApr.nrProcJud);
    Gerador.wCampo(tcStr, '', 'contEntEd', 0, 1, 0, eSSimNaoToStr(infoEstab.DadosEstab.infoTrab.infoApr.contEntEd));
    GerarInfoEntEduc();
  Gerador.wGrupo('/infoApr');
end;

procedure TEvtTabEstab.GerarInfoEntEduc;
var i: Integer;
begin
  if ASSIGNED(infoEstab.DadosEstab.infoTrab.infoApr.FInfoEntEduc) then
    for i := 0 to infoEstab.DadosEstab.infoTrab.infoApr.FInfoEntEduc.Count - 1 do
    begin
      Gerador.wGrupo('infoEntEduc');
        Gerador.wCampo(tcStr, '', 'nrInsc', 0, 0, 0, infoEstab.DadosEstab.infoTrab.infoApr.FInfoEntEduc[i].nrInsc);
      Gerador.wGrupo('/infoEntEduc');
    end;
end;

function TEvtTabEstab.GerarXML: boolean;
begin
  try
    GerarCabecalho('evtTabEstab');
      Gerador.wGrupo('evtTabEstab Id="'+ GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0) +'"');
      GerarIdeEvento(Self.FIdeEvento, True);
      GerarIdeEmpregador(Self.FIdeEmpregador);
      Gerador.wGrupo('infoEstab');
        GerarModoAbertura(Self.ModoLancamento);
          GerarIdeEstab();
          if (FModoLancamento <> mlExclusao) then
          begin
            GerarDadosEstab();
            if Self.ModoLancamento = mlAlteracao then
              if (infoEstab.NovaValidadeInst()) then
                GerarIdePeriodo(infoEstab.NovaValidade, 'novaValidade');
          end;     
        GerarModoFechamento(Self.ModoLancamento);
      Gerador.wGrupo('/infoEstab');
      Gerador.wGrupo('/evtTabEstab');
    GerarRodape();
    
    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtTabEstab');//Gerador.ArquivoFormatoXML;
    Validar('evtTabEstab');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;   
  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TS1005CollectionItem }

constructor TS1005CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento := teS1005;
  FevtTabEstab := TevtTabEstab.Create(AOwner);
end;

destructor TS1005CollectionItem.Destroy;
begin
  FevtTabEstab.Free;
  inherited;
end;

{ TS1005Collection }

function TS1005Collection.Add: TS1005CollectionItem;
begin
  Result := TS1005CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS1005Collection.GetItem(Index: Integer): TS1005CollectionItem;
begin
  Result := TS1005CollectionItem(inherited GetItem(Index));
end;

procedure TS1005Collection.SetItem(Index: Integer; Value: TS1005CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoEntEducCollection }
function TInfoEntEducCollection.Add: TInfoEntEducCollectionItem;
begin
  Result := TInfoEntEducCollectionItem(inherited Add);
  Result.Create;
end;

constructor TInfoEntEducCollection.Create(AOwner: TPersistent);
begin
  inherited Create(TInfoEntEducCollectionItem);
end;

function TInfoEntEducCollection.GetItem(
  Index: Integer): TInfoEntEducCollectionItem;
begin
  Result := TInfoEntEducCollectionItem(inherited GetItem(Index));
end;

procedure TInfoEntEducCollection.SetItem(Index: Integer;
  Value: TInfoEntEducCollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TInfoEntEducCollectionItem }

constructor TInfoEntEducCollectionItem.Create;
begin

end;

end.
