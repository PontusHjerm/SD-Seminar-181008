page 50106 "CSD Seminar Comment Sheet"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Comment Line";
    AutoSplitKey = true;
    caption='Seminar Comment Sheet';
    layout
    {
        area(Content)
        {
            repeater("Seminar Comment Sheet")
            {
                field("Date"; "Date")
                {
                }
                field("Code"; "Code")
                {
                    Visible = false;
                }
                field(Comment; Comment)
                {
                }
            }
        }
    }

    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction()
                begin

                end;
            }
        }
    }
    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        SetupNewLine();
    end;

    var
        myInt: Integer;
}