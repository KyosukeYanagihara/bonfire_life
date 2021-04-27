# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create!(
  email: "rctttzg7@sample.com",
  password: '123456789',
  password_confirmation: '123456789',
  created_at: Time.current,
  updated_at: Time.current,
  id: 1
)

Address.create!(
  postcode: 345-9617,
  prefecture_code: 24,
  city: "四日市市",
  address1: "6-5",
  user_id: 1,
  created_at: Time.current,
  updated_at: Time.current
)

Account.create!(
  admin: true,
  first_name: "太郎",
  last_name: "山田",
  first_name_kana: "タロウ",
  last_name_kana: "ヤマダ",
  birthday: Time.current.ago(25.year),
  sex: 1,
  contact_number: 12345678901,
  user_id: 1,
  created_at: Time.current,
  updated_at: Time.current
)

Product.create!(
  [
    {
      name: "mouncol ORTEGA",
      images: [open("#{Rails.root}/db/fixtures/mouncol ORTEGA1.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncol ORTEGA2.jpg"),
              open("#{Rails.root}/db/fixtures/mouncol ORTEGA3.jpg"),
              open("#{Rails.root}/db/fixtures/mouncol ORTEGA4.jpg"),
              open("#{Rails.root}/db/fixtures/mouncol ORTEGA5.jpg"),
              ],
      description: "ニューメキシコ州チマヨの伝統工芸品でもある織物の柄をモチーフにデザインされたORTEGAは、今までの焚火台には無い、プリミティブな幾何学模様が特徴です。",
      rental_price: 8500,
      selling_price: 46200,
      size: "約Φ450 × H330mm（脚170mm）",
      weight: 7,
      brand: "sanzoku mountain サンゾクマウンテン",
    },
    {
      name: "mouncos ORTEGA",
      images: [open("#{Rails.root}/db/fixtures/mouncos ORTEGA1.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncos ORTEGA2.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncos ORTEGA3.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncos ORTEGA4.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncos ORTEGA5.jpg"), 
              ],
      description: "ニューメキシコ州チマヨの伝統工芸品でもある織物の柄をモチーフにデザインされたORTEGAは、今までの焚火台には無い、プリミティブな幾何学模様が特徴です。",
      rental_price: 7500,
      selling_price: 38500,
      size: "約Φ200 × H310mm（脚100mm）",
      weight: 5,
      brand: "sanzoku mountain サンゾクマウンテン",
    },
    {
      name: "mouncol",
      images: [open("#{Rails.root}/db/fixtures/mouncol1.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncol2.jpg"), 
              open("#{Rails.root}/db/fixtures/mouncol3.jpg"), 
              ],
      description: "代表作のひとつ『mouncol』は直径が45cmあるため、一般的な長さの薪であれば気にせずそのままくべられる、大人数での利用にオススメの焚火台。 ベースとなる素材には、耐熱、耐久性に優れた黒皮鉄を使用。使い込むほど、素材の持つ独特な経年変化や、燃え上がる炎との美しいコントラストを楽しむことができます。 また、高さの異なる２種類の脚部は、工具を必要とせず簡単に付け替え可能。同ブランドの「derutas」などと組み合わせて、焚火調理も存分に満喫できます。",
      rental_price: 6000,
      selling_price: 38280,
      size: "約Φ450 × H330mm（脚170mm）",
      weight: 7,
      brand: "sanzoku mountain サンゾクマウンテン",
    },
    {
      name: "TAKIBI STAND L",
      images: [open("#{Rails.root}/db/fixtures/TAKIBI STAND L1.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L2.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L3.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L5.jpg"), 
              ],
      description: "直火は現在、多くのキャンプ場で禁止されるようになってきていますが、焚き火台を使いながらも直火感を味わえるのが開発コンセプトのひとつ。
      独創的なデザインですが、実際に火をつけてみると、炎の美しさを引き立たせるようデザインされています。大胆にくり抜かれたプレートのおかげで、側面からも直火のような暖かさを味わえることに加え、軽量化も実現しています。",
      rental_price: 6400,
      selling_price: 29700,
      size: "約340（開口部） × H350（mm）",
      weight: 3.7,
      brand: "MITARI WORKS ミタリワークス",
    },
    {      name: "TAKIBI STAND M",
      images: [open("#{Rails.root}/db/fixtures/TAKIBI STAND L1.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L2.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L3.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L5.jpg"), 
              ],
      description: "直火は現在、多くのキャンプ場で禁止されるようになってきていますが、焚き火台を使いながらも直火感を味わえるのが開発コンセプトのひとつ。
      独創的なデザインですが、実際に火をつけてみると、炎の美しさを引き立たせるようデザインされています。大胆にくり抜かれたプレートのおかげで、側面からも直火のような暖かさを味わえることに加え、軽量化も実現しています。",
      rental_price: 6000,
      selling_price: 24200,
      size: "約230（開口部） × H245（mm）",
      weight: 1.3,
      brand: "MITARI WORKS ミタリワークス",
    },
    {      name: "TAKIBI STAND S",
      images: [open("#{Rails.root}/db/fixtures/TAKIBI STAND L1.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L2.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L3.jpg"), 
              open("#{Rails.root}/db/fixtures/TAKIBI STAND L5.jpg"), 
              ],
      description: "直火は現在、多くのキャンプ場で禁止されるようになってきていますが、焚き火台を使いながらも直火感を味わえるのが開発コンセプトのひとつ。
      独創的なデザインですが、実際に火をつけてみると、炎の美しさを引き立たせるようデザインされています。大胆にくり抜かれたプレートのおかげで、側面からも直火のような暖かさを味わえることに加え、軽量化も実現しています。",
      rental_price: 4000,
      selling_price: 17600,
      size: "約170（開口部） × H170（mm）",
      weight: 0.6,
      brand: "MITARI WORKS ミタリワークス",
    },
    {      name: "GURU GURU FIRE M",
      images: [open("#{Rails.root}/db/fixtures/GURU GURU FIRE M1.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M2.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M3.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M4.jpg"), 
              ],
      description: "TRIPATH PRODUCTSは、北海道で70年の歴史を持つ金属加工会社トリパスが新たに挑むアウトドアギアの新ブランド。 金属の性質を知り尽くしたプロ集団が、高レベルで性能と美しさを両立させています。 「GURU GURU FIRE」は、黒皮鉄板を用いた今までに無い、独創的なシルエットをした新しい焚火台。 立体的なデザインでありながら、収納は平面でコンパクトになるので、車の積載にも優しい仕様です。ファミリーキャンプにも対応するサイズです。",
      rental_price: 6200,
      selling_price: 26180,
      size: "約410 × 410 × 673（mm）",
      weight: 7.2,
      brand: "TRIPATH PRODUCTS トリパスプロダクト",
    },
    {      name: "GURU GURU FIRE S",
      images: [open("#{Rails.root}/db/fixtures/GURU GURU FIRE M1.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M2.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M3.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M4.jpg"), 
              ],
      description: "TRIPATH PRODUCTSは、北海道で70年の歴史を持つ金属加工会社トリパスが新たに挑むアウトドアギアの新ブランド。 金属の性質を知り尽くしたプロ集団が、高レベルで性能と美しさを両立させています。 「GURU GURU FIRE」は、黒皮鉄板を用いた今までに無い、独創的なシルエットをした新しい焚火台。立体的なデザインでありながら、収納は平面でコンパクトになるので、車の積載にも優しい仕様です。２～３人での焚火に最適なサイズ。",
      rental_price: 5200,
      selling_price: 20680,
      size: "約330 × 330 × 505（mm）",
      weight: 3.4,
      brand: "TRIPATH PRODUCTS トリパスプロダクト",
    },
    {      name: "GURU GURU FIRE XS",
      images: [open("#{Rails.root}/db/fixtures/GURU GURU FIRE M1.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M2.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M3.jpg"), 
              open("#{Rails.root}/db/fixtures/GURU GURU FIRE M4.jpg"), 
              ],
      description: "TRIPATH PRODUCTSは、北海道で70年の歴史を持つ金属加工会社トリパスが新たに挑むアウトドアギアの新ブランド。 金属の性質を知り尽くしたプロ集団が、高レベルで性能と美しさを両立させています。 「GURU GURU FIRE」は、黒皮鉄板を用いた今までに無い、独創的なシルエットをした新しい焚火台。立体的なデザインでありながら、収納は平面でコンパクトになるので、バックパックでも持ち運び可能なサイズ。ソロで遊ぶのにぴったりです。",
      rental_price: 4200,
      selling_price: 16280,
      size: "約220 × 220 × 340（mm）",
      weight: 1.2,
      brand: "TRIPATH PRODUCTS トリパスプロダクト",
    },
    {
      name: "ケンシュリ【黒皮鉄】",
      images: [open("#{Rails.root}/db/fixtures/ケンシュリ１.png"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ２.jpg"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ３.jpg"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ４.jpg"), 
              ],
      description: "暗闇の中を踊る炎の美しさをより引き立てるとご評価頂いている組み立て式の焚き火台で、手裏剣をモチーフにしたデザインに仕上げています。      ",
      rental_price: 6500,
      selling_price: 28600,
      size: "約W35×D35×H35cm",
      weight: 6.3,
      brand: "RobSnow",
    },
    {
      name: "ケンシュリ【ステンレス】",
      images: [open("#{Rails.root}/db/fixtures/ケンシュリ)【ステンレス】1.png"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ)【ステンレス】2.jpg"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ)【ステンレス】3.jpg"), 
              open("#{Rails.root}/db/fixtures/ケンシュリ)【ステンレス】4.jpg"), 
              ],
      description: "暗闇の中を踊る炎の美しさをより引き立てるとご評価頂いている組み立て式の焚き火台で、手裏剣をモチーフにしたデザインに仕上げています。",
      rental_price: 6700,
      selling_price: 29700,
      size: "約W35×D35×H35cm",
      weight: 6.4,
      brand: "RobSnow",
    },
    {
      name: "ディアン",
      images: [open("#{Rails.root}/db/fixtures/ディアン1.png"), 
              open("#{Rails.root}/db/fixtures/ディアン2.jpg"), 
              open("#{Rails.root}/db/fixtures/ディアン3.jpg"), 
              open("#{Rails.root}/db/fixtures/ディアン4.jpg"), 
              ],
      description: "デザインには、最近テント内に敷くラグやテーブルマットなどでも多く見かけるようになったネイティブ柄をあしらい、他のギアとの共存を図れるよう、主張を抑えたシンプルな印象にまとめました",
      rental_price: 5800,
      selling_price: 25300,
      size: "約W32×D32×H32cm",
      weight: 4.3,
      brand: "RobSnow",
    },
    {
      name: "ラバト",
      images: [open("#{Rails.root}/db/fixtures/ラバト1.jpg"), 
              open("#{Rails.root}/db/fixtures/ラバト2.jpg"), 
              open("#{Rails.root}/db/fixtures/ラバト3.jpg"), 
              ],
      description: "デザインには、テント内に敷くラグやテーブルマットなどでも多く見かけるようになったモロッカン柄をあしらい、他のギアとの共存を図れるデザインにしました。",
      rental_price: 6500,
      selling_price: 28600,
      size: "約W32×D32×H32cm",
      weight: 4.4,
      brand: "RobSnow",
    },
    {
      name: "マチャ",
      images: [open("#{Rails.root}/db/fixtures/マチャ1.png"), 
              open("#{Rails.root}/db/fixtures/マチャ2.jpg"), 
              open("#{Rails.root}/db/fixtures/マチャ3.jpg"), 
              open("#{Rails.root}/db/fixtures/マチャ4.jpg"), 
              open("#{Rails.root}/db/fixtures/マチャ5.jpg"), 
              ],
      description: "携帯性の観点から見れば多少手のかかるMachaですが、その分安定性に優れ、天気の急変によりロケーションが荒れてもびくともしない信頼感があります。
      高い強度を保ちつつも加工性に優れるステンレスの特性を活かした円形にすることで、さらに安定感を底上げしています。",
      rental_price: 7000,
      selling_price: 33000,
      size: "約W32×D32×H32cm",
      weight: 4.9,
      brand: "RobSnow",
    },
    {
      name: "タワーオブボンファイヤー",
      images: [open("#{Rails.root}/db/fixtures/タワーオブボンファイヤー1.jpg"), 
              open("#{Rails.root}/db/fixtures/タワーオブボンファイヤー2.jpg"), 
              open("#{Rails.root}/db/fixtures/タワーオブボンファイヤー3.jpg"), 
              open("#{Rails.root}/db/fixtures/タワーオブボンファイヤー4.jpg"), 
              ],
      description: "3段構造で簡単に組み立て、収納ができる便利な焚き火台です。",
      rental_price: 5600,
      selling_price: 24750,
      size: "430x400x340H ",
      weight: 7.3,
      brand: "NATURETONES",
    },
    {
      name: "FRONTISTAR",
      images: [open("#{Rails.root}/db/fixtures/FRONTISTAR1.jpg"), 
              open("#{Rails.root}/db/fixtures/FRONTISTAR2.jpg"), 
              open("#{Rails.root}/db/fixtures/FRONTISTAR3.jpg"), 
              open("#{Rails.root}/db/fixtures/FRONTISTAR4.jpg"), 
              ],
      description: "『ノルディックなニットを着て焚き火を。』北欧のノルディック柄をデザインした焚き火台をキャンプと共に。",
      rental_price: 7500,
      selling_price: 39600,
      size: "約392mm×450mm×331mm",
      weight: 3.5,
      brand: "",
    },
    {
      name: "焚き火台００１",
      images: [open("#{Rails.root}/db/fixtures/焚き火台００１1.jpg"), 
              open("#{Rails.root}/db/fixtures/焚き火台００１2.jpg"), 
              open("#{Rails.root}/db/fixtures/焚き火台００１3.jpg"), 
              ],
      description: "両脚板にGravity-Equipment（グラエク）ロゴマークのヘラジカをデザインしております。焚き火中、特に夜には炎で浮かび上がるヘラジカをお愉しみください。",
      rental_price: 4000,
      selling_price: 13850,
      size: "L４５０＊W３５０＊H２００mm",
      weight: 5,
      brand: "2.1",
    },
    {
      name: "FIRE STAND ～灯篭～ Large",
      images: [open("#{Rails.root}/db/fixtures/FIRE STAND ～灯篭～ Large1.jpg"), 
              open("#{Rails.root}/db/fixtures/FIRE STAND ～灯篭～ Large2.jpg"), 
              open("#{Rails.root}/db/fixtures/FIRE STAND ～灯篭～ Large3.jpg"), 
              open("#{Rails.root}/db/fixtures/FIRE STAND ～灯篭～ Large4.jpg"), 
              ],
      description: "デザインのコンセプトは、北海道開拓のシンボルで北極星をモチーフとした赤い星マーク「御綾星」と、長崎の「灯篭流し」。御綾星の頂点を全て結んだ五角形をサイド五面に施し、その五角形の窓からはまるで灯篭のように火の揺らめきを楽しむことができる。",
      rental_price: 7000,
      selling_price: 33800,
      size: "約43㎝×約42㎝×約4.5㎝",
      weight: 5.3,
      brand: "",
    },
    {
      name: "VULCAN バルカン",
      images: [open("#{Rails.root}/db/fixtures/VULCAN バルカン1.jpg"), 
              open("#{Rails.root}/db/fixtures/VULCAN バルカン2.jpg"), 
              ],
      description: "ミニマルワークスのヴァルカンは、折り畳み式で、携帯しやすい新しいスタイルの焚火台です。",
      rental_price: 5600,
      selling_price: 24200,
      size: "W450 x D450 x H240mm",
      weight: 2.7,
      brand: "",
    },
    {
      name: "FIRE WHIRL",
      images: [open("#{Rails.root}/db/fixtures/FIRE WHIRL1.jpg"), 
              open("#{Rails.root}/db/fixtures/FIRE WHIRL2.jpg"), 
              open("#{Rails.root}/db/fixtures/FIRE WHIRL3.jpg"), 
              ],
      description: "湾曲したプレートを組み合わせるだけで、様々なシーンで焚火を手軽に楽しむことを可能にしてくれる焚火台。",
      rental_price: 6600,
      selling_price: 29480,
      size: "D38cm　X　H28ｃｍ",
      weight: 2.5,
      brand: "",
    },
  ]
)