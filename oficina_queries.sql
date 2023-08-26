-- Recuperar os clientes e seus automóveis cadastrados
select c.completeName, c.CPF, v.licensePlate, v.model
	from customer c 
    inner join vehicle v 
    on v.VidCustomer = c.idCustomer;

-- Recuperar ordens de serviço e os serviços solicitados para cada veículo dos clientes
select c.completeName, c.CPF, v.licensePlate, v.model, r.requestIdWorkorder, s.serviceName
	from customer c 
    inner join vehicle v 
		on v.VidCustomer = c.idCustomer
    inner join requests r
		on r.requestIdVehicle = v.idVehicle
	inner join service s
		on s.idService = r.requestIdService;
        
-- Recuperar serviço e peças associadas
select serviceName, partName from service
	inner join service_has_parts on idService = partIdService
	inner join part on idPart = serviceIdParts;
    

-- Recuperar preço total dos serviços (valor da mão-de-obra mais valor das peças)
select idService, serviceName, serviceCost, SUM(partsQuantity * partCost) as PartsCost,
serviceCost + SUM(partsQuantity * partCost) as TotalCost from service_has_parts
	inner join service on idService = partIdService
	inner join part on idPart = serviceIdParts
    group by idService;

-- Recuperar valor total de cada ordem de serviço
select r.requestIdWorkorder as WorkOrder, round(SUM(TotalCost),2) as Total
	from (requests r inner join service s
			on s.idService = r.requestIdService
			inner join (select idService, serviceCost + SUM(partsQuantity * partCost) as TotalCost from service_has_parts
				inner join service on idService = partIdService
				inner join part on idPart = serviceIdParts
				group by idService) as TotalServiceCost
				on s.idService = TotalServiceCost.idService)
	group by r.requestIdWorkorder
    order by requestIdWorkorder;
         
-- Recuperar valor total a pagar por veículo e por ordem       
select distinct requestIdVehicle as Veiculo, requestIdWorkorder as WorkOrder, Total
from requests r
inner join (select r.requestIdWorkorder as WorkOrder, round(SUM(TotalCost),2) as Total
			from (requests r inner join service s on s.idService = r.requestIdService
							inner join (select idService, serviceCost + SUM(partsQuantity * partCost) as TotalCost from service_has_parts
										inner join service on idService = partIdService
										inner join part on idPart = serviceIdParts
										group by idService) as TotalServiceCost
							on s.idService = TotalServiceCost.idService)
							group by r.requestIdWorkorder
							order by requestIdWorkorder) as TotalDeCadaOrdem
on requestIdWorkorder = TotalDeCadaOrdem.WorkOrder
order by Veiculo;

-- Recuperar cliente, veículo e respectivas ordens de serviços
select idCustomer, completeName, CPF, idVehicle, licensePlate, model, requestIdWorkorder as WorkOrder
	from vehicle inner join requests on idVehicle = requestIdVehicle, customer
	where idCustomer = VidCustomer;
    
-- Recuperar quantidade total de serviços solicitados
select count(*) as Total_of_services from requests;

-- Recuperar mecânicos designados ao veículo 3
select idMechanic, mechanicName, tmIdWorkTeam as Workteam
from mechanic
inner join (select * from team_mechanic where tmIdWorkTeam = (select xIdWorkteam from requests
												  inner join executed
                                                  on xIdWorkorder = requestIdWorkorder
												  where requestIdVehicle = 3)) as mechanics_3
on idMechanic = tmIdMechanic;

-- Recupera ordens de serviço agrupado por status com contagem maior que um
select orderStatus, count(*) as Numero_de_ordens
from workorder
group by orderStatus
having Numero_de_ordens > 1; 

-- Recuperar ordens de serviço com data de entrega anterior a 30 de agosto de 2023
select * from workorder where deliveryDate < '2023-08-30' order by deliveryDate desc;