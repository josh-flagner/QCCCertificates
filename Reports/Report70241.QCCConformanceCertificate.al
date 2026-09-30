report 70241 "QCC Conformance Certificate"
{
    Caption = 'QCC Conformance Certificate';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = ConformanceWord;
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

            column(ShipToAddress2; "Ship-to Address 2")
            {
            }

            column(ShipToCity; "Ship-to City")
            {
            }

            column(ShipToState; "Ship-to State")
            {
            }

            column(ShipToPostCode; "Ship-to Post Code")
            {
            }

            dataitem(CertificateLine; "QCC Certificate Line")
            {
                DataItemLink =
                    "Certificate No." = field("Certificate No.");

                column(LineNo; "Line No.")
                {
                }

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

                dataitem(TrackingLine; "QCC Cert Tracking Line")
                {
                    DataItemLink =
                        "Certificate No." = field("Certificate No."),
                        "Certificate Line No." = field("Line No.");

                    column(TrackingItemNo; "Item No.")
                    {
                    }

                    column(SerialNo; "Serial No.")
                    {
                    }

                    column(SerialNoCaption; SerialNoCaptionLbl)
                    {
                    }

                    column(SerialBarcode; "Serial Barcode")
                    {
                    }

                    column(LotNoCaption; LotNoCaptionLbl)
                    {
                    }

                    column(LotNo; "Lot No.")
                    {
                    }

                    column(LotBarcode; "Lot Barcode")
                    {
                    }
                }
            }
        }
    }

    rendering
    {
        layout(ConformanceWord)
        {
            Type = Word;
            LayoutFile = 'Reports\Layouts\QCCConformanceCertificate.docx';
            Caption = 'QCC Conformance Certificate';
            Summary = 'Serialized certificate with serial and lot tracking.';
        }
    }

    var
        SerialNoCaptionLbl: Label 'S/N:';
        LotNoCaptionLbl: Label 'Lot:';
}
