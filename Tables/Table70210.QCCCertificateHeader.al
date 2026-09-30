table 70210 "QCC Certificate Header"
{
    Caption = 'QCC Certificate Header';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Certificate No."; Code[20])
        {
            Caption = 'Certificate No.';
        }

        field(2; "Certificate Type"; Enum "QCC Certificate Type")
        {
            Caption = 'Certificate Type';
        }

        field(3; "Shipment No."; Code[20])
        {
            Caption = 'Shipment No.';
            TableRelation = "Sales Shipment Header";
        }

        field(4; "Shipment Line No."; Integer)
        {
            Caption = 'Shipment Line No.';
        }

        field(5; Status; Enum "QCC Certificate Status")
        {
            Caption = 'Status';
        }

        field(10; "Created Date/Time"; DateTime)
        {
            Caption = 'Created Date/Time';
        }

        field(11; "Created By"; Code[50])
        {
            Caption = 'Created By';
        }

        field(20; "PDF Generated"; Boolean)
        {
            Caption = 'PDF Generated';
        }

        field(21; "PDF Attachment ID"; Guid)
        {
            Caption = 'PDF Attachment ID';
        }

        field(30; Emailed; Boolean)
        {
            Caption = 'Emailed';
        }

        field(31; "Email Date/Time"; DateTime)
        {
            Caption = 'Email Date/Time';
        }

        field(32; "Email To"; Text[250])
        {
            Caption = 'Email To';
        }

        field(40; "Superseded By"; Code[20])
        {
            Caption = 'Superseded By';
        }

        field(41; "Revision No."; Integer)
        {
            Caption = 'Revision No.';
        }

        field(50; Notes; Text[250])
        {
            Caption = 'Notes';
        }
        field(60; "Customer No."; Code[20])
        {
            Caption = 'Customer No.';
        }

        field(61; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
        }

        field(62; "Customer PO No."; Code[35])
        {
            Caption = 'Customer PO No.';
        }
        field(70; "Item No."; Code[20])
        {
            Caption = 'Item No.';
        }

        field(71; Description; Text[100])
        {
            Caption = 'Description';
        }

        field(72; "Customer Item No."; Code[50])
        {
            Caption = 'Customer Item No.';
        }

        field(73; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(80; "Shipment Date"; Date)
        {
            Caption = 'Shipment Date';
        }

        field(81; "Ship-to Name"; Text[100])
        {
            Caption = 'Ship-to Name';
        }

        field(82; "Ship-to Address"; Text[100])
        {
            Caption = 'Ship-to Address';
        }

        field(83; "Ship-to Address 2"; Text[50])
        {
            Caption = 'Ship-to Address 2';
        }

        field(84; "Ship-to City"; Text[30])
        {
            Caption = 'Ship-to City';
        }

        field(85; "Ship-to State"; Code[10])
        {
            Caption = 'Ship-to State';
        }

        field(86; "Ship-to Post Code"; Code[20])
        {
            Caption = 'Ship-to Post Code';
        }
    }

    keys
    {
        key(PK; "Certificate No.")
        {
            Clustered = true;
        }

        key(Shipment; "Shipment No.")
        {
        }

        key(ShipmentLine; "Shipment No.", "Shipment Line No.")
        {
        }
    }

    trigger OnInsert()
    var
        CertificateMgmt: Codeunit "QCC Certificate Management";
    begin
        if "Certificate No." = '' then
            "Certificate No." := CertificateMgmt.GetNextCertificateNo();
        if "Created Date/Time" = 0DT then
            "Created Date/Time" := CurrentDateTime();
        if "Created By" = '' then
            "Created By" := UserId();
    end;
}