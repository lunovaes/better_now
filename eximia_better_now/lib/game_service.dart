import 'package:eximia_better_now/color_service.dart';
import 'package:eximia_better_now/game_model.dart';

class GameService {
  static List<GameModel> games = [getConnectGame(), getPrepareGame(), getInspireGame()];
  static GameModel selectedGame = getConnectGame();
  static bool gameStarted = false;
}

GameModel getConnectGame() {
  var model = GameModel();
  model.id = 0;
  model.title = "CONECTE-SE";
  model.backgroundColor = ColorService.black;
  model.titleBackgroundColor = ColorService.black;
  model.foregroundColor = ColorService.pink;
  model.titleTextColor = ColorService.lightTextColor;
  model.introduction =
      "Tá, vocês devem estar pensando como funciona essa etapa do jogo, antes de esquentar as coisas é importante não se esquecerem de que uma boa comunicação é fundamental para vocês construírem uma conexão mais profunda e significativa.";
  model.deck = DeckModel([
    CardModel(1, "O que vocês mais admiram um no outro?"),
    CardModel(2, "Qual o momento favorito que passaram juntos?"),
    CardModel(3, "O que vocês mais valorizam no relacionamento de vocês?"),
    CardModel(4, "O que vocês acham mais importante e fundamental em um relacionamento?"),
    CardModel(5, "Como seria um encontro perfeito pra vocês e o que não pode faltar?"),
    CardModel(6, "O que faz vocês se sentirem amados?"),
    CardModel(7, "O que mais tira a paz um do outro?"),
    CardModel(8, "O que vocês acham que atrapalha a conexão entre vocês no dia a dia?"),
    CardModel(9, "O que poderia melhorar a conexão entre vocês?"),
    CardModel(10, "Quando vocês tiveram certeza que eram a pessoa certa um do outro?"),
    CardModel(11, "Digam 5 coisas que vocês amam quando o outro faz!"),
    CardModel(12, "Qual o momento que vocês mais sentiram orgulho um do outro?"),
    CardModel(13, "Qual o ato mais romântico pra vocês durante o sexo?"),
    CardModel(14, "Pra vocês, o sexo tem que ser espontâneo ou pode ser planejado?"),
    CardModel(15, "O que não pode faltar em um sexo perfeito?"),
    CardModel(16, "Hora de começar a apimentar as coisas! Qual é o brinquedo sexual favorito de vocês?"),
    CardModel(17, "Qual a posição sexual favorita de vocês? Preferem com força ou com jeitinho?"),
    CardModel(18, "O que cada um faz que mais instiga e excita o outro?"),
    CardModel(19, "Qual lugar mais inusitado que vocês gostariam de transar?"),
    CardModel(20, "Quais as partes do corpo que vocês mais gostam um do outro?"),
    CardModel(21, "Se vocês pudessem experimentar algo novo na cama, o que seria?"),
    CardModel(22, "Quais são as fantasias que vocês têm e ainda não realizaram?"),
    CardModel(23, "Vocês gostam de ser chamados de algo diferente durante o sexo?"),
    CardModel(24, "Vocês preferem sexo mais romântico ou mais ousado?"),
    CardModel(25, "Tem alguma pergunta que vocês gostariam de fazer um para o outro?"),
  ]);
  return model;
}

GameModel getPrepareGame() {
  var model = GameModel();
  model.id = 1;
  model.title = "PREPARE-SE";
  model.backgroundColor = ColorService.pink;
  model.titleBackgroundColor = ColorService.pink;
  model.foregroundColor = ColorService.black;
  model.introduction =
      "Chegou o momento mais aguardado, a hora que o tesão e o desejo serão seus maiores aliados no jogo, a única regra é deixar fluir toda vontade que está dentro de vocês. Aproveitem, porque poucos conseguem chegar até o final das cartas!";
  model.deck = DeckModel([
    CardModel(1,
        "Tirem as roupas um do outro lentamente e comecem a ouvir playlist que preparamos especialmente para esse momento!",
        imagePath: "qr_code_0.png"),
    CardModel(2, "Beijem a parte do corpo um do outro que vocês mais gostam."),
    CardModel(3, "Falem no ouvido um do outro o que vocês estiverem pensando!"),
    CardModel(4,
        "Utilizem por 2min algum brinquedo sexual que gostem! DICA: Um vibrador com capas diferentes e um sugador seriam opções incríveis!"),
    CardModel(5,
        "Façam uma massagem relaxante e excitante onde preferirem um no outro! Dica: Nossa vela Exímia junto com a varinha massageadora seria o combo perfeito para esse momento!"),
    CardModel(6,
        "Se ainda não conhecem o poder do olhar, experimentem se olharem por alguns minutos até não aguentarem mais de tesão!"),
    CardModel(
        7, "Se acariciem por alguns minutos, onde preferirem, mas aproveitem esse momento de conexão e prazer juntos!"),
    CardModel(8,
        "Façam um delicioso sexo oral um no outro! Dica: As bolas bolas tailandesas e um gel excitante são perfeitos para esquentar o clima!"),
    CardModel(9, "Após tantas preliminares e conexão, escolham uma posição para começarem!"),
    CardModel(10,
        "Se ainda conseguirem continuar, mudem para uma posição mais ousada, sabemos que daqui pra frente nada se controla, é a hora de se deixarem levar!"),
  ]);
  return model;
}

GameModel getInspireGame() {
  var model = GameModel();
  model.id = 2;
  model.hasTimer = false;
  model.title = "INSPIRE-SE";
  model.backgroundColor = ColorService.pink;
  model.titleBackgroundColor = ColorService.yellow;
  model.foregroundColor = ColorService.yellow;
  model.introduction =
      "Tá, vocês devem estar pensando como funciona essa etapa do jogo, antes de esquentar as coisas é importante não se esquecerem de que uma boa comunicação é fundamental para vocês construírem uma conexão mais profunda e significativa.";
  model.deck = DeckModel([
    CardModel(1,
        "Café da manhã na cama: \n\n\nVocê fica vendado e o outro fica responsável por te dar os alimentos e bebidas para experimentar, você precisa adivinhar o que é! Escolham elementos com sabores e texturas diferentes, o que fará com que seja uma experiência diferente e divertida! PS: Quem perder paga prenda!"),
    CardModel(2,
        "Banho juntos: \n\n\nEssa é uma ótima alternativa para criarem uma conexão diferente, utilizem um óleo para fazer massagem um no outro, o que será extremamente relaxante e gostoso!"),
    CardModel(3,
        "Carta de amor: \n\n\nReserve um tempo para colocar no papel tudo o que você ama do outro. Muitas vezes esquecemos de dizer e partimos do princípio que o outro sabe, mas precisamos constantemente lembrar e fazer com que o outro se sinta amado e especial!"),
    CardModel(4,
        "Jantar romântico: \n\n\nCaso tenham algum dote culinário tirem um tempo para preparar algo especial, vocês podem abrir uma garrafa de vinho ou uma bebida que gostem, colocar uma música e aproveitar esse tempo juntos. Calma, se vocês não souberem navegar nesses mares, peçam um jantar especial e aproveitem enquanto esperam!"),
    CardModel(5,
        "Massagem: \n\n\nCrie um clima especial, prepare o quarto ou o local que preferir com os itens que vai precisar. Um escalda pés relaxante combina muito com uma massagem excitante utilizando a vela Exímia, eles serão seus melhores amigos nesse momento!"),
    CardModel(6,
        "Papo sincero: \n\n\nDurante o sexo, em cada coisa que forem fazer perguntem um para o outro como querem. Por exemplo: lento, rápido, forte, suave, mais pra cima, mais pra baixo, se dói ou se é bom. Vocês podem se surpreender com as respostas e isso faz com que vocês se conheçam e se conectem ainda mais!"),
    CardModel(7,
        "Tantra: \n\n\nA prática tântrica intensifica a sensação orgástica, ameniza o estresse e melhora a qualidade do sono, além de elevar a conexão do casal em intimidade sexual. É importante que o ambiente esteja preparado e que você tenha todos os elementos necessários para começar, no blog do nosso site tem um post perfeito que vai ajudar!"),
    CardModel(8,
        "Xô rotina: \n\n\nFaçam um passeio legal, seja um piquenique no parque ou um bate volta na praia, o que importa é inovar e pensar em algo diferente dentro da realidade de vocês!"),
    CardModel(9,
        "Viagem: \n\n\nPlanejem uma viagem juntos, tudo que dá muito trabalho causa estresse e esgotamento, fora que demanda tempo! Aqui a intenção é algo simples, um airbnb no interior ou em uma praia próxima, algum lugar que já foram antes e que foi legal, quanto mais simples e fácil de organizar melhor, isso ajuda a não procrastinar, bora arrumar as malas!"),
    CardModel(10,
        "Cineminha especial: \n\n\nEm casa: preparem o ambiente, comprem coisas gostosas para beliscar, assistam um filme mais picante ou romântico a depender da vibe do dia.No cinema: façam alguma brincadeira ou se provoquem durante o filme, seja falando besteiras no ouvido um do outro ou usando algum brinquedo ou gel."),
    CardModel(11,
        "Primeiro encontro: \n\n\nTentem reviver esse dia, não precisa ser exatamente igual, mas tentem recriar o ambiente, beber e comer as mesmas coisas ou algo semelhante. Isso faz vocês lembrarem de tudo o que viveram até aqui, o quanto evoluíram e cresceram juntos como casal, além de despertar aquela paixão do início do relacionamento, sabe?"),
    CardModel(12,
        "Encontro secreto: \n\n\nDepois de um dia cansativo de trabalho, mande uma mensagem pedindo para que o outro te encontre em um local de sua escolha, passe o endereço, horário, dress code, tudo o que for necessário para que não dê nada errado! Aqui você pode escolher um restaurante, um bar, algum lugar que vocês queriam ir juntos, enfim, o céu é o limite!"),
    CardModel(13,
        "Ensaio: \n\n\nNem sempre ficamos muito confortáveis, mas aqui esqueça das redes sociais, aproveite o momento. Um parque, praia, qualquer lugar que tenha uma vista e um clima descontraído. Para apimentar as coisas,um motel com um quarto mais luxuoso para um ensaio mais excitante, isso sem dúvidas vai dar um up no relacionamento e chacoalhar a rotina!"),
    CardModel(14,
        "Day off: \n\n\nNada como não ter que pensar em nada e só deitar debaixo das cobertas para maratonar alguma série ou filme, não é mesmo? Tire hoje para fazer isso, para tornar o momento mais legal, vocês podem pedir alguma comida gostosa ou fazer pipoca!"),
    CardModel(15,
        "Noite de jogos: \n\n\nEscolha um jogo e faça um programa diferente, seja só vocês ou um grupo de amigos, nada como aproveitar em boas companhias! DICA - Sozinhos: quando alguém perder paga prenda! Amigos: quando alguém perder, bebe um shot!"),
  ]);
  return model;
}
