page 50206 "Example Line Subpage"
{
    ApplicationArea = All;
    Caption = 'Example Line Subpage';
    SourceTable = "Example Line";
    //important listpart properties
    PageType = ListPart;
    UsageCategory = None;
    AutoSplitKey = true;
    DelayedInsert = true;


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Document No."; Rec."Document No.")
                {
                    ToolTip = 'Specifies the value of the Document No. field.';
                    Editable = false;
                }
                field("Example Description"; Rec."Example Description")
                {
                    ToolTip = 'Specifies the value of the Example Description field.';
                }
                field("Example No."; Rec."Example No.")
                {
                    ToolTip = 'Specifies the value of the Example No. field.';
                }
                field("Line Date"; Rec."Line Date")
                {
                    ToolTip = 'Specifies the value of the Line Date field.';
                }
                field("Line No."; Rec."Line No.")
                {
                    ToolTip = 'Specifies the value of the Line No. field.';
                    Editable = false;
                }
                field(Quantity; Rec.Quantity)
                {
                    ToolTip = 'Specifies the value of the Quantity field.';
                }
            }
        }
    }
}
