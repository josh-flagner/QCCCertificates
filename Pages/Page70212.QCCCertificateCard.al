page 70212 "QCC Certificate Card"
{
    PageType = Card;
    SourceTable = "QCC Certificate Header";
    Caption = 'QCC Certificate';
    ApplicationArea = All;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Certificate No."; Rec."Certificate No.")
                {
                    ApplicationArea = All;
                }

                field("Certificate Type"; Rec."Certificate Type")
                {
                    ApplicationArea = All;
                }

                field("Shipment No."; Rec."Shipment No.")
                {
                    ApplicationArea = All;
                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                }

                field("Customer PO No."; Rec."Customer PO No.")
                {
                    ApplicationArea = All;
                }
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }

                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }

                field("Customer Item No."; Rec."Customer Item No.")
                {
                    ApplicationArea = All;
                }

                field(Quantity; Rec.Quantity)
                {
                    ApplicationArea = All;
                }

                field("Shipment Line No."; Rec."Shipment Line No.")
                {
                    ApplicationArea = All;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }
            }
            group("Shipping Information")
            {
                field("Shipment Date"; Rec."Shipment Date")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Name"; Rec."Ship-to Name")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Address"; Rec."Ship-to Address")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Address 2"; Rec."Ship-to Address 2")
                {
                    ApplicationArea = All;
                }

                field("Ship-to City"; Rec."Ship-to City")
                {
                    ApplicationArea = All;
                }

                field("Ship-to State"; Rec."Ship-to State")
                {
                    ApplicationArea = All;
                }

                field("Ship-to Post Code"; Rec."Ship-to Post Code")
                {
                    ApplicationArea = All;
                }
            }


            group("Audit Information")
            {
                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = All;
                    Editable = false;
                }

                field("PDF Generated"; Rec."PDF Generated")
                {
                    ApplicationArea = All;
                }

                field(Emailed; Rec.Emailed)
                {
                    ApplicationArea = All;
                }

            }
            part(CertificateLines; "QCC Certificate Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Certificate No." = field("Certificate No.");
            }
            part(CertificateTrackingLines; "QCC Certificate Tracking Lines")
            {
                ApplicationArea = All;
                SubPageLink = "Certificate No." = field("Certificate No.");
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action(PrintComplianceCertificate)
            {
                Caption = 'Print Compliance Certificate';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    CertificateHeader: Record "QCC Certificate Header";
                begin
                    CertificateHeader.SetRange(
                        "Certificate No.",
                        Rec."Certificate No.");

                    Report.RunModal(
                        Report::"QCC Compliance Certificate",
                        true,
                        false,
                        CertificateHeader);
                end;
            }
            action(PrintConformanceCertificate)
            {
                Caption = 'Print Conformance Certificate';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    CertificateHeader: Record "QCC Certificate Header";
                begin
                    CertificateHeader.SetRange(
                        "Certificate No.",
                        Rec."Certificate No.");

                    Report.RunModal(
                        Report::"QCC Conformance Certificate",
                        true,
                        false,
                        CertificateHeader);
                end;
            }

            action(PrintSerialLotLabels)
            {
                Caption = 'Print Serial/Lot Labels';
                ApplicationArea = All;
                Image = Print;

                trigger OnAction()
                var
                    CertificateHeader: Record "QCC Certificate Header";
                begin
                    CertificateHeader.SetRange(
                        "Certificate No.",
                        Rec."Certificate No.");

                    Report.RunModal(
                        Report::"QCC Serial Lot Labels",
                        true,
                        false,
                        CertificateHeader);
                end;
            }
        }
    }
}

