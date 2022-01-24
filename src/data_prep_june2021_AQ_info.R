## Data Prep - June 2021 & AQ info engagement patterns##
## 11/1/2022 ##
## Kayla Schulte ##

#load packages

packages <- c("readxl", "dplyr", "tidyr", "data.table", "stringr")

lapply(packages, require, character.only = TRUE)

#save RDA

save(june2021_raw_cat, june2021_raw_num, june2021_cat_clean, june2021_num_clean, june2021_ord_clean, june2021_num_clean_2, file = "/Users/kaylaschulte/Research/Paper III_5/rdas/june_2021_clean.rda")

##LOAD & REVIEW data -June 2021

june2021_raw_cat <- read_xlsx("/Users/kaylaschulte/Research/Paper III_5/data/OP17053 GAP June 2021 - with labels.xlsx", sheet = 1)
june2021_raw_num <- read_xlsx("/Users/kaylaschulte/Research/Paper III_5/data/OP17053 GAP June 2021.xlsx", sheet = 1)

#add in row numbers and subset raw dataframe to include only questions & variables of interest

id <- rownames(june2021_raw_cat)
june2021_raw_cat <- cbind(id=id, june2021_raw_cat)
june2021_cat_clean <- subset(june2021_raw_cat, select = c(1, 4:33, 68:81, 102:104, 173:230))  

id2 <- rownames(june2021_raw_num)
june2021_raw_num <- cbind(id=id2, june2021_raw_num)
june2021_num_clean <- subset(june2021_raw_num, select = c(1, 4:33, 68:81, 102:104, 173:230))  

#rename colnames for key demographic variables

june2021_cat_clean <- dplyr::rename(gender = D1_Gender.c, age = D2_Age.c, region = D4_Region.c, employment = D3_employment.a, self_efficacy = OP11153_Q13.a,
                                    social_grade = D5_socialgrade.a, income = OP17026_D4.a, has_children = D6_Children.a.9, june2021_cat_clean)

june2021_num_clean <- dplyr::rename(gender = D1_Gender.c, age = D2_Age.c, region = D4_Region.c, employment = D3_employment.a, self_efficacy = OP11153_Q13.a,
                                    social_grade = D5_socialgrade.a, income = OP17026_D4.a, has_children = D6_Children.a.9, june2021_num_clean)

#rename colnames for key awareness variables

june2021_cat_clean <- dplyr::rename(awareness_cleanairday = OP11153_Q21.a.1, awareness_cleanaireveryday = OP11153_Q21.a.2, awareness_readytoburn = OP11153_Q21.a.3, awareness_electriccollective = OP11153_Q21.a.4, awareness_cleanairzones = OP11153_Q21.a.5, 
                                    awareness_tcharge = OP11153_Q21.a.6, awareness_londoncongestioncharge = OP11153_Q21.a.7, awareness_cleanairhub = OP11153_Q21.a.8, june2021_cat_clean)

june2021_num_clean <- dplyr::rename(awareness_cleanairday = OP11153_Q21.a.1, awareness_cleanaireveryday = OP11153_Q21.a.2, awareness_readytoburn = OP11153_Q21.a.3, awareness_electriccollective = OP11153_Q21.a.4, awareness_cleanairzones = OP11153_Q21.a.5, 
                                    awareness_tcharge = OP11153_Q21.a.6, awareness_londoncongestioncharge = OP11153_Q21.a.7, awareness_cleanairhub = OP11153_Q21.a.8, june2021_num_clean)

#rename colnames for key attitudes variables

june2021_cat_clean <- dplyr::rename(priority_airpollution = OP11153_Q1.a.1, priority_recycling = OP11153_Q1.a.2, priority_fix_potholes = OP11153_Q1.a.3, 
                                             priority_reduce_smoking = OP11153_Q1.a.4, priority_healthy_eating = OP11153_Q1.a.5, june2021_cat_clean)

june2021_num_clean <- dplyr::rename(priority_airpollution = OP11153_Q1.a.1, priority_recycling = OP11153_Q1.a.2, priority_fix_potholes = OP11153_Q1.a.3, 
                                    priority_reduce_smoking = OP11153_Q1.a.4, priority_healthy_eating = OP11153_Q1.a.5, june2021_num_clean)

#rename colnames for key exposure reducing behaviour variables *HOW OFTEN??? (i.e. OP11153_Q2.a.1)

june2021_cat_clean <- dplyr::rename(general_open_windows = OP11153_Q5.a.1, general_dry_fuel = OP11153_Q5.a.2, general_no_solid_fuel = OP11153_Q5.a.3, general_low_dust = OP11153_Q5.a.4, general_eco_personal_products = OP11153_Q5.a.5, 
                                    general_eco_cleaning_products = OP11153_Q5.a.6,general_maintain_boiler = OP11153_Q5.a.7, general_extractor_fan = OP11153_Q5.a.8, general_low_emission_paint = OP11153_Q5.a.9, general_low_emission_furniture = OP11153_Q5.a.10, 
                                    general_no_smoking_indoors = OP11153_Q5.a.11, general_other = OP11153_Q5.a.12, general_dont_know = OP11153_Q5.a.13, general_not_possible = OP11153_Q5.a.14, aq_info_worn_pollution_mask = OP17053newQ3a.a.1, 
                                    aq_info_avoided_outdoors = OP17053newQ3a.a.2, aq_info_travel_outside_rushour = OP17053newQ3a.a.3, aq_info_active_travel = OP17053newQ3a.a.4, aq_info_driven = OP17053newQ3a.a.5, aq_info_switch_off_engine = OP17053newQ3a.a.6, 
                                    aq_info_public_transport = OP17053newQ3a.a.7, aq_info_low_polluting_car = OP17053newQ3a.a.8, aq_info_electric_taxi = OP17053newQ3a.a.9, aq_info_extractor_fan = OP17053newQ3a.a.10, aq_info_no_solid_fuel = OP17053newQ3a.a.11, 
                                    aq_info_telework = OP17053newQ3a.a.12, aq_info_fewer_bonfires = OP17053newQ3a.a.13, aq_info_electric_mower = OP17053newQ3a.a.14, aq_info_smokeless_fuel = OP17053newQ3a.a.15, aq_info_low_dust = OP17053newQ3a.a.16, 
                                    aq_info_maintain_boiler = OP17053newQ3a.a.17, aq_info_no_smoking_indoors = OP17053newQ3a.a.18, aq_info_eco_cleaning_products = OP17053newQ3a.a.19, aq_info_eco_personal_products = OP17053newQ3a.a.20, 
                                    aq_info_low_emission_paint = OP17053newQ3a.a.21, aq_info_low_emission_furniture = OP17053newQ3a.a.22, aq_info_eco_delivery_slot = OP17053newQ3a.a.23, aq_info_green_energy_tariff = OP17053newQ3a.a.24,
                                    aq_info_reduced_landfill_waste = OP17053newQ3a.a.25, aq_info_other = OP17053newQ3a.a.26, aq_info_no_ERB = OP17053newQ3a.a.27, aq_info_ERB_frequency = OP17053newQ4.a, Q3b_extractor_fan = OP17053newQ3b.a.1,
                                    Q3b_no_solid_fuel = OP17053newQ3b.a.2, Q3b_telework = OP17053newQ3b.a.3, Q3b_fewer_bonfires = OP17053newQ3b.a.4, Q3b_electric_mower = OP17053newQ3b.a.5, Q3b_smokeless_fuel = OP17053newQ3b.a.6,  
                                    Q3b_low_dust = OP17053newQ3b.a.7, Q3b_maintain_boiler = OP17053newQ3b.a.8, Q3b_no_smoking_indoors = OP17053newQ3b.a.9, Q3b_eco_cleaning_products = OP17053newQ3b.a.10, Q3b_eco_personal_products = OP17053newQ3b.a.11, 
                                    Q3b_low_emission_paint = OP17053newQ3b.a.12, Q3b_low_emission_furniture = OP17053newQ3b.a.13, Q3b_service_boilder = OP17053newQ3b.a.14, Q3b_eco_delivery = OP17053newQ3b.a.15, Q3b_green_tariff = OP17053newQ3b.a.16, 
                                    Q3b_other = OP17053newQ3b.a.17, Q3b_none = OP17053newQ3b.a.18, june2021_cat_clean)
                                    
june2021_num_clean <- dplyr::rename(general_open_windows = OP11153_Q5.a.1, general_dry_fuel = OP11153_Q5.a.2, general_no_solid_fuel = OP11153_Q5.a.3, general_low_dust = OP11153_Q5.a.4, general_eco_personal_products = OP11153_Q5.a.5, 
                                    general_eco_cleaning_products = OP11153_Q5.a.6,general_maintain_boiler = OP11153_Q5.a.7, general_extractor_fan = OP11153_Q5.a.8, general_low_emission_paint = OP11153_Q5.a.9, general_low_emission_furniture = OP11153_Q5.a.10, 
                                    general_no_smoking_indoors = OP11153_Q5.a.11, general_other = OP11153_Q5.a.12, general_dont_know = OP11153_Q5.a.13, general_not_possible = OP11153_Q5.a.14, aq_info_worn_pollution_mask = OP17053newQ3a.a.1, 
                                    aq_info_avoided_outdoors = OP17053newQ3a.a.2, aq_info_travel_outside_rushour = OP17053newQ3a.a.3, aq_info_active_travel = OP17053newQ3a.a.4, aq_info_driven = OP17053newQ3a.a.5, aq_info_switch_off_engine = OP17053newQ3a.a.6, 
                                    aq_info_public_transport = OP17053newQ3a.a.7, aq_info_low_polluting_car = OP17053newQ3a.a.8, aq_info_electric_taxi = OP17053newQ3a.a.9, aq_info_extractor_fan = OP17053newQ3a.a.10, aq_info_no_solid_fuel = OP17053newQ3a.a.11, 
                                    aq_info_telework = OP17053newQ3a.a.12, aq_info_fewer_bonfires = OP17053newQ3a.a.13, aq_info_electric_mower = OP17053newQ3a.a.14, aq_info_smokeless_fuel = OP17053newQ3a.a.15, aq_info_low_dust = OP17053newQ3a.a.16, 
                                    aq_info_maintain_boiler = OP17053newQ3a.a.17, aq_info_no_smoking_indoors = OP17053newQ3a.a.18, aq_info_eco_cleaning_products = OP17053newQ3a.a.19, aq_info_eco_personal_products = OP17053newQ3a.a.20, 
                                    aq_info_low_emission_paint = OP17053newQ3a.a.21, aq_info_low_emission_furniture = OP17053newQ3a.a.22, aq_info_eco_delivery_slot = OP17053newQ3a.a.23, aq_info_green_energy_tariff = OP17053newQ3a.a.24,
                                    aq_info_reduced_landfill_waste = OP17053newQ3a.a.25, aq_info_other = OP17053newQ3a.a.26, aq_info_no_ERB = OP17053newQ3a.a.27, aq_info_ERB_frequency = OP17053newQ4.a, Q3b_extractor_fan = OP17053newQ3b.a.1, 
                                    Q3b_no_solid_fuel = OP17053newQ3b.a.2, Q3b_telework = OP17053newQ3b.a.3, Q3b_fewer_bonfires = OP17053newQ3b.a.4, Q3b_electric_mower = OP17053newQ3b.a.5, Q3b_smokeless_fuel = OP17053newQ3b.a.6,  
                                    Q3b_low_dust = OP17053newQ3b.a.7, Q3b_maintain_boiler = OP17053newQ3b.a.8, Q3b_no_smoking_indoors = OP17053newQ3b.a.9, Q3b_eco_cleaning_products = OP17053newQ3b.a.10, Q3b_eco_personal_products = OP17053newQ3b.a.11, 
                                    Q3b_low_emission_paint = OP17053newQ3b.a.12, Q3b_low_emission_furniture = OP17053newQ3b.a.13, Q3b_service_boilder = OP17053newQ3b.a.14, Q3b_eco_delivery = OP17053newQ3b.a.15, Q3b_green_tariff = OP17053newQ3b.a.16, 
                                    Q3b_other = OP17053newQ3b.a.17, Q3b_none = OP17053newQ3b.a.18, june2021_num_clean)

#rename colnames for key AQ info access variables

june2021_cat_clean <- dplyr::rename(aq_info_acces_frequency = OP17053newQ2.a, aq_info_via_internet = OP17053newQ1.a.1, aq_info_via_tv_radio = OP17053newQ1.a.2,
                                    aq_info_via_GP = OP17053newQ1.a.3, aq_info_via_nat_paper = OP17053newQ1.a.4, aq_info_via_hospital_clinic = OP17053newQ1.a.5, 
                                    aq_info_via_local_paper = OP17053newQ1.a.6, aq_info_via_pharmacy = OP17053newQ1.a.7, aq_info_via_app = OP17053newQ1.a.8, 
                                    aq_info_via_school = OP17053newQ1.a.9, aq_info_via_other = OP17053newQ1.a.10, june2021_cat_clean)

june2021_num_clean <- dplyr::rename(aq_info_acces_frequency = OP17053newQ2.a, aq_info_via_internet = OP17053newQ1.a.1, aq_info_via_tv_radio = OP17053newQ1.a.2,
                                    aq_info_via_GP = OP17053newQ1.a.3, aq_info_via_nat_paper = OP17053newQ1.a.4, aq_info_via_hospital_clinic = OP17053newQ1.a.5, 
                                    aq_info_via_local_paper = OP17053newQ1.a.6, aq_info_via_pharmacy = OP17053newQ1.a.7, aq_info_via_app = OP17053newQ1.a.8, 
                                    aq_info_via_school = OP17053newQ1.a.9, aq_info_via_other = OP17053newQ1.a.10, june2021_num_clean)
                              
#rename colnames for concern about health impacts of AQ

june2021_cat_clean <- dplyr::rename(impact_indoor_pollution = OP11153_Q8.a.1, impact_outdoor_pollution = OP11153_Q8.a.2, long_term_health_AQ = OP11153_Q9.a, june2021_cat_clean)
     
june2021_num_clean <- dplyr::rename(impact_indoor_pollution = OP11153_Q8.a.1, impact_outdoor_pollution = OP11153_Q8.a.2, long_term_health_AQ = OP11153_Q9.a, june2021_num_clean)

#Recode key variables, replace NAs, hange data type to factor
#ordinal DF

june2021_ord_clean <- june2021_cat_clean

june2021_ord_clean$has_children[is.na(june2021_ord_clean$has_children)] <- 'Has children'

june2021_ord_clean[, 9:16][is.na(june2021_ord_clean[9:16])] <- 'no'
june2021_ord_clean[, 32:45][is.na(june2021_ord_clean[32:45])] <- 'no'
june2021_ord_clean[, 50:105][is.na(june2021_ord_clean[50:105])] <- 'no'

exceptions <- c("no")
june2021_ord_clean <- june2021_ord_clean %>%
  mutate(general_other = if_else(!(general_other %in% exceptions), 
                       "other", 
                       general_other))

june2021_ord_clean <- june2021_ord_clean %>%
  mutate(aq_info_other = if_else(!(aq_info_other %in% exceptions), 
                                 "other", 
                                 aq_info_other))

june2021_ord_clean <- june2021_ord_clean %>%
  mutate(aq_info_via_other = if_else(!(aq_info_via_other %in% exceptions), 
                                 "other", 
                                 aq_info_via_other))

june2021_ord_clean <- june2021_ord_clean %>% 
  mutate(
    # Create categories
    age_group = dplyr::case_when(
      age > 17 & age <= 26 ~ "18-25",
      age > 26 & age <= 36 ~ "26-35",
      age > 36 & age <= 46 ~ "36-45",
      age > 46 & age <= 56 ~ "46-55",
      age > 56 & age <= 66 ~ "56-65",
      age > 66 & age <= 76 ~ "66-75",
      age > 76 & age <= 80 ~ "76-80",
      age == "Over 80"     ~ "Over 80"
    ),
    # Convert to factor
    age_group = factor(
      age_group,
      level = c("18-25", "26-35","36-45", "46-55", "56-65","66-75", "76-80", "Over 80")
    )
  )

june2021_ord_clean <- as.data.frame(unclass(june2021_ord_clean),stringsAsFactors=TRUE)

#Numeric DF

june2021_num_clean_2 <- june2021_num_clean

june2021_num_clean_2$has_children[june2021_num_clean_2$has_children==9] <- 0
june2021_num_clean_2$has_children[is.na(june2021_num_clean_2$has_children)] <- 1

june2021_num_clean_2[, 9:16][is.na(june2021_num_clean_2[9:16])] <- 0
june2021_num_clean_2[, 32:45][is.na(june2021_num_clean_2[32:45])] <- 0
june2021_num_clean_2[, 50:105][is.na(june2021_num_clean_2[50:105])] <- 0

exceptions2 <- c("0")
june2021_num_clean_2 <- june2021_num_clean_2 %>%
  mutate(general_other = if_else(!(general_other %in% exceptions2), 
                                 "other", 
                                 general_other))

june2021_num_clean_2 <- june2021_num_clean_2 %>%
  mutate(aq_info_other = if_else(!(aq_info_other %in% exceptions2), 
                                 "other", 
                                 aq_info_other))

june2021_num_clean_2 <- june2021_num_clean_2 %>%
  mutate(aq_info_via_other = if_else(!(aq_info_via_other %in% exceptions2), 
                                     "other", 
                                     aq_info_via_other))

june2021_num_clean_2$general_other[june2021_num_clean_2$general_other=="other"] <- 1
june2021_num_clean_2$aq_info_other[june2021_num_clean_2$aq_info_other=="other"] <- 1
june2021_num_clean_2$aq_info_via_other[june2021_num_clean_2$aq_info_via_other=="other"] <- 1

convert <- c("general_other", "aq_info_other", "aq_info_via_other")
june2021_num_clean_2 <- june2021_num_clean_2 %>% mutate_at(convert, as.numeric)

