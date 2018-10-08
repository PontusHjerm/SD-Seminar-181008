pageextension 50101 "CSD ResourceListExt" extends "Resource List"
{
    layout
    {
        addafter(type)
        {
            field("CSD Recource Type"; "CSD Recource Type")
            {
                Visible = ShowType;
            }
            field("CSD Maximum Participants"; "CSD Maximum Participants")
            {
                Visible = ShowMaxField;
            }
        }
    }

    trigger OnopenPage()
    begin
        FilterGroup(3);
        ShowType := (GetFilter(type) = '');
        ShowMaxField := GetFilter(Type) = Format(Type::Machine);
        FilterGroup(0);
    end;

    var
        [InDataSet]
        ShowMaxField: Boolean
            ShowType: Boolean
}