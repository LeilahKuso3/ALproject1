tableextension 50101 "CSD SourceCodeSetupExt" extends "Source Code Setup"
{
    fields
    {
        field(50100; "CSD Seminar"; Code[10])
        {
            Caption = 'Seminar';
            TableRelation = "Source Code";
        }
    }
}