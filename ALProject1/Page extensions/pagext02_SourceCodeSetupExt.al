pageextension 50102 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    layout
    {
        addafter("Cost Accounting")
        {
            group("CSD SeminarGroup")
            {
                Caption = 'Seminar';

                field("CSD Seminar"; Rec."CSD Seminar")
                {
                    ApplicationArea = All;
                }
            }
        }
    }
}