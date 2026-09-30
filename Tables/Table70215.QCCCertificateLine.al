table 70215 "QCC Certificate Line"
{
    Caption = 'QCC Certificate Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Certificate No."; Code[20])
        {
            Caption = 'Certificate No.';
            TableRelation = "QCC Certificate Header";
        }

        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(10; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
        }

        field(11; "Shipment Line No."; Integer)
        {
            Caption = 'Shipment Line No.';
        }

        field(20; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }

        field(21; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(22; "Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
        }

        field(23; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }

        field(30; "Lot No."; Code[50])
        {
            Caption = 'Lot No.';
        }

        field(31; "Serial No."; Code[50])
        {
            Caption = 'Serial No.';
        }
    }

    keys
    {
        key(PK; "Certificate No.", "Line No.")
        {
            Clustered = true;
        }

        key(Shipment; "Shipment No.", "Shipment Line No.")
        {
        }
    }
}