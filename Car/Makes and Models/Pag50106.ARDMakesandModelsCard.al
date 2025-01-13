page 50106 "ARD Makes and Models Card"
{
    ApplicationArea = All;
    Caption = 'Makes and Models Card';
    PageType = Card;
    SourceTable = "ARD Makes and Models";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                // field(ID; Rec.ID)
                // {
                // ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                // }
                field(Make; Rec.CarMake)
                {
                    ToolTip = 'Specifies the value of the Make field.', Comment = '%';
                }
                field(Model; Rec.CarModel)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
            }
        }
    }
}
