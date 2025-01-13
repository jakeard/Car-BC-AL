page 50100 "ARD Car Card"
{
    ApplicationArea = All;
    Caption = 'Car Card';
    PageType = Card;
    SourceTable = "ARD Car";


    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';
                field(VIN; Rec.VIN)
                {
                    ToolTip = 'Specifies the value of the VIN field.', Comment = '%';
                }

                field(Make; Rec.Make)
                {
                    ToolTip = 'Specifies the value of the Make field.', Comment = '%';
                    // Lookup = true;
                    // LookupPageId = "ARD Makes and Models List";
                    // LookupPageId = "ARD Makes and Models List";

                    // trigger on

                    // trigger OnLookup(var Text: Text): Boolean
                    // var
                    //     MakeRec: Record "ARD Makes and Models";
                    // // Models: Record "Makes and Models"
                    // begin
                    // end;
                }
                field(Model; Rec.Model)
                {
                    ToolTip = 'Specifies the value of the Model field.', Comment = '%';
                    // LookupPageId = "ARD Makes and Models List";
                }
                field(Year; Rec.Year)
                {
                    ToolTip = 'Specifies the value of the Year field', Comment = '%';
                }
            }

            group(CarInfo)
            {
                Caption = 'Car Information';

                field(Cost; Rec.Cost)
                {
                    ToolTip = 'Value of the Cost field.', Comment = '%';
                }
                field(Miles; Rec.Miles)
                {
                    ToolTip = 'Specifies the value of the Miles field.', Comment = '%';
                }
                field(Color; Rec.Color)
                {
                    ToolTip = 'Specifies the value of the Color field.', Comment = '%';
                }
                field(Condition; Rec.Quality)
                {
                    ToolTip = 'Specifies the value of the Condition field.', Comment = '%';
                }

                field(BuildDate; Rec.BuildDate)
                {
                    ToolTip = 'Specifies the value of the BuildDate field.', Comment = '%';
                }
            }

            group(SellerInfo)
            {
                Caption = 'Seller Information';

                field(SellerName; Rec.Company)
                {
                    ToolTip = 'Specifies the value of the Company field.', Comment = '%';
                    Lookup = true;
                }
            }
        }
    }
    var
        Other: Text[50];
}
