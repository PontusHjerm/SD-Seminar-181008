pageextension 50100 "CSD ResourceCardExt" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Recource Type";"CSD Recource Type")
            {
            }
            field("CSD Quantity Per Day";"CSD Quantity Per Day")
            {

            }
        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';
                Visible = ShowRoom;
                field("CSD Maximum Participants";"CSD Maximum Participants")
                {

                }
            }
        }
    }
    trigger OnAfterGetRecord()
    begin
        ShowRoom:= Type = Type::Machine;
        CurrPage.Update(false);    
    end;
    
    var
        [InDataSet]
        ShowRoom:Boolean;
    
}