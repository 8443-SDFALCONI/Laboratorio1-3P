--------------------------------------
--Creacion de base de datos y usuario
-------------------------------------

--alter sesion set container = DBSENESCYT;
--show con_name;
--create user sfalconi2 IDENTIFIED BY Oracle60567;
--GRANT CONNECT, RESOURCE, DBA to sfalconi2;
--CONNECT sfalconi2@DBSENESCYT


--------------------------------------
--Creacion de tablas
-------------------------------------

--TblProvincia
---------
create table TblProvincia(
VarIdentificadorProvincia VARCHAR(50) PRIMARY KEY NOT NULL,
VarNombreProvincia VARCHAR(30) NOT NULL,
VarEstadoProvincia VARCHAR(10) NOT NULL,
IxVarIdentificadorProvincia VARCHAR(10) NOT NULL
);


--TblCanton
------
create table TblCanton(
VarIdentificadorCanton VARCHAR(50) NOT NULL,
VarNombreCanton VARCHAR(30) NOT NULL,
VarEstadoCanton VARCHAR(10) NOT NULL,
VarIdentificadorProvincia VARCHAR(50) NOT NULL,
IxVarIdentificadorCanton VARCHAR(10) NOT NULL,
CONSTRAINT VarPkCanton PRIMARY KEY (VarIdentificadorCanton,VarIdentificadorProvincia),
FOREIGN KEY (VarIdentificadorProvincia) REFERENCES TblProvincia(VarIdentificadorProvincia)
);


--TblPermisos
---------
create table TblPermisos(
VarIdentificadorPermisos VARCHAR(50) PRIMARY KEY,
VarTipoPermisos VARCHAR(20) NOT NULL,
VarEstadoPermisos VARCHAR(10) NOT NULL,
VarDescripcionPermisos VARCHAR(500) NOT NULL,
IxVarIdentificadorPermisos VARCHAR(10) NOT NULL
);

--TblRol
---------
create table TblRol(
VarIdentificadorRol VARCHAR(50) PRIMARY KEY NOT NULL,
VarTipoRol VARCHAR(20) NOT NULL,
VarEstadoRol VARCHAR(20) NOT NULL,
VarDescripcionRol VARCHAR(500) NOT NULL,
IxVarIdentificadorRol VARCHAR(10) NOT NULL
);

--TblParametros
---------
create table TblParametros(
VarIdentificadorParametros VARCHAR(50) PRIMARY KEY NOT NULL,
VarAccionAfirSocioecoParametros VARCHAR(20) NOT NULL,
VarAccionAfirTerriParametros VARCHAR(20) NOT NULL,
VarAccionAfirRuralParametros VARCHAR(20) NOT NULL,
VarAccionAfirVulneraParametros VARCHAR(5) NOT NULL,
VarAccionAfirPueblosNacionParametros VARCHAR(20) NOT NULL,
VarCuposOfertaCarParametros VARCHAR(10) NOT NULL,
DtCuposOfertaCarParametros DATE NOT NULL,
VarNotaReferCarParametros VARCHAR(4) NOT NULL,
IxVarIdentificadorParametros VARCHAR(10) NOT NULL
);

--TblExamen
---------
create table TblExamen(
VarIdentificadorExamen VARCHAR(50) PRIMARY KEY NOT NULL,
DtFechaExamen DATE NOT NULL,
VarEstadoExamen VARCHAR(10) NOT NULL,
VarNotaExamen VARCHAR(4) NOT NULL,
IxVarIdentificadorExamen VARCHAR(10) NOT NULL
);

--TblUsuario
---------
create table TblUsuario(
VarIdentificadorUsuario VARCHAR(50) PRIMARY KEY NOT NULL,
VarNombresUsuario VARCHAR(50) NOT NULL,
VarApellidosUsuario VARCHAR(50) NOT NULL,
VarCorreoUsuario VARCHAR(50) NOT NULL,
VarEstadoUsuario VARCHAR(10) NOT NULL,
VarContraseniaUsuario VARCHAR(20) NOT NULL,
VarNicknameUsuario VARCHAR(20) NOT NULL,
VarGeneroUsuario VARCHAR(5) NOT NULL,
NbrTelefonoUsuario NUMBER NOT NULL,
IxVarIdentificadorUsuario VARCHAR(10) NOT NULL
);

--TblCarreras
---------
create table TblCarreras(
VarIdentificadorCarreras VARCHAR(50) PRIMARY KEY NOT NULL,
VarNombreCarreras VARCHAR(30) NOT NULL,
VarDescripcionCarreras VARCHAR(500) NOT NULL,
VarEstadoCarreras VARCHAR(10) NOT NULL,
DtFechaVigenciaCarreras DATE NOT NULL,
VarModalidadCarreras VARCHAR(20) NOT NULL,
VarJornadaCarreras VARCHAR(20) NOT NULL,
IxVarIdentificadorCarreras VARCHAR(10) NOT NULL
);


--TblParroquia
---------
create table TblParroquia(
VarIdentificadorParroquia VARCHAR(50) NOT NULL,
VarNombreParroquia VARCHAR(30) NOT NULL,
VarEstadoParroquia VARCHAR(10) NOT NULL,
VarIdentificadorProvincia VARCHAR(50) NOT NULL,
VarIdentificadorCanton VARCHAR(50) NOT NULL,
IxVarIdentificadorParroquia VARCHAR(10) NOT NULL,
CONSTRAINT VarPkParro PRIMARY KEY(VarIdentificadorParroquia,VarIdentificadorCanton,VarIdentificadorProvincia),
FOREIGN KEY(VarIdentificadorCanton, VarIdentificadorProvincia) REFERENCES TBLCANTON(VarIdentificadorCanton, VarIdentificadorProvincia)
);

--TblInstitucionEducativa
--------------------
create table TblInstitucionEducativa(
VarIdentificadorInstitucionEducativa VARCHAR(50) PRIMARY KEY NOT NULL,
VarNombreInstitucionEducativa VARCHAR(50) NOT NULL,
VarCorreoInstitucionEducativa VARCHAR(50) NOT NULL,
NbrTelefonoInstitucionEducativa NUMBER NOT NULL,
VarDescripcionInstitucionEducativa VARCHAR(500) NOT NULL,
VarEstadoInstitucionEducativa VARCHAR(10) NOT NULL,
VarTipoInstitucionEducativa VARCHAR(10) NOT NULL,
IxVarIdentificadorInstitucionEducativa VARCHAR(10) NOT NULL
);

--TblSedes
---------
create table TblSedes(
VarIdentificadorSedes VARCHAR(50) NOT NULL,
VarNombreSedes VARCHAR(30) NOT NULL,
VarDescripcionSedes VARCHAR(500) NOT NULL,
NbrTelefonoSedes NUMBER NOT NULL,
VarEstadoSedes VARCHAR(10) NOT NULL,
VarIdentificadorProvincia VARCHAR(50) NOT NULL,
VarIdentificadorParroquia VARCHAR(50) NOT NULL,
VarIdentificadorCanton VARCHAR(50) NOT NULL,
VarIdentificadorInstitucionEducativa VARCHAR(50) NOT NULL,
IxVarIdentificadorSedes VARCHAR(10) NOT NULL,
CONSTRAINT VarPkSe PRIMARY KEY(VarIdentificadorSedes,VarIdentificadorInstitucionEducativa,VarIdentificadorParroquia,VarIdentificadorCanton,VarIdentificadorProvincia),
FOREIGN KEY (VarIdentificadorCanton,VarIdentificadorProvincia,VarIdentificadorParroquia) 
REFERENCES TblParroquia(VarIdentificadorCanton,VarIdentificadorProvincia,VarIdentificadorParroquia),
FOREIGN KEY (VarIdentificadorInstitucionEducativa) 
REFERENCES TblInstitucionEducativa(VarIdentificadorInstitucionEducativa)
);

--TblCarrerasSedes
---------
create table TblCarrerasSedes(
VarIdentificadorCarrerasSedes VARCHAR(50) PRIMARY KEY NOT NULL,
VarIdentificadorInstitucionEducativa VARCHAR(50) NOT NULL,
VarIdentificadorCarreras VARCHAR(50) NOT NULL,
VarIdentificadorSedes VARCHAR(50) NOT NULL,
VarIdentificadorParroquia VARCHAR(50) NOT NULL,
VarIdentificadorCanton VARCHAR(50) NOT NULL,
VarIdentificadorProvincia VARCHAR(50) NOT NULL,
FOREIGN KEY (VarIdentificadorSedes,VarIdentificadorCanton,VarIdentificadorProvincia,VarIdentificadorParroquia,VarIdentificadorInstitucionEducativa) 
REFERENCES TblSedes(VarIdentificadorSedes,VarIdentificadorCanton,VarIdentificadorProvincia,VarIdentificadorParroquia,VarIdentificadorInstitucionEducativa),
FOREIGN KEY (VarIdentificadorCarreras) REFERENCES TblCarreras(VarIdentificadorCarreras)
);

--TblAspirantes
---------
create table TblAspirantes(
VarCedulaAspirantes VARCHAR(10) NOT NULL,
VarNombresAspirantes VARCHAR(50) NOT NULL,
VarApellidosAspirantes VARCHAR(50) NOT NULL,
VarCorreoAspirantes VARCHAR(50) NOT NULL,
VarGeneroAspirantes VARCHAR(5) NOT NULL,
NbrTelefonoAspirantes NUMBER NOT NULL,
DtFechaNacimientoAspirantes DATE NOT NULL,
NbrEdadAspirantes NUMBER NOT NULL,
VarEstadoAspirantes VARCHAR(10) NOT NULL,
VarEstadoGratuidadAspirantes VARCHAR(30) NOT NULL,
VarEstadoCivilAspirantes VARCHAR(30) NOT NULL,
VarIdentificadorUsuario VARCHAR(50) NOT NULL,
CONSTRAINT VarPkAs PRIMARY KEY(VarCedulaAspirantes,VarIdentificadorUsuario),
FOREIGN KEY(VarIdentificadorUsuario) REFERENCES TblUsuario(VarIdentificadorUsuario)
);

--TblExamenAspirante
---------
create table TblExamenAspirante(
VarIdentificadorUsuario VARCHAR(50) NOT NULL,
VarCedulaAspirantes VARCHAR(10) NOT NULL,
VarIdentificadorExamen VARCHAR(50) NOT NULL,
CONSTRAINT VarPkExamenAspirante PRIMARY KEY(VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen),
FOREIGN KEY(VarIdentificadorUsuario,VarCedulaAspirantes) REFERENCES TblAspirantes(VarIdentificadorUsuario,VarCedulaAspirantes),
FOREIGN KEY (VarIdentificadorExamen) REFERENCES TblExamen(VarIdentificadorExamen)
);

--TblPostular
---------
create table TblPostular(
VarIdentificadorPostular VARCHAR(50) NOT NULL,
VarEstadoPostular VARCHAR(10) NOT NULL,
VarPuntajePostular VARCHAR(4) NOT NULL,
VarIdentificadorExamen VARCHAR(50) NOT NULL,
VarIdentificadorCarreras VARCHAR(50) NOT NULL,
VarIdentificadorUsuario VARCHAR(50) NOT NULL,
VarCedulaAspirantes VARCHAR(10) NOT NULL,
IxVarIdentificadorPostular VARCHAR(10) NOT NULL,
CONSTRAINT VarPkPos PRIMARY KEY (VarIdentificadorCarreras,VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen,VarIdentificadorPostular),
FOREIGN KEY (VarIdentificadorCarreras) REFERENCES TblCarreras(VarIdentificadorCarreras),
FOREIGN KEY (VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen) REFERENCES TblExamenAspirante(VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen)
);

--TblPostularParametros
---------
create table TblPostularParametros(
VarIdentificadorPostular VARCHAR(50) NOT NULL,
VarIdentificadorExamen VARCHAR(50) NOT NULL,
VarIdentificadorCarreras VARCHAR(50) NOT NULL,
VarIdentificadorUsuario VARCHAR(50) NOT NULL,
VarCedulaAspirantes VARCHAR(10) NOT NULL,
VarIdentificadorParametros VARCHAR(50) NOT NULL,
CONSTRAINT PkRige PRIMARY KEY(VarIdentificadorCarreras,VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen,VarIdentificadorPostular,VarIdentificadorParametros),
FOREIGN KEY (VarIdentificadorCarreras,VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen,VarIdentificadorPostular)
REFERENCES TblPostular(VarIdentificadorCarreras,VarCedulaAspirantes,VarIdentificadorUsuario,VarIdentificadorExamen,VarIdentificadorPostular),
FOREIGN KEY (VarIdentificadorParametros) REFERENCES TblParametros(VarIdentificadorParametros)
);

--TblRolPermisos
---------
create table TblRolPermisos(
VarIdentificadorRol VARCHAR(50) NOT NULL,
VarIdentificadorPermisos VARCHAR(50) NOT NULL,
CONSTRAINT VarPkRolPermisos PRIMARY KEY(VarIdentificadorRol,VarIdentificadorPermisos),
FOREIGN KEY (VarIdentificadorRol) REFERENCES TblRol(VarIdentificadorRol),
FOREIGN KEY (VarIdentificadorPermisos) REFERENCES TblPermisos(VarIdentificadorPermisos)
);

--TblUsuarioRolPermisos
---------
create table TblUsuarioRolPermisos(
VarIdentificadorUsuario VARCHAR(50) NOT NULL,
VarIdentificadorRol VARCHAR(50) NOT NULL,
VarIdentificadorPermisos VARCHAR(50) NOT NULL,
CONSTRAINT VarPkUsuarioRolPermisos PRIMARY KEY (VarIdentificadorUsuario,VarIdentificadorRol,VarIdentificadorPermisos),
FOREIGN KEY (VarIdentificadorUsuario) REFERENCES TblUsuario(VarIdentificadorUsuario),
FOREIGN KEY (VarIdentificadorRol,VarIdentificadorPermisos) REFERENCES TblRolPermisos(VarIdentificadorRol,VarIdentificadorPermisos)
);

--------------------------------------
--Creacion de indices
-------------------------------------

CREATE INDEX "IxVarIdentificadorInstitucionEducativa" ON TblInstitucionEducativa(IxVarIdentificadorInstitucionEducativa);
CREATE INDEX "IxVarCorreoInstitucionEducativa" ON TblInstitucionEducativa(VarCorreoInstitucionEducativa);
CREATE INDEX "IxNbrTelefonoInstitucionEducativa" ON TblInstitucionEducativa(NbrTelefonoInstitucionEducativa);

CREATE INDEX "IxVarIdentificadorSedes" ON TblSedes(IxVarIdentificadorSedes);
CREATE INDEX "IxNbrTelefonoSedes" ON TblSedes(NbrTelefonoSedes);

CREATE INDEX "IxVarIdentificadorParroquia" ON TblParroquia(IxVarIdentificadorParroquia);

CREATE INDEX "IxVarIdentificadorCanton" ON TblCanton(IxVarIdentificadorCanton);

CREATE INDEX "IxVarIdentificadorProvincia" ON TblProvincia(IxVarIdentificadorProvincia);

CREATE INDEX "IxVarIdentificadorCarreras" ON TblCarreras(IxVarIdentificadorCarreras);

CREATE INDEX "IxVarIdentificadorPostular" ON TblPostular(IxVarIdentificadorPostular);

CREATE INDEX "IxVarIdentificadorParametros" ON TblParametros(IxVarIdentificadorParametros);

CREATE INDEX "IxVarIdentificadorExamen" ON TblExamen(IxVarIdentificadorExamen);

CREATE INDEX "IxVarCedulaAspirantes" ON TblAspirantes(VarCedulaAspirantes);
CREATE INDEX "IxVarCorreoAspirantes" ON TblAspirantes(VarCorreoAspirantes);
CREATE INDEX "IxNbrTelefonoAspirantes" ON TblAspirantes(NbrTelefonoAspirantes);

CREATE INDEX "IxVarIdentificadorUsuario" ON TblUsuario(IxVarIdentificadorUsuario);
CREATE INDEX "IxVarCorreoUsuario" ON TblUsuario(VarCorreoUsuario);
CREATE INDEX "IxNbrTelefonoUsuario" ON TblUsuario(NbrTelefonoUsuario);
CREATE INDEX "IxVarContraseniaUsuario" ON TblUsuario(VarContraseniaUsuario);
CREATE INDEX "IxVarNicknameUsuario" ON TblUsuario(VarNicknameUsuario);


CREATE INDEX "IxVarIdentificadorRol" ON TblRol(IxVarIdentificadorRol);

CREATE INDEX "IxVarIdentificadorPermisos" ON TblPermisos(IxVarIdentificadorPermisos);
