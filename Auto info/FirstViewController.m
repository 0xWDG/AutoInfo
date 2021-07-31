//
//  FirstViewController.m
//  Auto info
//
//  Created by Wesley de Groot on 12-04-15.
//  Copyright (c) 2015 WDGWV. All rights reserved.
//

#import "FirstViewController.h"
#import "dataViewController.h"

#import "Cores/core.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
// https://api.datamarket.azure.com/opendata.rdw/VRTG.Open.Data/v1/KENT_VRTG_O_DAT('45jnbz')?$format=json

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *kenteken = @"49-PF-LL";
    lblTitle.text = kenteken;
    
    NSString *kkenteken = kenteken;
    kkenteken = [kenteken stringByReplacingOccurrencesOfString:@"-" withString:@""];
    
    self.dict = [[NSMutableDictionary dictionaryWithContentsOfJSONURLString:[[NSString alloc] initWithFormat:@"https://api.datamarket.azure.com/opendata.rdw/VRTG.Open.Data/v1/KENT_VRTG_O_DAT('%@')?$format=json", kkenteken]] objectForKey:@"d"];
    
    self.ident = @[@"Merk", @"Handelsbenaming", @"Hoofdbrandstof", @"Voertuigsoort", @"Zuinigheidslabel", @"Wachtopkeuren", @"VervaldatumAPK", @"WAMverzekerdgeregistreerd", @"Inrichting", @"Aantalcilinders", @"Aantalzitplaatsen", @"Aantalstaanplaatsen", @"BPM", @"Brandstofverbruikbuitenweg", @"Brandstofverbruikgecombineerd", @"Brandstofverbruikstad", @"CO2uitstootgecombineerd", @"Catalogusprijs"];
    
    [[NSUserDefaults standardUserDefaults] setValue:@"Aantal Cilinders:"               forKey:@"Aantalcilinders"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Aantal Zitplaatsen:"             forKey:@"Aantalzitplaatsen"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Aantal Staanplaatsen:"           forKey:@"Aantalstaanplaatsen"];
    [[NSUserDefaults standardUserDefaults] setValue:@"BPM: €"                          forKey:@"BPM"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Brandstofverbruik buitenweg:"    forKey:@"Brandstofverbruikbuitenweg"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Brandstofverbruik gecombineerd:" forKey:@"Brandstofverbruikgecombineerd"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Brandstofverbruik Stad:"         forKey:@"Brandstofverbruikstad"];
    [[NSUserDefaults standardUserDefaults] setValue:@"CO2 uitstoot gecombineerd:"      forKey:@"CO2uitstootgecombineerd"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Catalogusprijs:"                 forKey:@"Catalogusprijs"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Cilinderinhoud:"                 forKey:@"Cilinderinhoud"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Kleur:"                          forKey:@"Eerstekleur"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Merk:"                           forKey:@"Merk"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Handelsbenaming:"                forKey:@"Handelsbenaming"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Brandstof:"                      forKey:@"Hoofdbrandstof"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Zuinigheidslabel:"               forKey:@"Zuinigheidslabel"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Wacht op keuren:"                forKey:@"Wachtopkeuren"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Voertuigsoort:"                  forKey:@"Voertuigsoort"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Vervaldatum APK:"                forKey:@"VervaldatumAPK"];
    [[NSUserDefaults standardUserDefaults] setValue:@"WAM verzekerd:"                  forKey:@"WAMverzekerdgeregistreerd"];
    [[NSUserDefaults standardUserDefaults] setValue:@"Inrichting:"                     forKey:@"Inrichting"];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
//    [[NSUserDefaults standardUserDefaults] setValue:<#(id)#> forKey:<#(NSString *)#>];
    
    tvC.delegate   = self;
    tvC.dataSource = self;
    
    NSLog(@"DiCt: %@", self.dict);
    NSLog(@"MERK: %@ %@", [self.dict objectForKey:@"Merk"], [self.dict objectForKey:@"Handelsbenaming"]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    [tableView setRowHeight:21.0f];
    return [self.ident count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    UILabel *lblInfo = (UILabel *)[cell viewWithTag:1];
    lblInfo.text = [[NSUserDefaults standardUserDefaults] objectForKey:[self.ident objectAtIndex:indexPath.row]];
    
    UILabel *lblText = (UILabel *)[cell viewWithTag:2];
    NSString *Fetch = [[NSString alloc] initWithFormat:@"%@", [self.ident objectAtIndex:indexPath.row]];
    NSString *tinfo = [[NSString alloc] initWithFormat:@"%@", [self.dict valueForKey:Fetch]];
    tinfo = [(NSString*)tinfo stringByReplacingOccurrencesOfString:@"<null>" withString:@"Onbekend"];
    lblText.text = [[NSString alloc] initWithFormat:@"%@", tinfo];
    
    return cell;
}

//UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
//pasteboard.string
@end

@implementation cell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
