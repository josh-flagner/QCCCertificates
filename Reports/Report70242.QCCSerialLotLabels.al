report 70242 "QCC Serial Lot Labels"
{
    Caption = 'QCC Serial/Lot Labels';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultRenderingLayout = SerialLotLabelsWord;
    WordMergeDataItem = CertificateHeader;

    dataset
    {
        dataitem(CertificateHeader; "QCC Certificate Header")
        {
            RequestFilterFields = "Certificate No.";

            column(CertificateNo; "Certificate No.")
            {
            }

            dataitem(LabelRow; Integer)
            {
                DataItemTableView = sorting(Number);

                column(Label1ItemNo; Label1ItemNo)
                {
                }

                column(Label1SerialNo; Label1SerialNo)
                {
                }

                column(Label1SerialBarcode; Label1SerialBarcode)
                {
                }

                column(Label1LotNo; Label1LotNo)
                {
                }

                column(Label1LotBarcode; Label1LotBarcode)
                {
                }

                column(Label2ItemNo; Label2ItemNo)
                {
                }

                column(Label2SerialNo; Label2SerialNo)
                {
                }

                column(Label2SerialBarcode; Label2SerialBarcode)
                {
                }

                column(Label2LotNo; Label2LotNo)
                {
                }

                column(Label2LotBarcode; Label2LotBarcode)
                {
                }

                column(Label3ItemNo; Label3ItemNo)
                {
                }

                column(Label3SerialNo; Label3SerialNo)
                {
                }

                column(Label3SerialBarcode; Label3SerialBarcode)
                {
                }

                column(Label3LotNo; Label3LotNo)
                {
                }

                column(Label3LotBarcode; Label3LotBarcode)
                {
                }
                trigger OnPreDataItem()
                var
                    TrackingLine: Record "QCC Cert Tracking Line";
                    TrackingCount: Integer;
                    LabelRowCount: Integer;
                begin
                    TrackingLine.SetRange(
                        "Certificate No.",
                        CertificateHeader."Certificate No.");

                    TrackingCount := TrackingLine.Count();

                    if TrackingCount = 0 then begin
                        SetRange(Number, 1, 0);
                        exit;
                    end;

                    LabelRowCount := (TrackingCount + 2) div 3;
                    SetRange(Number, 1, LabelRowCount);
                end;

                trigger OnAfterGetRecord()
                var
                    FirstPosition: Integer;
                begin
                    ClearLabelValues();

                    FirstPosition := ((Number - 1) * 3) + 1;

                    LoadLabel1(FirstPosition);
                    LoadLabel2(FirstPosition + 1);
                    LoadLabel3(FirstPosition + 2);
                end;
            }
        }
    }

    rendering
    {
        layout(SerialLotLabelsWord)
        {
            Type = Word;
            LayoutFile = 'Reports\Layouts\QCCSerialLotLabels.docx';
            Caption = 'QCC Serial/Lot Labels';
            Summary = 'Three-across serial and lot labels.';
        }
    }

    var
        Label1ItemNo: Code[20];
        Label1SerialNo: Code[50];
        Label1SerialBarcode: Text[100];
        Label1LotNo: Code[50];
        Label1LotBarcode: Text[100];

        Label2ItemNo: Code[20];
        Label2SerialNo: Code[50];
        Label2SerialBarcode: Text[100];
        Label2LotNo: Code[50];
        Label2LotBarcode: Text[100];

        Label3ItemNo: Code[20];
        Label3SerialNo: Code[50];
        Label3SerialBarcode: Text[100];
        Label3LotNo: Code[50];
        Label3LotBarcode: Text[100];

    local procedure GetTrackingLine(
        Position: Integer;
        var TrackingLine: Record "QCC Cert Tracking Line"): Boolean
    var
        CurrentPosition: Integer;
    begin
        TrackingLine.Reset();
        TrackingLine.SetRange(
            "Certificate No.",
            CertificateHeader."Certificate No.");

        if not TrackingLine.FindSet() then
            exit(false);

        CurrentPosition := 1;

        while CurrentPosition < Position do begin
            if TrackingLine.Next() = 0 then
                exit(false);

            CurrentPosition += 1;
        end;

        exit(true);
    end;

    local procedure LoadLabel1(Position: Integer)
    var
        TrackingLine: Record "QCC Cert Tracking Line";
    begin
        if not GetTrackingLine(Position, TrackingLine) then
            exit;

        Label1ItemNo := TrackingLine."Item No.";
        Label1SerialNo := TrackingLine."Serial No.";
        Label1SerialBarcode := TrackingLine."Serial Barcode";
        Label1LotNo := TrackingLine."Lot No.";
        Label1LotBarcode := TrackingLine."Lot Barcode";
    end;

    local procedure LoadLabel2(Position: Integer)
    var
        TrackingLine: Record "QCC Cert Tracking Line";
    begin
        if not GetTrackingLine(Position, TrackingLine) then
            exit;

        Label2ItemNo := TrackingLine."Item No.";
        Label2SerialNo := TrackingLine."Serial No.";
        Label2SerialBarcode := TrackingLine."Serial Barcode";
        Label2LotNo := TrackingLine."Lot No.";
        Label2LotBarcode := TrackingLine."Lot Barcode";
    end;

    local procedure LoadLabel3(Position: Integer)
    var
        TrackingLine: Record "QCC Cert Tracking Line";
    begin
        if not GetTrackingLine(Position, TrackingLine) then
            exit;

        Label3ItemNo := TrackingLine."Item No.";
        Label3SerialNo := TrackingLine."Serial No.";
        Label3SerialBarcode := TrackingLine."Serial Barcode";
        Label3LotNo := TrackingLine."Lot No.";
        Label3LotBarcode := TrackingLine."Lot Barcode";
    end;

    local procedure ClearLabelValues()
    begin
        Clear(Label1ItemNo);
        Clear(Label1SerialNo);
        Clear(Label1SerialBarcode);
        Clear(Label1LotNo);
        Clear(Label1LotBarcode);

        Clear(Label2ItemNo);
        Clear(Label2SerialNo);
        Clear(Label2SerialBarcode);
        Clear(Label2LotNo);
        Clear(Label2LotBarcode);

        Clear(Label3ItemNo);
        Clear(Label3SerialNo);
        Clear(Label3SerialBarcode);
        Clear(Label3LotNo);
        Clear(Label3LotBarcode);
    end;

}