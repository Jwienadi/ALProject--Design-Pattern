page 50205 "Example Document"
{
    ApplicationArea = All;
    Caption = 'Example Document';
    PageType = Document;
    SourceTable = "Example Header";
    UsageCategory = Documents;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';


                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                    trigger OnAssistEdit()
                    begin
                        if Rec.AssistEdit(xRec) then
                            CurrPage.Update();
                    end;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ToolTip = 'Specifies the value of the Document Date field.';
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
            part("Example Line Subpage"; "Example Line Subpage")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }
        area(FactBoxes)
        {
            part("Example FactBox"; "Example FactBox")
            {
                ApplicationArea = All;
                Provider = "Example Line Subpage";
                SubPageLink = "No." = field("Example No.");


            }
        }
    }
}
