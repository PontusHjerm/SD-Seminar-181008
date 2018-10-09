report 50101 SeminarParticipantsList
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    DefaultLayout = RDLC;

    dataset
    {
        dataitem(Seminar; "CSD Seminar Reg. Header")
        {
            DataItemTableView = sorting ("No.");
            RequestFilterFields = "No.", "Seminar No.";
            column(No_; "No.")
            {
                IncludeCaption = true;
            }
            column(Room; "Room Name")
            {
                IncludeCaption = true;
            }
            dataitem("RegistrationLine"; "CSD Seminar Registration Line")
            {
                DataItemTableView = sorting ("Document No.", "Line No.");
                DataItemLink = "Document No." = field ("No.");
                column(Bill_to_Customer_No_; "Bill-to Customer No.")
                {

                }
                column(Participant_Contact_No_; "Participant Contact No.")
                {

                }
                column(Participant_Name; "Participant Name")
                {

                }
            }
        }
        dataitem("Company Information"; "Company Information")
        {
            column(Company_Name; Name)
            {

            }
        }
    }
    labels
    {
        SeminarRegistrationHeaderCap = 'Seminar Registration List';
    }
}