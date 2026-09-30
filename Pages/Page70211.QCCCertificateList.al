page 70211 "QCC Certificate List"
{
    PageType = List;
    SourceTable = "QCC Certificate Header";
    Caption = 'QCC Certificates';
    ApplicationArea = All;
    UsageCategory = Lists;
    CardPageId = "QCC Certificate Card";

    layout
    {
        area(Content)
        {
            repeater(General)
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

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                }

                field("Created Date/Time"; Rec."Created Date/Time")
                {
                    ApplicationArea = All;
                }

                field("Created By"; Rec."Created By")
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
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}