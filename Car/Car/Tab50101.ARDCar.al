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
            trigger OnValidate()
            begin
                if Miles > 1000001 then
                    Error('The entered value is too high. Please enter a valid number of miles. Value: %1', Miles);
            end;
        }
        field(5; Condition; Text[500])
        {
            Caption = 'Condition';
            ObsoleteState = Removed;
            ObsoleteReason = 'Moved to enum, is now field under name Quality.';

        }
        field(6; Color; Text[100])
        {
            Caption = 'Color';
        }
        field(7; BuildDate; Date)
        {
            Caption = 'Build Date';
            trigger OnValidate()
            var
                MinDate: Date;
                MaxDate: Date;
            begin
                if (Year < 1885) or (Year > Date2DMY(Today, 3) + 1) then begin
                    Error('You must enter a valid year before entering the build date.');
                end
                else begin
                    MinDate := DMY2Date(1, 1, Year - 1);
                    MaxDate := DMY2Date(31, 12, Year);
                    if (BuildDate < MinDate) or (BuildDate > MaxDate) then begin
                        Error('Please enter a valid build date.');
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
                    Error('Please enter a valid car model year. Value: %1', Year);
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
        }
        field(11; Price; Integer)
        {
            Caption = 'Price';
            MinValue = 0;
            ObsoleteState = Removed;
            ObsoleteReason = 'Wrong data type, replaced by Cost.';
        }
        field(12; Cost; Decimal)
        {
            Caption = 'Price';
            MinValue = 0;
            DecimalPlaces = 2;
        }
        field(13; Quality; Enum "ARD Car Condition")
        {
            Caption = 'Condition';

            // trigger OnValidate()
            // begin
            //     if Quality = Quality::None then
            //         Error('You must choose a car condition.');
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