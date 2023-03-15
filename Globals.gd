extends Node

enum Location {
	SUN,
	MERCURY,
	VENUS,
	EARTH,
	MARS,
	JUPITER,
	SATURN,
	URANUS,
	NEPTUNE,
	PLUTO
}

const LOCATIONS_NAME = [
	"Soleil",
	"Mercure",
	"Vénus",
	"Terre",
	"Mars",
	"Jupiter",
	"Saturne",
	"Uranus",
	"Neptune",
	"Pluton"
]

const LOCATIONS_DESCRIPTION = [
	"Le Soleil est une étoile de type \"naine jaune\" composée principalement d'hydrogène (74% de sa masse) et d'hélium (25% de sa masse). Il représente à lui seul presque 99% de la masse totale du système solaire. Autour de lui orbitent des planètes telle que la nôtre. Le Soleil a 5 milliards d'années d'âge, et continuera de briller encore 5 milliards d'années. Fun fact : les planètes tournent autour du soleil, mais le système solaire entier tourne également autour du centre de la galaxie.",
	"Mercure est la planète la plus proche du Soleil, même si elle n'est pas la plus chaude ! Elle fut également une énigme pour la communauté scientifique pendant des siècles car jusqu'à Einstein, personne ne pouvait prédire avec précision son orbite autour de l'étoile. Mercure est une petite planète, elle est la moins massive de toutes. Fun fact : une année sur cette planète ne dure que 88 jours terrestres, mais un seul jour dure 58 jours terrestres !",
	"Vénus est la deuxième planète du système solaire, et pourtant elle est la plus chaude avec pas loin de 460°C à sa surface. Elle est très similaire à la Terre en ce qui concerne sa taille, sa masse et sa composition, mais est très différente sur de nombreux autres aspects. Une année là-bas est plus longue qu'une journée entière. De plus, marcher sur Vénus reviendrait à marcher à 900 mètres sous l'eau à cause de la pression extrême ! Enfin, on y rapporte un fort volcanisme ainsi que des nuages d'acide sulfurique.",
	"La Terre est le berceau de la vie, elle est la seule planète connue dans l'Univers accueillant la vie. On estime son âge à 4,54 milliards d'années. La Lune s'est formée peu après. Cette dernière est la raison pour laquelle nous avons des marées et c'est elle qui ralentit peu à peu la durée d'une journée. Grâce à tous ces phénomènes, la vie est apparue dans les océans il y a à peu près 3,5 milliards d'années. Désormais, l'Humanité explore l'espace, avec notamment la station spatiale internationale (ISS).",
	"Mars est une planète très particulière aux yeux de l'Humanité. Elle est la prochaine cible de l'exploration spatiale. Tout indique que Mars fut très similaire à la Terre auparavant, avec des lacs à sa surface, une atmosphère. Cependant, elle n'a pas survécu, son atmosphère s'est évaporée, ses lacs ont disparu ou se sont transformés en glace. Enfin, n'oublions pas qu'elle accueille le plus grand volcan du système solaire : Olympus Mons et qu'elle a deux lunes : Phobos (qui deviendra un anneau) et Déimos.",
	"Jupiter est la plus grande planète du système solaire, et aussi la plus massive. On estime que Jupiter est tellement grande qu'on pourrait y mettre environ 1300 Terres dedans ! Il s'agit d'une planète gazeuse qui n'a pas de surface solide. On y tomberait indéfiniment jusqu'à finir écraser par la pression. Les vents là-bas peuvent atteindre les 600 km/h. La tempête \"Grande Tâche Rouge\" est observée depuis le 17e siècle. Enfin, des études suggéreraient que des diamants se forment depuis le méthane de l'atmosphère !",
	"Saturne est la deuxième plus grande planète du système solaire, et sans aucun doute la plus impressionnante de par ses anneaux et son nombre de lunes : 82. Ce qui est encore plus impressionnant est que Titan, la deuxième plus grande lune du système solaire, est un habitat potentiel pour la vie en raison des océans de méthane liquide et de son atmosphère. Encelade, une autre lune de Jupiter, est aussi un habitat potentiel pour la vie microbienne à cause de ses geysers d'eau. Les deux sont plus grandes que Mercure !",
	"Uranus n'est pas le premier nom qui a été donné à cette planète, en effet son découvreur l'a appelée \"l'étoile de George\" en l'honneur du roi George III. C'est en 1789, appuyée par la découverte de l'uranium (nommé pour soutenir le nouveau nom) que Uranus a obtenu son nom définitif. La planète la plus froide du système solaire a une particularité : ses pôles Nord et Sud sont là où la plupart des autres planètes ont leur équateur, ce qui lui donne l'impression de rouler sur son orbite.",
	"Neptune, célèbre pour sa teinte de bleu, est la planète la plus éloignée du système solaire. Un tour complet autour du soleil dure 164 années terrestres ! La particularité de cette planète réside dans la façon dont elle a été découverte. Contrairement aux autres, son existence a été déduite et prédite, puis ensuite observée. Sa distance en fait un objet d'étude très difficile. À ce jour la planète n'a été visitée qu'une seule fois par la sonde Voyager 2 dont on tient la photo la plus utilisée pour l'illustrer.",
	"Malgré sa position de 9e plus gros objet céleste connu à tourner autour du Soleil, Pluton n'est pas considérée comme étant la 9e planète. Elle ne l'est plus depuis la décision de l'union astronomique internationale en 2006. Il s'agissait de la seule planète découverte par un américain, en 1930. En raison de sa très grande distance par rapport à la Terre, il est très difficile de l'observer. Sa première et dernière observation fut réalisée par la sonde New Horizons en 2015 d'où vient sa célèbre photo."
]

func get_random_integer(min_value:int, max_value:int)->int:
	return randi()%max_value+min_value
