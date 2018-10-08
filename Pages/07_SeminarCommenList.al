page 50107 "CSD Seminar Comment List"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Comment";
    Editable=false;
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

    var
        myInt: Integer;
}