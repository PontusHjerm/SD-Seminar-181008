table 50101 "CSD Seminar"
{
    DrillDownPageId = 50102;
    LookupPageId = 50102;

    fields
    {
        field(10; "No."; Code[20])
        {
            trigger OnValidate()
            begin
                SeminarSetup.Get;
                NoSeriesMgt.TestManual(SeminarSetup."Seminar Nos.");
                "No. Series" := '';
            end;
        }
        field(20; Name; Text[50])
        {
            trigger Onvalidate()
            begin
                if "Search Name" = '' then
                    "Search Name" := Name;
            end;
        }
        field(30; "Seminar Duration"; Decimal)
        {
        }
        field(40; "Minimum Participants"; Integer)
        {
        }
        field(50; "Maximum Participants"; Integer)
        {
        }
        field(60; "Search Name"; Code[50])
        {
        }
        field(70; Blocked; Boolean)
        {
        }
        field(80; "Last Date Modified"; Date)
        {
            Editable = false;
        }
        field(90; "Comment"; Boolean)
        {
            Editable = false;
            //FieldClass=FlowField
            //CalcFormula=exist("Seminar Comment Line" where("Table Name"= const("Seminar", "no." =Field("no.")));
        }
        field(100; "Seminar Price"; decimal)
        {
            AutoFormatType = 1;
        }
        field(110; "Gen. Prod. Posting Group"; Code[10])
        {
            TableRelation = "Gen. Product Posting Group";
            trigger OnValidate()
            begin
                if "Gen. Prod. Posting Group" <> '' then begin
                    GenProdPostingGroup.GET("Gen. Prod. Posting Group");
                    if GenProdPostingGroup.ValidateVatProdPostingGroup(GenProdPostingGroup, "Gen. Prod. Posting Group") then
                        Validate("VAT Prod. Posting Group", GenProdPostingGroup."Def. VAT Prod. Posting Group");
                end;
            end;
        }
        field(120; "VAT Prod. Posting Group"; Code[10])
        {

        }
        field(130; "No. Series"; Code[10])
        {
            TableRelation = "No. Series";
            Editable = false;
        }

    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
        key(Key1; "Search Name")
        {

        }
    }
    trigger OnInsert()
    begin
        if "No." = '' then begin
            SeminarSetup.GET;
            SeminarSetup.TestField("Seminar Nos.");
            NoSeriesMgt.InitSeries(SeminarSetup."Seminar Nos.",
            xRec."No. Series", TODAY, "No.", "No. Series");

        end;
    end;

    trigger OnModify()
    begin
        "Last Date Modified" := TODAY;
    end;

    trigger OnDelete()
    begin
        //CommentLine.Reset;
        //CommentLine.SETRANGE("Tale Name", CommentLine."TableName"::Seminar);
        //CommentLine.Setrange("No.", "No.");
        //CommentLine.DELETEALL;
    end;

    var
        SeminarSetup: Record "CSD Seminar Setup";
        //CommentLine : record "CSD Seminar Comment Line"
        Seminar: Record "CSD Seminar";
        GenProdPostingGroup: Record "Gen. Product Posting Group";
        NoSeriesMgt: Codeunit NoSeriesManagement;

    procedure AssistEdit(): boolean
    begin
        SeminarSetup.GET;
        SeminarSetup.TestField("Seminar Nos.");
        IF NoSeriesMgt.SelectSeries(SeminarSetup."Seminar Nos.", xRec."No. Series", "No. Series") then begin
            NoSeriesMgt.SetSeries("No.");
            exit(true);
        end;

    end;
}