page 50100 "CSD Seminar Setup"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    InsertAllowed = false;
    Caption = 'Seminar Setup';
    DeleteAllowed = false;


    layout
    {
        area(Content)
        {
            group(Numbering)
            {
                field("Seminar Nos."; "Seminar Nos.")
                {
                    
                    
                }
                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.")
                {
                    
                    
                }
                field("Seminar Registration Nos."; "Seminar Registration Nos.")
                {
                    
                    
                }
            }
        }
    }
    trigger OnOpenPage()
    begin
        IF not get then
            insert(true);    
    end;

}