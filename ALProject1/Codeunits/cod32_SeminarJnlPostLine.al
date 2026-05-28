codeunit 50132 "CSD Seminar Jnl.-Post Line"
// CSD1.00 - 2018-01-01 - D. E. Veloper 
// Chapter 7 - Lab 2-8 
{
    TableNo = "CSD Seminar Journal Line";

    trigger OnRun()
    begin
        RunWithCheck(Rec);
    end;

    var
        SeminarJnlLine: Record "CSD Seminar Journal Line";
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        SeminarRegister: Record "CSD Seminar Register";
        SeminarJnlCheckLine: Codeunit "CSD Seminar Jnl.-Check Line";

        NextEntryNo: Integer;

    procedure RunWithCheck(var SeminarJnlLine2: Record "CSD Seminar Journal Line")
    begin
        SeminarJnlLine := SeminarJnlLine2;
        Code();
        SeminarJnlLine2 := SeminarJnlLine;
    end;

    local procedure Code()
    begin
        // 1. Exit if empty
        if SeminarJnlLine.EmptyLine() then
            exit;

        // 2. Run validation
        SeminarJnlCheckLine.RunCheck(SeminarJnlLine);

        // 3. Get Next Entry No.
        if NextEntryNo = 0 then begin
            SeminarLedgerEntry.LockTable();

            if SeminarLedgerEntry.FindLast() then
                NextEntryNo := SeminarLedgerEntry."Entry No.";

            NextEntryNo := NextEntryNo + 1;
        end;

        // 4. Default Document Date
        if SeminarJnlLine."Document Date" = 0D then
            SeminarJnlLine."Document Date" := SeminarJnlLine."Posting Date";

        // 5. Register handling
        if SeminarRegister."No." = 0 then begin
            SeminarRegister.LockTable();

            if (not SeminarRegister.FindLast()) or
               (SeminarRegister."To Entry No." <> 0) then begin

                SeminarRegister.Init();

                SeminarRegister."No." := SeminarRegister."No." + 1;
                SeminarRegister."From Entry No." := NextEntryNo;
                SeminarRegister."To Entry No." := NextEntryNo;
                SeminarRegister."Creation Date" := Today;
                SeminarRegister."Source Code" := SeminarJnlLine."Source Code";
                SeminarRegister."Journal Batch Name" := SeminarJnlLine."Journal Batch Name";
                SeminarRegister."User ID" := UserId;

                SeminarRegister.Insert();
            end;
        end;

        SeminarRegister."To Entry No." := NextEntryNo;
        SeminarRegister.Modify();

        // 6. Create Ledger Entry
        SeminarLedgerEntry.Init();

        SeminarLedgerEntry."Entry No." := NextEntryNo;

        SeminarLedgerEntry."Seminar No." := SeminarJnlLine."Seminar No.";
        SeminarLedgerEntry."Posting Date" := SeminarJnlLine."Posting Date";
        SeminarLedgerEntry."Document Date" := SeminarJnlLine."Document Date";
        SeminarLedgerEntry."Document No." := SeminarJnlLine."Document No.";
        SeminarLedgerEntry.Description := SeminarJnlLine.Description;

        SeminarLedgerEntry."Bill-to Customer No." := SeminarJnlLine."Bill-to Customer No.";
        SeminarLedgerEntry."Charge Type" := SeminarJnlLine."Charge Type";
        SeminarLedgerEntry.Chargeable := SeminarJnlLine.Chargeable;
        SeminarLedgerEntry."Participant Contact No." := SeminarJnlLine."Participant Contact No.";
        SeminarLedgerEntry."Instructor Resource No." := SeminarJnlLine."Instructor Resource No.";
        SeminarLedgerEntry."Room Resource No." := SeminarJnlLine."Room Resource No.";
        SeminarLedgerEntry.Quantity := SeminarJnlLine.Quantity;

        SeminarLedgerEntry."Source Code" := SeminarJnlLine."Source Code";
        SeminarLedgerEntry."Reason Code" := SeminarJnlLine."Reason Code";
        SeminarLedgerEntry."No. Series" := SeminarJnlLine."No. Series";
        SeminarLedgerEntry."User ID" := UserId;

        SeminarLedgerEntry.Insert();

        NextEntryNo := NextEntryNo + 1;

        // 7. Final register update
        SeminarRegister."To Entry No." := NextEntryNo - 1;
        SeminarRegister.Modify();
    end;
}
