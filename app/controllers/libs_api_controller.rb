class LibsApiController < ApplicationController
	def setupLibs
	
		libstoClear = Lib.all
		libstoClear.delete_all
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:-2'
		lib.value = '%h всегда был хлипким заморышем, он боится всех и всего и предпочитает никогда не ввязываться в драки, потому что это никогда для него хорошо не заканчивалось.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:-1'
		lib.value = '%h побывал на нескольких аренах и всегда мечтал драться с гладиаторами там, но судьба ему не дала такого шанса – он всегда был откровенно слабым %c.tvp. Боясь смерти, %h так ни разу и не побывал в битве, и остался слабым.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:0'
		lib.value = '%h всегда готов к битве, однако он зачастую проигрывает даже смешным противникам, отчего теряет самооценку.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:1'
		lib.value = '%h не такой уж и сильный, как кажется на первый взгляд. Да, он может врезать и дать пинка, но сильный противник без проблем уничтожит наглого %c.rop, поэтому тот предпочитает запугивать, а не драться по-настоящему.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:2'
		lib.value = 'Побывав в куче передряг и битв, %h закалился в бою и может наподдать любому, кто с ним полезет в драку. Все девки от него текут, а ему на них всех плевать. Потому все мужики козлы и их интересует только война и политика, а до женщины им дела нет вообще.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'str:3'
		lib.value = '%h – ветеран афгана и он ЧРЕЗВЫЧАЙНО СИЛЕН. Резкий, молниеносный, быстрый, он наносит кровавые фатальные повреждения своему врагу. %H не боится никого и мечтает проявить свой талант и достичь вершины полей правосудия.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:-2'
		lib.value = 'Неуклющий мишка – так называли %h, когда он был маленьким. У него все летит из рук, он ничего не умеет делать хорошо и качественно. Тонкие искусства ему недоступны.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:-1'
		lib.value = 'А поговорка «как слон в посудной лавке» – это и есть про него. Где равернется, там и кого-нибудь заденет и испортит ландшафт. Не давайте ему в руки острые предметы – он и себя поранит и по врагу не попадет. Лучше уж дубину какую-нибудь.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:0'
		lib.value = 'Флегматичный и медленный на подъем %c.imp – он никогда не славился четкими и быстрыми действиями.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:1'
		lib.value = 'А в детстве %h мог залезть на любую крышу или дерево, его движения точны и быстры, а взгляд никогда не бывает затуманенным.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:2'
		lib.value = '%h не боится сильных мощных противников – он с первых секунд битвы узнает их слабости и всегда попадает в цель. В него просто хрен попадешь, постоянно бегает крутится. Мерзкий тип.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'dex:3'
		lib.value = 'И как же красиво он ведет драку – его движения словно танец, восхищающий союзников и внушающий панику во врага. Животные инстинкты, интуиция и природная хитрость, ОН МАКАКА, ОН ТИГР, ОН МЕДВЕДЬ. И %h этими талантами умело пользуется. '
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:-2'
		lib.value = 'А вот с магией у героя ПРОБЛЕМКИ. Сколько он не пытался колдовать – у него ничего не получается. В детстве это создавало ему проблемы, но сейчас ему просто плевать и он смотрит на этих грязных магов с высока.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:-1'
		lib.value = 'Когда-то %h учился магии. Хоть и с трудом, но по курпицам он собирал небесную ману и концентрировал её в своих заклинаниях. Вот только исполнение этих заклинаний еще ни разу для него не заканчивалось хорошо, поэтому герой предпочитает ей не пользоваться.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:0'
		lib.value = 'Герой обучался магии вместе с другими детьми не показывая никаких талантов в этой области. Однако он успешно сдал экзамены и до сих пор может что-либо скастовать.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:1'
		lib.value = 'Магию наш герой не одобряет, мерзкой она ему кажется и дизбалансной. Однако когда его прижимают к стенке он не брезгует скастовать что-нибудь отвратительное, чтобы уничтожить своего противника. Берегитесь враги!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:2'
		lib.value = 'С удовольствием отучившись на мага, %h начал промышлять магией самостоятельно. Его заклинания закалились в бою, и он просто обожает их использовать. Там кастанёт, тут кастанёт. И сидит радуется всем назло!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mag:3'
		lib.value = 'У всех вокруг магический талант %h вызывает удивление. Как этот c.imp может быть настолько талантливым? – спрашивают все. А он и сам не знает, как так получилось. Ведь он – и есть магия он – ЕБАНЫЙ ЧЕРНЫЙ КОЛДУН ИЗ АДА, он чувствует каждую клеточку вокруг и знает, как управлять всеми силами на земле. Ему никто не помеха.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:-2'
		lib.value = 'Тупорылый имбецил, он не может промолвить даже пару слов и постоянно испражняется под себя. Такое элитное поведение вызывает у всех вокруг насмешки, а в детстве это привело %h к настоящей травле.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:-1'
		lib.value = 'Даун-аутист – он постоянно зациклен на бесполезных вещах и никогда не скажет вам ничего полезного. Однако с теми, кто с ним не согласен – он суров, так что не перечь ему.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:0'
		lib.value = 'Туповатый %c.imp, он зачастую так сильно тупит, что выводит всех вокруг из себя. Но иногда на него нисходит просветление и он делает что-то полезное.  Ненадолго его хватает.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:1'
		lib.value = 'Среднего ума c.imp, он прекрасно осознает свои плюсы и минусы и всегда готов использовать то, что ему дала природа. Однако он не сильно желает развиваться, да и вообще довольно инертен. Ему на все плевать и изучать он ничего не желает.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:2'
		lib.value = 'Довольно умный, он всегда может найти свой бонус в любом исходе. Он постоянно развивается, читает книжки и смотрит на этих невежд свысока. Однажды %h добьется всего и будет на вершине мира. По крайней мере он в это верит.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'int:3'
		lib.value = 'ГЕНИАЛЬНЫЙ тактик, стратег и торговец, он читает мысли и управляет разумом других людей с легкостью. Он постоянно в раздумьях и не дает себе отдыха, только лишь для того, чтобы быть ЛУЧШЕ всех. Куча людей перед ним стоят на коленях и просят поделиться мудростью. И он всегда её делится, ибо это мудро. Да и какая разница – все остальные настолько тупы что едва ли они смогут понять его.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:-2'
		lib.value = 'Герой всегда ненавидел людей, он просто не может с ними находиться рядом. Его тошнит от больших компаний, и он совсем не умеет торговаться – да ему это и не нужно, ведь всегда можно убить торговца и забрать у него всё что тебе нужно.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:-1'
		lib.value = 'Простой деревенский паренек, он всегда был добродушен ко всем. И многие этим пользовались. Но однажды %h посмотрел на себя и свою жизнь и понял, что люди – эгоистичны и трусливы. И перестал общаться со всеми. И когда торгуется он забирает товар и даже не смотрит сдачу, потому что ему плевать – лишь бы подальше убежать от людных мест.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:0'
		lib.value = '%h всегда хотел быть таким же как все, и с трепетным рвением пытался мимикрировать под толпу и это ему накоц-то успешно удалось в какой-то мере. Его никто не замечает, и ему от этого сладко на душе.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:1'
		lib.value = 'Настоящий мужик наш %c.imp! Он любит побазарить от души с братанами и пропустить пару рюмашек. В целом, на этом его ораторские таланты заканчиваются.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:2'
		lib.value = 'Ох уж этот %h – он настоящая душа компании, то пошутит, то пританцовывать начнет. Вокруг себя он мгновенно собирает народ, и люди его любят. Он делится с ними своей радостью и своим вечно хорошим настроением. И всем становится хорошо.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'tra:3'
		lib.value = 'ЛЕГЕНДАРНЫЙ ШОУМЕН и ЗВЕЗДА мирового маштаба, люди в своих снах мечтают понюхать нашего героя или хотя бы краем глаза увидеть нашего героя в живую. Немного уставший от такой бешенной популярности он все еще душа любой компании и быть с ним рядом мечтает любой. Потому что человека добрее, мудрее и честнее не найти. По крайней мере, ОНИ так думают.'
		lib.save
		
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:-2'
		lib.value = '%h целых десять лет был прикован к стулу и не двигался. И у него наступили неисправимые повреждения внутренних органов. Поэтому наш герой совершенно не приспособлен к нагрузкам. Но он все равно вышел на поля битвы, чтобы набираться опыта и поправить наконец уже свое здоровье.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:-1'
		lib.value = 'Никогда наш c.imp не ходил в поход, никогда он не делал пробежек. Из-за этого заплыл жиром и получил проблемы с сердечно-сосудистой системой. Все хорошее когда-нибудь заканчивается, и мамка выкинула %h на поля призывателя. Хоть он и домашний, все равно он хочет быть лучшим и доказать мамке что-то, доступное только им двоим!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:0'
		lib.value = 'Наш герой занимался отжиманиями и приседаниями.  Вроде-бы все с ним хорошо. Только вот по лицу он никогда серьезно не получал, поэтому избегает ссерьезных нагрузок и повреждений. Он хочет найти себя на полях битвы и развить свои таланты, да поможет ему бог.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:1'
		lib.value = 'Красавчик %c.imp, он стройно выглядит, подтянутый сексуальный тип без единой морщинки и прыщика. Настоящий боец. По крайней мере таким он кажется девчонкам. Природная красота и таланты помогут ему на полях битвы.'
		lib.save	
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:2'
		lib.value = 'Занатия спортом принесли герою кучу профитов: он стал намного сильнее и выносливее. С его-то данными он уж точно сможет завоевать поле битв.'
		lib.save
				
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'vel:3'
		lib.value = 'Невыносимые тяжелейшие тренировки, которым подвергался герой сделали из него непробиваемую скалу. Он не чувствует боли и он готов уничтожить всех и каждого, кого он встретит, и ничто его не остановит!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'hp:-1'
		lib.value = 'А еще герой проклят матушкой землей, из-за чего он слабее чем он мог быть.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'hp:1'
		lib.value = 'А еще герой благословлен матушкой землей, из-за чего он сильнее чем он мог быть до этого.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mana:-1'
		lib.value = 'А еще герой проклят небесами и поэтому ему зачастую не хватает сил сколдовать что-либо реально сильное.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'mana:1'
		lib.value = 'А еще герой был благословлен небесами и самолично богом, ему был дан дар колдовать столько, сколько его душа пожелает.'
		lib.save
		
		
		####################################################################################################################################################
		####################################################################################################################################################
		####################################################################################################################################################
		####################################################################################################################################################
		
				lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:-2'
		lib.value = '%h всегда была хлипкой заморашкой, она боится всех и всего и предпочитает никогда не ввязываться в драки, потому что это никогда для неё хорошо не заканчивалось.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:-1'
		lib.value = '%h побывала на нескольких аренах и всегда мечтала драться с гладиаторами там, но судьба ей не дала такого шанса – она всегда был откровенно слабой женщиной. Боясь смерти, %h так ни разу и не побывала в битве, и осталась слабой.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:0'
		lib.value = '%h всегда готова к битве, однако она зачастую проигрывает даже смешным противникам, отчего её самооценка падаает.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:1'
		lib.value = '%h не такая уж и сильная, как кажется на первый взгляд. Да, она может врезать и дать пинка, но сильный противник без проблем уничтожит наглую %c.rop, поэтому та предпочитает запугивать, а не драться по-настоящему.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:2'
		lib.value = 'Побывав в куче передряг и битв, %h закалилась в бою и может наподдать любому, кто с ней полезет в драку. Все мужики её уважают, а ей на них всех плевать. Потому все мужики козлы и их интересует только война и политика, а до женщины им дела нет вообще.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fstr:3'
		lib.value = '%h – ветеран афгана и он ЧРЕЗВЫЧАЙНА СИЛЬНА. Резкая, молниеносная, быстрая, она наносит кровавые фатальные повреждения своему врагу. %H не боится никого и мечтает проявить свой талант и достичь вершины полей битвы.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:-2'
		lib.value = 'Неуклющая свинья – так называли %h, когда она был маленькой. У него все летит из рук, она ничего не умеет делать хорошо и качественно. Тонкие искусства ей недоступны.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:-1'
		lib.value = 'А поговорка «как слон в посудной лавке» – это и есть про неё. Где равернется, там и кого-нибудь заденет и испортит ландшафт. Не давайте ей в руки острые предметы – она и себя поранит и по врагу не попадет. Лучше уж сковородку какую-нибудь. Или скалку.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:0'
		lib.value = 'Флегматичная и медленная на подъем %c.imp – она никогда не славилась четкими и быстрыми действиями.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:1'
		lib.value = 'А в детстве %h могла залезть на любую крышу или дерево, её движения точны и быстры, а взгляд никогда не бывает затуманенным.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:2'
		lib.value = '%h не боится сильных мощных противников – она с первых секунд битвы узнает их слабости и всегда попадает в цель. В неё просто хрен попадешь, постоянно бегает крутится. Мерзкая сучка.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fdex:3'
		lib.value = 'И как же красиво она ведет драку – её движения словно танец, восхищающий союзников и внушающий панику во врага. Животные инстинкты, интуиция и природная хитрость, ОНА МАКАКА, ОНА ТИГР, ОНА МЕДВЕДИЦА. И %h этими талантами умело пользуется. '
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:-2'
		lib.value = 'А вот с магией у героини ПРОБЛЕМКИ. Сколько бы она не пытался колдовать – у неё ничего не получается. В детстве это создавало ей проблемы, но сейчас ей просто плевать и она смотрит на этих грязных магов с высока.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:-1'
		lib.value = 'Когда-то %h училась магии. Хоть и с трудом, но по курпицам она собирала небесную ману и концентрировала её в своих заклинаниях. Вот только исполнение этих заклинаний еще ни разу для неё не заканчивалось хорошо, поэтому героиня предпочитает магией не пользоваться.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:0'
		lib.value = 'Героиня обучалась магии вместе с другими детьми не показывая никаких талантов в этой области. Однако она успешно сдал экзамены и до сих пор может что-либо скастовать.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:1'
		lib.value = 'Магию наша героиня не одобряет, мерзкой она ей кажется и дизбалансной. Однако когда её прижимают к стенке, она не брезгует скастовать что-нибудь отвратительное, чтобы уничтожить своего противника. Берегитесь враги!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:2'
		lib.value = 'С удовольствием отучившись на мага, %h начала промышлять магией самостоятельно. Её заклинания закалились в бою, и она просто обожает их использовать. Там кастанёт, тут кастанёт. И сидит радуется всем назло!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmag:3'
		lib.value = 'У всех вокруг магический талант %h вызывает удивление. Как эта %c.imp может быть настолько талантливой? – спрашивают все. А она и сама не знает, как так получилось. Ведь она – и есть магия. Она – ЕБАНАЯ ЧЕРНАЯ КОЛДУНЬЯ ИЗ АДА, она чувствует каждую клеточку вокруг и знает, как управлять всеми силами на земле. Ей никто не помеха.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:-2'
		lib.value = 'Тупорылая имбецилная дура, она не может промолвить даже пару слов и постоянно испражняется под себя. Такое элитное поведение вызывает у всех вокруг насмешки, а в детстве это привело её к настоящей травле.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:-1'
		lib.value = 'Даун-аутист – она постоянно зациклена на бесполезных вещах и никогда не скажет вам ничего полезного. Однако с теми, кто с ней не согласен – она сурова, так что не перечь ей.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:0'
		lib.value = 'Туповатая %c.imp, она зачастую так сильно тупит, что выводит всех вокруг из себя. Но иногда на неё нисходит просветление и она делает что-то полезное. Ненадолго её хватает.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:1'
		lib.value = 'Среднего ума %c.imp, она прекрасно осознает свои плюсы и минусы и всегда готова использовать то, что ей дала природа. Однако она не сильно желает развиваться, да и вообще довольно инертна. Ей на все плевать и изучать она ничего не желает.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:2'
		lib.value = 'Довольно умная, она всегда может найти свой бонус в любом исходе. Она постоянно развивается, читает книжки и смотрит на этих невежд свысока. Однажды %h добьется всего и будет на вершине мира. По крайней мере она в это верит.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fint:3'
		lib.value = 'ГЕНИАЛЬНЫЙ тактик, стратег и торговец, она читает мысли и управляет разумом других людей с легкостью. Она постоянно в раздумьях и не дает себе отдыха, только лишь для того, чтобы быть ЛУЧШЕ всех. Куча людей перед ней стоят на коленях и просят поделиться мудростью. И она всегда ею делится, ибо это мудро. Да и какая разница – все остальные настолько тупы что едва ли они смогут понять её.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:-2'
		lib.value = 'Героиня всегда ненавидела людей, она просто не может с ними находиться рядом. Её тошнит от больших компаний, и она совсем не умеет торговаться – да ей это и не нужно, ведь всегда можно убить торговца и забрать у него всё что тебе нужно.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:-1'
		lib.value = 'Простая дервенская пастушка, она всегда был добродушна ко всем. И многие этим пользовались. Но однажды %h посмотрела на себя и свою жизнь со стороны и поняла, что люди – эгоистичны и трусливы. И перестала общаться со всеми. И когда торгуется, она забирает товар и даже не смотрит сдачу, потому что ей плевать – лишь бы подальше убежать из людных мест.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:0'
		lib.value = '%h всегда хотела быть таким же как все, и с трепетным рвением пыталась мимикрировать под толпу и это ей накоц-то успешно удалось в какой-то мере. Её никто не замечает, и ей от этого сладко на душе.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:1'
		lib.value = 'Бой-баба эта наша %h! Она любит побазарить от души с братанами и подружками и пропустить пару рюмашек. В целом, на этом её ораторские таланты заканчиваются.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:2'
		lib.value = 'Ох уж эта %h – она настоящая душа компании, то пошутит, то пританцовывать начнет. Вокруг себя она мгновенно собирает народ, и люди её любят. Она делится с ними своей радостью, улыбкой и своим вечно хорошим настроением. И всем становится хорошо.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'ftra:3'
		lib.value = 'ЛЕГЕНДАРНЫЙ ШОУМЕН и ЗВЕЗДА мирового маштаба, люди в своих снах мечтают понюхать нашу героиню или хотя бы краем глаза увидеть её в живую. Немного уставшая от такой бешенной популярности, она все еще душа любой компании и быть с ней рядом мечтает любой. Потому что человека добрее, мудрее и честнее не найти. По крайней мере, ОНИ так думают.'
		lib.save
		
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:-2'
		lib.value = '%h целых десять лет был прикована к стулу и не двигалась. И у неё наступили неисправимые повреждения внутренних органов. Поэтому наша героиня совершенно не приспособлена к нагрузкам. Но она все равно вышла на поля битвы, чтобы набираться опыта и поправить наконец уже свое здоровье.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:-1'
		lib.value = 'Никогда наша %c.imp не ходила в поход, никогда она не делала пробежек. Из-за этого заплыла жиром и получила проблемы с сердечно-сосудистой системой. Все хорошее когда-нибудь заканчивается, и мамка выкинула %h на поля призывателя. Хоть она и домашная, все равно она хочет быть лучшей и доказать мамке что-то, доступное только им двоим!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:0'
		lib.value = 'Наша героиня занималась отжиманиями и приседаниями. И вроде-бы все с ней хорошо. Только вот по лицу она никогда серьезно не получала, поэтому избегает ссерьезных нагрузок и повреждений. Она хочет найти себя на полях битвы и развить свои таланты, да поможет ей бог.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:1'
		lib.value = 'Красавица %c.imp, она стройно выглядит, подтянутая сексуальная телка без единой морщинки и прыщика. Настоящая СУКА. По крайней мере таким она кажется мальчикам. Природная красота и таланты помогут ей на полях битвы.'
		lib.save	
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:2'
		lib.value = 'Занатия спортом принесли героине кучу профитов: она стал намного сильнее и выносливее. С её-то данными, она уж точно сможет завоевать поле битв.'
		lib.save
				
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fvel:3'
		lib.value = 'Невыносимые тяжелейшие тренировки, которым подвергалась героиня сделали из неё непробиваемую скалу. Она не чувствует боли и она готов уничтожить всех и каждого, кого она встретит, и ничто его не остановит!'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fhp:-1'
		lib.value = 'А еще героиня проклята матушкой землей, из-за чего она слабее чем он могла быть.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fhp:1'
		lib.value = 'А еще героиня благословлена матушкой землей, из-за чего она сильнее чем она могла бы быть до этого.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmana:-1'
		lib.value = 'А еще героиня проклята небесами и поэтому ей зачастую не хватает сил сколдовать что-либо реально сильное.'
		lib.save
		
		lib = Lib.new
		lib.token = 'heroDesc'
		lib.item = 'fmana:1'
		lib.value = 'А еще героиня была благословлена небесами и самолично богом, ей был дан дар колдовать столько, сколько её душа пожелает.'
		lib.save
		
		
		
		#######################################################################################################################################
		#######################################################################################################################################
		#Creature Modificators
		#######################################################################################################################################
		#######################################################################################################################################
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '0'
		lib.value = 'Хилый'
		lib.save
			
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '1'
		lib.value = 'Маленький'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '2'
		lib.value = 'Отсталый'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '3'
		lib.value = 'Слабый'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '4'
		lib.value = 'Великолепный'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '5'
		lib.value = 'Сильный'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '6'
		lib.value = 'Мощный'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '7'
		lib.value = 'Огромный'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '8'
		lib.value = 'Великий'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.m'
		lib.item = '9'
		lib.value = 'Титанический'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '0'
		lib.value = 'Хилая'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '1'
		lib.value = 'Маленькая'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '2'
		lib.value = 'Отсталая'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '3'
		lib.value = 'Слабая'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '4'
		lib.value = 'Великолепная'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '5'
		lib.value = 'Сильная'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '6'
		lib.value = 'Мощная'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '7'
		lib.value = 'Великая'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '8'
		lib.value = 'Огромная'
		lib.save
		
		lib = Lib.new
		lib.token = 'creatureMod.f'
		lib.item = '9'
		lib.value = 'Титаническая'
		lib.save
		
		alllibs = Lib.all
		render json: alllibs

	end
	
	
	def getHeroDesc
		strItem = Lib.find_by token: 'heroDesc', item: 'str:'+params[:str]
		dexItem = Lib.find_by token: 'heroDesc', item: 'dex:'+params[:dex]
		magItem = Lib.find_by token: 'heroDesc', item: 'mag:'+params[:mag]
		intItem = Lib.find_by token: 'heroDesc', item: 'int:'+params[:int]
		traItem = Lib.find_by token: 'heroDesc', item: 'tra:'+params[:tra]
		velItem = Lib.find_by token: 'heroDesc', item: 'vel:'+params[:vel]
		manaItem = Lib.find_by token: 'heroDesc', item: 'mana:'+params[:mana]
		hpItem = Lib.find_by token: 'heroDesc', item: 'hp:'+params[:hp]
		
		text = strItem.value + " " + dexItem.value + " " + magItem.value + " " + intItem.value + " " + traItem.value
		if (hpItem)
			text = text + " " + hpItem.value
		end
		if (manaItem)
			text = text + " " + manaItem.value
		end
		text = text + " " + velItem.value
		
		result = {'success' => true, 'status' => 'OK', 'text' => text}
		render json: result
	end
	
	
end
