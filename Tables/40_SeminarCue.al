table 50140 "CSD Seminar Cue"
{

    fields
    {
        field(10; "Primary Key"; Integer)
        {
            Caption = 'Primary key';

        }
        field(20; Planned; Integer)
        {
            Caption = 'Planned';
            FieldClass = FlowField;
            CalcFormula = Count ("CSD Seminar Reg. Header" where (Status = const (Planning)));
        }
        field(30; Registered; Integer)
        {
            Caption = 'Registered';
            FieldClass = FlowField;
            CalcFormula = Count ("CSD Seminar Reg. Header" where (Status = const (Registration)));
        }
        field(40; Closed; Integer)
        {
            Caption = 'Closed';
            FieldClass = FlowField;
            CalcFormula = Count ("CSD Seminar Reg. Header" where (Status = const (Closed)));
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