using {golf} from '../db/schema';
using {RemoteService as external} from './external/RemoteService';

service CatalogService @(path: '/browse') {
    entity Rounds  as projection on golf.Rounds;
    entity Holes   as projection on golf.Holes;
    entity Shots   as projection on golf.Shots;
    entity Players as projection on external.Players;
}
