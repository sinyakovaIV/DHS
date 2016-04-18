unit NRComReg;

interface

procedure Register;

implementation

uses
  System.Classes, XMLReport, Logger;

resourcestring
  sPageName = 'NRCom';


procedure Register;
begin
  RegisterComponents(sPageName,[TXMLReport, TLogger]);
end;

end.
