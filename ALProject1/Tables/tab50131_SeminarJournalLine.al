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