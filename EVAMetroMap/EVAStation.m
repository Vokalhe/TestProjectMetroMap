//
//  EVAStation.m
//  EVAMetroMap
//
//  Created by Admin on 05.05.17.
//  Copyright © 2017 Ehlakov Victor. All rights reserved.
//


#import "EVAStation.h"

@interface EVAStation ()


@end

static  NSString *redString = @"Red.png";
static  NSString *greenString = @"Green.png";
static  NSString *blueString = @"Blue.png";

@implementation EVAStation

- (id)initWithArrays
{
    self = [super init];
    if (self) {
        
        self.arrayOfRedStation = [self createRedBranchOfSubway];
        self.arrayOfGreenStation = [self createGreenBranchOfSubway];
        self.arrayOfBlueStation = [self createBlueBranchOfSubway];
        
    }
    return self;
}

-(NSMutableArray*) createRedBranchOfSubway{
    //Red
    EVAStation *akademgorodok = [[EVAStation alloc] init];
    akademgorodok.name = @"Академгородок";
    akademgorodok.imageString = redString;
    akademgorodok.coordinate = CLLocationCoordinate2DMake(50.4649394, 30.3530833);
    
    EVAStation *zhytomyr = [[EVAStation alloc] init];
    zhytomyr.name = @"Житомирская";
    zhytomyr.imageString = redString;
    zhytomyr.coordinate = CLLocationCoordinate2DMake(50.4560802, 30.3628095);
    
    EVAStation *svyatoshin = [[EVAStation alloc] init];
    svyatoshin.name = @"Святошино";
    svyatoshin.imageString = redString;
    svyatoshin.coordinate = CLLocationCoordinate2DMake(50.4577744, 30.3883963);
    
    EVAStation *nivki = [[EVAStation alloc] init];
    nivki.name = @"Нивки";
    nivki.imageString = redString;
    nivki.coordinate = CLLocationCoordinate2DMake(50.4586344, 30.4017263);
    
    EVAStation *beresteyskaya = [[EVAStation alloc] init];
    beresteyskaya.name = @"Берестейская";
    beresteyskaya.imageString = redString;
    beresteyskaya.coordinate = CLLocationCoordinate2DMake(50.4592734, 30.4168253);
    
    EVAStation *shulyavka = [[EVAStation alloc] init];
    shulyavka.name = @"Шулявская";
    shulyavka.imageString = redString;
    shulyavka.coordinate = CLLocationCoordinate2DMake(50.4544924, 30.4450503);
    
    EVAStation *polytechnicalInstitute = [[EVAStation alloc] init];
    polytechnicalInstitute.name = @"Политехнический Иститут";
    polytechnicalInstitute.imageString = redString;
    polytechnicalInstitute.coordinate = CLLocationCoordinate2DMake(50.4509564, 30.4629553);
    
    EVAStation *vokzalnaya = [[EVAStation alloc] init];
    vokzalnaya.name = @"Вокзальная";
    vokzalnaya.imageString = redString;
    vokzalnaya.coordinate = CLLocationCoordinate2DMake(50.4413934, 30.4868523);
    
    EVAStation *university = [[EVAStation alloc] init];
    university.name = @"Университет";
    university.imageString = redString;
    university.coordinate = CLLocationCoordinate2DMake(50.4442753, 30.5046746);
    
    EVAStation *theatrical = [[EVAStation alloc] init];
    theatrical.name = @"Театральная";
    theatrical.imageString = redString;
    theatrical.coordinate = CLLocationCoordinate2DMake(50.4448544, 30.5138843);
    
    EVAStation *khreshchatyk = [[EVAStation alloc] init];
    khreshchatyk.name = @"Крещатик";
    khreshchatyk.imageString = redString;
    khreshchatyk.coordinate = CLLocationCoordinate2DMake(50.4471248, 30.5031078);
    
    EVAStation *arsenalna = [[EVAStation alloc] init];
    arsenalna.name = @"Арсенальная";
    arsenalna.imageString = redString;
    arsenalna.coordinate = CLLocationCoordinate2DMake(50.4430204, 30.5455443);
    
    EVAStation *dnepr = [[EVAStation alloc] init];
    dnepr.name = @"Днепр";
    dnepr.imageString = redString;
    dnepr.coordinate = CLLocationCoordinate2DMake(50.4413286, 30.5232178);
    
    EVAStation *hydropark = [[EVAStation alloc] init];
    hydropark.name = @"Гидропарк";
    hydropark.imageString = redString;
    hydropark.coordinate = CLLocationCoordinate2DMake(50.4459404, 30.5747053);
    
    EVAStation *livoberezhna = [[EVAStation alloc] init];
    livoberezhna.name = @"Левобережная";
    livoberezhna.imageString = redString;
    livoberezhna.coordinate = CLLocationCoordinate2DMake(50.4518804, 30.5959783);

    EVAStation *darnitsa = [[EVAStation alloc] init];
    darnitsa.name = @"Дарница";
    darnitsa.imageString = redString;
    darnitsa.coordinate = CLLocationCoordinate2DMake(50.4557485, 30.6097098);
    
    EVAStation *chernihiv = [[EVAStation alloc] init];
    chernihiv.name = @"Черниговская";
    chernihiv.imageString = redString;
    chernihiv.coordinate = CLLocationCoordinate2DMake(50.4599244, 30.6281863);
    
    EVAStation *lesnaya = [[EVAStation alloc] init];
    lesnaya.name = @"Лесная";
    lesnaya.imageString = redString;
    lesnaya.coordinate = CLLocationCoordinate2DMake(50.4647814,30.6434203);

    NSMutableArray *array = [NSMutableArray arrayWithObjects: akademgorodok, zhytomyr, svyatoshin, nivki, beresteyskaya, shulyavka, polytechnicalInstitute, vokzalnaya, university, theatrical, khreshchatyk, arsenalna, dnepr, hydropark, livoberezhna, darnitsa, chernihiv, lesnaya, nil];
    
    return array;
}

-(NSMutableArray*) createGreenBranchOfSubway{
    
    //Green
    EVAStation *syrets = [[EVAStation alloc] init];
    syrets.name = @"Сырец";
    syrets.imageString = greenString;
    syrets.coordinate = CLLocationCoordinate2DMake(50.4762214, 30.4284893);
    
    EVAStation *dorogozhychi = [[EVAStation alloc] init];
    dorogozhychi.name = @"Дорогожичи";
    dorogozhychi.imageString = greenString;
    dorogozhychi.coordinate = CLLocationCoordinate2DMake(50.4731224, 30.4500583);
    
    EVAStation *lukyanovskaya = [[EVAStation alloc] init];
    lukyanovskaya.name = @"Лукьяновская";
    lukyanovskaya.imageString = greenString;
    lukyanovskaya.coordinate = CLLocationCoordinate2DMake(50.4611824, 30.4814823);
    
    EVAStation *goldenGate = [[EVAStation alloc] init];
    goldenGate.name = @"Золотые Ворота";
    goldenGate.imageString = greenString;
    goldenGate.coordinate = CLLocationCoordinate2DMake(50.4461624, 30.5132373);
    
    EVAStation *dvoretsSporta = [[EVAStation alloc] init];
    dvoretsSporta.name = @"Дворец спорта";
    dvoretsSporta.imageString = greenString;
    dvoretsSporta.coordinate = CLLocationCoordinate2DMake(50.4396504, 30.5173443);
    
    EVAStation *klovskaya = [[EVAStation alloc] init];
    klovskaya.name = @"Кловская";
    klovskaya.imageString = greenString;
    klovskaya.coordinate = CLLocationCoordinate2DMake(50.4359054, 30.5312343);
    
    EVAStation *pecherskaya = [[EVAStation alloc] init];
    pecherskaya.name = @"Печерская";
    pecherskaya.imageString = greenString;
    pecherskaya.coordinate = CLLocationCoordinate2DMake(50.4265564, 30.5379313);
    
    EVAStation *druzhbyNarodov = [[EVAStation alloc] init];
    druzhbyNarodov.name = @"Дружбы народов";
    druzhbyNarodov.imageString = greenString;
    druzhbyNarodov.coordinate = CLLocationCoordinate2DMake(50.4168444, 30.5447293);
    
    EVAStation *vydubichi = [[EVAStation alloc] init];
    vydubichi.name = @"Выдубичи";
    vydubichi.imageString = greenString;
    vydubichi.coordinate = CLLocationCoordinate2DMake(50.402102, 30.5579713);
    
    EVAStation *slavutich = [[EVAStation alloc] init];
    slavutich.name = @"Славутич";
    slavutich.imageString = greenString;
    slavutich.coordinate = CLLocationCoordinate2DMake(50.394264, 30.6004816);
   
    EVAStation *osokorki = [[EVAStation alloc] init];
    osokorki.name = @"Осокорки";
    osokorki.imageString = greenString;
    osokorki.coordinate = CLLocationCoordinate2DMake(50.395248, 30.6140423);
    
    EVAStation *poznyaki = [[EVAStation alloc] init];
    poznyaki.name = @"Позняки";
    poznyaki.imageString = greenString;
    poznyaki.coordinate = CLLocationCoordinate2DMake(50.397944, 30.6323903);
    
    EVAStation *kharkovskaya = [[EVAStation alloc] init];
    kharkovskaya.name = @"Харьковская";
    kharkovskaya.imageString = greenString;
    kharkovskaya.coordinate = CLLocationCoordinate2DMake(50.40073, 30.6502853);
    
    EVAStation *vyrlitsa = [[EVAStation alloc] init];
    vyrlitsa.name = @"Вырлица";
    vyrlitsa.imageString = greenString;
    vyrlitsa.coordinate = CLLocationCoordinate2DMake(50.40312, 30.6647023);
    
    EVAStation *borispolskaya = [[EVAStation alloc] init];
    borispolskaya.name = @"Бориспольская";
    borispolskaya.imageString = greenString;
    borispolskaya.coordinate = CLLocationCoordinate2DMake(50.403375, 30.6820063);
    
    EVAStation *krasnyyKhutor = [[EVAStation alloc] init];
    krasnyyKhutor.name = @"Красный Хутор";
    krasnyyKhutor.imageString = greenString;
    krasnyyKhutor.coordinate = CLLocationCoordinate2DMake(50.409473, 30.6940143);
    
    NSMutableArray *array = [NSMutableArray arrayWithObjects:syrets, dorogozhychi, lukyanovskaya, goldenGate, dvoretsSporta, klovskaya, pecherskaya, druzhbyNarodov, vydubichi, slavutich, osokorki, poznyaki, kharkovskaya, vyrlitsa, borispolskaya, krasnyyKhutor, nil];
    
    return array;
}

-(NSMutableArray*) createBlueBranchOfSubway{
    
    //Blue
    EVAStation *vystavochnyy = [[EVAStation alloc] init];
    vystavochnyy.name = @"Выставочный Центр";
    vystavochnyy.imageString = blueString;
    vystavochnyy.coordinate = CLLocationCoordinate2DMake(50.3824154, 30.4754663);
    
    EVAStation *vasilkovskaya = [[EVAStation alloc] init];
    vasilkovskaya.name = @"Васильковская";
    vasilkovskaya.imageString = blueString;
    vasilkovskaya.coordinate = CLLocationCoordinate2DMake(50.3932544,30.4854813);
    
    EVAStation *goloseyevskaya = [[EVAStation alloc] init];
    goloseyevskaya.name = @"Голосеевская";
    goloseyevskaya.imageString = blueString;
    goloseyevskaya.coordinate = CLLocationCoordinate2DMake(50.3974634, 30.5061723);
    
    EVAStation *demeyevskaya = [[EVAStation alloc] init];
    demeyevskaya.name = @"Демеевская";
    demeyevskaya.imageString = blueString;
    demeyevskaya.coordinate = CLLocationCoordinate2DMake(50.4047914, 30.5146793);
    
    EVAStation *lybidskaya = [[EVAStation alloc] init];
    lybidskaya.name = @"Лыбидская";
    lybidskaya.imageString = blueString;
    lybidskaya.coordinate = CLLocationCoordinate2DMake(50.4144414, 30.5226933);
    
    EVAStation *dvoretsUkraina = [[EVAStation alloc] init];
    dvoretsUkraina.name = @"Дворец Украина";
    dvoretsUkraina.imageString = blueString;
    dvoretsUkraina.coordinate = CLLocationCoordinate2DMake(50.4211894, 30.5184223);
    
    EVAStation *olimpiyskaya = [[EVAStation alloc] init];
    olimpiyskaya.name = @"Олимпийская";
    olimpiyskaya.imageString = blueString;
    olimpiyskaya.coordinate = CLLocationCoordinate2DMake(50.4321778, 30.513668);
    
    EVAStation *tolstogo = [[EVAStation alloc] init];
    tolstogo.name = @"площадь Льва Толстого";
    tolstogo.imageString = blueString;
    tolstogo.coordinate = CLLocationCoordinate2DMake(50.4400784, 30.5158323);
    
    EVAStation *ploshchadNezavisimosti = [[EVAStation alloc] init];
    ploshchadNezavisimosti.name = @"Площадь Независимости";
    ploshchadNezavisimosti.imageString = blueString;
    ploshchadNezavisimosti.coordinate = CLLocationCoordinate2DMake(50.4479764, 30.5230843);
    
    EVAStation *pochtovayaPloshchad = [[EVAStation alloc] init];
    pochtovayaPloshchad.name = @"Почтовая Площадь";
    pochtovayaPloshchad.imageString = blueString;
    pochtovayaPloshchad.coordinate = CLLocationCoordinate2DMake(50.4589667, 30.5225698);

    EVAStation *kontraktovayaPloshchad = [[EVAStation alloc] init];
    kontraktovayaPloshchad.name = @"Контрактовая Площадь";
    kontraktovayaPloshchad.imageString = blueString;
    kontraktovayaPloshchad.coordinate = CLLocationCoordinate2DMake(50.4660534, 30.5128073);
    
    EVAStation *tarasaShevchenko = [[EVAStation alloc] init];
    tarasaShevchenko.name = @"Тараса Шевченко";
    tarasaShevchenko.imageString = blueString;
    tarasaShevchenko.coordinate = CLLocationCoordinate2DMake(50.4741584, 30.5013023);
    
    EVAStation *petrovka = [[EVAStation alloc] init];
    petrovka.name = @"Петровка";
    petrovka.imageString = blueString;
    petrovka.coordinate = CLLocationCoordinate2DMake(50.4860814, 30.4956623);
    
    EVAStation *obolon = [[EVAStation alloc] init];
    obolon.name = @"Оболонь";
    obolon.imageString = blueString;
    obolon.coordinate = CLLocationCoordinate2DMake(50.5014694, 30.4960393);
    
    EVAStation *minskaya = [[EVAStation alloc] init];
    minskaya.name = @"Минская";
    minskaya.imageString = blueString;
    minskaya.coordinate = CLLocationCoordinate2DMake(50.5122454, 30.4963623);

    EVAStation *geroyevDnepra = [[EVAStation alloc] init];
    geroyevDnepra.name = @"Героев Днепра";
    geroyevDnepra.imageString = blueString;
    geroyevDnepra.coordinate = CLLocationCoordinate2DMake(50.5227424, 30.4967823);
   
    NSMutableArray *array = [NSMutableArray arrayWithObjects: vystavochnyy, vasilkovskaya, goloseyevskaya, demeyevskaya, lybidskaya, dvoretsUkraina, olimpiyskaya, tolstogo, ploshchadNezavisimosti, pochtovayaPloshchad, kontraktovayaPloshchad, tarasaShevchenko, petrovka, obolon, minskaya, geroyevDnepra, nil];
    
    return array;
}

-(NSArray*) generateArrayOfStation:(NSInteger) selectSegmentIndexFirst numberOfRowsInFirst:(NSInteger) numberFirst andIndex:(NSInteger)selectSegmentIndexSecond numberOfRowsInSecond:(NSInteger) numberSecond {
    
    NSArray *arrayOfStation = [NSArray array];
    NSRange range;
    
    BOOL isInvert = NO;
    
    if (selectSegmentIndexFirst == selectSegmentIndexSecond) {
        
        if (numberFirst < numberSecond) {
            isInvert = NO;
            range.location = numberFirst;
            range.length = numberSecond - numberFirst + 1;
        }else if (numberFirst > numberSecond) {
            isInvert = YES;
            range.location = numberSecond;
            range.length = numberFirst - numberSecond + 1;
        }
        
        arrayOfStation = [self actionSubarray:selectSegmentIndexFirst andRange:range];
        self.arrayOfStationFinal = arrayOfStation;
        if (isInvert) {
            self.arrayOfStationFinal = [[arrayOfStation reverseObjectEnumerator] allObjects];
        }
        return self.arrayOfStationFinal;
    }
    
    NSArray *arrayFirst = [NSArray array];
    NSArray *arraySecond = [NSArray array];
    NSArray *arrayFinal = [NSArray array];

    NSInteger greenBlue = 4;
    NSInteger greenRed = 3;
    
    NSInteger redBlue = 10;
    NSInteger redGreen = 9;
    
    NSInteger blueRed = 8;
    NSInteger blueGreen = 7;
    
    NSRange rangeFirst;
    NSRange rangeSecond;
    
    BOOL isInvertFirst = NO;
    BOOL isInvertSecond = NO;

    if (selectSegmentIndexFirst == 0 && selectSegmentIndexSecond == 1){
        //Red to Green
        
        if (numberFirst > redGreen) {
            isInvertFirst = YES;
            rangeFirst.location = redGreen;
            rangeFirst.length = numberFirst - redGreen + 1;
            
        }else if (numberFirst < redGreen) {
            isInvertFirst = NO;
            rangeFirst.location = numberFirst;
            rangeFirst.length = redGreen - numberFirst + 1;
            
        }else if (numberFirst == redGreen) {
            rangeFirst.location = redGreen;
            rangeFirst.length = 1;
        }
        
        if (numberSecond > greenRed) {
            isInvertSecond = NO;
            rangeSecond.location = greenRed ;
            rangeSecond.length = numberSecond - greenRed + 1;
            
        }else if (numberSecond < greenRed) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = greenRed - numberSecond + 1;
            
        }else if (numberSecond == greenRed) {
            rangeSecond.location = greenRed;
            rangeSecond.length = 1;
            
        }
        
    }else if (selectSegmentIndexFirst == 1 && selectSegmentIndexSecond == 0){
        //Green to Red
        
        if (numberFirst > greenRed) {
            isInvertFirst = YES;
            rangeFirst.location = greenRed ;
            rangeFirst.length = numberFirst - greenRed + 1;
            
        }else if (numberFirst < greenRed) {
            isInvertFirst = NO;
            rangeFirst.location = numberFirst;
            rangeFirst.length = greenRed - numberFirst + 1;
            
        }else if (numberFirst == greenRed) {
            rangeFirst.location = greenRed;
            rangeFirst.length = 1;
            
        }

        if (numberSecond > redGreen) {
            isInvertSecond = NO;
            rangeSecond.location = redGreen;
            rangeSecond.length = numberSecond - redGreen + 1;
            
        }else if (numberSecond < redGreen) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = redGreen - numberSecond + 1;
            
        }else if (numberSecond == redGreen) {
            rangeSecond.location = redGreen;
            rangeSecond.length = 1;
        }
        
    }else if (selectSegmentIndexFirst == 0 && selectSegmentIndexSecond == 2) {
        //Red to Blue
        
        if (numberFirst > redBlue) {
            isInvertFirst = YES;
            rangeFirst.location = redBlue ;
            rangeFirst.length = numberFirst - redBlue + 1;
            
        }else if (numberFirst < redBlue) {
            isInvertFirst = NO;
            rangeFirst.location = numberFirst;
            rangeFirst.length = redBlue - numberFirst + 1;
            
        }else if (numberFirst == redBlue) {
            rangeFirst.location = redBlue;
            rangeFirst.length = 1;
            
        }
        
        if (numberSecond > blueRed) {
            isInvertSecond = NO;
            rangeSecond.location = blueRed;
            rangeSecond.length = numberSecond - blueRed + 1;
            
        }else if (numberSecond < blueRed) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = blueRed - numberSecond + 1;
            
        }else if (numberSecond == blueRed) {
            rangeSecond.location = blueRed;
            rangeSecond.length = 1;
        }

    }else if (selectSegmentIndexFirst == 2 && selectSegmentIndexSecond == 0){
        //Blue to Red
        
        if (numberFirst > blueRed) {
            isInvertFirst = YES;
            rangeFirst.location = blueRed ;
            rangeFirst.length = numberFirst - blueRed + 1;
            
        }else if (numberFirst < blueRed) {
            isInvertFirst = NO;
            rangeFirst.location = numberFirst;
            rangeFirst.length = blueRed - numberFirst + 1;
            
        }else if (numberFirst == blueRed) {
            rangeFirst.location = blueRed;
            rangeFirst.length = 1;
            
        }
        
        if (numberSecond > redBlue) {
            isInvertSecond = NO;
            rangeSecond.location = redBlue;
            rangeSecond.length = numberSecond - redBlue + 1;
            
        }else if (numberSecond < redBlue) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = redBlue - numberSecond + 1;
            
        }else if (numberSecond == redBlue) {
            rangeSecond.location = redBlue;
            rangeSecond.length = 1;
        }
        
    }else if (selectSegmentIndexFirst == 1 && selectSegmentIndexSecond == 2){
        //Green to Blue
        
        if (numberFirst > greenBlue) {
            isInvertFirst = YES;
            rangeFirst.location = greenBlue ;
            rangeFirst.length = numberFirst - greenBlue + 1;
            
        }else if (numberFirst < greenBlue) {
            isInvertFirst = NO;
            rangeFirst.location = numberFirst;
            rangeFirst.length = greenBlue - numberFirst + 1;
            
        }else if (numberFirst == greenBlue) {
            rangeFirst.location = greenBlue;
            rangeFirst.length = 1;
            
        }
        
        if (numberSecond > blueGreen) {
            isInvertSecond = NO;
            rangeSecond.location = blueGreen;
            rangeSecond.length = numberSecond - blueGreen + 1;
            
        }else if (numberSecond < blueGreen) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = blueGreen - numberSecond + 1;
            
        }else if (numberSecond == blueGreen) {
            rangeSecond.location = blueGreen;
            rangeSecond.length = 1;
        }
        
    }else if (selectSegmentIndexFirst == 2 && selectSegmentIndexSecond == 1){
        //Blue to Green
        
        if (numberFirst > blueGreen) {
            isInvertFirst = NO;
            rangeFirst.location = blueGreen ;
            rangeFirst.length = numberFirst - blueGreen + 1;
            
        }else if (numberFirst < blueGreen) {
            isInvertFirst = YES;
            rangeFirst.location = numberFirst;
            rangeFirst.length = blueGreen - numberFirst + 1;
            
        }else if (numberFirst == blueGreen) {
            rangeFirst.location = blueGreen;
            rangeFirst.length = 1;
            
        }
        
        if (numberSecond > greenBlue) {
            isInvertSecond = NO;
            rangeSecond.location = greenBlue;
            rangeSecond.length = numberSecond - greenBlue + 1;
            
        }else if (numberSecond < greenBlue) {
            isInvertSecond = YES;
            rangeSecond.location = numberSecond;
            rangeSecond.length = greenBlue - numberSecond + 1;
            
        }else if (numberSecond == greenBlue) {
            rangeSecond.location = greenBlue;
            rangeSecond.length = 1;
        }
    }
    
    arrayFirst = [self actionSubarray:selectSegmentIndexFirst andRange:rangeFirst];
    arraySecond = [self actionSubarray:selectSegmentIndexSecond andRange:rangeSecond];
    
    if (isInvertFirst) {
        arrayFirst = [[arrayFirst reverseObjectEnumerator] allObjects];
    }
    if (isInvertSecond) {
        arraySecond = [[arraySecond reverseObjectEnumerator] allObjects];
    }
    
    arrayFinal = [NSArray arrayWithArray:arrayFirst];
    arrayFinal = [arrayFinal arrayByAddingObjectsFromArray:arraySecond];
    
    self.arrayOfStationFinal = arrayFinal;
    
    return self.arrayOfStationFinal;

}

-(NSArray*) actionSubarray:(NSInteger) selectIndex andRange:(NSRange) range{
    
    NSArray *arrayOfStation = [NSArray array];
    
    switch (selectIndex) {
        case 0:
            arrayOfStation = self.arrayOfRedStation;
            arrayOfStation = [arrayOfStation subarrayWithRange:range];
            break;
        case 1:
            arrayOfStation = self.arrayOfGreenStation;
            arrayOfStation = [arrayOfStation subarrayWithRange:range];
            break;
        case 2:
            arrayOfStation = self.arrayOfBlueStation;
            arrayOfStation = [arrayOfStation subarrayWithRange:range];
            break;
        default:
            break;
    }
    return arrayOfStation;

}
@end
