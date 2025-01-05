table 50104 "ARD Car Seller"
{
    Caption = 'ARD Car Seller';
    DataClassification = OrganizationIdentifiableInformation;
    LookupPageId = "ARD Seller List";
    DrillDownPageId = "Ard Seller List";

    fields
    {
        field(1; Company; Text[300])
        {
            Caption = 'Company';
        }
        field(2; Website; Code[300])
        {
            Caption = 'Website';
            ExtendedDatatype = URL;
        }
        field(3; PhoneNumber; Code[30])
        {
            Caption = 'Phone Number';
            ExtendedDatatype = PhoneNo;
        }
        field(4; Image; Media)
        {
            Caption = 'Image';
        }
        field(5; CarCount; Integer)
        {
            Caption = 'Number of Cars';
            MinValue = 0;
        }
        field(6; Cars; Integer)
        {
            Caption = 'Cars';
            FieldClass = FlowField;
            CalcFormula = Count("ARD Car" WHERE(Company = field(Company)));
            Editable = false;
        }
    }
    keys
    {
        key(PK; Company)
        {
            Clustered = true;
        }
    }
}
