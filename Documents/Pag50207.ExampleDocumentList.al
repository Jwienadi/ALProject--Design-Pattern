page 50207 "Example Document List"
{
    ApplicationArea = All;
    Caption = 'Example Document List';
    PageType = List;
    SourceTable = "Example Header";
    UsageCategory = Lists;
    Editable = false;
    CardPageId = "Example Document";

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field("No. Printed"; Rec."No. Printed")
                {
                    ToolTip = 'Specifies the value of the No. Printed field.';
                }
                field("Posting Date"; Rec."Posting Date")
                {
                    ToolTip = 'Specifies the value of the Posting Date field.';
                }
            }
        }
    }
}
