page 50124 "CSD Seminar Ledger Entries"
// CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 7 - Lab 2-9 
{
    PageType = List;
    SourceTable = "CSD Seminar Ledger Entry";
    Caption = 'Seminar Ledger Entries';
    ApplicationArea = All;
    UsageCategory = Lists;
    Editable = false;

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field("Entry No."; Rec."Entry No.") { }
                field("Seminar No."; Rec."Seminar No.") { }
                field("Posting Date"; Rec."Posting Date") { }
                field("Document Date"; Rec."Document Date") { }
                field("Document No."; Rec."Document No.") { }
                field(Description; Rec.Description) { }
                field("Bill-to Customer No."; Rec."Bill-to Customer No.") { }
                field("Charge Type"; Rec."Charge Type") { }
                field(Quantity; Rec.Quantity) { }
                field("Unit Price"; Rec."Unit Price") { }
                field("Total Price"; Rec."Total Price") { }
                field(Chargeable; Rec.Chargeable) { }
                field("Participant Contact No."; Rec."Participant Contact No.") { }
                field("Instructor Resource No."; Rec."Instructor Resource No.") { }
                field("Room Resource No."; Rec."Room Resource No.") { }
                field("Source Code"; Rec."Source Code") { }
                field("Reason Code"; Rec."Reason Code") { }
                field("No. Series"; Rec."No. Series") { }
                field("User ID"; Rec."User ID") { }
            }
        }

        area(FactBoxes)
        {
            systempart(RecordLinks; Links)
            {
                ApplicationArea = All;
            }

            systempart(Notes; Notes)
            {
                ApplicationArea = All;
            }
        }
    }
}