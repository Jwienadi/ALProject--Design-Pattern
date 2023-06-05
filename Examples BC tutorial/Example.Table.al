table 50201 Example
{
    DataClassification = CustomerContent;
    Caption = 'Example';
    LookupPageId = "Example List";
    DrillDownPageId = "Example List";
    // DataPerCompany --> data for this company only or all
    DataPerCompany = true;

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(2; "Description"; Text[50])
        {
            DataClassification = CustomerContent;
            Caption = 'Description';
        }
        field(3; "Example Type Code"; Code[10])
        {
            DataClassification = CustomerContent;
            Caption = 'Example Type Code';
            TableRelation = ExampleType;
        }
        field(4; "No. Series"; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
        }
        field(5; "Test Decimal"; Decimal)
        {

            Caption = 'Test decimal';
            AutoFormatType = 10;
            AutoFormatExpression = '2,IDR';
            DecimalPlaces = 1;
        }
    }

    keys
    {
        key(Pk; "No.")
        {
            Clustered = true;
        }
    }
    //global var
    var
        NoSeriesManagement: Codeunit NoSeriesManagement;
        ExampleSetup: Record "Example Setup";



    trigger OnInsert();
    begin
        if "No." = '' then begin
            //get record
            ExampleSetup.Get();

            //test if not zero
            ExampleSetup.TestField("Example Nos.");

            //init number and change the current number referenced
            NoSeriesManagement.InitSeries(ExampleSetup."Example Nos.",
                                        xRec."No. Series",
                                        0D,
                                        "No.",
                                        "No. Series");
        end;
    end;

    trigger OnModify();
    begin
        Message('Modified');

    end;

    trigger OnDelete();
    begin
        Message('Deleted');

    end;

    //open numberseries selection list when assistedit
    procedure AssistEdit(OldExample: Record Example): Boolean
    var
        Example: Record Example;
    begin
        Example := Rec;
        ExampleSetup.Get();
        //test if number series is defined, error if not
        ExampleSetup.TestField("Example Nos.");

        if NoSeriesManagement.SelectSeries(ExampleSetup."Example Nos.",
                                        OldExample."No. Series",
                                        Example."No. Series") then begin
            NoSeriesManagement.SetSeries(Example."No.");
            Rec := Example;
            exit(true);
        end;
    end;


}