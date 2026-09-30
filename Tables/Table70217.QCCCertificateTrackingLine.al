table 70217 "QCC Cert Tracking Line"
{
    Caption = 'QCC Certificate Tracking Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Certificate No."; Code[20])
        {
            Caption = 'Certificate No.';
            TableRelation = "QCC Certificate Header";
        }

        field(2; "Certificate Line No."; Integer)
        {
            Caption = 'Certificate Line No.';
        }

        field(3; "Tracking Line No."; Integer)
        {
            Caption = 'Tracking Line No.';
        }
        field(4; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }
        field(10; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }

        field(11; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }

        field(12; "Serial Barcode"; Text[100])
        {
            Caption = 'Serial Barcode';
        }

        field(13; "Lot Barcode"; Text[100])
        {
            Caption = 'Lot Barcode';
        }
    }

    keys
    {
        key(PK; "Certificate No.", "Certificate Line No.", "Tracking Line No.")
        {
            Clustered = true;
        }
    }
}