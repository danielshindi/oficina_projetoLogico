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

insert into mechanic(mIdWorkteam, mechanicName, mechanicAdress, mechanicContact, mechanicSpecialty)
	values(1,'Gerson Mendes', 'Rua tal, 123', '41995859684','Freios'),
		  (1,'Amanda Souza', 'Rua etc, 543', '41876659684','Direção'),
          (1,'Rodolfo Santos', 'Rua tal, 11223', '45994859684','Motor'),
          (1,'Amélia Pereira', 'Rua tal, 12433', '46794859684','Eletrônica embarcada'),
          (1,'Aluisio Pinto', 'Rua da glória, 123', '5694859684','Funelaria'),
          (1,'Gerson Mendes', 'Rua tal, 123', '41994859684','Câmbio'),
          (1,'Gerson Mendes', 'Rua tal, 123', '41994859684','Suspensão'),
          (2,'Alicia Assunção', 'Rua fulano, 32', '41994854545','Freios'),;