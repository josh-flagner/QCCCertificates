page 70218 "QCC Certificate Tracking Lines"
{
    PageType = ListPart;
    SourceTable = "QCC Cert Tracking Line";
    Caption = 'Tracking Lines';

    layout
    {
        area(Content)
        {
            repeater(Tracking)
            {
                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                }
                field("Serial No."; Rec."Serial No.")
                {
                    ApplicationArea = All;
                }

                field("Lot No."; Rec."Lot No.")
                {
                    ApplicationArea = All;
                }

                field("Serial Barcode"; Rec."Serial Barcode")
                {
                    ApplicationArea = All;
                }

                field("Lot Barcode"; Rec."Lot Barcode")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}