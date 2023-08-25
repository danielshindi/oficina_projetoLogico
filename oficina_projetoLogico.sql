create database oficina;
use oficina;

create table customer(
	idCustomer int auto_increment primary key,
    CPF char(11) not null,
    completeName varchar(255) not null,
    contact varchar(11) not null,
    address varchar(255) not null,
    constraint unique_CPF unique(CPF)
	);

create table vehicle(
	idVehicle int auto_increment,
    VidCustomer int,
    licensePlate char(7) not null,
    registrationNumber varchar(45) not null,
    model varchar(45),
    primary key (idVehicle, VidCustomer),
    constraint unique_licensePlate unique (licensePlate),
    constraint unique_registrationNumber unique (registrationNumber),
    constraint fk_vehicle_customer foreign key (VidCustomer) references customer(idCustomer)
    );
    
create table workOrder(
	idWorkOrder int auto_increment primary key,
    dateOfIssue date not null,
    deliveryDate date not null,
    orderStatus enum('Aguardando aprovação','Aprovado','Cancelado','Finalizado') default 'Aguardando aprovação'
    );
    
create table service(
	idService int auto_increment primary key,
    serviceName varchar(255) not null,
    serviceCost float
    );
    
create table part(
	idPart int auto_increment primary key,
    partName varchar(45) not null,
    partCost float
    );

create table workTeam(
	idWorkTeam int primary key
    );

create table mechanic(
	idMechanic int auto_increment,
    mIdWorkteam int,
    mechanicName varchar(255) not null,
    mechanicAdress varchar(255) not null,
    mechanicContact varchar(11) not null,
    mechanicSpecialty enum('Freios',
						   'Direção',
                           'Motor',
                           'Eletrônica embarcada',
                           'Funelaria',
                           'Câmbio',
                           'Suspensão'),
	primary key (idMechanic, mIdWorkteam),
    constraint fk_mechanic_workteam foreign key (mIdWorkteam) references workTeam(idWorkTeam)    
    );

create table requests(
	requestIdVehicle int,
    requestIdWorkorder int,
    requestIdService int,
    primary key (requestIdVehicle, requestIdWorkorder, requestIdService),
    constraint fk_requests_vehicle foreign key (requestIdVehicle) references vehicle(idVehicle),
    constraint fk_requests_workorder foreign key (requestIdWorkorder) references workOrder(idWorkOrder),
    constraint fk_requests_service foreign key (requestIdService) references service(idService)
    );
    
create table service_has_parts(
	partIdService int,
    serviceIdParts int,
    partsQuantity int,
    primary key (partIdService, serviceIdParts),
    constraint fk_part_service foreign key (partIdService) references service(idService),
    constraint fk_service_part foreign key (serviceIdParts) references part(idPart)
    );
 
create table executed(
	xIdWorkorder int,
    xIdWorkteam int,
    primary key (xIdWorkorder, xIdWorkteam),
    constraint fk_order_team foreign key (xIdWorkorder) references workOrder(idWorkOrder),
    constraint fk_team_order foreign key (xIdWorkteam) references workTeam(idWorkTeam)
    );
    