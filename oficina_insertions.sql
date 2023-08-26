use oficina;

insert into customer (CPF, completeName, contact, address)
	values('12345678910','João Silva', '41993849654', 'Rua Lalala, 342'),
		  ('93847867583','Roberta Santos','45775847563','Rua da Paz, 1234'),
          ('93002967583','Marina Reis','27675847563','Rua da Glória, 130'),
          ('04447867583','Diego Nunes','35765847578','Rua Chile, 1298');
          
insert into vehicle(VidCustomer, licensePlate, registrationNumber, model)
	values(1,'abc2035','3827465872345682','Toyota Etios'),
		  (1,'def8459','3247569827435685','Fiat Uno'),
          (2,'fbc2235','9648674684876867','Renault Kwid'),
          (3,'gjk9875','7563875678568688','Nissan Frontier'),
          (4,'hjf9304','5437367345680981','Cherry Tiggo');
          
insert into workOrder(dateOfIssue, deliveryDate, orderStatus)
	values('2023-08-25','2023-08-30','Aprovado'),
		  ('2023-08-25','2023-08-30',default),
          ('2023-08-22','2023-08-29','Aprovado'),
          ('2023-07-25','2023-08-25','Finalizado'),
          ('2023-08-23','2023-09-12',default),
          ('2023-08-25','2023-08-30','Cancelado');
          
insert into service(serviceName, serviceCost)
	values('Revisão completa', 700.00),
		  ('Troca de óleo', 40.00),
          ('Troca de pneu', 50.00),
          ('Manutenção freio', 100.00),
          ('Manutenção embreagem', 200.00),
          ('Manutenção amortecedores', 300.00),
          ('Troca de filtro de ar do motor', 60.00),
          ('Troca de filtro de combustível', 70.00),
          ('Funilaria e pintura', 100.00),
          ('Manutenção elétrica', 90.00);
          
insert into part(partName, partCost)
	values('Freio', 500.00),
		  ('Fluído de freio', 100.00),
          ('Pneu', 500.00),
          ('Óleo motor', 60.00),
          ('Câmbio', 600.00),
          ('Embreagem', 300.00),
          ('Amortecedor', 350),
          ('Filtro de ar de motor',40.00),
          ('Filtro de combustível', 70.00),
          ('Tinta automotiva', 100.00),
          ('Bateria', 400.00);
          
insert into workTeam values (1),(2),(3),(4),(5);

insert into mechanic(mechanicName, mechanicAdress, mechanicContact, mechanicSpecialty)
	values('Gerson Mendes', 'Rua tal, 123', '41995859684','Freios'),
		  ('Amanda Souza', 'Rua etc, 543', '41876659684','Direção'),
          ('Rodolfo Santos', 'Rua tal, 11223', '45994859684','Motor'),
          ('Amélia Pereira', 'Rua tal, 12433', '46794859684','Eletrônica embarcada'),
          ('Aluisio Pinto', 'Rua da glória, 123', '5694859684','Funelaria'),
          ('Gerson Mendes', 'Rua tal, 123', '41994859684','Câmbio'),
          ('Gerson Mendes', 'Rua tal, 123', '41994859684','Suspensão'),          
          ('Roberta Assunção', 'Rua fulano, 32', '4198947545','Pintura'),
          ('Alicia Assunção', 'Rua fulano, 32', '41994854545','Funelaria'),          
          ('Roberto Martins', 'Rua fulano, 56', '41994854545','Freios'),          
          ('Jéssica Nunes', 'Rua Heráclito, 1047', '41993354545','Motor'),          
          ('Indiana Jones', 'Rua esmeralda, 100', '41894854545','Eletrônica embarcada'),          
          ('José Silva', 'Rua Chagas, 542', '41994854599','Câmbio');
 
select * from mechanic; 
insert into team_mechanic values (1, 1),
								 (2, 1),
                                 (3, 1),
                                 (4, 1),
                                 (5, 1),
                                 (6, 1),
                                 (7, 1),
                                 (8, 2),
                                 (9, 2),
                                 (10, 3),
                                 (1, 3),
                                 (12, 4),
                                 (4, 4),
                                 (13, 5),
                                 (6, 5),
                                 (11, 5);
                                 
select * from team_mechanic;

select * from service;
insert into requests values (1,1,1),
							(2,2,9),
                            (3,3,4),
                            (4,4,10),
                            (5,5,2),
                            (5,5,7),
                            (5,5,8),
                            (5,5,5);
                            
insert into service_has_parts values (1,4,1),
									 (1,8,1),
                                     (1,9,1),
                                     (2,4,1),
                                     (3,3,4),
                                     (4,1,2),
                                     (4,2,1),
                                     (5,5,1),
                                     (5,6,1),
                                     (6,7,4),
                                     (7,8,1),
                                     (8,9,1),
                                     (9,10,3),
                                     (10,11,1);
                                     
insert into executed values (1,1),
						    (2,2),
							(3,3),
                            (4,4),
                            (5,5),
                            (6,2);