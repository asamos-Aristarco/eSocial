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
******************************************************************************}
{$I ACBr.inc}

unit eSocial_S2299;

interface

uses
  SysUtils, Classes,
  eSocial_Common, eSocial_Conversao,
  pcnConversao,
  ACBreSocialGerador;

type
  TS2299Collection = class;
  TS2299CollectionItem = class;
  TEvtDeslig = class;
  TInfoDeslig = class;


  TS2299Collection = class(TOwnedCollection)
  private
    function GetItem(Index: Integer): TS2299CollectionItem;
    procedure SetItem(Index: Integer; Value: TS2299CollectionItem);
  public
    function Add: TS2299CollectionItem;
    property Items[Index: Integer]: TS2299CollectionItem read GetItem write SetItem; default;
  end;

  TS2299CollectionItem = class(TCollectionItem)
  private
    FTipoEvento: TTipoEvento;
    FEvtDeslig : TEvtDeslig;
    procedure setEvtDeslig(const Value: TEvtDeslig);
  public
    constructor Create(AOwner: Tcomponent); reintroduce;
    destructor  Destroy; override;
  published
    property TipoEvento: TTipoEvento read FTipoEvento;
    property EvtDeslig: TEvtDeslig read FEvtDeslig write setEvtDeslig;
  end;

  TEvtDeslig = class(TeSocialEvento)
    private
      FIdeEvento: TIdeEvento2;
      FIdeEmpregador: TIdeEmpregador;
      FIdeVinculo: TIdeVinculo;
      FInfoDeslig: TInfoDeslig;
      procedure GerarInfoDeslig(obj: TInfoDeslig);
      procedure GerarSucessaoVinc(obj: TSucessaoVinc);
      procedure GerarVerbasResc(obj: TVerbasResc);
      procedure GerarRecPgtos(obj: TRecPgtosCollection);
      procedure GerarIdeEstabLot(obj : TIdeEstabLotCollection);
      procedure GerarProcJudTrab(obj: TinfoProcJudCollection);
      procedure GerarDetVerbas(obj: TdetVerbasCollection);
      procedure GerarInfoSimples(obj: TinfoSimples);
      procedure GerarInfoAgNocivo(obj: TInfoAgNocivo);
      procedure GerarQuarentena(obj: TQuarentena);
      procedure GerarInfoASO(obj: TInfoASO);
    public
      constructor Create(AACBreSocial: TObject);overload;
      destructor  Destroy; override;

      function GerarXML: boolean; override;

      property IdeEvento: TIdeEvento2 read FIdeEvento write FIdeEvento;
      property IdeEmpregador: TIdeEmpregador read FIdeEmpregador write FIdeEmpregador;
      property IdeVinculo: TIdeVinculo read FIdeVinculo write FIdeVinculo;
      property InfoDeslig: TInfoDeslig read FInfoDeslig write FInfoDeslig;
  end;

  TInfoDeslig = class(TPersistent)
    private
      FmtvDeslig: String;
      FdtDeslig: TDateTime;
      FindPagtoAPI : tpSimNao;
      FdtProjFimAPI : TDateTime;
      FnrCertObito : String;
      FnrProcTrab : String;
      FObservacao : String;
      FSucessaoVinc : TSucessaoVinc;
      FVerbasResc : TVerbasResc;
      FQuarentena: TQuarentena;
      FInfoASO: TInfoASO;
    public
      constructor Create;
      destructor  Destroy; override;

      property mtvDeslig: String read FmtvDeslig write FmtvDeslig;
      property dtDeslig: TDateTime read FdtDeslig write FdtDeslig;
      property indPagtoAPI : tpSimNao read FindPagtoAPI write FindPagtoAPI;
      property dtProjFimAPI : TDateTime read FdtProjFimAPI write FdtProjFimAPI;
      property nrCertObito : String read FnrCertObito write FnrCertObito;
      property nrProcTrab : String read FnrProcTrab write FnrProcTrab;
      property Observacao : String read FObservacao write FObservacao;
      property SucessaoVinc : TSucessaoVinc read FSucessaoVinc write FSucessaoVinc;
      property VerbasResc : TVerbasResc read FVerbasResc write FVerbasResc;
      property Quarentena: TQuarentena read FQuarentena write FQuarentena;
      property InfoASO : TInfoASO read FInfoASO write FInfoASO;
  end;

implementation

uses
  eSocial_NaoPeriodicos;

{ TS2299Collection }

function TS2299Collection.Add: TS2299CollectionItem;
begin
  Result := TS2299CollectionItem(inherited Add);
  Result.Create(TComponent(Self.Owner));
end;

function TS2299Collection.GetItem(Index: Integer): TS2299CollectionItem;
begin
  Result := TS2299CollectionItem(inherited GetItem(Index));
end;

procedure TS2299Collection.SetItem(Index: Integer; Value: TS2299CollectionItem);
begin
  inherited SetItem(Index, Value);
end;

{ TEvtDeslig }

constructor TEvtDeslig.Create(AACBreSocial: TObject);
begin
  inherited;
  FIdeEvento := TIdeEvento2.Create;
  FIdeEmpregador := TIdeEmpregador.Create;
  FIdeVInculo := TIdeVinculo.Create;
  FInfoDeslig := TInfoDeslig.Create;
end;

destructor TEvtDeslig.destroy;
begin
  FIdeEvento.Free;
  FIdeEmpregador.Free;
  FIdeVinculo.Free;
  FInfoDeslig.Free;
  inherited;
end;

procedure TEvtDeslig.GerarDetVerbas(obj: TdetVerbasCollection);
var
  i : Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('detVerbas');
        Gerador.wCampo(tcStr, '', 'codRubr', 0,0,0, obj.Items[i].codRubr);
        Gerador.wCampo(tcStr, '', 'ideTabRubr', 0,0,0, obj.Items[i].ideTabRubr);
        Gerador.wCampo(tcStr, '', 'qtdRubr', 0,0,0, obj.Items[i].qtdRubr);
        Gerador.wCampo(tcDe2, '', 'vrUnit', 0,0,0, obj.Items[i].vrUnit);
        Gerador.wCampo(tcDe2, '', 'vrRubr', 0,0,0, obj.Items[i].vrRubr);
      Gerador.wGrupo('/detVerbas');
    end;
end;

procedure TEvtDeslig.GerarIdeEstabLot(obj: TIdeEstabLotCollection);
var
  i : integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('ideEstabLot');
        Gerador.wCampo(tcStr, '', 'tpInsc', 0,0,0, obj.Items[i].tpInsc);
        Gerador.wCampo(tcStr, '', 'nrInsc', 0,0,0, obj.Items[i].nrInsc);
        Gerador.wCampo(tcStr, '', 'codLotacao', 0,0,0, obj.Items[i].codLotacao);
        GerarDetVerbas(obj.Items[i].detVerbas);
        GerarInfoAgNocivo(obj.Items[i].infoAgNocivo);
        GerarInfoSimples(obj.Items[i].infoSimples);
      Gerador.wGrupo('/ideEstabLot');
    end;
end;

procedure TEvtDeslig.GerarInfoAgNocivo(obj: TInfoAgNocivo);
begin
  Gerador.wGrupo('infoAgNocivo');
    Gerador.wCampo(tcStr, '', 'grauExp', 0,0,0, obj.grauExp);
  Gerador.wGrupo('/infoAgNocivo');
end;

procedure TEvtDeslig.GerarInfoASO(obj: TInfoASO);
begin
  Gerador.wGrupo('InfoASO');
    Gerador.wCampo(tcDat, '', 'dtAsoDem', 0,0,0, obj.DtAso);
    Gerador.wCampo(tcStr, '', 'nrCRM', 0,0,0, obj.NrCRM);
    Gerador.wCampo(tcStr, '', 'ufCRM', 0,0,0, obj.UfCRM);
  Gerador.wGrupo('/InfoASO');
end;

procedure TEvtDeslig.GerarInfoDeslig(obj: TInfoDeslig);
begin
  Gerador.wGrupo('infoDeslig');
    Gerador.wCampo(tcStr, '', 'mtvDeslig', 0,0,0, obj.mtvDeslig);
    Gerador.wCampo(tcDat, '', 'dtDeslig', 0,0,0, obj.dtDeslig);
    Gerador.wCampo(tcStr, '', 'indPagtoAPI', 0,0,0, obj.indPagtoAPI);
    if (obj.indPagtoAPI=tpSim) then
      Gerador.wCampo(tcDat, '', 'dtProjFimAPI', 0,0,0, obj.dtProjFimAPI);
    if ((obj.mtvDeslig='09') or (obj.mtvDeslig='10')) then
      Gerador.wCampo(tcStr, '', 'nrCertObito', 0,0,0, obj.nrCertObito);
    if (obj.mtvDeslig='17') then
      Gerador.wCampo(tcStr, '', 'nrProcTrab', 0,0,0, obj.nrProcTrab);
    Gerador.wCampo(tcStr, '', 'observacao', 0,0,0, obj.Observacao);
    GerarSucessaoVinc(obj.SucessaoVinc);
    GerarVerbasResc(obj.VerbasResc);
    GerarQuarentena(obj.Quarentena);
    GerarInfoASO(obj.InfoASO);
  Gerador.wGrupo('/infoDeslig');
end;

procedure TEvtDeslig.GerarInfoSimples(obj: TinfoSimples);
begin
  Gerador.wGrupo('infoSimples');
    Gerador.wCampo(tcStr, '', 'indSimples', 0,0,0, obj.indSimples);
  Gerador.wGrupo('/infoSimples');
end;

procedure TEvtDeslig.GerarProcJudTrab(obj: TinfoProcJudCollection);
var
  i : Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('procJutTrab');
        Gerador.wCampo(tcStr, '', 'tpTrib', 0,0,0, obj.Items[i].tpTrib);
        Gerador.wCampo(tcDe2, '', 'nrProcJud', 0,0,0, obj.items[i].nrProcJud);
      Gerador.wGrupo('/procJutTrab');
    end;
end;

procedure TEvtDeslig.GerarQuarentena(obj: TQuarentena);
begin
  Gerador.wGrupo('quarentena');
    Gerador.wCampo(tcDat, '', 'dtFimQuar', 0,0,0, obj.dtFimQuar);
  Gerador.wGrupo('/quarentena');
end;

procedure TEvtDeslig.GerarRecPgtos(obj: TRecPgtosCollection);
var
  i: Integer;
begin
  for i := 0 to obj.Count - 1 do
    begin
      Gerador.wGrupo('recPgtos');
        Gerador.wCampo(tcStr, '', 'ideRecPgto', 0,0,0, obj.Items[i].IdeRecPgto);
        Gerador.wCampo(tcDe2, '', 'vlrPgto', 0,0,0, obj.items[i].vlrPgto);
        GerarIdeEstabLot(obj.Items[i].ideEstabLot);
      Gerador.wGrupo('/recPgtos');
    end;
end;

procedure TEvtDeslig.GerarSucessaoVinc(obj: TSucessaoVinc);
begin
  Gerador.wGrupo('sucessaoVinc');
    Gerador.wCampo(tcStr, '', 'cnpjSucessora', 0,0,0, obj.Cnpj);
  Gerador.wGrupo('/sucessaoVinc');
end;

procedure TEvtDeslig.GerarVerbasResc(obj: TVerbasResc);
begin
  Gerador.wGrupo('verbasResc');
    GerarRecPgtos(obj.RecPgtos);
    GerarProcJudTrab(obj.ProcJudTrab);
  Gerador.wGrupo('/verbasResc');
end;

function TEvtDeslig.GerarXML: boolean;
begin
  try
    GerarCabecalho('');
      Gerador.wGrupo('evtDeslig Id="'+GerarChaveEsocial(now, self.ideEmpregador.NrInsc, 0)+'"');//versao="'+Self.versao+'"
        //gerarIdVersao(self);
        gerarIdeEvento2(self.IdeEvento);
        gerarIdeEmpregador(self.IdeEmpregador);
        gerarIdeVinculo(self.IdeVinculo);
        GerarInfoDeslig(Self.InfoDeslig);
      Gerador.wGrupo('/evtDeslig');
    GerarRodape;
    XML := Assinar(Gerador.ArquivoFormatoXML, 'evtDeslig');
    Validar('evtDeslig');
  except on e:exception do
    raise Exception.Create(e.Message);
  end;
  Result := (Gerador.ArquivoFormatoXML <> '')
end;

{ TInfoDeslig }

constructor TInfoDeslig.Create;
begin
  inherited;
    FSucessaoVinc := TSucessaoVinc.Create;
    FVerbasResc := TVerbasResc.create;
    FQuarentena := TQuarentena.Create;
    FInfoASO := TInfoASO.Create;
end;

destructor TInfoDeslig.destroy;
begin
  FSucessaoVinc.Free;
  FVerbasResc.Free;
  FQuarentena.Free;
  FInfoASO.Free;
  inherited;
end;

{ TS2299CollectionItem }

constructor TS2299CollectionItem.Create(AOwner: TComponent);
begin
  FTipoEvento  := teS2299;
  FEvtDeslig := TEvtDeslig.Create(AOwner);
end;

destructor TS2299CollectionItem.Destroy;
begin
  FEvtDeslig.Free;
  inherited;
end;

procedure TS2299CollectionItem.setEvtDeslig(const Value: TEvtDeslig);
begin
  FEvtDeslig.Assign(Value);
end;

end.
