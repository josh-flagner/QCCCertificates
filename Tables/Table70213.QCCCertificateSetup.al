table 70213 "QCC Certificate Setup"
{
    Caption = 'QCC Certificate Setup';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Primary Key"; Code[10])
        {
            Caption = 'Primary Key';
        }

        field(10; "Certificate No. Series"; Code[20])
        {
            Caption = 'Certificate No. Series';
            TableRelation = "No. Series";
        }
    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }
}