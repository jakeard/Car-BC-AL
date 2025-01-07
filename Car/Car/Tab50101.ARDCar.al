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
            // MinValue = DMY2Date(1, 1, Year - 1);
            // trigger OnValidate()
            // var
            // CurrentDate: Today;
            // MinDate: Date;
            // MaxDate: Date;

            // begin
            //     MinDate := DMY2Date(1, 1, Year - 1);
            //     MaxDate := DMY2Date(31, 12, Year);
            //     // CurrentDate := Today;
            //     if (Year > MaxDate) or (Today < MinDate)
            // end;
            trigger OnValidate()
            var
                MinDate: Date;
                MaxDate: Date;
            begin
                if Year = 0 then begin
                    Message('You must enter a year before entering the build date.');
                    BuildDate := 0D;
                end
                else begin
                    MinDate := DMY2Date(1, 1, Year - 1);
                    MaxDate := DMY2Date(31, 12, Year);
                    if (BuildDate < MinDate) or (BuildDate > MaxDate) then begin
                        Message('Please enter a valid build date.');
                        BuildDate := 0D;
                    end;
                end;
            end;

        }
        field(8; Year; Integer)
        {
            Caption = 'Year';
            BlankZero = true;
            MinValue = 1885;

            trigger OnValidate()
            var
                CurrentYear: Integer;
                MinDate: Date;
                MaxDate: Date;
            begin
                CurrentYear := Date2DMY(Today, 3);
                if Year > CurrentYear + 1 then begin
                    Message('Please enter a valid car model year.');
                    Year := CurrentYear;
                end;
            end;
        }
        field(9; SellerID; Code[20])
        {
            Caption = 'SellerID';
            TableRelation = "ARD Seller".ID;
            ObsoleteState = Removed;
            ObsoleteReason = 'Company name used instead of sellerID.';
        }
        field(10; Company; Text[300])
        {
            Caption = 'Company';
            TableRelation = "ARD Car Seller".Company;

            // trigger OnValidate() // Adds 1 to the specified company's car count per car that is added
            // var
            //     Seller: Record "ARD Car Seller";
            // begin
            //     // MESSAGE('Company value: %1', Company);
            //     // if Company = '' then
            //     //     exit;

            //     Seller.Get(Company);
            //     Seller.CarCount := Seller.CarCount + 1;
            //     Seller.Modify();
            // end;
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