CREATE VIEW `betbrain`.`AllSportsOdds` as
select `FootballOdds`.`eventId` AS `eventId`,`FootballOdds`.`bettingOfferId` AS `bettingOfferId`,`FootballOdds`.`eventName` AS `eventName`,`FootballOdds`.`location` AS `location`,`FootballOdds`.`participantName` AS `participantName`,`FootballOdds`.`role` AS `role`,`FootballOdds`.`odds` AS `odds`,`FootballOdds`.`providerId` AS `providerId`,`FootballOdds`.`bookmaker` AS `bookmaker`,`FootballOdds`.`date` AS `date`,`FootballOdds`.`lastChangedTime` AS `lastChangedTime`,`FootballOdds`.`bettingTypeId` AS `bettingTypeId`,`FootballOdds`.`sportId` AS `sportId` from `betbrain`.`FootballOdds` union all select `TennisOdds`.`eventId` AS `eventId`,`TennisOdds`.`bettingOfferId` AS `bettingOfferId`,`TennisOdds`.`eventName` AS `eventName`,`TennisOdds`.`location` AS `location`,`TennisOdds`.`participantName` AS `participantName`,`TennisOdds`.`role` AS `role`,`TennisOdds`.`odds` AS `odds`,`TennisOdds`.`providerId` AS `providerId`,`TennisOdds`.`bookmaker` AS `bookmaker`,`TennisOdds`.`date` AS `date`,`TennisOdds`.`lastChangedTime` AS `lastChangedTime`,`TennisOdds`.`bettingTypeId` AS `bettingTypeId`,`TennisOdds`.`sportId` AS `sportId` from `betbrain`.`TennisOdds` union all select `BasketOdds`.`eventId` AS `eventId`,`BasketOdds`.`bettingOfferId` AS `bettingOfferId`,`BasketOdds`.`eventName` AS `eventName`,`BasketOdds`.`location` AS `location`,`BasketOdds`.`participantName` AS `participantName`,`BasketOdds`.`role` AS `role`,`BasketOdds`.`odds` AS `odds`,`BasketOdds`.`providerId` AS `providerId`,`BasketOdds`.`bookmaker` AS `bookmaker`,`BasketOdds`.`date` AS `date`,`BasketOdds`.`lastChangedTime` AS `lastChangedTime`,`BasketOdds`.`bettingTypeId` AS `bettingTypeId`,`BasketOdds`.`sportId` AS `sportId` from `betbrain`.`BasketOdds` union all select `BaseballOdds`.`eventId` AS `eventId`,`BaseballOdds`.`bettingOfferId` AS `bettingOfferId`,`BaseballOdds`.`eventName` AS `eventName`,`BaseballOdds`.`location` AS `location`,`BaseballOdds`.`participantName` AS `participantName`,`BaseballOdds`.`role` AS `role`,`BaseballOdds`.`odds` AS `odds`,`BaseballOdds`.`providerId` AS `providerId`,`BaseballOdds`.`bookmaker` AS `bookmaker`,`BaseballOdds`.`date` AS `date`,`BaseballOdds`.`lastChangedTime` AS `lastChangedTime`,`BaseballOdds`.`bettingTypeId` AS `bettingTypeId`,`BaseballOdds`.`sportId` AS `sportId` from `betbrain`.`BaseballOdds` union all select `IceHockeyOddsHA`.`eventId` AS `eventId`,`IceHockeyOddsHA`.`bettingOfferId` AS `bettingOfferId`,`IceHockeyOddsHA`.`eventName` AS `eventName`,`IceHockeyOddsHA`.`location` AS `location`,`IceHockeyOddsHA`.`participantName` AS `participantName`,`IceHockeyOddsHA`.`role` AS `role`,`IceHockeyOddsHA`.`odds` AS `odds`,`IceHockeyOddsHA`.`providerId` AS `providerId`,`IceHockeyOddsHA`.`bookmaker` AS `bookmaker`,`IceHockeyOddsHA`.`date` AS `date`,`IceHockeyOddsHA`.`lastChangedTime` AS `lastChangedTime`,`IceHockeyOddsHA`.`bettingTypeId` AS `bettingTypeId`,`IceHockeyOddsHA`.`sportId` AS `sportId` from `betbrain`.`IceHockeyOddsHA`


CREATE VIEW `betbrain`.`AllSportsOddsAPI` as
(select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where (`e`.`sportId` = 5)) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 9) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10) and (`bo`.`bettingTypeId` = 70) and (`o`.`eventPartId` = 70))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 8) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10) and (`bo`.`bettingTypeId` = 70) and (`o`.`eventPartId` = 60))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 1) and (`o`.`eventPartId` = 3) and (`e`.`typeId` = 1) and (`o`.`typeId` in (10,11)))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 6) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10) and (`bo`.`bettingTypeId` = 70) and (`o`.`eventPartId` = 40))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 3) and (`o`.`eventPartId` = 20) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10)))

#
CREATE VIEW `betbrain`.`AllSportsOddsAPI_466` as
(select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where (`e`.`sportId` = 5)) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 9) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 70))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 8) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 60))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 1) and (`o`.`eventPartId` = 3) and (`e`.`typeId` = 1) and (`o`.`typeId` in (10,11)))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 6) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 40))) union all (select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 3) and (`o`.`eventPartId` = 20) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10)))

CREATE TABLE `betbrain`.`AllSportsOddsSnapshot` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(255) NOT NULL, 
  `location` varchar(255) NOT NULL, 
  `participantName` varchar(255) DEFAULT NULL, 
  `role` varchar(16) DEFAULT NULL, 
  `odds` double DEFAULT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime DEFAULT NULL, 
  `lastChangedTime` datetime DEFAULT NULL, 
  `bettingTypeId` int(11) DEFAULT NULL, 
  `sportId` int(11) NOT NULL, 
KEY `eventIdIdx` (`eventId`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`AmericanFootballChampionshipDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `Campionato` varchar(4) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;

CREATE VIEW `betbrain`.`AmericanFootballMollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (utc_timestamp() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= utc_timestamp()) and (`betbrain`.`mollybet_event`.`sport` = 'af'))

CREATE VIEW `betbrain`.`AmericanFootballOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 5) and (`bo`.`bettingTypeId` = 466)) order by `bo`.`providerId`,`e`.`id`

CREATE TABLE `betbrain`.`BaseballChampionshipDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `Campionato` varchar(4) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;


CREATE VIEW `betbrain`.`BaseballOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (`e`.`sportId` = 9) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 70)) order by `bo`.`providerId`,`e`.`id`


CREATE VIEW `betbrain`.`BaseballOdds_Updated` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (`e`.`sportId` = 9) and (`e`.`typeId` = 1) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 70)) order by `bo`.`providerId`,`e`.`id`

CREATE TABLE `betbrain`.`BasketChampionshipDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `Campionato` varchar(4) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;

CREATE VIEW `betbrain`.`BasketMollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (utc_timestamp() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= utc_timestamp()) and (`betbrain`.`mollybet_event`.`sport` = 'basket'))

CREATE VIEW `betbrain`.`BasketOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 8) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 60)) order by `bo`.`providerId`,`e`.`id`

CREATE VIEW `betbrain`.`BasketOdds_Updated` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 8) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 60)) order by `bo`.`providerId`,`e`.`id`

CREATE TABLE `betbrain`.`BettingOffer` (
  `id` bigint(20) NOT NULL, 
  `providerId` bigint(20) NOT NULL, 
  `sourceId` bigint(20) DEFAULT NULL, 
  `outcomeId` bigint(20) DEFAULT NULL, 
  `bettingTypeId` bigint(20) DEFAULT NULL, 
  `statusId` bigint(20) DEFAULT NULL, 
  `odds` double DEFAULT NULL, 
  `lastChangedTime` datetime DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_outcomeId` (`outcomeId`),
KEY `idx_providerId` (`providerId`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`BookmakerDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `betbrain_name` varchar(100) NOT NULL, 
  `asian88_name` varchar(10) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;

CREATE TABLE `betbrain`.`Event` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `isComplete` bigint(1) DEFAULT NULL, 
  `sportId` bigint(20) NOT NULL, 
  `templateId` bigint(20) DEFAULT NULL, 
  `promotionId` bigint(20) DEFAULT NULL, 
  `parentId` bigint(20) DEFAULT NULL, 
  `parentPartId` bigint(20) DEFAULT NULL, 
  `typeId` bigint(20) DEFAULT NULL, 
  `startTime` datetime DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_startTime` (`startTime`),
KEY `idx_sportId` (`sportId`),
KEY `idx_typeId` (`typeId`),
KEY `idx_parentId` (`parentId`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`EventParticipantRelation` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `eventId` bigint(20) DEFAULT NULL, 
  `eventPartId` bigint(20) DEFAULT NULL, 
  `participantId` bigint(20) DEFAULT NULL, 
  `participantRoleId` bigint(20) DEFAULT NULL, 
  `parentParticipantId` bigint(20) DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_participantId` (`participantId`),
KEY `idx_participantRoleId` (`participantRoleId`),
KEY `idx_eventId` (`eventId`)
) ENGINE=MyISAM;

CREATE TABLE `betbrain`.`EventTemplate` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `eventTypeId` bigint(20) DEFAULT NULL, 
  `sportId` bigint(20) DEFAULT NULL, 
  `venueId` bigint(20) DEFAULT NULL, 
  `rootPartId` bigint(20) DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_venueId` (`venueId`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`EventType` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`FirstBettingOffer` (
  `id` bigint(20) NOT NULL, 
  `providerId` bigint(20) NOT NULL, 
  `sourceId` bigint(20) DEFAULT NULL, 
  `outcomeId` bigint(20) DEFAULT NULL, 
  `bettingTypeId` bigint(20) DEFAULT NULL, 
  `statusId` bigint(20) DEFAULT NULL, 
  `odds` double DEFAULT NULL, 
  `lastChangedTime` datetime DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_outcomeId` (`outcomeId`),
KEY `idx_providerId` (`providerId`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`FootballChampionshipDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `Campionato` varchar(4) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;

CREATE VIEW `betbrain`.`FootballMollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (utc_timestamp() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= utc_timestamp()) and (`betbrain`.`mollybet_event`.`sport` = 'fb'))

CREATE VIEW `betbrain`.`FootballOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 1) and (`o`.`eventPartId` = 3) and (`e`.`typeId` = 1) and (`o`.`typeId` in (10,11))) order by `bo`.`providerId`,`e`.`id`

CREATE VIEW `betbrain`.`FootballOddsUnderOver` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 24 hour)) and (`e`.`sportId` = 1) and (`o`.`eventPartId` = 3) and (`e`.`typeId` = 1) and (`o`.`typeId` = 67)) order by `bo`.`providerId`,`e`.`id`

CREATE VIEW FootballOdds_TEMP as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 1) and (`o`.`eventPartId` = 3) and (`e`.`typeId` = 1) and (`o`.`typeId` in (10,11))) order by `bo`.`providerId`,`e`.`id`


CREATE TABLE `betbrain`.`FootballOdds_data` (
  `eventId` bigint(20) DEFAULT NULL, 
  `bettingOfferId` bigint(20) DEFAULT NULL, 
  `eventName` varchar(255) DEFAULT NULL, 
  `location` varchar(255) DEFAULT NULL, 
  `participantName` varchar(255) DEFAULT NULL, 
  `role` varchar(255) DEFAULT NULL, 
  `odds` double DEFAULT NULL, 
  `providerId` bigint(20) DEFAULT NULL, 
  `bookmaker` varchar(255) DEFAULT NULL, 
  `date` datetime DEFAULT NULL, 
  `lastChangedTime` datetime DEFAULT NULL, 
  `bettingTypeId` bigint(20) DEFAULT NULL, 
  `sportId` bigint(20) DEFAULT NULL 
) ENGINE=InnoDB;



CREATE TABLE `betbrain`.`IceHockeyChampionshipDecode` (
  `id` int(11) NOT NULL AUTO_INCREMENT, 
  `Campionato` varchar(64) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=InnoDB;

CREATE VIEW `betbrain`.`IceHockeyMollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (utc_timestamp() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= utc_timestamp()) and (`betbrain`.`mollybet_event`.`sport` = 'ih'))

CREATE VIEW `betbrain`.`IceHockeyOddsHA` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 6) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 40)) order by `bo`.`providerId`,`e`.`id`

CREATE VIEW `betbrain`.`IceHockeyOddsHA_Updated` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 6) and (`e`.`typeId` = 1) and (`o`.`typeId` = 104) and (`bo`.`bettingTypeId` = 466) and (`o`.`eventPartId` = 40)) order by `bo`.`providerId`,`e`.`id`

CREATE VIEW `betbrain`.`IceHockeyOddsHDA` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,(case when isnull(`prt`.`name`) then 'Draw' else `prt`.`name` end) AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 48 hour)) and (cast(`e`.`startTime` as datetime) >= (now() + interval 12 hour)) and (`e`.`sportId` = 6) and (`e`.`typeId` = 1) and (`o`.`typeId` in (10,11)) and (`bo`.`bettingTypeId` = 69) and (`o`.`eventPartId` = 41)) order by `bo`.`providerId`,`e`.`id`


CREATE TABLE `betbrain`.`Location` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `code` char(3) NOT NULL, 
  `typeId` bigint(20) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=MyISAM;

CREATE VIEW `betbrain`.`MollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (now() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= now()))


CREATE TABLE `betbrain`.`Outcome` (
  `id` bigint(20) NOT NULL, 
  `isComplete` bit(1) DEFAULT NULL, 
  `statusId` bigint(20) DEFAULT NULL, 
  `eventId` bigint(20) DEFAULT NULL, 
  `eventPartId` bigint(20) DEFAULT NULL, 
  `paramParticipantId1` bigint(20) DEFAULT NULL, 
  `paramParticipantId2` bigint(20) DEFAULT NULL, 
  `paramParticipantId3` bigint(20) DEFAULT NULL, 
  `typeId` bigint(20) DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`),
KEY `idx_eventId` (`eventId`),
KEY `idx_eventPartId` (`eventPartId`),
KEY `idx_typeId` (`typeId`),
KEY `idx_paramParticipantId` (`paramParticipantId1`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`Participant` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `countryId` bigint(20) DEFAULT NULL, 
  `typeId` bigint(20) DEFAULT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`ParticipantRole` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=MyISAM;


CREATE TABLE `betbrain`.`Provider` (
  `id` bigint(20) NOT NULL, 
  `name` varchar(255) NOT NULL, 
  `locationId` bigint(20) NOT NULL, 
  `isBookmaker` bit(1) NOT NULL, 
PRIMARY KEY `PRIMARY` (`id`)
) ENGINE=MyISAM;

CREATE VIEW `betbrain`.`TennisMollybetEvent` as
select `betbrain`.`mollybet_event`.`event_id` AS `event_id`,`betbrain`.`mollybet_event`.`home_team` AS `home_team`,`betbrain`.`mollybet_event`.`away_team` AS `away_team`,`betbrain`.`mollybet_event`.`match_date` AS `match_date`,`betbrain`.`mollybet_event`.`championship_id` AS `championship_id`,`betbrain`.`mollybet_event`.`championship_name` AS `championship_name`,`betbrain`.`mollybet_event`.`country` AS `country`,`betbrain`.`mollybet_event`.`sport` AS `sport` from `betbrain`.`mollybet_event` where ((cast(`betbrain`.`mollybet_event`.`match_date` as datetime) <= (utc_timestamp() + interval 48 hour)) and (cast(`betbrain`.`mollybet_event`.`match_date` as datetime) >= utc_timestamp()) and (`betbrain`.`mollybet_event`.`sport` = 'tennis'))


CREATE VIEW `betbrain`.`TennisOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 3) and (`o`.`eventPartId` = 20) and (`e`.`typeId` = 1) and (`bo`.`bettingTypeId` = 466))

CREATE VIEW `betbrain`.`TennisOdds_Updated` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`BettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((`e`.`sportId` = 3) and (`o`.`eventPartId` = 20) and (`e`.`typeId` = 1) and (`bo`.`bettingTypeId` = 466))


CREATE TABLE `betbrain`.`american_footballsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;

CREATE TABLE `betbrain`.`baseballsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`basketsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`boxingsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`championshipDecode` (
  `id` int(11) NOT NULL, 
  `Campionato` varchar(4) NOT NULL, 
  `eventNameBetbrain` varchar(64) NOT NULL, 
  `locationBetbrain` varchar(64) NOT NULL, 
  `Continente` varchar(64) DEFAULT NULL, 
  `eventNameAsian88` varchar(150) DEFAULT NULL 
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`event_schedule_logs` (
  `event_name` varchar(50) DEFAULT NULL, 
  `label` varchar(20) DEFAULT NULL, 
  `exec_date` timestamp DEFAULT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP 
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`footballsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL 
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`icehockeysbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`mollybet_event` (
  `event_id` varchar(100) NOT NULL, 
  `home_team` varchar(64) NOT NULL, 
  `away_team` varchar(64) NOT NULL, 
  `match_date` datetime NOT NULL, 
  `championship_id` int(11) DEFAULT NULL, 
  `championship_name` varchar(100) DEFAULT NULL, 
  `country` varchar(100) DEFAULT NULL, 
  `sport` varchar(16) NOT NULL, 
PRIMARY KEY `PRIMARY` (`sport`,`event_id`),
UNIQUE KEY `mollybet_event_event_id_uindex` (`event_id`),
KEY `mollybet_event_match_date_index` (`match_date`)
) ENGINE=InnoDB;

CREATE VIEW `betbrain`.`oldTennisOdds` as
select `e`.`id` AS `eventId`,`bo`.`id` AS `bettingOfferId`,`ev`.`name` AS `eventName`,`lo`.`name` AS `location`,`p`.`name` AS `participantName`,`prt`.`name` AS `role`,`bo`.`odds` AS `odds`,`bo`.`providerId` AS `providerId`,`pr`.`name` AS `bookmaker`,`e`.`startTime` AS `date`,`bo`.`lastChangedTime` AS `lastChangedTime`,`bo`.`bettingTypeId` AS `bettingTypeId`,`e`.`sportId` AS `sportId` from (((((((((`betbrain`.`Event` `e` join `betbrain`.`Outcome` `o` on((`o`.`eventId` = `e`.`id`))) join `betbrain`.`Event` `ev` on((`ev`.`id` = `e`.`parentId`))) join `betbrain`.`EventTemplate` `et` on((`et`.`id` = `ev`.`templateId`))) join `betbrain`.`Location` `lo` on((`lo`.`id` = `et`.`venueId`))) join `betbrain`.`FirstBettingOffer` `bo` on((`bo`.`outcomeId` = `o`.`id`))) join `betbrain`.`Provider` `pr` on((`pr`.`id` = `bo`.`providerId`))) left join `betbrain`.`Participant` `p` on((`p`.`id` = `o`.`paramParticipantId1`))) left join `betbrain`.`EventParticipantRelation` `epr` on(((`epr`.`participantId` = `p`.`id`) and (`epr`.`eventId` = `e`.`id`)))) left join `betbrain`.`ParticipantRole` `prt` on((`prt`.`id` = `epr`.`participantRoleId`))) where ((cast(`e`.`startTime` as datetime) <= (now() + interval 24 hour)) and (`e`.`sportId` = 3) and (`o`.`eventPartId` = 20) and (`e`.`typeId` = 1) and (`o`.`typeId` = 10)) order by `bo`.`providerId`,`e`.`id`


CREATE TABLE `betbrain`.`tennissbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;


CREATE TABLE `betbrain`.`ufcsbrodds` (
  `eventId` varchar(32) NOT NULL, 
  `bettingOfferId` varchar(64) NOT NULL, 
  `eventName` varchar(32) NOT NULL, 
  `location` varchar(32) NOT NULL, 
  `participantName` varchar(32) NOT NULL, 
  `role` varchar(16) NOT NULL, 
  `odds` double NOT NULL, 
  `providerId` int(11) NOT NULL, 
  `bookmaker` varchar(32) NOT NULL, 
  `date` datetime NOT NULL, 
  `lastChangedTime` datetime NOT NULL, 
  `bettingTypeId` int(11) NOT NULL, 
  `sportId` int(11) NOT NULL, 
PRIMARY KEY `PRIMARY` (`eventId`,`bettingOfferId`,`role`)
) ENGINE=InnoDB;

