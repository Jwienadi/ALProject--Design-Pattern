table 50204 "Example Line"
{
    Caption = 'Example Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Document No."; Code[20])
        {
            Caption = 'Document No.';
            DataClassification = CustomerContent;
            TableRelation = "Example Header";
        }
        field(2; "Line No."; Integer)
        {
            Caption = 'Line No.';
            DataClassification = CustomerContent;
        }
        field(3; "Example No."; Code[20])
        {
            Caption = 'Example No.';
            DataClassification = CustomerContent;
            TableRelation = Example;
        }
        field(4; "Line Date"; Date)
        {
            Caption = 'Line Date';
            DataClassification = CustomerContent;
        }
        field(5; Quantity; Decimal)
        {
            Caption = 'Quantity';
            DataClassification = CustomerContent;
            DecimalPlaces = 0 : 2;
        }
        field(6; "Example Description"; Text[50])
        {
            Caption = 'Example Description';
            FieldClass = FlowField;
            CalcFormula = lookup(Example.Description where("No." = field("Example No.")));

        }
    }
    keys
    {
        key(PK; "Document No.", "Line No.")
        {
            Clustered = true;
        }
    }
}
