using {managed} from '@sap/cds/common';

namespace golf;

entity Rounds : managed {
    key ID    : UUID;
        title : String(111);
        holes : Composition of Holes
                    on holes.round = $self;
}

entity Holes {
    key ID     : UUID;
        score  : Integer;
        par    : Integer enum {
            three = 3;
            four  = 4;
            five  = 5;
        };
        result : String;
        round  : Association to Rounds;
        shots  : Composition of Shots
                     on shots.hole = $self;
}

entity Shots {
    key ID   : UUID;
        hole : Association to Holes;
}
