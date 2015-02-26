class LibsApiController < ApplicationController
	def setupLibs
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
		
		
	end
	
	
	def getHeroDesc
		strItem = Lib.find_by token: 'heroDesc', item = 'str:'+params[:str]
		dexItem = Lib.find_by token: 'heroDesc', item = 'dex:'+params[:dex]
		magItem = Lib.find_by token: 'heroDesc', item = 'mag:'+params[:mag]
		intItem = Lib.find_by token: 'heroDesc', item = 'int:'+params[:int]
		traItem = Lib.find_by token: 'heroDesc', item = 'tra:'+params[:tra]
		velItem = Lib.find_by token: 'heroDesc', item = 'vel:'+params[:vel]
		manaItem = Lib.find_by token: 'heroDesc', item = 'mana:'+params[:mana]
		hpItem = Lib.find_by token: 'heroDesc', item = 'hp:'+params[:hp]
		
		text = strItem.value + " " + dexItem.value + " " + magItem.value + " " + intItem.value + " " + traItem.value
		if (hpItem)
			text = text + " " + hpItem.value
		if (manaItem)
			text = text + " " + manaItem.value
		text = text + " " + velItem.value
		
		result = {'success' => true, 'status' => 'OK', 'text' => text}
	end
end
