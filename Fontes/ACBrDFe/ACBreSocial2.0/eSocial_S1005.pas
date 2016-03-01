{******************************************************************************}
{ Projeto: Componente ACBreSocial                                              }
{  Biblioteca multiplataforma de componentes Delphi para envio dos eventos do  }
{ eSocial - http://www.esocial.gov.br/                                         }
{                                                                              }
{ Direitos Autorais Reservados (c) 2008 Wemerson Souto                         }
{                                       Daniel Simoes de Almeida               }
{                                       André Ferreira de Moraes               }
{                                                                              }
{ Colaboradores nesse arquivo:                                                 }
{                                                                              }
{  Você pode obter a última versão desse arquivo na pagina do Projeto ACBr     }
{ Componentes localizado em http://www.sourceforge.net/projects/acbr           }
{                                                                              }
{                                                                              }
{  Esta biblioteca é software livre; você pode redistribuí-la e/ou modificá-la }
{ sob os termos da Licença Pública Geral Menor do GNU conforme publicada pela  }
{ Free Software Foundation; tanto a versão 2.1 da Licença, ou (a seu critério) }
{ qualquer versão posterior.                                                   }
{                                                                              }
{  Esta biblioteca é distribuída na expectativa de que seja útil, porém, SEM   }
{ NENHUMA GARANTIA; nem mesmo a garantia implícita de COMERCIABILIDADE OU      }
{ ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Consulte a Licença Pública Geral Menor}
{ do GNU para mais detalhes. (Arquivo LICENÇA.TXT ou LICENSE.TXT)              }
{                                                                              }
{  Você deve ter recebido uma cópia da Licença Pública Geral Menor do GNU junto}
{ com esta biblioteca; se não, escreva para a Free Software Foundation, Inc.,  }
{ no endereço 59 Temple Street, Suite 330, Boston, MA 02111-1307 USA.          }
{ Você também pode obter uma copia da licença em:                              }
{ http://www.opensource.org/licenses/lgpl-license.php                          }
{                                                                              }
{ Daniel Simões de Almeida  -  daniel@djsystem.com.br  -  www.djsystem.com.br  }
{              Praça Anita Costa, 34 - Tatuí - SP - 18270-410                  }
{                                                                              }
{******************************************************************************}

{******************************************************************************
|* Historico
|*
|* 27/10/2015: Jean Carlo Cantu, Tiago Ravache
|*  - Doação do componente para o Projeto ACBr
|* 01/03/2016: Guilherme Costa
|*  - Passado o namespace para geração no cabeçalho
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

  {Classes específicas deste evento}
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
    FInfoObra: TInfoObra;
    FinfoCaepf : TinfoCaepf;
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
  FInfoObra := nil;
  FinfoCaepf := nil;
end;

destructor TDadosEstab.destroy;
begin
  FAliqGilrat.Free;
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

end.
