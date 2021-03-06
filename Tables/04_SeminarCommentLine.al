table 50104 "CSD Seminar Comment Line"
{
    DrillDownPageId = 50107;
    LookupPageId = 50107;

    fields
    {
        field(10; "Table Name"; Option)
        {
            OptionMembers = "Seminar","Seminar Registration","Posted Seminar Registration";
        }
        field(20; "Document Line No."; Integer)
        {

        }
        field(30; "No."; Code[20])
        {
            TableRelation = if ("Table Name" = CONST (Seminar)) "CSD Seminar"
            else
            if ("Table Name" = const ("Seminar Registration")) "CSD Seminar Reg. Header";
        }
        field(40; "Line No."; Integer)
        {
        }
        field(50; "Date"; Date)
        {

        }
        field(60; "Code"; Code[10])
        {

        }
        field(70; Comment; text[80])
        {

        }
    }

    keys
    {
        key(PK; "Table Name", "Document Line No.", "Line No.")
        {
            Clustered = true;
        }
    }

    procedure SetupNewLine()
    var
        SeminarCommentLine: Record "CSD Seminar Comment Line";
    begin
        SeminarCommentLine.SetRange("Table Name", "Table Name");
        SeminarCommentLine.SetRange("No.", "No.");
        SeminarCommentLine.SetRange("Document Line No.", "Document Line No.");
        SeminarCommentLine.SetRange("Date", WorkDate);
        if SeminarCommentLine.IsEmpty() then
            "Date" := WorkDate();
    end;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}