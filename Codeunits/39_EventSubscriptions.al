codeunit 50139 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(ObjectType::page, Page::Navigate, 'OnAfterNavigateFindRecords', '', true, true)]
    procedure PageNavigateOnAfterNavigateFindRecords(VAR DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
        PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
        DocNoOfRecords := PostedSeminarRegHeader.Count;
        if DocNoOfRecords > 0 then
            exit;
        with DocumentEntry do begin
            if FindLast() then
                NextEntryNo := "Entry No." + 1
            else
                NextEntryNo := 1;
            Init;
            "Entry No." := NextEntryNo;
            "Table ID" := Database::"CSD Posted Seminar Reg. Header";
            "Document Type" := 0;
            "Table Name" := CopyStr(PostedSeminarRegHeader.TableCaption(), 1, maxstrlen("Table Name"));
            "No. of Records" := DocNoOfRecords;
            insert;
        end;

        SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
        SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
        DocNoOfRecords := SeminarLedgerEntry.Count;
        if DocNoOfRecords > 0 then
            exit;
        with DocumentEntry do begin
            if FindLast() then
                NextEntryNo := "Entry No." + 1
            else
                NextEntryNo := 1;
            Init;
            "Entry No." := NextEntryNo;
            "Table ID" := Database::"CSD Seminar Ledger Entry";
            "Document Type" := 0;
            "Table Name" := CopyStr(SeminarLedgerEntry.TableCaption(), 1, maxstrlen("Table Name"));
            "No. of Records" := DocNoOfRecords;
            insert;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateShowRecords', '', true, true)]
    procedure PageNavigateOnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean; VAR TempDocumentEntry: Record "Document Entry")
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
    begin
        case TableID of
            Database::"CSD Posted Seminar Reg. Header":
                begin
                    PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
                    PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
                    page.Run(0, PostedSeminarRegHeader);
                end;
            Database::"CSD Seminar Ledger Entry":
                begin
                    SeminarLedgerEntry.SetFilter("Document No.", DocNoFilter);
                    SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
                    page.run(0, SeminarLedgerEntry);
                end;
        end;
    end;
}
