report 70240 "QCC Compliance Certificate"
{
    Caption = 'QCC Compliance Certificate';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    DefaultLayout = Word;
    WordLayout = 'Reports\Layouts\QCCComplianceCertificate.docx';

    WordMergeDataItem = CertificateHeader;

    dataset
    {
        dataitem(CertificateHeader; "QCC Certificate Header")
        {
            RequestFilterFields = "Certificate No.";

            column(CertificateNo; "Certificate No.")
            {
            }

            column(CustomerName; "Customer Name")
            {
            }

            column(CustomerPONo; "Customer PO No.")
            {
            }

            column(ShipmentNo; "Shipment No.")
            {
            }

            column(ShipmentDate; "Shipment Date")
            {
            }

            column(ShipToName; "Ship-to Name")
            {
            }

            column(ShipToAddress; "Ship-to Address")
            {
            }

            column(ShipToCity; "Ship-to City")
            {
            }

            dataitem(CertificateLine; "QCC Certificate Line")
            {
                DataItemLink = "Certificate No." = field("Certificate No.");

                column(ItemNo; "Item No.")
                {
                }

                column(LineDescription; Description)
                {
                }

                column(CustomerItemNo; "Customer Item No.")
                {
                }

                column(Quantity; Quantity)
                {
                }
            }
        }
    }
}