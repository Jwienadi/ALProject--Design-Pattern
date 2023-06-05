page 50208 "Example FactBox"
{
    ApplicationArea = All;
    Caption = 'Example FactBox';
    PageType = CardPart;
    SourceTable = Example;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';

                field(Description; Rec.Description)
                {
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Example Type Code"; Rec."Example Type Code")
                {
                    ToolTip = 'Specifies the value of the Example Type Code field.';
                }
                field("No."; Rec."No.")
                {
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(SystemCreatedAt; Rec.SystemCreatedAt)
                {
                    ToolTip = 'Specifies the value of the SystemCreatedAt field.';
                }
                field("Test Decimal"; Rec."Test Decimal")
                {
                    ToolTip = 'Specifies the value of the Test decimal field.';
                }
            }
        }
    }
}
