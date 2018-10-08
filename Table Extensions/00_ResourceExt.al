tableextension 50100 "CSD RecourceExt" extends Resource
// CSD1.00 - 2018-10-08 - D. E. Veloper
{
    fields
    {
        modify("Profit %")
        {
            trigger OnAfterValidate()
            begin
                testfield("Unit Cost");
            end;
        }
        modify(Type)
        {
            OptionCaption = 'Instructor,Room';
        }
        field(50101; "CSD Recource Type"; Option)
        {

            OptionMembers = Internal,External;
        }
        field(50102; "CSD Maximum Participants"; Integer)
        {

        }
        field(50103; "CSD Quantity Per Day"; Decimal)
        {

        }
    }
}