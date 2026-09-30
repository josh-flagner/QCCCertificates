pageextension 70230 "QCC Posted Shipment Ext"
    extends "Posted Sales Shipment"
{
    actions
    {
        addlast(Processing)
        {
            group(QCCCertificates)
            {
                Caption = 'Certificates';
                Image = Documents;

                action(CreateComplianceCertificate)
                {
                    Caption = 'Create Compliance Certificate';
                    ApplicationArea = All;
                    Image = Report;
                    ToolTip = 'Creates a compliance certificate from all item lines on this posted sales shipment.';

                    trigger OnAction()
                    var
                        CertificateHeader: Record "QCC Certificate Header";
                        CertificateTrackingLine: Record "QCC Cert Tracking Line";
                        CertificateLine: Record "QCC Certificate Line";
                        SalesShipmentLine: Record "Sales Shipment Line";
                        ItemLedgerEntry: Record "Item Ledger Entry";
                        ExistingCertificate: Record "QCC Certificate Header";
                        CertificateLineNo: Integer;
                        TrackingLineNo: Integer;
                    begin
                        ExistingCertificate.Reset();

                        ExistingCertificate.SetRange(
                            "Shipment No.",
                            Rec."No.");

                        ExistingCertificate.SetRange(
                            "Certificate Type",
                            ExistingCertificate."Certificate Type"::Compliance);

                        if ExistingCertificate.FindFirst() then begin
                            Message(
                                'Certificate %1 already exists for shipment %2.',
                                ExistingCertificate."Certificate No.",
                                Rec."No.");

                            Page.Run(
                                Page::"QCC Certificate Card",
                                ExistingCertificate);

                            exit;
                        end;
                        CertificateHeader.Init();

                        CertificateHeader."Certificate Type" :=
                            CertificateHeader."Certificate Type"::Compliance;

                        CertificateHeader."Shipment No." := Rec."No.";
                        CertificateHeader."Customer No." := Rec."Sell-to Customer No.";
                        CertificateHeader."Customer Name" := Rec."Sell-to Customer Name";
                        CertificateHeader."Customer PO No." := Rec."External Document No.";
                        CertificateHeader."Shipment Date" := Rec."Posting Date";
                        CertificateHeader."Ship-to Name" := Rec."Ship-to Name";
                        CertificateHeader."Ship-to Address" := Rec."Ship-to Address";
                        CertificateHeader."Ship-to Address 2" := Rec."Ship-to Address 2";
                        CertificateHeader."Ship-to City" := Rec."Ship-to City";
                        CertificateHeader."Ship-to State" := Rec."Ship-to County";
                        CertificateHeader."Ship-to Post Code" := Rec."Ship-to Post Code";
                        CertificateHeader.Status :=
                            CertificateHeader.Status::Draft;

                        CertificateHeader.Insert(true);

                        CertificateLineNo := 0;

                        SalesShipmentLine.Reset();
                        SalesShipmentLine.SetRange(
                            "Document No.",
                            Rec."No.");

                        SalesShipmentLine.SetRange(
                            Type,
                            SalesShipmentLine.Type::Item);

                        if SalesShipmentLine.FindSet() then
                            repeat
                                if SalesShipmentLine.Quantity = 0 then
                                    continue;
                                CertificateLineNo += 10000;

                                CertificateLine.Init();
                                CertificateLine."Certificate No." :=
                                    CertificateHeader."Certificate No.";

                                CertificateLine."Line No." :=
                                    CertificateLineNo;

                                CertificateLine."Shipment No." :=
                                    SalesShipmentLine."Document No.";

                                CertificateLine."Shipment Line No." :=
                                    SalesShipmentLine."Line No.";

                                CertificateLine."Item No." :=
                                    SalesShipmentLine."No.";

                                CertificateLine.Description :=
                                    SalesShipmentLine.Description;

                                CertificateLine."Customer Item No." :=
                                    SalesShipmentLine."Item Reference No.";

                                CertificateLine.Quantity :=
                                    SalesShipmentLine.Quantity;

                                CertificateLine.Insert(true);
                                TrackingLineNo := 0;

                                ItemLedgerEntry.Reset();

                                ItemLedgerEntry.SetRange(
                                    "Document No.",
                                    SalesShipmentLine."Document No.");

                                ItemLedgerEntry.SetRange(
                                    "Item No.",
                                    SalesShipmentLine."No.");

                                if ItemLedgerEntry.FindSet() then
                                    repeat
                                        if (ItemLedgerEntry."Serial No." <> '') or
                                           (ItemLedgerEntry."Lot No." <> '')
                                        then begin
                                            TrackingLineNo += 10000;

                                            CertificateTrackingLine.Init();
                                            CertificateTrackingLine."Certificate No." :=
                                                CertificateHeader."Certificate No.";
                                            CertificateTrackingLine."Certificate Line No." :=
                                                CertificateLine."Line No.";
                                            CertificateTrackingLine."Tracking Line No." :=
                                                TrackingLineNo;
                                            CertificateTrackingLine."Item No." :=
                                                SalesShipmentLine."No.";
                                            CertificateTrackingLine."Serial No." :=
                                                ItemLedgerEntry."Serial No.";
                                            CertificateTrackingLine."Lot No." :=
                                                ItemLedgerEntry."Lot No.";

                                            if ItemLedgerEntry."Serial No." <> '' then
                                                CertificateTrackingLine."Serial Barcode" :=
                                                    '*' + ItemLedgerEntry."Serial No." + '*';

                                            if ItemLedgerEntry."Lot No." <> '' then
                                                CertificateTrackingLine."Lot Barcode" :=
                                                    '*' + ItemLedgerEntry."Lot No." + '*';

                                            CertificateTrackingLine.Insert(true);
                                        end;
                                    until ItemLedgerEntry.Next() = 0;
                            until SalesShipmentLine.Next() = 0;

                        Page.Run(
                            Page::"QCC Certificate Card",
                            CertificateHeader);
                    end;
                }
            }
        }
    }
}