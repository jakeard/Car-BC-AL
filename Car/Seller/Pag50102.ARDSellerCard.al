page 50102 "ARD Seller Card"
{
    ApplicationArea = All;
    Caption = 'Seller Card';
    PageType = Card;
    SourceTable = "ARD Car Seller";

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(Company; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.', Comment = '%';
                }
                field(Website; Rec.Website)
                {
                    ToolTip = 'Specifies the value of the Website field', Comment = '%';
                }
                field(PhoneNumber; Rec.PhoneNumber)
                {
                    ToolTip = 'Specifies the value of the PhoneNumber field', Comment = '%';
                }
                field(Image; Rec.Image)
                {
                    ToolTip = 'Specifies the value of the Image field', Comment = '%';
                }
            }
            group(OtherInfo)
            {
                Caption = 'Other Information';
                field(CarCount; Rec.NoCars)
                {
                    ToolTip = 'Car Count field value', Comment = '%';
                }
                // field(Cars; Rec.Cars)
                // {
                //     ToolTip = 'Car count', Comment = '%';
                //     // Editable = false;
                // }
            }
        }
    }
}
