table 50100 "CSD Seminar Setup"
{
    Caption = 'Seminar Setup';
    LookupPageId = 50100;


    fields
    {
        field(10; "Primary Key"; Code[10])
        {

        }

        field(20; "Seminar Nos."; Code[20])
        {
            TableRelation = "No. Series";
        }
        field(30; "Seminar Registration Nos."; Code[20])
        {

        }
        field(40; "Posted Seminar Reg. Nos."; Code[20])
        {

        }

    }

    keys
    {
        key(PK; "Primary Key")
        {
            Clustered = true;
        }
    }

}