table 50133 "CSD Seminar Register"
{
    Caption = 'Seminar Register';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "No."; Integer)
        {
            Caption = 'No.';
        }

        field(2; "From Entry No."; Integer)
        {
            Caption = 'From Entry No.';
        }

        field(3; "To Entry No."; Integer)
        {
            Caption = 'To Entry No.';
        }

        field(4; "Creation Date"; Date)
        {
            Caption = 'Creation Date';
        }

        field(5; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
        }

        field(6; "User ID"; Code[50])
        {
            Caption = 'User ID';
        }

        field(7; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }
}