page 50102 "CSD Seminar List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = "CSD Seminar";
    Caption = 'Seminar List';
    Editable = false;
    CardPageId = 50101;
    layout
    {
        area(Content)
        {
            repeater("Group")
            {
                field("No."; "No.")
                {

                }
                field(Name; Name)
                {
                }
                field("Search Name"; "Search Name")
                {
                }
                field("Seminar Duration"; "Seminar Duration")
                {
                }
                field("Minimum Participants"; "Minimum Participants")
                {
                }
                field("Maximum Participants"; "Maximum Participants")
                {
                }
                field(Blocked; Blocked)
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }


                field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
                {

                }
                field("VAT Prod. Posting Group"; "VAT Prod. Posting Group")
                {

                }
                field("Seminar Price"; "Seminar Price")
                {

                }
            }
        }
        area(Factboxes)
        {
            systempart(Links; Links)
            {

            }
            systempart(Notes; Notes)
            {

            }
        }
    }


    actions
    {
        area(Navigation)
        {
            group("&Seminar")
            {
                action("Co&mments")
                {
                    //               RunObject=page "CSD Seminar Comment Sheet";
                    //               RunPageLink = "Table Name" = const(Seminar), "No."=field("No.");
                    Image = Comment;
                    Promoted = true;
                    PromotedIsBig = true;
                    PromotedOnly = true;
                }
            }
        }
    }