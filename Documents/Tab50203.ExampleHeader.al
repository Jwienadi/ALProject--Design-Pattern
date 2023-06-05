table 50203 "Example Header"
{
    Caption = 'Example Header';
    DataClassification = CustomerContent;
    DrillDownPageId = "Example Document List";
    LookupPageId = "Example Document List";


    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
            DataClassification = CustomerContent;
            trigger OnValidate();
            begin
                if "No." <> xRec."No." then begin
                    NoSeriesManagement.TestManual("No. Series");
                    "No. Series" := '';
                end;
            end;
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
            DataClassification = CustomerContent;
        }
        field(3; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            DataClassification = CustomerContent;
        }
        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
            DataClassification = CustomerContent;
        }
        field(5; "No. Printed"; Integer)
        {
            Caption = 'No. Printed';
            DataClassification = CustomerContent;
            Editable = false;
        }
    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        ExampleSetup: Record "Example Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            ExampleSetup.Get();
            ExampleSetup.TestField("Document Nos.");
            NoSeriesManagement.InitSeries(ExampleSetup."Document Nos.", xRec."No. Series", 0D, "No.", "No. Series");

        end;
        InitRecord();
    end;

    procedure AssistEdit(OldExampleHeader: Record "Example Header"): Boolean
    var
        ExampleHeader: Record "Example Header";
    begin
        ExampleHeader := Rec;
        ExampleSetup.Get();
        ExampleSetup.TestField("Document Nos.");
        if NoSeriesManagement.SelectSeries(ExampleSetup."Document Nos.", OldExampleHeader."No. Series", ExampleHeader."No. Series") then begin
            NoSeriesManagement.SetSeries(ExampleHeader."No.");
            Rec := ExampleHeader;
            exit(true);
        end;
    end;

    procedure InitRecord()
    begin
        if Rec."Posting Date" = 0D then
            Rec."Posting Date" := WorkDate();
        Rec."Document Date" := WorkDate();
    end;


}
