create database Pedido;

create table Cliente(
    codCliente int not null,
    nomeCliente VARCHAR(100) not null,

    constraint PK_codCliente_Cliente PRIMARY KEY (codCliente),
);

create table Peca(
    codPeca int not null,
    descrPeca varchar(100) not null,

    constraint PK_codPeca_Peca primary key (codPeca),
);

create table Pedido(
    noPedido int not null,
    dataPedido DATETIME not null,
    codCliente int not null,

    constraint PK_noPedido_Pedido primary key (noPedido),
    constraint FK_codCliente_Pedido_Cliente FOREIGN KEY (codCliente) REFERENCES Cliente (codCliente),
);

create table PedidoTelefone(
    noPedido int not null,
    noTel VARCHAR(15) not null,

    constraint PK_noPedido_noTel_PedidoTelefone PRIMARY KEY (noPedido, noTel),
    constraint FK_noPedido_PedidoTelefone_Pedido FOREIGN KEY (noPedido) REFERENCES Pedido (noPedido),
);

create table ItemPedido(
    noPedido int not null,
    codPeca int not null,
    quantPeca int not null,

    constraint PK_noPedido_codPeca_ItemPedido PRIMARY key (noPedido, codPeca),

    constraint FK_noPedido_ItemPedido_Pedido FOREIGN KEY (noPedido) REFERENCES Pedido (noPedido),
    constraint FK_codPeca_ItemPedido_Peca FOREIGN KEY (codPeca) REFERENCES Peca (codPeca),
);