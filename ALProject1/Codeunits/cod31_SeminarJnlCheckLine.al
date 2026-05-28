codeunit 50131 "CSD Seminar Jnl.-Check Line"
// CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 7 - Lab 2-1 
{
    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunCheck(Rec);
    end;

    var
        GlSetup: Record "General Ledger Setup";
        UserSetup: Record "User Setup";
        AllowPostingFrom: Date;
        AllowPostingTo: Date;

        ClosingDateTxt: Label 'cannot be a closing date.';
        PostingDateTxt: Label 'is not within your range of allowed posting dates.';

    procedure RunCheck(var SemJnlLine: Record "CSD Seminar Journal Line")
    begin

        // 1) Exit if line is empty
        if SemJnlLine.EmptyLine() then
            exit;

        // 2) Required fields must not be empty
        SemJnlLine.TestField("Posting Date");
        SemJnlLine.TestField("Seminar No.");

        // 3) Charge type validation
        case SemJnlLine."Charge Type" of
            SemJnlLine."Charge Type"::Instructor:
                SemJnlLine.TestField("Instructor Resource No.");

            SemJnlLine."Charge Type"::Room:
                SemJnlLine.TestField("Room Resource No.");

            SemJnlLine."Charge Type"::Participant:
                SemJnlLine.TestField("Participant Contact No.");
        end;

        // 4) Chargeable check
        if SemJnlLine.Chargeable then
            SemJnlLine.TestField("Bill-to Customer No.");

        // 5) Posting Date cannot be a closing date
        if SemJnlLine."Posting Date" = ClosingDate(SemJnlLine."Posting Date") then
            SemJnlLine.FieldError("Posting Date", ClosingDateTxt);

        // 6) Get posting date limits (User Setup or G/L Setup)
        if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin

            if UserId <> '' then
                if UserSetup.Get(UserId) then begin
                    AllowPostingFrom := UserSetup."Allow Posting From";
                    AllowPostingTo := UserSetup."Allow Posting To";
                end;

            if (AllowPostingFrom = 0D) and (AllowPostingTo = 0D) then begin
                GlSetup.Get;
                AllowPostingFrom := GlSetup."Allow Posting From";
                AllowPostingTo := GlSetup."Allow Posting To";
            end;

            if AllowPostingTo = 0D then
                AllowPostingTo := DMY2Date(31, 12, 9999);
        end;

        // 7) Check posting date range
        if (SemJnlLine."Posting Date" < AllowPostingFrom) or
           (SemJnlLine."Posting Date" > AllowPostingTo) then
            SemJnlLine.FieldError("Posting Date", PostingDateTxt);

        // 8) Document Date closing date check
        if (SemJnlLine."Document Date" <> 0D) then
            if (SemJnlLine."Document Date" = ClosingDate(SemJnlLine."Document Date")) then
                SemJnlLine.FieldError("Document Date", PostingDateTxt);

    end;
}