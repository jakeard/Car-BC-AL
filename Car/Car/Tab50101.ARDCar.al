table 50101 "ARD Car"
{
    Caption = 'ARD Car';
    DataClassification = CustomerContent;
    LookupPageId = "ARD Car List";
    DrillDownPageId = "Ard Car List";

    fields
    {
        field(1; VIN; Code[17])
        {
            Caption = 'VIN';
            NotBlank = true;
        }
        field(2; Make; Text[50])
        {
            Caption = 'Make';
        }
        field(3; Model; Text[50])
        {
            Caption = 'Model';
        }
        field(4; Miles; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Miles';
            MinValue = 0;
        }
        field(5; Condition; Text[500])
        {
            Caption = 'Condition';
        }
        field(6; Color; Text[100])
        {
            Caption = 'Color';
        }
        field(7; BuildDate; Date)
        {
            Caption = 'Build Date';
        }
        field(8; Year; Integer)
        {
            Caption = 'Year';
            BlankZero = true;
            MinValue = 1900;
            MaxValue = 2100;
        }
        field(9; SellerID; Code[20])
        {
            Caption = 'SellerID';
            TableRelation = "ARD Seller".ID;
        }
        field(10; Company; Text[300])
        {
            Caption = 'Company';
            TableRelation = "ARD Car Seller".Company;

            trigger OnValidate() // Adds 1 to the specified company's car count per car that is added
            var
                Seller: Record "ARD Car Seller";
            begin
                // MESSAGE('Company value: %1', Company);
                // if Company = '' then
                //     exit;

                Seller.Get(Company);
                Seller.CarCount := Seller.CarCount + 1;
                Seller.Modify();
            end;
        }
    }
    keys
    {
        key(PK; VIN)
        {
            Clustered = true;
        }
    }
}
