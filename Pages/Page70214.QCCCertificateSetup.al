page 70214 "QCC Certificate Setup"
{
    PageType = Card;
    SourceTable = "QCC Certificate Setup";
    Caption = 'QCC Certificate Setup';
    ApplicationArea = All;
    UsageCategory = Administration;

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("Certificate No. Series"; Rec."Certificate No. Series")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        if not Rec.Get('SETUP') then begin
            Rec.Init();
            Rec."Primary Key" := 'SETUP';
            Rec.Insert();
        end;
    end;
}