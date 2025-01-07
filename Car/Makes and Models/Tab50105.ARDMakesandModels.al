table 50105 "ARD Makes and Models"
{
    Caption = 'ARD Makes and Models';
    DataClassification = ToBeClassified;

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
        }
        field(3; Model; Text[200])
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
    }
}
