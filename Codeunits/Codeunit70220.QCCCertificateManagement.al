codeunit 70220 "QCC Certificate Management"
{
    procedure GetNextCertificateNo(): Code[20]
    var
        CertificateSetup: Record "QCC Certificate Setup";
        NoSeries: Codeunit "No. Series";
    begin
        CertificateSetup.Get('SETUP');

        CertificateSetup.TestField("Certificate No. Series");

        exit(
            NoSeries.GetNextNo(
                CertificateSetup."Certificate No. Series",
                Today()
            )
        );
    end;
}