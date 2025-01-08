page 50101 "ARD Car List"
{
    ApplicationArea = All;
    Caption = 'Car List';
    PageType = List;
    SourceTable = "ARD Car";
    UsageCategory = Lists;
    CardPageId = "ARD Car Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.', Comment = '%';
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field.', Comment = '%';
                }
                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Value of the Cost field.', Comment = '%';
                }
            }
        }
    }
}
