page 50103 "ARD Seller List"
{
    ApplicationArea = All;
    Caption = 'Seller List';
    PageType = List;
    SourceTable = "ARD Car Seller";
    UsageCategory = Lists;
    CardPageId = "ARD Seller Card";
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.', Comment = '%';
                }
                field(Website; Rec.Website)
                {
                    ToolTip = 'Specifies the value of the Website field', Comment = '%';
                }
            }
        }
    }
}
