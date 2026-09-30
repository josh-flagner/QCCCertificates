page 70216 "QCC Certificate Lines"
{
    PageType = ListPart;
    SourceTable = "QCC Certificate Line";
    Caption = 'Certificate Lines';

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
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

            }
        }
    }
}