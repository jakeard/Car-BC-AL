page 50107 "ARD Makes and Models List"
{
    ApplicationArea = All;
    Caption = 'Makes and Models List';
    PageType = List;
    SourceTable = "ARD Makes and Models";
    UsageCategory = Lists;
    CardPageId = "ARD Makes and Models Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                // field(ID; Rec.ID)
                // {
                //     ToolTip = 'Specifies the value of the ID field.', Comment = '%';
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
