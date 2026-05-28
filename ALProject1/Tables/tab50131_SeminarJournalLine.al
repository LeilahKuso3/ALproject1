table 50131 "CSD Seminar Journal Line"
{
    Caption = 'Seminar Journal Line';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Journal Template Name"; Code[10])
        {
            Caption = 'Journal Template Name';
        }

        field(2; "Journal Batch Name"; Code[10])
        {
            Caption = 'Journal Batch Name';
        }

        field(3; "Line No."; Integer)
        {
            Caption = 'Line No.';
        }

        field(4; "Posting Date"; Date)
        {
            Caption = 'Posting Date';

            trigger OnValidate()
            begin
                Validate("Document Date", "Posting Date");
            end;
        }

        field(5; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }

        field(6; "Seminar No."; Code[20])
        {
            Caption = 'Seminar No.';
        }

        field(7; Quantity; Decimal)
        {
            Caption = 'Quantity';
        }
        field(8; "Charge Type"; Option)
        {
            OptionMembers = Instructor,Room,Participant;
        }

        field(9; Chargeable; Boolean)
        {
        }

        field(10; "Bill-to Customer No."; Code[20])
        {
        }
        field(11; "Instructor Resource No."; Code[20]) { }
        field(12; "Room Resource No."; Code[20]) { }
        field(13; "Participant Contact No."; Code[20]) { }
        field(14; "Document No."; Code[20])
        {
            Caption = 'Document No.';
        }

        field(15; "Source Code"; Code[10])
        {
            Caption = 'Source Code';
        }

        field(16; "Reason Code"; Code[10])
        {
            Caption = 'Reason Code';
        }

        field(17; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
        }
        field(18; Description; Text[100])
        {
            Caption = 'Description';
        }
    }

    keys
    {
        key(PK; "Journal Template Name", "Journal Batch Name", "Line No.")
        {
            Clustered = true;
        }
    }

    procedure EmptyLine(): Boolean
    begin
        exit(("Seminar No." = '') AND (Quantity = 0));
    end;
}