page 50205 Test
{
    ApplicationArea = All;
    Caption = 'Test';
    PageType = Card;
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
            }
        }
    }
}
