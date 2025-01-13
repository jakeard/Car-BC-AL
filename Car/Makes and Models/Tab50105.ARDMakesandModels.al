table 50105 "ARD Makes and Models"
{
    Caption = 'ARD Makes and Models';
    DataClassification = ToBeClassified;
    LookupPageId = "ARD Makes and Models List";
    DrillDownPageId = "ARD Makes and Models List";


    fields
    {
        field(1; ID; Integer)
        {
            Caption = 'ID';
            Editable = false;
            AutoIncrement = true;
        }
        field(2; Make; Text[200])
        {
            Caption = 'Make';
            ObsoleteState = Removed;
            ObsoleteReason = 'Wrong data length.';
        }
        field(3; Model; Text[200])
        {
            Caption = 'Model';
            ObsoleteState = Removed;
            ObsoleteReason = 'Wrong data length.';
        }
        field(4; CarMake; Text[50])
        {
            Caption = 'Make';
            // trigger OnLookup()
            // trigger OnLookup()
            // var
            //     MakesRec: Record "ARD Makes and Models";
            // begin

            // end;
        }
        field(5; CarModel; Text[50])
        {
            Caption = 'Model';
        }
    }
    keys
    {
        key(PK; ID)
        {
            Clustered = true;
        }
        key(Make; CarMake)
        {
            Clustered = false;
        }
        key(MakeAndModel; CarMake, CarModel)
        {
            Clustered = false;
        }
    }
}
