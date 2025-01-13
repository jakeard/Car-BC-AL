table 50106 "ARD Makes and Models 2"
{
    Caption = 'ARD Makes and Models 2';
    DataClassification = ToBeClassified;
    // LookupPageId = "ARD Makes and Models List";
    // DrillDownPageId = "ARD Makes and Models List";

    fields
    {
        field(1; Make; Text[50])
        {
            Caption = 'Make';
        }
        field(2; Model; Text[50])
        {
            Caption = 'Model';
        }
    }
    keys
    {
        key(PK; Make, Model)
        {
            Clustered = true;
        }
    }
}
