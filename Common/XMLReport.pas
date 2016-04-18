unit XMLReport;

interface

uses
  System.Classes, Xml.xmldom, Xml.XMLIntf, Xml.Win.msxmldom, Xml.XMLDoc;

type
  TReportSection = class;
  TReportSections = class;
  TSectionAttribute = class;
  TSectionAttributes = class;

  TXMLReport = class(TComponent)
  private
    fXMLText: TStrings;
    fXMLVersion: string;
    fXMLEncoding: string;
    fXSLFileName: string;
    fFileName: string;
    fSections: TReportSections;
    fUsedXSL: boolean;
    fTempPath: string;
    function GetXMLReport: TStrings;
    procedure SetFileName(const Value: string);
  protected
    procedure GetChilds(ASections: TReportSections; ANode: IXMLNode);
    procedure SaveToFileP(const AFileName: string = ''; const aTempFlag: boolean = false);
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure SaveToFile(const AFileName: string = '');
    property XMLReport: TStrings read GetXMLReport;
  published
    property FileName: string read fFileName write SetFileName;
    property Sections: TReportSections read fSections write fSections;
    property TempPath: string read fTempPath write fTempPath;
    property UsedXSL: boolean read fUsedXSL write fUsedXSL;
    property XMLVersion: string read fXMLVersion write fXMLVersion;
    property XMLEncoding: string read fXMLEncoding write fXMLEncoding;
    property XSLFileName: string read fXSLFileName write fXSLFileName;
  end;

  TReportSection = class(TCollectionItem)
  private
    fName: string;
    fCaption: string;
    fAttributes: TSectionAttributes;
    fSections: TReportSections;
    fShowCaption: boolean;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    destructor Destroy; override;
    procedure Assign(Source: TPersistent); override;
  published
    property Caption: string read fCaption write fCaption;
    property Name: string read fName write fName;
    property Attributes: TSectionAttributes read fAttributes write fAttributes;
    property Sections: TReportSections read fSections write fSections;
    property ShowCaption: boolean read fShowCaption write fShowCaption;
  end;

  TReportSections = class(TCollection)
  private
    fOwner: TPersistent;
    fName: string;
    function GetItem(Index: Integer): TReportSection;
    procedure SetItem(Index: Integer; const Value: TReportSection);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    function Add: TReportSection;
    function AddItem(Item: TReportSection; Index: Integer): TReportSection;
    function Insert(Index: Integer): TReportSection;
    function FindByName(const aName: string): TReportSection;
    property Items[Index: Integer]: TReportSection read GetItem write SetItem; default;
  published
    property Name: string read fName write fName;
  end;

  TSectionAttribute = class(TCollectionItem)
  private
    fName: string;
    fValue: string;
  protected
    function GetDisplayName: string; override;
  public
    constructor Create(Collection: TCollection); override;
    procedure Assign(Source: TPersistent); override;
  published
    property Value: string read fValue write fValue;
    property Name: string read fName write fName;
  end;

  TSectionAttributes = class(TCollection)
  private
    fOwner: TPersistent;
    function GetItem(Index: Integer): TSectionAttribute;
    procedure SetItem(Index: Integer; const Value: TSectionAttribute);
  protected
    function GetOwner: TPersistent; override;
  public
    constructor Create(AOwner: TPersistent);
    function Add: TSectionAttribute;
    function AddItem(Item: TSectionAttribute; Index: Integer): TSectionAttribute;
    function Insert(Index: Integer): TSectionAttribute;
    function FindByName(const aName: string): TSectionAttribute;
    property Items[Index: Integer]: TSectionAttribute read GetItem write SetItem; default;
  end;

implementation

uses
  System.SysUtils;

resourcestring
  sReportName = 'REPORT';
  sReportSectionName = 'ReportSection';
  sSectionAttributeName = 'SectionAttribute';
  sXMLVersionDefault = '1.0';
  sXMLEncodingDefault = 'utf-8';
  sXMLProcessingInstrXSL = 'xml-stylesheet';
  sXMLProcessingInstrXSLText = 'type = "text/xsl" href="%s"';
  sTmpName = 'report.tmp';


{ TXMLReport }

constructor TXMLReport.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  fXMLText := TStringList.Create;
  fXMLVersion := sXMLVersionDefault;
  fXMLEncoding := sXMLEncodingDefault;
  fSections := TReportSections.Create(Self);
  fSections.Name := sReportName;
  fUsedXSL := True;
  fFileName := '';
  fXSLFileName := '';
  fTempPath := '';
end;

destructor TXMLReport.Destroy;
begin
  fSections.Free;
  fXMLText.Free;
  inherited;
end;

procedure TXMLReport.GetChilds(ASections: TReportSections; ANode: IXMLNode);
var
  i, j: integer;
  iChildNode: IXMLNode;
begin
  for i := 0 to ASections.Count-1 do
  begin
    iChildNode := ANode.AddChild(ASections[i].Name);
    with iChildNode do
    begin
      if ASections[i].ShowCaption then
        Attributes['Caption'] := ASections[i].Caption;
      for j := 0 to ASections[i].Attributes.Count-1 do
        Attributes[ASections[i].Attributes[j].Name] := ASections[i].Attributes[j].Value;
      if ASections[i].Sections.Count > 0 then
        GetChilds(ASections[i].Sections, iChildNode);
    end;
  end;
end;

function TXMLReport.GetXMLReport: TStrings;
begin
  fXMLText.Clear;
  Result := fXMLText;
  SaveToFileP(sTmpName,true);
  fXMLText.LoadFromFile(fTempPath+sTmpName);
  DeleteFile(fTempPath+sTmpName);
end;

procedure TXMLReport.SaveToFile(const AFileName: string);
begin
  SaveToFileP(AFileName);
end;

procedure TXMLReport.SaveToFileP(const AFileName: string; const aTempFlag: boolean);
var
  iNode: IXMLNode;
  fXMLDoc: TXMLDocument;
begin
  fXMLDoc := TXMLDocument.Create(Self);
  try
    fXMLDoc.Active := true;
    fXMLDoc.Encoding := fXMLEncoding;
    fXMLDoc.Version := fXMLVersion;
    fXMLDoc.Options := fXMLDoc.Options + [doNodeAutoIndent] - [doAutoSave];
    if fFileName <> '' then
      fXMLDoc.FileName := fFileName;
    if (AFileName <> '') and (fFileName <> AFileName) then
      fXMLDoc.FileName := AFileName;
    //add xslt
    if fUsedXSL then
    begin
      iNode := fXMLDoc.CreateNode(sXMLProcessingInstrXSL, ntProcessingInstr,
        format(sXMLProcessingInstrXSLText, [fXSLFileName]));
      fXMLDoc.ChildNodes.Add(iNode);
    end;
    //add body report
    iNode := fXMLDoc.AddChild(fSections.Name);
    //add sections
    GetChilds(fSections,iNode);

    //get xml
    if not ((csDesigning in ComponentState) or (csDesignInstance in ComponentState)) then
    begin
      if aTempFlag then
      begin
        if fTempPath <> '' then
          fTempPath := IncludeTrailingPathDelimiter(fTempPath);
        fXMLDoc.SaveToFile(fTempPath+sTmpName);
      end else
        fXMLDoc.SaveToFile();
    end;
  finally
    fXMLDoc.Free;
  end;
end;

procedure TXMLReport.SetFileName(const Value: string);
begin
  fFileName := Value;
  if fXSLFileName = '' then
    fXSLFileName := ChangeFileExt(fFileName,'.xsl');
end;

{ TReportSection }

procedure TReportSection.Assign(Source: TPersistent);
begin
  if Source is TReportSection then
  begin
    fName := TReportSection(Source).fName;
    fCaption := TReportSection(Source).fCaption;
    fShowCaption := TReportSection(Source).fShowCaption;
    fAttributes.Assign(TReportSection(Source).fAttributes);
    fSections.Assign(TReportSection(Source).fSections);
  end
  else
    inherited Assign(Source);
end;

constructor TReportSection.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  fName := sReportSectionName + IntToStr(Collection.Count);
  fCaption := '';
  fAttributes := TSectionAttributes.Create(Self);
  fSections := TReportSections.Create(Self);
  fShowCaption := True;
end;

destructor TReportSection.Destroy;
begin
  fAttributes.Free;
  fSections.Free;
  inherited;
end;

function TReportSection.GetDisplayName: string;
begin
  if Trim(fCaption) <> '' then
    Result := fCaption
  else if Trim(fName) <> '' then
    Result := fName
  else
    Result := inherited GetDisplayName;
end;

{ TReportSections }

function TReportSections.Add: TReportSection;
begin
  Result := AddItem(nil, -1);
end;

function TReportSections.AddItem(Item: TReportSection; Index: Integer): TReportSection;
begin
  if Item = nil then
  begin
    Result := TReportSection.Create(Self);
  end
  else
  begin
    Result := Item;
    if Assigned(Item) then
    begin
      Result.Collection := Self;
      if Index < Count then
        Index := Count - 1;
      Result.Index := Index;
    end;
  end;
end;

constructor TReportSections.Create(AOwner: TPersistent);
begin
  fOwner := AOwner;
  fName := '';
  inherited Create(TReportSection);
end;

function TReportSections.FindByName(const aName: string): TReportSection;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Self.Count - 1 do
    if AnsiUpperCase(GetItem(i).Name) = AnsiUpperCase(aName) then
      Result := GetItem(i);
end;

function TReportSections.GetItem(Index: Integer): TReportSection;
begin
  Result := TReportSection(inherited GetItem(Index));
end;

function TReportSections.GetOwner: TPersistent;
begin
  Result := fOwner;
end;

function TReportSections.Insert(Index: Integer): TReportSection;
begin
  Result := AddItem(nil, Index);
end;

procedure TReportSections.SetItem(Index: Integer; const Value: TReportSection);
begin
  TReportSection(Items[Index]).Assign(Value);
end;

{ TSectionAttribute }

procedure TSectionAttribute.Assign(Source: TPersistent);
begin
  if Source is TSectionAttribute then
  begin
    fName := TSectionAttribute(Source).fName;
    fValue := TSectionAttribute(Source).fValue;
  end
  else
    inherited Assign(Source);
end;

constructor TSectionAttribute.Create(Collection: TCollection);
begin
  inherited Create(Collection);
  fName := sSectionAttributeName + IntToStr(Collection.Count);
  fValue := '';
end;

function TSectionAttribute.GetDisplayName: string;
begin
  if Trim(fName) <> '' then
    Result := fName
  else
    Result := inherited GetDisplayName;
end;

{ TSectionAttributes }

function TSectionAttributes.Add: TSectionAttribute;
begin
  Result := AddItem(nil, -1);
end;

function TSectionAttributes.AddItem(Item: TSectionAttribute; Index: Integer): TSectionAttribute;
begin
  if Item = nil then
  begin
    Result := TSectionAttribute.Create(Self);
  end
  else
  begin
    Result := Item;
    if Assigned(Item) then
    begin
      Result.Collection := Self;
      if Index < Count then
        Index := Count - 1;
      Result.Index := Index;
    end;
  end;
end;

constructor TSectionAttributes.Create(AOwner: TPersistent);
begin
  fOwner := AOwner;
  inherited Create(TSectionAttribute);
end;

function TSectionAttributes.FindByName(const aName: string): TSectionAttribute;
var
  i: Integer;
begin
  Result := nil;
  for i := 0 to Self.Count - 1 do
    if AnsiUpperCase(GetItem(i).Name) = AnsiUpperCase(aName) then
      Result := GetItem(i);
end;

function TSectionAttributes.GetItem(Index: Integer): TSectionAttribute;
begin
  Result := TSectionAttribute(inherited GetItem(Index));
end;

function TSectionAttributes.GetOwner: TPersistent;
begin
  Result := fOwner;
end;

function TSectionAttributes.Insert(Index: Integer): TSectionAttribute;
begin
  Result := AddItem(nil, Index);
end;

procedure TSectionAttributes.SetItem(Index: Integer; const Value: TSectionAttribute);
begin
  TSectionAttribute(Items[Index]).Assign(Value);
end;

end.
