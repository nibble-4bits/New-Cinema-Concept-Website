USE Cinema
GO

-- Usuarios
EXEC dbo.sp_RegistrarUsuario 'Luis Andr�s', 'De Anda', 'Cu�llar', 'ldeanda@gmail.com', 'nullptr', 'mipass', '1998-04-03'
EXEC dbo.sp_RegistrarUsuario 'Jorge Arturo', 'Rangel', 'Luna', 'jarangel@gmail.com', 'elYorch', 'supass', '1999-03-11'
GO

-- Tickets
EXEC dbo.sp_CreateTicket 2, 'Insecto en las palomitas', 'Calidad', 'Me aparecieron unas cucarachas en mis palomitas con extra mantequilla'
GO

-- Productos
INSERT INTO Producto(Nombre, PrecioUnitario)
			VALUES('Palomitas chicas', 37.99),
				  ('Palomitas medianas', 47.99),
				  ('Refresco de 355ml', 25.99),
				  ('Hot-Dog', 29.99)
GO

-- Sala (14 salas)
INSERT INTO Sala(Precio)
			VALUES(60),(60),(60),(60),(60),(60),(60),(60),(60),(60),(60),(60),(60),(60)
GO

-- Proyectables (FALTA AGREGAR LA RUTA DE LA IMAGEN)
INSERT INTO Proyectable(Titulo, Sinopsis, Duracion, RutaImagen, Estatus)
			VALUES
				  -- PELICULAS
				  ('Bohemian Rhapsody: La Historia de Freddie Mercury', '"Bohemian Rhapsody, La historia de Freddie Mercury" es una celebraci�n trepidante de Queen, su m�sica y su extraordinario cantante principal Freddie Mercury, quien desafi� estereotipos y destruy� convenciones para convertirse en uno de los artistas m�s queridos del mundo. La pel�cula sigue el ascenso mete�rico de la banda a trav�s de sus canciones ic�nicas y su sonido revolucionario, de su inminente implosi�n una vez que el estilo de vida de Mercury se sale de control, quien enfrentaba una enfermedad terminal, lidera la banda en una de las presentaciones m�s grandiosas en la historia de la m�sica rock.', '2:13:00', '', 2),
				  ('El Padrino', 'Don Vito Corleone es uno de los mayores mafiosos de Nueva York y el cabeza de familia. Su hija se ha casado y su hijo Michael vuelve de la guerra, aunque no desea seguir con el negocio familiar de su padre. Don Vito Corleone se hace mayor y sus ideas empiezan a quedarse un poco obsoletas, especialmente cuando un reci�n llegado llega a la ciudad. Es un antiguo rival que necesitar� las influencias del Sr. Corleone si quiere adentrarse en el mercado neoyorquino.', '2:55:00', '', 1),
				  ('Pulp Fiction', 'Jules y Vincent, dos asesinos a sueldo con no demasiadas luces, trabajan para el g�ngster Marsellus Wallace. Vincent le confiesa a Jules que Marsellus le ha pedido que cuide de Mia, su atractiva mujer. Jules le recomienda prudencia porque es muy peligroso sobrepasarse con la novia del jefe. Cuando llega la hora de trabajar, ambos deben ponerse "manos a la obra". Su misi�n: recuperar un misterioso malet�n.', '2:33:00', '', 1),
				  ('Full Metal Jacket', 'Un grupo de reclutas se prepara en Parris Island, centro de entrenamiento de la marina norteamericana. All� est� el sargento Hartman, duro e implacable, cuya �nica misi�n en la vida es endurecer el cuerpo y el alma de los novatos, para que puedan defenderse del enemigo. Pero no todos los j�venes est�n preparados para soportar sus m�todos.', '2:00:00', '', 2),
				  ('El club de la pelea', 'Un joven hastiado de su gris y mon�tona vida lucha contra el insomnio. En un viaje en avi�n conoce a un carism�tico vendedor de jab�n que sostiene una teor�a muy particular: el perfeccionismo es cosa de gentes d�biles; s�lo la autodestrucci�n hace que la vida merezca la pena. Ambos deciden entonces fundar un club secreto de lucha, donde poder descargar sus frustaciones y su ira, que tendr� un �xito arrollador.', '2:19:00', '', 1),
				  ('El Gran Hotel Budapest', 'Gustave H. (Ralph Fiennes), un legendario conserje de un famoso hotel europeo de entreguerras, entabla amistad con Zero Moustafa (Tony Revolori), un joven empleado al que convierte en su protegido. La historia trata sobre el robo y la recuperaci�n de una pintura renacentista de valor incalculable y sobre la batalla que enfrenta a los miembros de una familia por una inmensa fortuna. Como tel�n de fondo, los levantamientos que transformaron Europa durante la primera mitad del siglo XX.', '1:39:00', '', 1),
				  ('Donnie Darko', 'Donnie es un chico americano dotado de gran inteligencia e imaginaci�n. Tras escapar milagrosamente de una muerte casi segura, comienza a sufrir alucinaciones que lo llevan a actuar como nunca hubiera imaginado y a descubrir un mundo ins�lito a su alrededor.', '1:53:00', '', 3),
				  ('La forma del agua', 'En un inquietante laboratorio de alta seguridad, durante la Guerra Fr�a, se produce una conexi�n ins�lita entre dos mundos aparentemente alejados. La vida de la solitaria Elisa (Sally Hawkins), que trabaja como limpiadora en el laboratorio, cambia por completo cuando descubre un experimento clasificado como secreto: un hombre anfibio (Doug Jones) que se encuentra ah� recluido.', '1:59:00', '', 3),
				  -- SERIES
				  ('El cruce', 'Howard Silk comienza a descubrir una dimensi�n paralela, que pondr� su vida patas arriba.', '00:57:00', '', 2), -- Counterpart
				  ('Saint Nick', 'Un asesino a sueldo se ve obligado a asociarse con un unicornio imaginario de para rescatar a un ni�o desaparecido.', '1:00:00', '', 2), -- Happy!
				  ('Retorno al pasado', '250 a�os despu�s de su muerte, Takeshi Kovacs descubre que ha sido resucitado para ayudar a un magnate a resolver el misterio de su propio asesinato.', '1:00:00', '', 2), -- Altered Carbon
				  ('Uno', 'Jimmy se dispone a perseguir de forma no convencional a potenciales clientes.', '00:47:00', '', 2), -- Better Call Saul
				  ('La desaparici�n de Will Byers', 'La trama nos sit�a en la ciudad de Hawkins, Indiana, en el a�o 1983. Nada m�s empezar vemos c�mo un cient�fico del laboratorio de energ�a de los Estados Unidos es atacado por una extra�a criatura. El joven Will Byers desaparece de manera misteriosa tras intentar huir de esa criatura en los aleda�os de su casa, tras regresar de jugar una partida de "Dragones y Mazmorras" con sus amigos', '00:50:00', '', 1), -- Stranger Things
				  ('Ca�a de az�car', 'Cuando su socio enga�a a un cliente muy poderoso, el asesor financiero Marty Byrde tendr� que trazar un plan para salvar la vida de su familia y la suya propia.', '00:56:00', '', 1) -- Ozark
GO

-- Peliculas
INSERT INTO Pelicula(IdProyectable, Clasificacion, Genero, Reparto) 
			VALUES(1, 'B', 'Drama', 'Rami Malek,  Joseph Mazzello,  Ben Hardy,  Gwilym Lee,  Lucy Boynton,  Aidan Gillen, Tom Hollander,  Mike Myers,  Allen Leech,  Aaron McCusker,  Jess Radomska, Max Bennett,  Michelle Duncan,  Ace Bhatti,  Charlotte Sharland, Ian Jareth Williamson,  Dickie Beau,  Jes�s Gallo,  Jessie Vinning'),
				  (2, 'C', 'Mafia', 'Marlon Brando,  Al Pacino,  James Caan,  Robert Duvall,  Diane Keaton,  John Cazale, Talia Shire,  Richard S. Castellano,  Sterling Hayden,  Gianni Russo,  Rudy Bond, John Marley,  Richard Conte,  Al Lettieri,  Abe Vigoda,  Franco Citti,  Lenny Montana, Al Martino,  Joe Spinell'),
				  (3, 'C', 'Thriller', 'John Travolta,  Samuel L. Jackson,  Uma Thurman,  Bruce Willis,  Ving Rhames, Harvey Keitel,  Tim Roth,  Amanda Plummer,  Mar�a de Medeiros,  Eric Stoltz, Rosanna Arquette,  Christopher Walken,  Paul Calderon,  Bronagh Gallagher, Peter Greene,  Stephen Hibbert,  Angela Jones'),
				  (4, 'C', 'B�lico', 'Matthew Modine,  Vincent D''Onofrio,  R. Lee Ermey,  Adam Baldwin,  Arliss Howard, Dorian Harewood,  Kevyn Major Howard,  Ed O''Ross,  Gary Landon Mills,  Sal L�pez, John Stafford'),
				  (5, 'C', 'Thriller', 'Edward Norton,  Brad Pitt,  Helena Bonham Carter,  Meat Loaf,  Jared Leto, Van Quattro,  Markus Redmond,  Michael Girardin,  Rachel Singer,  Eion Bailey, David Lee Smith'),
				  (6, 'B15', 'Comedia', 'Ralph Fiennes,  Tony Revolori,  Saoirse Ronan,  Edward Norton,  Jeff Goldblum, Jude Law,  Willem Dafoe,  F. Murray Abraham,  Adrien Brody,  Tilda Swinton, Harvey Keitel,  Mathieu Amalric,  Jason Schwartzman,  Tom Wilkinson,  Larry Pine, Bill Murray,  L�a Seydoux'),
				  (7, 'B15', 'Ciencia ficci�n', 'Jake Gyllenhaal,  Maggie Gyllenhaal,  Patrick Swayze,  Jena Malone,  Mary McDonnell, Drew Barrymore,  Holmes Osborne,  Noah Wyle,  Katharine Ross,  Daveigh Chase, James Duval'),
				  (8, 'B15', 'Fant�stico', 'Sally Hawkins,  Doug Jones,  Michael Shannon,  Octavia Spencer,  Richard Jenkins, Michael Stuhlbarg,  Lauren Lee Smith,  David Hewlett,  Nick Searcy,  Morgan Kelly, Dru Viergever,  Maxine Grossman')
GO

-- Series
INSERT INTO Serie(Nombre, Clasificacion, Genero, Reparto)
			VALUES('Counterpart', 'B', 'Thriller', 'J.K. Simmons,  Harry Lloyd,  Nazanin Boniadi,  Olivia Williams,  Sara Serraiocco, Kenneth Choi,  Ulrich Thomsen,  Nicholas Pinnock,  Bernhard Forcher, Nolan Gerard Funk,  Junes Zahdi,  Piotr Adamczyk,  Jacqueline Bisset,  Mads Black, Flula Borg,  Marco Khan,  Ilean Almaguer'),
				  ('Happy!', 'C', 'Comedia', 'Christopher Meloni,  Patton Oswalt,  Ren Colley,  Alexander Jameson,  Michael Maize, Bryce Lorenzo,  Lili Mirojnick,  Scott Burik,  Ben Cole,  Dante Pereira-Olson, Michael Ryan Segal,  Benjamin Snyder,  Matthias Sebastiun Garry,  James Collins Jr., Bonnie Milligan'),
				  ('Altered Carbon', 'B15', 'Ciencia ficci�n', 'Joel Kinnaman,  Martha Higareda,  James Purefoy,  Katie Stuart,  Dichen Lachman, Lisa Chandler,  Renee Goldsberry,  Chris Conner,  Leonardo Nam,  Ato Essandoh, Nicole Anthony,  Marlene Forte,  Kristin Lehman,  Stephanie Cleough'),
				  ('Better Call Saul', 'B15', 'Drama', 'Bob Odenkirk,  Michael McKean,  Jonathan Banks,  Rhea Seehorn,  Patrick Fabian, Michael Mando,  Gene N. Chavez,  Julie Ann Emery,  Raymond Garcia, Mel Rodriguez,  Jeremy Shamos,  Amy Davidson,  Kerry Condon,  Giancarlo Esposito, Ann Cusack,  Clea Duvall'),
				  ('Stranger Things', 'B', 'Thriller', 'Winona Ryder,  David Harbour,  Matthew Modine,  Finn Wolfhard,  Millie Bobby Brown, Gaten Matarazzo,  Caleb McLaughlin,  Natalia Dyer,  Charlie Heaton,  Noah Schnapp, Cara Buono,  Joe Keery,  Rob Morgan,  John Reynolds,  Joe Chrest,  Ross Partridge'),
				  ('Ozark', 'B15', 'Crimen', 'Jason Bateman,  Laura Linney,  Sofia Hublitz,  Skylar Gaertner,  Peter Mullan, Jason Butler Harner,  Anthony Collins,  Julia Garner,  Esai Morales,  Janet McTeer, Carson Holmes,  Marc Menchaca,  McKinley Belcher III,  Kevin L. Johnson, Michael Tourek,  Dirk Allison')
GO

-- Episodios
INSERT INTO Episodio(IdProyectable, IdSerie)
			VALUES(9, 1),
				  (10, 2),
				  (11, 3),
				  (12, 4),
				  (13, 5),
				  (14, 6)
GO

-- Funciones de cine
INSERT INTO Funcion(IdProyectable, IdSala, DiaHora)
			VALUES  (1, 1, '2018-11-20T10:30:05'),
					(1, 1, '2018-11-20T12:05:30'),
					(1, 1, '2018-11-20T14:50:10'),
					(1, 1, '2018-11-20T16:45:45'),
					(1, 1, '2018-11-20T18:40:00'),
					(1, 1, '2018-11-20T20:35:05'),
					(1, 1, '2018-11-20T22:20:45'),
					(1, 1, '2018-11-21T10:25:00'),
					(1, 1, '2018-11-21T12:25:50'),
					(1, 1, '2018-11-21T14:05:45'),
					(1, 1, '2018-11-21T16:20:45'),
					(1, 1, '2018-11-21T18:40:35'),
					(1, 1, '2018-11-21T20:40:05'),
					(1, 1, '2018-11-21T22:25:15'),
					(1, 1, '2018-11-22T10:05:20'),
					(1, 1, '2018-11-22T12:35:20'),
					(1, 1, '2018-11-22T14:35:30'),
					(1, 1, '2018-11-22T16:40:00'),
					(1, 1, '2018-11-22T18:40:10'),
					(1, 1, '2018-11-22T20:10:35'),
					(1, 1, '2018-11-22T22:25:30'),
					(2, 2, '2018-11-20T10:15:45'),
					(2, 2, '2018-11-20T12:25:25'),
					(2, 2, '2018-11-20T14:00:40'),
					(2, 2, '2018-11-20T16:15:45'),
					(2, 2, '2018-11-20T18:30:35'),
					(2, 2, '2018-11-20T20:25:10'),
					(2, 2, '2018-11-20T22:20:40'),
					(2, 2, '2018-11-21T10:40:00'),
					(2, 2, '2018-11-21T12:05:30'),
					(2, 2, '2018-11-21T14:45:25'),
					(2, 2, '2018-11-21T16:40:35'),
					(2, 2, '2018-11-21T18:45:40'),
					(2, 2, '2018-11-21T20:40:10'),
					(2, 2, '2018-11-21T22:45:50'),
					(2, 2, '2018-11-22T10:05:40'),
					(2, 2, '2018-11-22T12:10:45'),
					(2, 2, '2018-11-22T14:40:50'),
					(2, 2, '2018-11-22T16:00:40'),
					(2, 2, '2018-11-22T18:35:35'),
					(2, 2, '2018-11-22T20:35:35'),
					(2, 2, '2018-11-22T22:40:35'),
					(3, 3, '2018-11-20T10:20:30'),
					(3, 3, '2018-11-20T12:40:40'),
					(3, 3, '2018-11-20T14:50:35'),
					(3, 3, '2018-11-20T16:45:45'),
					(3, 3, '2018-11-20T18:10:40'),
					(3, 3, '2018-11-20T20:05:10'),
					(3, 3, '2018-11-20T22:25:25'),
					(3, 3, '2018-11-21T10:20:00'),
					(3, 3, '2018-11-21T12:15:30'),
					(3, 3, '2018-11-21T14:50:40'),
					(3, 3, '2018-11-21T16:25:20'),
					(3, 3, '2018-11-21T18:30:10'),
					(3, 3, '2018-11-21T20:00:10'),
					(3, 3, '2018-11-21T22:40:20'),
					(3, 3, '2018-11-22T10:00:25'),
					(3, 3, '2018-11-22T12:05:25'),
					(3, 3, '2018-11-22T14:50:15'),
					(3, 3, '2018-11-22T16:50:40'),
					(3, 3, '2018-11-22T18:15:45'),
					(3, 3, '2018-11-22T20:35:25'),
					(3, 3, '2018-11-22T22:00:10'),
					(4, 4, '2018-11-20T10:35:35'),
					(4, 4, '2018-11-20T12:20:15'),
					(4, 4, '2018-11-20T14:00:45'),
					(4, 4, '2018-11-20T16:35:00'),
					(4, 4, '2018-11-20T18:00:05'),
					(4, 4, '2018-11-20T20:15:50'),
					(4, 4, '2018-11-20T22:15:05'),
					(4, 4, '2018-11-21T10:25:50'),
					(4, 4, '2018-11-21T12:35:45'),
					(4, 4, '2018-11-21T14:45:35'),
					(4, 4, '2018-11-21T16:10:50'),
					(4, 4, '2018-11-21T18:50:35'),
					(4, 4, '2018-11-21T20:15:05'),
					(4, 4, '2018-11-21T22:45:10'),
					(4, 4, '2018-11-22T10:00:05'),
					(4, 4, '2018-11-22T12:45:10'),
					(4, 4, '2018-11-22T14:00:20'),
					(4, 4, '2018-11-22T16:25:20'),
					(4, 4, '2018-11-22T18:30:40'),
					(4, 4, '2018-11-22T20:05:40'),
					(4, 4, '2018-11-22T22:05:15'),
					(5, 5, '2018-11-20T10:05:10'),
					(5, 5, '2018-11-20T12:05:50'),
					(5, 5, '2018-11-20T14:50:50'),
					(5, 5, '2018-11-20T16:25:30'),
					(5, 5, '2018-11-20T18:45:50'),
					(5, 5, '2018-11-20T20:15:20'),
					(5, 5, '2018-11-20T22:20:30'),
					(5, 5, '2018-11-21T10:30:45'),
					(5, 5, '2018-11-21T12:45:45'),
					(5, 5, '2018-11-21T14:30:10'),
					(5, 5, '2018-11-21T16:40:15'),
					(5, 5, '2018-11-21T18:40:40'),
					(5, 5, '2018-11-21T20:35:40'),
					(5, 5, '2018-11-21T22:15:40'),
					(5, 5, '2018-11-22T10:20:15'),
					(5, 5, '2018-11-22T12:10:40'),
					(5, 5, '2018-11-22T14:10:25'),
					(5, 5, '2018-11-22T16:30:15'),
					(5, 5, '2018-11-22T18:35:35'),
					(5, 5, '2018-11-22T20:05:20'),
					(5, 5, '2018-11-22T22:50:45'),
					(6, 6, '2018-11-20T10:30:25'),
					(6, 6, '2018-11-20T12:15:35'),
					(6, 6, '2018-11-20T14:25:20'),
					(6, 6, '2018-11-20T16:25:50'),
					(6, 6, '2018-11-20T18:25:05'),
					(6, 6, '2018-11-20T20:20:00'),
					(6, 6, '2018-11-20T22:10:20'),
					(6, 6, '2018-11-21T10:50:40'),
					(6, 6, '2018-11-21T12:40:00'),
					(6, 6, '2018-11-21T14:45:20'),
					(6, 6, '2018-11-21T16:00:45'),
					(6, 6, '2018-11-21T18:25:00'),
					(6, 6, '2018-11-21T20:05:35'),
					(6, 6, '2018-11-21T22:05:25'),
					(6, 6, '2018-11-22T10:15:35'),
					(6, 6, '2018-11-22T12:25:25'),
					(6, 6, '2018-11-22T14:00:45'),
					(6, 6, '2018-11-22T16:40:15'),
					(6, 6, '2018-11-22T18:45:25'),
					(6, 6, '2018-11-22T20:00:45'),
					(6, 6, '2018-11-22T22:10:15'),
					(7, 7, '2018-11-20T10:10:25'),
					(7, 7, '2018-11-20T12:30:20'),
					(7, 7, '2018-11-20T14:25:05'),
					(7, 7, '2018-11-20T16:40:20'),
					(7, 7, '2018-11-20T18:05:45'),
					(7, 7, '2018-11-20T20:00:50'),
					(7, 7, '2018-11-20T22:15:15'),
					(7, 7, '2018-11-21T10:15:15'),
					(7, 7, '2018-11-21T12:45:20'),
					(7, 7, '2018-11-21T14:35:15'),
					(7, 7, '2018-11-21T16:45:05'),
					(7, 7, '2018-11-21T18:25:50'),
					(7, 7, '2018-11-21T20:00:35'),
					(7, 7, '2018-11-21T22:00:35'),
					(7, 7, '2018-11-22T10:10:15'),
					(7, 7, '2018-11-22T12:30:00'),
					(7, 7, '2018-11-22T14:35:35'),
					(7, 7, '2018-11-22T16:50:15'),
					(7, 7, '2018-11-22T18:25:35'),
					(7, 7, '2018-11-22T20:40:05'),
					(7, 7, '2018-11-22T22:15:15'),
					(8, 8, '2018-11-20T10:40:20'),
					(8, 8, '2018-11-20T12:35:10'),
					(8, 8, '2018-11-20T14:10:30'),
					(8, 8, '2018-11-20T16:30:15'),
					(8, 8, '2018-11-20T18:35:35'),
					(8, 8, '2018-11-20T20:45:10'),
					(8, 8, '2018-11-20T22:20:15'),
					(8, 8, '2018-11-21T10:20:25'),
					(8, 8, '2018-11-21T12:15:30'),
					(8, 8, '2018-11-21T14:10:05'),
					(8, 8, '2018-11-21T16:30:45'),
					(8, 8, '2018-11-21T18:35:10'),
					(8, 8, '2018-11-21T20:05:20'),
					(8, 8, '2018-11-21T22:15:25'),
					(8, 8, '2018-11-22T10:05:50'),
					(8, 8, '2018-11-22T12:45:40'),
					(8, 8, '2018-11-22T14:20:25'),
					(8, 8, '2018-11-22T16:05:35'),
					(8, 8, '2018-11-22T18:45:45'),
					(8, 8, '2018-11-22T20:05:25'),
					(8, 8, '2018-11-22T22:45:30'),
					(9, 9, '2018-11-20T10:35:15'),
					(9, 9, '2018-11-20T12:30:10'),
					(9, 9, '2018-11-20T14:15:15'),
					(9, 9, '2018-11-20T16:50:35'),
					(9, 9, '2018-11-20T18:00:25'),
					(9, 9, '2018-11-20T20:45:45'),
					(9, 9, '2018-11-20T22:50:15'),
					(9, 9, '2018-11-21T10:00:50'),
					(9, 9, '2018-11-21T12:10:40'),
					(9, 9, '2018-11-21T14:00:50'),
					(9, 9, '2018-11-21T16:50:05'),
					(9, 9, '2018-11-21T18:40:25'),
					(9, 9, '2018-11-21T20:50:40'),
					(9, 9, '2018-11-21T22:15:30'),
					(9, 9, '2018-11-22T10:10:15'),
					(9, 9, '2018-11-22T12:05:05'),
					(9, 9, '2018-11-22T14:25:15'),
					(9, 9, '2018-11-22T16:10:10'),
					(9, 9, '2018-11-22T18:10:20'),
					(9, 9, '2018-11-22T20:40:30'),
					(9, 9, '2018-11-22T22:50:30'),
					(10, 10, '2018-11-20T10:15:25'),
					(10, 10, '2018-11-20T12:25:05'),
					(10, 10, '2018-11-20T14:00:05'),
					(10, 10, '2018-11-20T16:00:00'),
					(10, 10, '2018-11-20T18:30:50'),
					(10, 10, '2018-11-20T20:30:00'),
					(10, 10, '2018-11-20T22:05:30'),
					(10, 10, '2018-11-21T10:40:05'),
					(10, 10, '2018-11-21T12:05:40'),
					(10, 10, '2018-11-21T14:45:35'),
					(10, 10, '2018-11-21T16:35:15'),
					(10, 10, '2018-11-21T18:35:20'),
					(10, 10, '2018-11-21T20:40:40'),
					(10, 10, '2018-11-21T22:35:40'),
					(10, 10, '2018-11-22T10:40:30'),
					(10, 10, '2018-11-22T12:20:05'),
					(10, 10, '2018-11-22T14:40:50'),
					(10, 10, '2018-11-22T16:00:20'),
					(10, 10, '2018-11-22T18:40:10'),
					(10, 10, '2018-11-22T20:50:50'),
					(10, 10, '2018-11-22T22:25:40'),
					(11, 11, '2018-11-20T10:50:45'),
					(11, 11, '2018-11-20T12:00:10'),
					(11, 11, '2018-11-20T14:00:15'),
					(11, 11, '2018-11-20T16:05:45'),
					(11, 11, '2018-11-20T18:00:00'),
					(11, 11, '2018-11-20T20:10:50'),
					(11, 11, '2018-11-20T22:20:50'),
					(11, 11, '2018-11-21T10:45:00'),
					(11, 11, '2018-11-21T12:25:00'),
					(11, 11, '2018-11-21T14:35:15'),
					(11, 11, '2018-11-21T16:35:35'),
					(11, 11, '2018-11-21T18:00:25'),
					(11, 11, '2018-11-21T20:50:30'),
					(11, 11, '2018-11-21T22:15:15'),
					(11, 11, '2018-11-22T10:00:20'),
					(11, 11, '2018-11-22T12:35:25'),
					(11, 11, '2018-11-22T14:10:25'),
					(11, 11, '2018-11-22T16:10:15'),
					(11, 11, '2018-11-22T18:40:00'),
					(11, 11, '2018-11-22T20:20:50'),
					(11, 11, '2018-11-22T22:00:50'),
					(12, 12, '2018-11-20T10:15:10'),
					(12, 12, '2018-11-20T12:25:15'),
					(12, 12, '2018-11-20T14:40:30'),
					(12, 12, '2018-11-20T16:15:30'),
					(12, 12, '2018-11-20T18:45:05'),
					(12, 12, '2018-11-20T20:10:10'),
					(12, 12, '2018-11-20T22:45:10'),
					(12, 12, '2018-11-21T10:20:00'),
					(12, 12, '2018-11-21T12:45:45'),
					(12, 12, '2018-11-21T14:40:35'),
					(12, 12, '2018-11-21T16:25:35'),
					(12, 12, '2018-11-21T18:35:45'),
					(12, 12, '2018-11-21T20:00:10'),
					(12, 12, '2018-11-21T22:25:25'),
					(12, 12, '2018-11-22T10:30:10'),
					(12, 12, '2018-11-22T12:45:20'),
					(12, 12, '2018-11-22T14:45:40'),
					(12, 12, '2018-11-22T16:05:20'),
					(12, 12, '2018-11-22T18:50:20'),
					(12, 12, '2018-11-22T20:10:35'),
					(12, 12, '2018-11-22T22:35:20'),
					(13, 13, '2018-11-20T10:45:00'),
					(13, 13, '2018-11-20T12:25:20'),
					(13, 13, '2018-11-20T14:20:25'),
					(13, 13, '2018-11-20T16:25:30'),
					(13, 13, '2018-11-20T18:15:05'),
					(13, 13, '2018-11-20T20:30:00'),
					(13, 13, '2018-11-20T22:50:20'),
					(13, 13, '2018-11-21T10:45:40'),
					(13, 13, '2018-11-21T12:10:00'),
					(13, 13, '2018-11-21T14:25:45'),
					(13, 13, '2018-11-21T16:00:10'),
					(13, 13, '2018-11-21T18:00:25'),
					(13, 13, '2018-11-21T20:25:00'),
					(13, 13, '2018-11-21T22:10:50'),
					(13, 13, '2018-11-22T10:50:05'),
					(13, 13, '2018-11-22T12:25:20'),
					(13, 13, '2018-11-22T14:00:25'),
					(13, 13, '2018-11-22T16:15:00'),
					(13, 13, '2018-11-22T18:30:40'),
					(13, 13, '2018-11-22T20:45:50'),
					(13, 13, '2018-11-22T22:10:05'),
					(14, 14, '2018-11-20T10:50:30'),
					(14, 14, '2018-11-20T12:10:10'),
					(14, 14, '2018-11-20T14:40:20'),
					(14, 14, '2018-11-20T16:50:05'),
					(14, 14, '2018-11-20T18:20:50'),
					(14, 14, '2018-11-20T20:45:45'),
					(14, 14, '2018-11-20T22:00:25'),
					(14, 14, '2018-11-21T10:45:25'),
					(14, 14, '2018-11-21T12:45:20'),
					(14, 14, '2018-11-21T14:30:15'),
					(14, 14, '2018-11-21T16:15:35'),
					(14, 14, '2018-11-21T18:45:05'),
					(14, 14, '2018-11-21T20:20:20'),
					(14, 14, '2018-11-21T22:10:10'),
					(14, 14, '2018-11-22T10:30:35'),
					(14, 14, '2018-11-22T12:00:35'),
					(14, 14, '2018-11-22T14:50:45'),
					(14, 14, '2018-11-22T16:25:25'),
					(14, 14, '2018-11-22T18:40:45'),
					(14, 14, '2018-11-22T20:40:25'),
					(14, 14, '2018-11-22T22:40:30')
GO