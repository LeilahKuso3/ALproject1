table 50132 "CSD Seminar Ledger Entry"
{
    Caption = 'Seminar Ledger Entry';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Entry No."; Integer)
        {
            Caption = 'Entry No.';
        }

        field(2; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
        }

        field(3; "Posting Date"; Date)
        {
            Caption = 'Posting Date';
        }

        field(4; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }

        field(5; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(6; Description; Text[50])
        {
            Caption = 'Description';
        }

        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }

        field(8; "Bill-to Customer No."; Code[20])
        {
            Caption = 'Bill-to Customer No.';
            TableRelation = Customer;
        }

        field(9; "Charge Type"; Option)
        {
            Caption = 'Charge Type';
            OptionMembers = Instructor,Room,Participant;
        }

        field(10; Chargeable; Boolean)
        {
            Caption = 'Chargeable';
        }

        field(11; "Participant Contact No."; Code[20])
        {
            Caption = 'Participant Contact No.';
            TableRelation = Contact;
        }

        field(12; "Instructor Resource No."; Code[20])
        {
            Caption = 'Instructor Resource No.';
            TableRelation = Resource;
        }

        field(13; "Room Resource No."; Code[20])
        {
            Caption = 'Room Resource No.';
            TableRelation = Resource;
        }

        field(14; "Unit Price"; Decimal)
        {
            Caption = 'Unit Price';
        }

        field(15; "Total Price"; Decimal)
        {
            Caption = 'Total Price';
        }

        field(16; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
        }

        field(17; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
        }

        field(18; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }

        field(19; "User ID"; Code[50])
        {
            Caption = 'User ID';
            TableRelation = User."User Name";
            ValidateTableRelation = false;
        }
    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }
}
