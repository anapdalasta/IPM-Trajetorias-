# --------------------------------------------------------------------------
# Importar bancos de dados do Censo demografico de 2000 e 2010
# Data: 31/08/2022
# Obs: o arquivo original esta em formato txt sem indicacao das colunas
#---------------------------------------------------------------------------
#### Limpando ambiente de trabalho
rm(list = ls(all = TRUE))


#### Ler bibliotecas
library(tidyr)
library(dplyr)


#### Definicao dos Caminhos
setwd("C:\\ipm")
path_Orig <- file.path("../ipm/")

#### Importando dados dos Microdados do Censo 2000
## utilizando a funcao read.fwf para ler o arquivo txt
al00domvo = rbind(
  read.fwf(file = "Dom11.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                          1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom12.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom13.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom14.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom15.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom16.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom17.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom21.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1)),
read.fwf(file = "Dom51.txt", widths = c(2,4,5,7,9,11,8,2,1,2,13,1,1,1,2,2,1,1,1,1,2,1,1,1,1,1,1,1,1,1,1,
                                        1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,2,3,3,2,2,2,2,2,2,2,2,2,6,6,11,1,1,1))
)

names(al00domvo) <- c("V0102", "V1002", "V1003", "V0103", "V0104", "V0105", "V0300", "V0400", "V1001", "V1004", "AREAP",
                      "V1005", "V1006", "V1007", "V0110", "V0111", "V0201", "M0201", "V0202", "M0202", "V0203", "M0203",
                      "V0204", "M0204", "V0205", "M0205", "V0206", "M0206", "V0207", "M0207", "V0208", "M0208", "V0209",
                      "M0209", "V0210", "M0210", "V0211", "M0211", "V0212", "M0212", "V0213", "M0213", "V0214", "M0214",
                      "V0215", "M0215", "V0216", "M0216", "V0217", "M0217", "V0218", "M0218", "V0219", "M0219", "V0220",
                      "M0220", "V0221", "M0221", "V0222", "M0222", "V0223", "M0223", "V7100", "V7203", "V7204", "V7401",
                      "V7402", "V7403", "V7404", "V7405", "V7406", "V7407", "V7408", "V7409", "V7616", "V7617", "P001",
                      "V1111", "V1112", "V1113")


#### Criar novas variaveis para inserir os decimais nas variáveis já existentes
### V7203	121	  3.1
### V7204	124	  3.1
### V7617	151   6.2  tem NA
### P001  157  11.8
al00domvo <- mutate(al00domvo, V7203a = V7203/10,
                    V7204a = V7204/10,
                    P001a = P001/100000000,
                    V7617a = ifelse(is.na(V7617), NA, V7617/100)
)


### Reorganizar algumas variáveis
al00domvo <- al00domvo[,c(1:64, 81, 65, 82, 66:76, 84, 77, 83, 78:80)]

#Base Pessoas
al00pesvo = rbind(
  read.fwf(file = file.path(path_Orig,"Pes11.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  read.fwf(file = file.path(path_Orig,"Pes12.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  read.fwf(file = file.path(path_Orig,"Pes13.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  read.fwf(file = file.path(path_Orig,"Pes14.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  
  read.fwf(file = file.path(path_Orig,"Pes15.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  
  read.fwf(file = file.path(path_Orig,"Pes16.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  read.fwf(file = file.path(path_Orig,"Pes17.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  read.fwf(file = file.path(path_Orig,"Pes21.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3)),
  
  read.fwf(file = file.path(path_Orig,"Pes51.txt"),widths = c(2,4,5,7,9,11,8,2,2,13,1,1,1,1,1,1,1,2,1,2,1,1,1,3,1,2,
                                                              1,1,1,1,3,1,1,1,1,1,1,1,1,1,1,1,1,1,2,1,1,1,1,1,1,1,4,1,2,1,2,1,2,1,1,1,7,1,2,1,7,1,1,1,1,1,2,1,1,1,1,1,2,1,1,1,2,
                                                              1,2,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,4,1,5,1,1,1,1,1,1,1,1,1,1,1,6,1,6,6,1,1,6,1,6,6,6,6,2,1,2,1,3,1,1,1,1,6,1,
                                                              6,1,6,1,6,1,6,1,6,6,2,1,2,2,1,2,1,2,1,11,2,2,2,1,2,1,2,1,2,1,1,1,2,1,2,1,3,3,3,3,3,3,3))
)

# acrescentando nomes nas variaveis
names(al00pesvo) <- c("V0102", "V1002", "V1003", "V0103", "V0104", "V0105", "V0300", "V0400", "V1004", "AREAP", "V1001",
                      "V1005", "V1006", "V1007", "MARCA", "V0401", "M0401", "V0402", "M0402", "V0403", "M0403", "V0404",
                      "M0404", "V4572", "M4572", "V4574", "M4574", "V4070", "V0408", "M0408", "V4090", "M4090", "V0410",
                      "M0410", "V0411", "M0411", "V0412", "M0412", "V0413", "M0413", "V0414", "M0414", "V0415", "M0415",
                      "V0416", "M0416", "V0417", "M0417", "V0418", "M0418", "V0419", "M0419", "V0420", "M0420", "V4210",
                      "M4210", "V0422", "M0422", "V4230", "M4230", "V0424", "M0424", "V4250", "M4250", "V4260", "M4260",
                      "V4276", "M4276", "V0428", "M0428", "V0429", "M0429", "V0430", "M0430", "V0431", "M0431", "V0432",
                      "M0432", "V0433", "M0433", "V0434", "M0434", "V0435", "M0435", "V4300", "V0436", "M0436", "V0437",
                      "M0437", "V0438", "M0438", "V0439", "M0439", "V0440", "M0440", "V0441", "M0441", "V0442", "M0442",
                      "V0443", "M0443", "V0444", "M0444", "V4452", "M4452", "V4462", "M4462", "V0447", "M0447", "V0448",
                      "M0448", "V0449", "M0449", "V0450", "M0450", "V4511", "M4511", "V4512", "M4512", "V4513", "V4514",
                      "V4521", "M4521", "V4522", "M4522", "V4523", "V4524", "V4525", "V4526", "V0453", "M4523", "V0454",
                      "M0454", "V4534", "V0455", "M0455", "V0456", "M0456", "V4573", "M4573", "V4583", "M4583", "V4593",
                      "M4593", "V4603", "M4603", "V4613", "M4613", "V4614", "V4615", "V4620", "M4620", "V0463", "V4654",
                      "M4654", "V4670", "M4670", "V4690", "M0463", "P001", "ESTR", "ESTRP", "V4621", "M4621", "V4622",
                      "M4622", "V4631", "M4631", "V4632", "M4632", "V0464", "M0464", "V4671", "M4671", "V4672", "M4672",
                      "V4354", "V4219", "V4239", "V4269", "V4279", "V4451", "V4461")

#### Criar uma nova variavel para inserir os decimais das vari?veis j? existentes
### V4514	  6 (2)
### V4524	  6 (2)
### V4526	  6 (2)
### V4615	  6 (2)
### P001	 11 (8)
al00pesvo <- mutate(al00pesvo, P001a = P001/100000000,
                    V4514a = ifelse(is.na(V4514), NA, V4514/100),
                    V4524a = ifelse(is.na(V4524), NA, V4524/100),
                    V4526a = ifelse(is.na(V4526), NA, V4526/100),
                    V4615a = ifelse(is.na(V4615), NA, V4615/100)
)

### Reorganizar algumas variaveis
al00pesvo <- al00pesvo[,c(1:121,185,122:127,186,128:129,187,130:150,188,151:160,184,161:183)]

al00pesvo <- al00pesvo[, !colnames(al00pesvo) %in% 
                         c("V0102", "V1002", "V1003", "V0103", "V0104", "V0105", "V0400", "V1004", "AREAP",
                           "V1001", "V1005", "V1006", "V1007", "P001", "P001a")]


##### Juntar arquivos de pessoas e domicilios
al00dompesvo <- as.data.frame(al00domvo %>%
                                full_join(al00pesvo,by = c("V0300")
                                )
)

#### Selecionar variáveis para formar novo dataframe
dat <- al00dompesvo %>% select(V0102, V0103, V0300, V1006, P001a, V0215, V0219, 
                               V0221, V0222, V0429, V4300, V4670, V4572, V7100, 
                               V0432, V0434, V0402, V0428, V4572, V0429, # DIMENSÃO EDUCAÇÃO
                               V4620, V0463,  #DIMENSÃO SAÚDE                     
                               V0201,V7204a, V0206,V0211, V0212, V0213, V0207, V0208, #DIMENSÃO CONDIÇÕES DE VIDA
                               V4525, V4573, V4593, V4603, V4613, #PROGRAMAS SOCIAIS (V4525= 0| v4593= 0| V4603 > 0|  V4613= 0\ v4573= 0)
                               V4525, #TRABALHO REMUNERADO (V4525=0)
                               V0215,V0220,V0221,V0222,V0217,V0219, V0214 # (V0215=2| V0220:2| V0221=0 | V0222=0| V0217=2| V0219=2)
)

#### Separar as bases em urbano e rural
al00rur = subset(dat, V1006 == "2")
al00urb = subset(dat, V1006 == "1")


#============================================   IPM GERAL 2000========================================================
#### Criar novo dataframe apenas com as vari?veis que serão criadas
ipm <- dat %>% select(V0102, V0103, P001a, V1006, V0300, V7100)


########################################### Estimativa do IPM  ################################################
# Criação de variáveis e dimensões
###############################################################################################################
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
dat$saud1 <- ifelse(dat$V4620-dat$V0463 >=1, 1, 0)
dat$saud1[which(is.na(dat$saud1))] <- 0

ipm$saud1 <- dat$saud1


################ Dimensão Educa??o
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
dat$educ1 <- ifelse((dat$V0432 == 1)| (dat$V0432 == 2)&(dat$V0434 == 2)|
                      (dat$V0432 == 5)&(dat$V0434 == 2), 1, 0)
dat$educ1[which(is.na(dat$educ1))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
dat$educ2 <- ifelse((dat$V0402 == 1 ) & (dat$V0428 == 2), 1, 0)
dat$educ2[which(is.na(dat$educ2))] <- 0


#### (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Crianças que não frequentam a escola
dat$educ3 <- ifelse((dat$V4572 >= 4 & dat$V4572 <= 14) & (dat$V0429 == 3)|
                      (dat$V4572 >= 4 & dat$V4572 <= 14) & (dat$V0429 == 4), 1, 0)
dat$educ3[which(is.na(dat$educ3))] <- 0

ipm$educ1 <- dat$educ1
ipm$educ2 <- dat$educ2
ipm$educ3 <- dat$educ3

################ Dimensão Condição de vida 
# Energia elétrica  (V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)


#### Esgotamento sanitário (variável V0211 - tipo de esgotamento sanitário)
# critério: não tem esgotamento sanitário adequado (3 a 6)
dat$cv1 <- ifelse(dat$V0211 >=3 & dat$V0211 <=6, 1, 0)
dat$cv1[which(is.na(dat$cv1))] <- 0


#### Destino do lixo (variável V0212 - destino do lixo)
# critério: lixo sem destino adequado (3 a 7)
dat$cv2 <- ifelse(dat$V0212 >=3 & dat$V0212 <= 7, 1, 0)
dat$cv2[which(is.na(dat$cv2))] <- 0


#### Energia elétrica (variável V0213 - ilumina??o elétrica)
# critério: na? tem eletricidade (2)
dat$cv3 <- ifelse(dat$V0213 ==2, 1, 0)
dat$cv3[which(is.na(dat$cv3))] <- 0


#### Acesso à Água (variável V0207 - origem | V0208 - Canalizada em pelo menos 1 cômodo)
# Critério: V0207=3 e V0208>=2
dat$cv4 <- ifelse((dat$V0207 ==3) | (dat$V0208 ==2) |(dat$V0208 ==3), 1, 0)
dat$cv4[which(is.na(dat$cv4))] <- 0


#### Espécie de domicílio (V0201:2 e 3)
# Critério: V0201=3 e V0201=2
dat$cv5 <- ifelse((dat$V0201 ==2) |(dat$V0201 ==3), 1, 0)
dat$cv5[which(is.na(dat$cv5))] <- 0


#### Densidade do Domicílio V7204 >= 5
# 
dat$cv6 <- ifelse(dat$V7204a >=5, 1, 0)
dat$cv6[which(is.na(dat$cv6))] <- 0

#### Condição do Terreno V0206 >= 2 APENAS PARA O RURAL
# 
dat$cv7 <- ifelse(dat$V0206 >=2, 1, 0)
dat$cv7[which(is.na(dat$cv7))] <- 0

ipm$cv1 <- dat$cv1
ipm$cv2 <- dat$cv2
ipm$cv3 <- dat$cv3
ipm$cv4 <- dat$cv4
ipm$cv5 <- dat$cv5
ipm$cv6 <- dat$cv6
ipm$cv7 <- dat$cv7

#### Condição de Vida (Bens de consumo e Trabalho)
# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
dat$nv1 <- ifelse((dat$V0402 == 1)&(dat$V4525 == 0 ) | (dat$V0402 == 1)&(dat$V4593 == 0) |
                    (dat$V0402 == 1)&(dat$V4603 >= 0) | (dat$V0402 == 1)&(dat$V4613 == 0) |
                    (dat$V0402 == 1)&(dat$V4573 == 0), 1, 0)
dat$nv1[which(is.na(dat$nv1))] <- 0

# Trabalho Remunerado (V4525: 0 | V0402=1)
dat$nv2 <- ifelse((dat$V4525 == 0) & (dat$V0402 == 1), 1, 0)
dat$nv2[which(is.na(dat$nv2))] <- 0

# Geladeira (V0215: 2 )
dat$nv3 <- ifelse((dat$V0215 == 2) , 1, 0)
dat$nv3[which(is.na(dat$nv3))] <- 0

# Computador, Televisores (V0220: 2 | V0221:0)
dat$nv4 <- ifelse((dat$V0220 == 2) | (dat$V0221 == 0), 1, 0)
dat$nv4[which(is.na(dat$nv4))] <- 0

dat$nv4r <- ifelse((dat$V0214 == 2)|(dat$V0221 == 0), 1, 0)
dat$nv4r[which(is.na(dat$nv4r))] <- 0

# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
dat$nv5 <- ifelse((dat$V0222 == 0) & (dat$V0217 == 2) & (dat$V0219 == 2), 1, 0)
dat$nv5[which(is.na(dat$nv5))] <- 0


ipm$nv1 <- dat$nv1           # esgotamento sanitário
ipm$nv2 <- dat$nv2           # destino do lixo
ipm$nv3 <- dat$nv3           # energia elétrica
ipm$nv4 <- dat$nv4           # ativos
ipm$nv4r <- dat$nv4r
ipm$nv5 <- dat$nv5  


##################################   AGREGAÇÃO POR DOMICÍLIOS   ####################################
attach(ipm)
agipm <- aggregate(ipm, by=list(V0300), FUN=mean, na.rm=TRUE)
ipm. <- c("V0102", "P001a", "V0103", "V7100")
ipm. <- agipm[ipm.]
ipm.$educ1[agipm$educ1 > 0] <- 1 
ipm.$educ1[agipm$educ1 == 0] <- 0 
ipm.$educ2[agipm$educ2 > 0] <- 1 
ipm.$educ2[agipm$educ2 == 0] <- 0 
ipm.$educ3[agipm$educ3 > 0] <- 1 
ipm.$educ3[agipm$educ3 == 0] <- 0 

ipm.$saud1[agipm$saud1 > 0] <- 1 
ipm.$saud1[agipm$saud1 == 0] <- 0

ipm.$cv1[agipm$cv1 > 0] <- 1 
ipm.$cv1[agipm$cv1 == 0] <- 0
ipm.$cv2[agipm$cv2 > 0] <- 1 
ipm.$cv2[agipm$cv2 == 0] <- 0
ipm.$cv3[agipm$cv3 > 0] <- 1 
ipm.$cv3[agipm$cv3 == 0] <- 0
ipm.$cv4[agipm$cv4 > 0] <- 1 
ipm.$cv4[agipm$cv4 == 0] <- 0
ipm.$cv5[agipm$cv5 > 0] <- 1 
ipm.$cv5[agipm$cv5 == 0] <- 0
ipm.$cv6[agipm$cv6 > 0] <- 1 
ipm.$cv6[agipm$cv6 == 0] <- 0

ipm.$nv1[agipm$nv1 > 0] <- 1 
ipm.$nv1[agipm$nv1 == 0] <- 0
ipm.$nv2[agipm$nv2 > 0] <- 1 
ipm.$nv2[agipm$nv2 == 0] <- 0
ipm.$nv3[agipm$nv3 > 0] <- 1 
ipm.$nv3[agipm$nv3 == 0] <- 0
ipm.$nv4[agipm$nv4 > 0] <- 1 
ipm.$nv4[agipm$nv4 == 0] <- 0
ipm.$nv5[agipm$nv5 > 0] <- 1 
ipm.$nv5[agipm$nv5 == 0] <- 0

#############################  GERAÇÃO DO IPM  ################################################
##### Criação dos pesos das dimensões

ipm.$peduc   <- (1/4)/3   #criando o peso da educação
ipm.$psaud   <- (1/4)/1   #criando o peso da saúde
ipm.$pcv   <- (1/4)/6   #criando o peso das condições de vida Habitação
ipm.$pnv   <- (1/4)/5   #criando o peso das condições de trabalho e renda


##### Geração da Carência Ponderada
ipm.$carpond <- ipm.$peduc*ipm.$educ1+ipm.$peduc*ipm.$educ2+ipm.$peduc*ipm.$educ3+
  ipm.$psaud*ipm.$saud1+
  ipm.$pnv*ipm.$nv1+  ipm.$pnv*ipm.$nv2+ipm.$pnv*ipm.$nv3+ipm.$pnv*ipm.$nv4+ipm.$pnv*ipm.$nv5+
  ipm.$pcv*ipm.$cv1+ipm.$pcv*ipm.$cv2+ipm.$pcv*ipm.$cv3+ipm.$pcv*ipm.$cv4+ipm.$pcv*ipm.$cv5+ipm.$pcv*ipm.$cv6


ipm.$clasipm.[ipm.$carpond < 0.25] <- 0
ipm.$clasipm.[ipm.$carpond >=0.25] <- 1


## Auxiliar da Taxa de Incidência (H)
ipm.$h <- sum(ipm.$clasipm.*ipm.$V7100)/sum(ipm.$V7100)

ipm.$totpesres <- ipm.$V7100
ipm.$totpescar <- ipm.$totpesres*ipm.$clasipm.

## Auxiliar na Intensidade da Pobreza (A)
ipm.$totint <- ipm.$carpond*ipm.$totpesres*ipm.$clasipm.


## Contribuições das dimensões
# Saúde
ipm.$tsaude <- (ipm.$psaud*ipm.$totpesres*ipm.$saud1*ipm.$clasipm.)


# Educação
ipm.$teduca <- (ipm.$peduc*ipm.$totpesres*ipm.$educ1*ipm.$clasipm.)+(ipm.$peduc*ipm.$totpesres*ipm.$educ2*ipm.$clasipm.)+
  (ipm.$peduc*ipm.$totpesres*ipm.$educ3*ipm.$clasipm.)



# Condição de Vida Habitacional
ipm.$tcv <- (ipm.$pcv*ipm.$totpesres*ipm.$cv1*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv2*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv3*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv4*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv5*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv6*ipm.$clasipm.)

# Condição de Vida Trabalho e renda
ipm.$tnv <- (ipm.$pnv*ipm.$totpesres*ipm.$nv1*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv2*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv3*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv4*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv5*ipm.$clasipm.)


##################################### AGREGAÇÃO POR MUNICÍPIOS   #####################################################
attach(ipm.)
eipm <- aggregate(ipm., by=list(V0103), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","carpond","clasipm.")
ipm1 <- eipm[ipm1]
colnames(ipm1)[1]<-"MUN"

eipm <- aggregate(ipm., by=list(V0103), FUN=sum, na.rm=T)
eipm$h <- eipm$totpescar/eipm$totpesres                    # Taxa de incidência (H)
eipm$a <- eipm$totint/eipm$totpescar                       # Intensidade da pobreza (A)
eipm$ipm <- eipm$h*eipm$a                                  # IPM
eipm$csaude <- eipm$tsaude/eipm$totpesres/eipm$ipm
eipm$ceduca <- eipm$teduca/eipm$totpesres/eipm$ipm
eipm$ccv <- eipm$tcv/eipm$totpesres/eipm$ipm
eipm$cnv <- eipm$tnv/eipm$totpesres/eipm$ipm

ipm2 <- c("Group.1","h","a","ipm","csaude","ceduca","ccv","cnv","totpescar","totpesres")
ipm2 <- eipm[ipm2]
colnames(ipm2)[1]<-"MUN"

baseipm_00 <- merge(ipm1,ipm2, by="MUN") 

baseipm_00 = baseipm_00 %>%
  dplyr::rename(
    carpond.00 = carpond,
    totpesres.00 = totpesres,
    totpescar.00 = totpescar,
    h.00 = h,
    a.00 = a,
    ipm.00 = ipm,
    csaude.00 = csaude,
    ceduca.00 = ceduca,
    ccv.00 = ccv,
    cnv.00 = cnv
  )

#=========================================    IPM URBANO 2000 =====================================================
#### Criar novo al00urbaframe apenas com as variáveis que serão criadas
ipm <- al00urb %>% select(V0102, V0103, P001a, V1006, V0300, V7100)


########################################### Estimativa do IPM  ################################################
# Criação de variáveis e dimensões
###############################################################################################################
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
al00urb$saud1 <- ifelse(al00urb$V4620-al00urb$V0463 >=1, 1, 0)
al00urb$saud1[which(is.na(al00urb$saud1))] <- 0

ipm$saud1 <- al00urb$saud1


################ Dimensão Educação
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
al00urb$educ1 <- ifelse((al00urb$V0432 == 1)| (al00urb$V0432 == 2)&(al00urb$V0434 == 2)|
                          (al00urb$V0432 == 5)&(al00urb$V0434 == 2), 1, 0)
al00urb$educ1[which(is.na(al00urb$educ1))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
al00urb$educ2 <- ifelse((al00urb$V0402 == 1 ) & (al00urb$V0428 == 2), 1, 0)
al00urb$educ2[which(is.na(al00urb$educ2))] <- 0


#### (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Crianças que não frequentam a escola
al00urb$educ3 <- ifelse((al00urb$V4572 >= 4 & al00urb$V4572 <= 14) & (al00urb$V0429 == 3)|
                          (al00urb$V4572 >= 4 & al00urb$V4572 <= 14) & (al00urb$V0429 == 4), 1, 0)
al00urb$educ3[which(is.na(al00urb$educ3))] <- 0

ipm$educ1 <- al00urb$educ1
ipm$educ2 <- al00urb$educ2
ipm$educ3 <- al00urb$educ3


################ Dimensão Condição de vida 
# Energia elétrica(V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário   - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)


#### Esgotamento sanitário   (variável V0211 - tipo de esgotamento sanitário  )
# critério: não tem esgotamento sanitário   adequado (3 a 6)
al00urb$cv1 <- ifelse(al00urb$V0211 >=3 & al00urb$V0211 <=6, 1, 0)
al00urb$cv1[which(is.na(al00urb$cv1))] <- 0


#### Destino do lixo (variável V0212 - destino do lixo)
# critério: lixo sem destino adequado (3 a 7)
al00urb$cv2 <- ifelse(al00urb$V0212 >=3 & al00urb$V0212 <= 7, 1, 0)
al00urb$cv2[which(is.na(al00urb$cv2))] <- 0


#### Energia elétrica (variável V0213 - ilumina??o elétrica)
# critério: na? tem eletricidade (2)
al00urb$cv3 <- ifelse(al00urb$V0213 ==2, 1, 0)
al00urb$cv3[which(is.na(al00urb$cv3))] <- 0


#### Acesso à Água (variável V0207 - origem | V0208 - Canalizada em pelo menos 1 cômodo)
# Critério: V0207=3 e V0208>=2
al00urb$cv4 <- ifelse((al00urb$V0207 ==3) | (al00urb$V0208 ==2) |(al00urb$V0208 ==3), 1, 0)
al00urb$cv4[which(is.na(al00urb$cv4))] <- 0


#### Espécie de domicílio (V0201:2 e 3)
# Critério: V0201=3 e V0201=2
al00urb$cv5 <- ifelse((al00urb$V0201 ==2) |(al00urb$V0201 ==3), 1, 0)
al00urb$cv5[which(is.na(al00urb$cv5))] <- 0


#### Densidade do Domicílio V7204 >= 5
# 
al00urb$cv6 <- ifelse(al00urb$V7204a >=5, 1, 0)
al00urb$cv6[which(is.na(al00urb$cv6))] <- 0


ipm$cv1 <- al00urb$cv1
ipm$cv2 <- al00urb$cv2
ipm$cv3 <- al00urb$cv3
ipm$cv4 <- al00urb$cv4
ipm$cv5 <- al00urb$cv5
ipm$cv6 <- al00urb$cv6


#### Condição de Vida (Bens de consumo e Trabalho)
# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
al00urb$nv1 <- ifelse((al00urb$V0402 == 1)&(al00urb$V4525 == 0 ) | (al00urb$V0402 == 1)&(al00urb$V4593 == 0) |
                        (al00urb$V0402 == 1)&(al00urb$V4603 >= 0) | (al00urb$V0402 == 1)&(al00urb$V4613 == 0) |
                        (al00urb$V0402 == 1)&(al00urb$V4573 == 0), 1, 0)
al00urb$nv1[which(is.na(al00urb$nv1))] <- 0

# Trabalho Remunerado (V4525: 0 | V0402=1)
al00urb$nv2 <- ifelse((al00urb$V4525 == 0) & (al00urb$V0402 == 1), 1, 0)
al00urb$nv2[which(is.na(al00urb$nv2))] <- 0

# Geladeira (V0215: 2 )
al00urb$nv3 <- ifelse((al00urb$V0215 == 2) , 1, 0)
al00urb$nv3[which(is.na(al00urb$nv3))] <- 0

# Computador, Televisores (V0220: 2 | V0221:0)
al00urb$nv4 <- ifelse((al00urb$V0220 == 2) | (al00urb$V0221 == 0), 1, 0)
al00urb$nv4[which(is.na(al00urb$nv4))] <- 0


# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
al00urb$nv5 <- ifelse((al00urb$V0222 == 0) & (al00urb$V0217 == 2) & (al00urb$V0219 == 2), 1, 0)
al00urb$nv5[which(is.na(al00urb$nv5))] <- 0


ipm$nv1 <- al00urb$nv1           # esgotamento sanitário  
ipm$nv2 <- al00urb$nv2           # destino do lixo
ipm$nv3 <- al00urb$nv3           # energia elétrica
ipm$nv4 <- al00urb$nv4           # ativos
ipm$nv5 <- al00urb$nv5  

##################################   AGREGAÇÃO POR DOMICÍLIOS   ####################################
attach(ipm)
agipm <- aggregate(ipm, by=list(V0300), FUN=mean, na.rm=TRUE)
ipm. <- c("V0102", "P001a", "V0103", "V7100")
ipm. <- agipm[ipm.]
ipm.$educ1[agipm$educ1 > 0] <- 1 
ipm.$educ1[agipm$educ1 == 0] <- 0 
ipm.$educ2[agipm$educ2 > 0] <- 1 
ipm.$educ2[agipm$educ2 == 0] <- 0 
ipm.$educ3[agipm$educ3 > 0] <- 1 
ipm.$educ3[agipm$educ3 == 0] <- 0 

ipm.$saud1[agipm$saud1 > 0] <- 1 
ipm.$saud1[agipm$saud1 == 0] <- 0

ipm.$cv1[agipm$cv1 > 0] <- 1 
ipm.$cv1[agipm$cv1 == 0] <- 0
ipm.$cv2[agipm$cv2 > 0] <- 1 
ipm.$cv2[agipm$cv2 == 0] <- 0
ipm.$cv3[agipm$cv3 > 0] <- 1 
ipm.$cv3[agipm$cv3 == 0] <- 0
ipm.$cv4[agipm$cv4 > 0] <- 1 
ipm.$cv4[agipm$cv4 == 0] <- 0
ipm.$cv5[agipm$cv5 > 0] <- 1 
ipm.$cv5[agipm$cv5 == 0] <- 0
ipm.$cv6[agipm$cv6 > 0] <- 1 
ipm.$cv6[agipm$cv6 == 0] <- 0

ipm.$nv1[agipm$nv1 > 0] <- 1 
ipm.$nv1[agipm$nv1 == 0] <- 0
ipm.$nv2[agipm$nv2 > 0] <- 1 
ipm.$nv2[agipm$nv2 == 0] <- 0
ipm.$nv3[agipm$nv3 > 0] <- 1 
ipm.$nv3[agipm$nv3 == 0] <- 0
ipm.$nv4[agipm$nv4 > 0] <- 1 
ipm.$nv4[agipm$nv4 == 0] <- 0
ipm.$nv5[agipm$nv5 > 0] <- 1 
ipm.$nv5[agipm$nv5 == 0] <- 0

#############################  GERAÇÃO DO IPM  ################################################
##### Cria??o dos pesos das dimensões

ipm.$peduc   <- (1/4)/3   #criando o peso da educação
ipm.$psaud   <- (1/4)/1   #criando o peso da saúde
ipm.$pcv   <- (1/4)/6   #criando o peso das condições de vida Habitação
ipm.$pnv   <- (1/4)/5   #criando o peso das condições de trabalho e renda


##### Geração da Carência Ponderada
ipm.$carpond <- ipm.$peduc*ipm.$educ1+ipm.$peduc*ipm.$educ2+ipm.$peduc*ipm.$educ3+
  ipm.$psaud*ipm.$saud1+
  ipm.$pnv*ipm.$nv1+  ipm.$pnv*ipm.$nv2+ipm.$pnv*ipm.$nv3+ipm.$pnv*ipm.$nv4+ipm.$pnv*ipm.$nv5+
  ipm.$pcv*ipm.$cv1+ipm.$pcv*ipm.$cv2+ipm.$pcv*ipm.$cv3+ipm.$pcv*ipm.$cv4+ipm.$pcv*ipm.$cv5+ipm.$pcv*ipm.$cv6

ipm.$clasipm.[ipm.$carpond < 0.25] <- 0
ipm.$clasipm.[ipm.$carpond >=0.25] <- 1

## Aux Taxa de Incidencia (H)
ipm.$h <- sum(ipm.$clasipm.*ipm.$V7100)/sum(ipm.$V7100)

ipm.$totpesres <- ipm.$V7100
ipm.$totpescar <- ipm.$totpesres*ipm.$clasipm.

## Aux Intensidade da Pobreza (A)
ipm.$totint <- ipm.$carpond*ipm.$totpesres*ipm.$clasipm.


## Contribuições das dimensões
# Saúde
ipm.$tsaude <- (ipm.$psaud*ipm.$totpesres*ipm.$saud1*ipm.$clasipm.)


# Educação
ipm.$teduca <- (ipm.$peduc*ipm.$totpesres*ipm.$educ1*ipm.$clasipm.)+(ipm.$peduc*ipm.$totpesres*ipm.$educ2*ipm.$clasipm.)+
  (ipm.$peduc*ipm.$totpesres*ipm.$educ3*ipm.$clasipm.)



# Condição de Vida Habitacional
ipm.$tcv <- (ipm.$pcv*ipm.$totpesres*ipm.$cv1*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv2*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv3*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv4*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv5*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv6*ipm.$clasipm.)

# Condição de Vida Trabalho e renda
ipm.$tnv <- (ipm.$pnv*ipm.$totpesres*ipm.$nv1*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv2*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv3*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv4*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv5*ipm.$clasipm.)

##################################### AGREGAÇÃO POR MUNICÍPIOS   #####################################################
attach(ipm.)
eipm <- aggregate(ipm., by=list(V0103), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","carpond","clasipm.")
ipm1 <- eipm[ipm1]
colnames(ipm1)[1]<-"MUN"

eipm <- aggregate(ipm., by=list(V0103), FUN=sum, na.rm=T)
eipm$h <- eipm$totpescar/eipm$totpesres                    # Taxa de incidência (H)
eipm$a <- eipm$totint/eipm$totpescar                       # Intensidade da pobreza (A)
eipm$ipm <- eipm$h*eipm$a                                  # IPM
eipm$csaude <- eipm$tsaude/eipm$totpesres/eipm$ipm
eipm$ceduca <- eipm$teduca/eipm$totpesres/eipm$ipm
eipm$ccv <- eipm$tcv/eipm$totpesres/eipm$ipm
eipm$cnv <- eipm$tnv/eipm$totpesres/eipm$ipm

ipm2 <- c("Group.1","h","a","ipm","csaude","ceduca","ccv","cnv","totpescar","totpesres")
ipm2 <- eipm[ipm2]
colnames(ipm2)[1]<-"MUN"

baseipm_00.urb <- merge(ipm1,ipm2, by="MUN") 

baseipm_00.urb = baseipm_00.urb %>%
  dplyr::rename(
    carpond.00.urb = carpond,
    totpesres.00.urb = totpesres,
    totpescar.00.urb = totpescar,
    h.00.urb = h,
    a.00.urb = a,
    ipm.00.urb = ipm,
    csaude.00.urb = csaude,
    ceduca.00.urb = ceduca,
    ccv.00.urb = ccv,
    cnv.00.urb = cnv
  )

#=========================================    IPM RURAL 2000 =====================================================
#### Criar novo al00ruraframe apenas com as variáveis que serão criadas
ipm <- al00rur %>% select(V0102, V0103, P001a, V1006, V0300, V7100)

########################################### Estimativa do IPM  ################################################
# Criação de variáveis e dimensões
###############################################################################################################
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
al00rur$saud1 <- ifelse(al00rur$V4620-al00rur$V0463 >=1, 1, 0)
al00rur$saud1[which(is.na(al00rur$saud1))] <- 0

ipm$saud1 <- al00rur$saud1


################ Dimensão Educação
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
al00rur$educ1 <- ifelse((al00rur$V0432 == 1)| (al00rur$V0432 == 2)&(al00rur$V0434 == 2)|
                          (al00rur$V0432 == 5)&(al00rur$V0434 == 2), 1, 0)
al00rur$educ1[which(is.na(al00rur$educ1))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
al00rur$educ2 <- ifelse((al00rur$V0402 == 1 ) & (al00rur$V0428 == 2), 1, 0)
al00rur$educ2[which(is.na(al00rur$educ2))] <- 0


#### (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Crianças que não frequentam a escola
al00rur$educ3 <- ifelse((al00rur$V4572 >= 4 & al00rur$V4572 <= 14) & (al00rur$V0429 == 3)|
                          (al00rur$V4572 >= 4 & al00rur$V4572 <= 14) & (al00rur$V0429 == 4), 1, 0)
al00rur$educ3[which(is.na(al00rur$educ3))] <- 0

ipm$educ1 <- al00rur$educ1
ipm$educ2 <- al00rur$educ2
ipm$educ3 <- al00rur$educ3


################ Dimensão Condição de vida 
# Energia elétrica(V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário   - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)


#### Esgotamento sanitário   (variável V0211 - tipo de esgotamento sanitário  )
# critério: não tem esgotamento sanitário   adequado (3 a 6)
al00rur$cv1 <- ifelse(al00rur$V0211 >=3 & al00rur$V0211 <=6, 1, 0)
al00rur$cv1[which(is.na(al00rur$cv1))] <- 0


#### Destino do lixo (variável V0212 - destino do lixo)
# critério: lixo sem destino adequado (3 a 7)
al00rur$cv2 <- ifelse(al00rur$V0212 >=3 & al00rur$V0212 <= 7, 1, 0)
al00rur$cv2[which(is.na(al00rur$cv2))] <- 0


#### Energia elétrica (variável V0213 - ilumina??o elétrica)
# critério: na? tem eletricidade (2)
al00rur$cv3 <- ifelse(al00rur$V0213 ==2, 1, 0)
al00rur$cv3[which(is.na(al00rur$cv3))] <- 0


#### Acesso à Água (variável V0207 - origem | V0208 - Canalizada em pelo menos 1 cômodo)
# Critério: V0207=3 e V0208>=2
al00rur$cv4 <- ifelse((al00rur$V0207 ==3) | (al00rur$V0208 ==2) |(al00rur$V0208 ==3), 1, 0)
al00rur$cv4[which(is.na(al00rur$cv4))] <- 0


#### Espécie de domicílio (V0201:2 e 3)
# Critério: V0201=3 e V0201=2
al00rur$cv5 <- ifelse((al00rur$V0201 ==2) |(al00rur$V0201 ==3), 1, 0)
al00rur$cv5[which(is.na(al00rur$cv5))] <- 0


#### Densidade do Domicílio V7204 >= 5
# 
al00rur$cv6 <- ifelse(al00rur$V7204a >=5, 1, 0)
al00rur$cv6[which(is.na(al00rur$cv6))] <- 0

#### Condição do Terreno V0206 >= 2 APENAS PARA O RURAL
# 
al00rur$cv7 <- ifelse(al00rur$V0206 >=2, 1, 0)
al00rur$cv7[which(is.na(al00rur$cv7))] <- 0

ipm$cv1 <- al00rur$cv1
ipm$cv2 <- al00rur$cv2
ipm$cv3 <- al00rur$cv3
ipm$cv4 <- al00rur$cv4
ipm$cv5 <- al00rur$cv5
ipm$cv6 <- al00rur$cv6
ipm$cv7 <- al00rur$cv7

#### Condição de Vida (Bens de consumo e Trabalho)

# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
al00rur$nv1 <- ifelse((al00rur$V4525 == 0 ) & (al00rur$V4593 == 0) | 
                        (al00rur$V4525 == 0 ) & (al00rur$V4603 == 0), 1, 0)
al00rur$nv1[which(is.na(al00rur$nv1))] <- 0

# Trabalho Remunerado (V4525: 0 | V0402=1)
al00rur$nv2 <- ifelse((al00rur$V4525 == 0) & (al00rur$V0402 == 1), 1, 0)
al00rur$nv2[which(is.na(al00rur$nv2))] <- 0

# Geladeira (V0215: 2 )
al00rur$nv3 <- ifelse((al00rur$V0215 == 2) , 1, 0)
al00rur$nv3[which(is.na(al00rur$nv3))] <- 0

# Computador, Televisores (V0220: 2 | V0221:0)
al00rur$nv4r <- ifelse((al00rur$V0214 == 2) | (al00rur$V0221 == 0), 1, 0)
al00rur$nv4r[which(is.na(al00rur$nv4))] <- 0

# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
al00rur$nv5 <- ifelse((al00rur$V0222 == 0) , 1, 0)
al00rur$nv5[which(is.na(al00rur$nv5))] <- 0


ipm$nv1 <- al00rur$nv1           # esgotamento sanitário  
ipm$nv2 <- al00rur$nv2           # destino do lixo
ipm$nv3 <- al00rur$nv3           # energia elétrica
ipm$nv4 <- al00rur$nv4           # ativos
ipm$nv4r <- al00rur$nv4r
ipm$nv5 <- al00rur$nv5  

##################################   AGREGAÇÃO POR DOMICÍLIOS   ####################################
attach(ipm)
agipm <- aggregate(ipm, by=list(V0300), FUN=mean, na.rm=TRUE)
ipm. <- c("V0102", "P001a", "V0103", "V7100")
ipm. <- agipm[ipm.]
ipm.$educ1[agipm$educ1 > 0] <- 1 
ipm.$educ1[agipm$educ1 == 0] <- 0 
ipm.$educ2[agipm$educ2 > 0] <- 1 
ipm.$educ2[agipm$educ2 == 0] <- 0 
ipm.$educ3[agipm$educ3 > 0] <- 1 
ipm.$educ3[agipm$educ3 == 0] <- 0 

ipm.$saud1[agipm$saud1 > 0] <- 1 
ipm.$saud1[agipm$saud1 == 0] <- 0

ipm.$cv1[agipm$cv1 > 0] <- 1 
ipm.$cv1[agipm$cv1 == 0] <- 0
ipm.$cv2[agipm$cv2 > 0] <- 1 
ipm.$cv2[agipm$cv2 == 0] <- 0
ipm.$cv3[agipm$cv3 > 0] <- 1 
ipm.$cv3[agipm$cv3 == 0] <- 0
ipm.$cv4[agipm$cv4 > 0] <- 1 
ipm.$cv4[agipm$cv4 == 0] <- 0
ipm.$cv5[agipm$cv5 > 0] <- 1 
ipm.$cv5[agipm$cv5 == 0] <- 0
ipm.$cv6[agipm$cv6 > 0] <- 1 
ipm.$cv6[agipm$cv6 == 0] <- 0

ipm.$nv1[agipm$nv1 > 0] <- 1 
ipm.$nv1[agipm$nv1 == 0] <- 0
ipm.$nv2[agipm$nv2 > 0] <- 1 
ipm.$nv2[agipm$nv2 == 0] <- 0
ipm.$nv3[agipm$nv3 > 0] <- 1 
ipm.$nv3[agipm$nv3 == 0] <- 0
ipm.$nv4r[agipm$nv4r > 0] <- 1 
ipm.$nv4r[agipm$nv4r == 0] <- 0
ipm.$nv5[agipm$nv5 > 0] <- 1 
ipm.$nv5[agipm$nv5 == 0] <- 0

#############################  GERAÇÃO DO IPM  ################################################
##### Cria??o dos pesos das dimensões

ipm.$peduc   <- (1/4)/3   #criando o peso da educação
ipm.$psaud   <- (1/4)/1   #criando o peso da saúde
ipm.$pcv   <- (1/4)/7   #criando o peso das condições de vida Habitação
ipm.$pnv   <- (1/4)/5   #criando o peso das condições de trabalho e renda


##### Geração da Carência Ponderada
ipm.$carpond <- ipm.$peduc*ipm.$educ1+ipm.$peduc*ipm.$educ2+ipm.$peduc*ipm.$educ3+
  ipm.$psaud*ipm.$saud1+
  ipm.$pnv*ipm.$nv1+  ipm.$pnv*ipm.$nv2+ipm.$pnv*ipm.$nv3+ipm.$pnv*ipm.$nv4+ipm.$pnv*ipm.$nv5+
  ipm.$pcv*ipm.$cv1+ipm.$pcv*ipm.$cv2+ipm.$pcv*ipm.$cv3+ipm.$pcv*ipm.$cv4+ipm.$pcv*ipm.$cv5+ipm.$pcv*ipm.$cv6

ipm.$clasipm.[ipm.$carpond < 0.25] <- 0
ipm.$clasipm.[ipm.$carpond >=0.25] <- 1

## Aux Taxa de Incidencia (H)
ipm.$h <- sum(ipm.$clasipm.*ipm.$V7100)/sum(ipm.$V7100)

ipm.$totpesres <- ipm.$V7100
ipm.$totpescar <- ipm.$totpesres*ipm.$clasipm.

## Aux Intensidade da Pobreza (A)
ipm.$totint <- ipm.$carpond*ipm.$totpesres*ipm.$clasipm.


## Contribuições das dimensões
# Saúde
ipm.$tsaude <- (ipm.$psaud*ipm.$totpesres*ipm.$saud1*ipm.$clasipm.)


# Educação
ipm.$teduca <- (ipm.$peduc*ipm.$totpesres*ipm.$educ1*ipm.$clasipm.)+(ipm.$peduc*ipm.$totpesres*ipm.$educ2*ipm.$clasipm.)+
  (ipm.$peduc*ipm.$totpesres*ipm.$educ3*ipm.$clasipm.)



# Condição de Vida Habitacional
ipm.$tcv <- (ipm.$pcv*ipm.$totpesres*ipm.$cv1*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv2*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv3*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv4*ipm.$clasipm.)+
  (ipm.$pcv*ipm.$totpesres*ipm.$cv5*ipm.$clasipm.)+(ipm.$pcv*ipm.$totpesres*ipm.$cv6*ipm.$clasipm.)

# Condição de Vida Trabalho e renda
ipm.$tnv <- (ipm.$pnv*ipm.$totpesres*ipm.$nv1*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv2*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv3*ipm.$clasipm.)+(ipm.$pnv*ipm.$totpesres*ipm.$nv4*ipm.$clasipm.)+
  (ipm.$pnv*ipm.$totpesres*ipm.$nv5*ipm.$clasipm.)


##################################### AGREGAÇÃO POR MUNICÍPIOS   #####################################################
attach(ipm.)
eipm <- aggregate(ipm., by=list(V0103), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","carpond","clasipm.")
ipm1 <- eipm[ipm1]
colnames(ipm1)[1]<-"MUN"

eipm <- aggregate(ipm., by=list(V0103), FUN=sum, na.rm=T)
eipm$h <- eipm$totpescar/eipm$totpesres                    # Taxa de incidência (H)
eipm$a <- eipm$totint/eipm$totpescar                       # Intensidade da pobreza (A)
eipm$ipm <- eipm$h*eipm$a                                  # IPM
eipm$csaude <- eipm$tsaude/eipm$totpesres/eipm$ipm
eipm$ceduca <- eipm$teduca/eipm$totpesres/eipm$ipm
eipm$ccv <- eipm$tcv/eipm$totpesres/eipm$ipm
eipm$cnv <- eipm$tnv/eipm$totpesres/eipm$ipm

ipm2 <- c("Group.1","h","a","ipm","csaude","ceduca","ccv","cnv","totpescar","totpesres")
ipm2 <- eipm[ipm2]
colnames(ipm2)[1]<-"MUN"

baseipm_00.rur <- merge(ipm1,ipm2, by="MUN") 

baseipm_00.rur = baseipm_00.rur %>%
  dplyr::rename(
    carpond.00.rur = carpond,
    totpesres.00.rur = totpesres,
    totpescar.00.rur = totpescar,
    h.00.rur = h,
    a.00.rur = a,
    ipm.00.rur = ipm,
    csaude.00.rur = csaude,
    ceduca.00.rur = ceduca,
    ccv.00.rur = ccv,
    cnv.00.rur = cnv
  )

rm(agipm,al00dompesvo,al00domvo,al00pesvo,al00rur,al00urb,dat,eipm,ipm,ipm.,ipm1,ipm2)

#### Importando dados dos Microdados do Censo 2010
## utilizando a funcao read.fwf para ler o arquivo txt
al10domvo = rbind(
  read.fwf(file = "Amostra_Domicilios_11.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_12.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_13.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_14.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_15.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_16.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_17.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_21.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = "Amostra_Domicilios_51.txt",
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 6, 9, 1, 2, 3, 2, 3, 1, 1, 1,
                      2, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 1, 1, 7, 10, 8,
                      9, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1)))

### acrescentando nomes nas variaáveis
names(al10domvo) <- c("V0002", "V0011", "V0300", "V0010", "V1001", "V1002", "V1003", "V1004", 
                      "V1006", "V4001", "V4002", "V0201", "V2011", "V2012", "V0202", "V0203", 
                      "V6203", "V0204", "V6204", "V0205", "V0206", "V0207", "V0208", "V0209", 
                      "V0210", "V0211", "V0212", "V0213", "V0214", "V0215", "V0216", "V0217", 
                      "V0218", "V0219", "V0220", "V0221", "V0222", "V0301", "V0401", "V0402", 
                      "V0701", "V6529", "V6530", "V6531", "V6532", "V6600", "V6210", "M0201", 
                      "M2011", "M0202", "M0203", "M0204", "M0205", "M0206", "M0207", "M0208", 
                      "M0209", "M0210", "M0211", "M0212", "M0213", "M0214", "M0215", "M0216", 
                      "M0217", "M0218", "M0219", "M0220", "M0221", "M0222", "M0301", "M0401", 
                      "M0402", "M0701", "V1005")

#### Criar novas variaveis para inserir os decimais nas variáveis já existentes
### V0010	29	3	(13)
### V2012	65	4	(5)
### V6203	77	2	(1)
### V6204	82	2	(1)
### V6530	116	5	(5)
### V6531	126	6	(2)
### V6532	134	4	(5)

al10domvo <- mutate(al10domvo, V0010a = V0010/10000000000000,
                    V2012a = ifelse(is.na(V2012), NA, V2012/100000),
                    V6203a = ifelse(is.na(V6203), NA, V6203/10),
                    V6204a = ifelse(is.na(V6204), NA, V6204/10),
                    V6530a = ifelse(is.na(V6530), NA, V6530/100000),
                    V6531a = ifelse(is.na(V6531), NA, V6531/100),
                    V6532a = ifelse(is.na(V6532), NA, V6532/100000)
)

### Excluir variaveis desnecessárias
al10domvo <- al10domvo[, !colnames(al10domvo) %in%
                         c("V0010","V2012", "V6203", "V6204", "V6530", "V6531", "V6532")]

al10pesvo = rbind(
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_11.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_12.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_13.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_14.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_15.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_16.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_17.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_21.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)),
  read.fwf(file = file.path(path_Orig,"Amostra_Pessoas_51.txt"),
           widths = c(7, 13, 8, 16, 1, 2, 3, 2, 1, 2, 2, 1, 3, 3, 2, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 4, 1, 7, 7, 3, 3, 1, 7, 7, 7, 1, 7, 7, 7, 1, 1, 2, 2, 1, 1, 2, 1, 1,
                      1, 3, 3, 3, 1, 7, 7, 7, 1, 2, 1, 1, 1, 1, 1, 1, 1, 4, 5, 1, 1, 1, 1, 6,
                      6, 6, 1, 6, 9, 7, 9, 7, 9, 7, 10, 8, 9, 3, 1, 1, 1, 1, 1, 1, 6, 1, 7, 7,
                      7, 1, 1, 1, 2, 2, 2, 1, 2, 2, 2, 1, 3, 1, 1, 1, 2, 4, 1, 2, 2, 2, 2, 1,
                      2, 1, 1, 1, 1, 1, 3, 1, 2, 2, 2, 8, 9, 4, 5, 1, 1, 1, 1, 1, 1, 2,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
                      1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1)))

# acrescentando nomes nas variaveis
names(al10pesvo) <- c("V0002", "V0011", "V0300", "V0010", "V1001", "V1002", "V1003", "V1004", "V1006",
                      "V0502", "V0504", "V0601", "V6033", "V6036", "V6037", "V6040", "V0606", "V0613", "V0614",
                      "V0615", "V0616", "V0617", "V0618", "V0619", "V0620", "V0621", "v0622", "V6222", "V6224",
                      "V0623", "V0624", "V0625", "V6252", "V6254", "V6256", "V0626", "V6262", "V6264", "V6266",
                      "V0627", "V0628", "V0629", "V0630", "V0631", "V0632", "V0633", "V0634", "V0635", "V6400",
                      "V6352", "V6354", "V6356", "V0636", "V6362", "V6364", "V6366", "V0637", "V0638", "V0639",
                      "V0640", "V0641", "V0642", "V0643", "V0644", "V0645", "V6461", "V6471", "V0648", "V0649",
                      "V0650", "V0651", "V6511", "V6513", "V6514", "V0652", "V6521", "V6524", "V6525", "V6526",
                      "V6527", "V6528", "V6529", "V6530", "V6531", "V6532", "V0653", "V0654", "V0655", "V0656",
                      "V0657", "V0658", "V0659", "V6591", "V0660", "V6602", "V6604", "V6606", "V0661", "V0662",
                      "V0663", "V6631", "V6632", "V6633", "V0664", "V6641", "V6642", "V6643", "V0665", "V6660",
                      "V6664", "V0667", "V0668", "V6681", "V6682", "V0669", "V6691", "V6692", "V6693", "V6800",
                      "V0670", "V0671", "V6900", "V6910", "V6920", "V6930", "V6940", "V6121", "V0604", "V0605",
                      "V5020", "V5060", "V5070", "V5080", "V6462", "V6472", "V5110", "V5120", "V5030", "V5040",
                      "V5090", "V5100", "V5130", "M0502", "M0601", "M6033", "M0606", "M0613", "M0614", "M0615",
                      "M0616", "M0617", "M0618", "M0619", "M0620", "M0621", "M0622", "M6222", "M6224", "M0623",
                      "M0624", "M0625", "M6252", "M6254", "M6256", "M0626", "M6262", "M6264", "M6266", "M0627",
                      "M0628", "M0629", "M0630", "M0631", "M0632", "M0633", "M0634", "M0635", "M6352", "M6354",
                      "M6356", "M0636", "M6362", "M6364", "M6366", "M0637", "M0638", "M0639", "M0640", "M0641",
                      "M0642", "M0643", "M0644", "M0645", "M6461", "M6471", "M0648", "M0649", "M0650", "M0651",
                      "M6511", "M0652", "M6521", "M0653", "M0654", "M0655", "M0656", "M0657", "M0658", "M0659",
                      "M6591", "M0660", "M6602", "M6604", "M6606", "M0661", "M0662", "M0663", "M6631", "M6632",
                      "M6633", "M0664", "M6641", "M6642", "M6643", "M0665", "M6660", "M0667", "M0668", "M6681",
                      "M6682", "M0669", "M6691", "M6692", "M6693", "M0670", "M0671", "M6800", "M6121", "M0604",
                      "M0605", "M6462", "M6472", "V1005")


al10pesvo <- mutate(al10pesvo, V0010a = V0010/10000000000000,
                    V6514a = ifelse(is.na(V6514), NA, V6514/100),
                    V6524a = ifelse(is.na(V6524), NA, V6524/100000),
                    V6526a = ifelse(is.na(V6526), NA, V6526/100000),
                    V6528a = ifelse(is.na(V6528), NA, V6528/100000),
                    V6530a = ifelse(is.na(V6530), NA, V6530/100000),
                    V6531a = ifelse(is.na(V6531), NA, V6531/100),
                    V6532a = ifelse(is.na(V6532), NA, V6532/100000),
                    V5070a = ifelse(is.na(V5070), NA, V5070/100),
                    V5080a = ifelse(is.na(V5080), NA, V5080/100000)
)


### Excluir variaveis repetidas
al10pesvo <- al10pesvo[, !colnames(al10pesvo) %in% 
                         c("V6514","V6524","V6526", "V6528", "V6530", "V6531",
                           "V6532","V5070", "V5080","V0001.1")]
al10pesvo <- al10pesvo[, !colnames(al10pesvo) %in% 
                         c("V0001", "V0002", "V0011", "V0010", "V0010a", "V1001", "V1002", "V1003", "V1004",
                           "V1006", "V6529", "V6530a", "V6531a", "V6532a", "V1005")]

##### Juntar arquivos de pessoas e domicilios
al10dp <- as.data.frame(al10domvo %>%
                                full_join(al10pesvo,by = c("V0300")
                                ))

#Variável V0751 para a dimensão de saúde que está na base externa
al10mortvo = rbind(
  read.fwf(file = "Amostra_Mortalidade_11.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_12.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_13.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_14.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_15.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_16.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_17.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_21.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)),
  read.fwf(file = "Amostra_Mortalidade_51.txt",
           widths = c(2,5,2,2,8,1,2,3,2,1,2,1,3,2,16,13,1,1,1,1)))

### acrescentando nomes nas variaveis
names(al10mortvo) <- c("V0001", "V0002", "V0003", "V0004", "V0300","V1001", "V1002", "V1003", "V1004", 
                       "V1006", "V0703", "V0704", "V7051", "V7052", "V0010", 
                       "V0011", "M0703", "M0704", "M7051", "M7052")

al10mortvo$var17 = ifelse(al10mortvo$V7052 >= 1 & al10mortvo$V7052 <= 5, 1, 0)
al10mortvo$var17[which(is.na(al10mortvo$var17))] <- 0


al10mortvo$var18 = ifelse(al10mortvo$V7052 >= 6 & al10mortvo$V7052 <= 74, 1, 0)
al10mortvo$var18[which(is.na(al10mortvo$var18))] <- 0


mortvo <- c("V0300","var17","var18")
al10mortvo <- al10mortvo[mortvo]
attach(al10mortvo)
saude23 <- aggregate(al10mortvo, by=list(V0300), FUN=mean, na.rm=T)
saude23 <- saude23[mortvo]

al10dp <- as.data.frame(al10dp %>%
                          full_join(saude23,by = c("V0300")
                          )
)
#### Separar o Rural do Urbano
al10rur = subset(al10dp, V1006 == "2")
al10urb = subset(al10dp, V1006 == "1")



############################### Estimativa do IPM 2010 ==================================
# Criar variáveis e dimensões
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
al10dp$var1 <- ifelse(al10dp$V6633-al10dp$V6643 > 0, 1, 0)
al10dp$var1[which(is.na(al10dp$var1))] <- 0

al10dp$var17 <- ifelse(al10dp$var17 > 0, 1, 0)
al10dp$var17[which(is.na(al10dp$var17))] <- 0

al10dp$var18 <- ifelse(al10dp$var18 > 0, 1, 0)
al10dp$var18[which(is.na(al10dp$var18))] <- 0


al10dp$peso1 <- al10dp$var1*(1/4)/3
al10dp$peso17 <- al10dp$var17*(1/4)/3
al10dp$peso18 <- al10dp$var18*(1/4)/3

al10dp$dim1 <- al10dp$peso1+al10dp$peso17+al10dp$peso18


################ Dimensão Educação
################ Dimenssão Educação
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
al10dp$var2 <- ifelse((al10dp$V6400 == 1 & al10dp$V0502 > 1), 1, 0)
al10dp$var2[which(is.na(al10dp$var2))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
al10dp$var3 <- ifelse((al10dp$V0502 == 1) & (al10dp$V0627==2), 1, 0)
al10dp$var3[which(is.na(al10dp$var3))] <- 0

#### (V6036: idade calculada em anos e V0628: anos de estudo)
# Critério: Crianças que não frequentam a escola
al10dp$var4 <- ifelse((al10dp$V0628 >= 3 & al10dp$V0628 <= 4) &
                        (al10dp$V6036 >= 4 & al10dp$V6036 <= 14), 1, 0)
al10dp$var4[which(is.na(al10dp$var4))] <- 0

al10dp$peso2 <- al10dp$var3*(1/4)/3
al10dp$peso3 <- al10dp$var3*(1/4)/3
al10dp$peso4 <- al10dp$var4*(1/4)/3

al10dp$dim2 <- al10dp$peso2+al10dp$peso3+al10dp$peso4


################ Dimensão Condição de vida 
# Energia elética  (V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)

# Habitação provisória Coletiva (V4001) v5
al10dp$var5 <- ifelse((al10dp$V4001 >= 5 & 
                         al10dp$V0628 <= 6), 1, 0)
al10dp$var5[which(is.na(al10dp$var5))] <- 0

# Densidade Domiciliar (V6204)
al10dp$var6 <- ifelse((al10dp$V6204a > 5), 1, 0)
al10dp$var6[which(is.na(al10dp$var6))] <- 0

# Estrutura do Domicílio
al10dp$var7 <- ifelse((al10dp$V0202 >= 4 & al10dp$V0202 <=9), 1, 0)
al10dp$var7[which(is.na(al10dp$var7))] <- 0


#### Esgotamento sanitário (variável V0211 - tipo de esgotamento sanitário)
# critário: não tem esgotamento sanitário adequado (3 a 6)
al10dp$var8 <- ifelse((al10dp$V0207 >= 3 & al10dp$V0207 <=6), 1, 0)
al10dp$var8[which(is.na(al10dp$var8))] <- 0

#### Destino do lixo (variável destino do lixo)
al10dp$var9 <- ifelse((al10dp$V0210 >= 3 & al10dp$V0210 <=7), 1, 0)
al10dp$var9[which(is.na(al10dp$var9))] <- 0

#### Acesso a Eletrecidade
al10dp$var10 <- ifelse(al10dp$V0211 ==3, 1, 0)
al10dp$var10[which(is.na(al10dp$var10))] <- 0

#### Acesso à Água
al10dp$var11 <- ifelse((al10dp$V0208 >= 3 & al10dp$V0208 <= 8)|(al10dp$V0208 == 10)
                       |(al10dp$V0209 >= 2 & al10dp$V0209 <= 3) , 1, 0)
al10dp$var11[which(is.na(al10dp$var11))] <- 0

al10dp$peso5 <- al10dp$var5*(1/4)/7
al10dp$peso6 <- al10dp$var6*(1/4)/7
al10dp$peso7 <- al10dp$var7*(1/4)/7
al10dp$peso8 <- al10dp$var8*(1/4)/7
al10dp$peso9 <- al10dp$var9*(1/4)/7
al10dp$peso10 <- al10dp$var10*(1/4)/7
al10dp$peso11 <- al10dp$var11*(1/4)/7

al10dp$dim3 <- al10dp$peso5+al10dp$peso6+al10dp$peso7+al10dp$peso8+
  al10dp$peso9+al10dp$peso10+al10dp$peso11


#### Condição de Vida (Bens de consumo e Trabalho)
# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
al10dp$var12 <- ifelse((al10dp$V6525 ==0) & (al10dp$V0502 == 1) & (al10dp$V0657 ==1) |
                         (al10dp$V6525 ==0) & (al10dp$V0502 == 1) & (al10dp$V0658 ==1), 1, 0)
al10dp$var12[which(is.na(al10dp$var12))] <- 0


# Trabalho Remunerado (V4525: 0 | V0402=1)
al10dp$var13 <- ifelse((al10dp$V6525 ==0) & (al10dp$V0502 == 1), 1, 0)
al10dp$var13[which(is.na(al10dp$var13))] <- 0

# Geladeira (V0215: 2 )
al10dp$var14 <- ifelse((al10dp$V0216 ==2), 1, 0)
al10dp$var14[which(is.na(al10dp$var14))] <- 0


# MicroComputador, Televisores (V0220: 2 | V0221:0)
al10dp$var15 <- ifelse(al10dp$V0220 ==2 | al10dp$V0217 ==2, 1, 0)
al10dp$var15[which(is.na(al10dp$var15))] <- 0

# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
al10dp$var16 <- ifelse(al10dp$V0222 ==2 & al10dp$V0215 ==2, 1, 0)
al10dp$var16[which(is.na(al10dp$var16))] <- 0


al10dp$peso12 <- al10dp$var12*(1/4)/5
al10dp$peso13 <- al10dp$var13*(1/4)/5
al10dp$peso14 <- al10dp$var14*(1/4)/5
al10dp$peso15 <- al10dp$var15*(1/4)/5
al10dp$peso16 <- al10dp$var16*(1/4)/5


al10dp$dim4 <- al10dp$peso12+al10dp$peso13+al10dp$peso14+al10dp$peso15+
  al10dp$peso16

#_____________________________________________________
##### Geração da Carência Ponderada
#_____________________________________________________
al10dp$carpond <- al10dp$dim1+al10dp$dim2+al10dp$dim3+al10dp$dim4

al10dp$clasipm[al10dp$carpond <=0.25] <- 0
al10dp$clasipm[al10dp$carpond >0.25] <- 1


## Aux Taxa de Incidencia (H)
al10dp$totpesres <- al10dp$V0401                        # pode ser usado também o numpes (numpes no domicilio)
al10dp$totpescar <- al10dp$totpesres*al10dp$clasipm

## Aux Intensidade da Pobreza (A)
al10dp$totint <- al10dp$carpond*al10dp$totpesres*al10dp$clasipm

## Contribuições das dimensões
# Saúde
al10dp$tsaude <- al10dp$peso1*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso17*al10dp$totpesres*al10dp$clasipm+al10dp$peso18*al10dp$totpesres*al10dp$clasipm

# Educação
al10dp$teduca <- al10dp$peso2*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso3*al10dp$totpesres*al10dp$clasipm+al10dp$peso4*al10dp$totpesres*al10dp$clasipm


# Padrão Habitação
al10dp$tpcv <- al10dp$peso5*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso6*al10dp$totpesres*al10dp$clasipm+al10dp$peso7*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso8*al10dp$totpesres*al10dp$clasipm+al10dp$peso9*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso10*al10dp$totpesres*al10dp$clasipm+al10dp$peso11*al10dp$totpesres*al10dp$clasipm


# Padrão Renda
al10dp$tpnv <- al10dp$peso12*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso13*al10dp$totpesres*al10dp$clasipm+al10dp$peso14*al10dp$totpesres*al10dp$clasipm+
  al10dp$peso15*al10dp$totpesres*al10dp$clasipm+al10dp$peso16*al10dp$totpesres*al10dp$clasipm


# GERANDO A RENDA DOMICILIAR PERCAPITA
al10dp$rdpc <- al10dp$V6531


#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é mulher [V0601(2)]
al10dp$sexo <- ifelse((al10dp$V0502 == 1 & al10dp$V0601 == 2),1,0) 
al10dp$sexo[which(is.na(al10dp$sexo))] <- 0

#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é da cor preta [V0606(2)]
al10dp$cor <- ifelse((al10dp$V0502 == 1 & al10dp$V0606 == 2),1,0)
al10dp$cor[which(is.na(al10dp$cor))] <- 0

#Deixando apenas as variáveis que serão usadas no modelo
var <- c("V0001","V0002", "V0300","var1","var17","var18","peso1","dim1","var2","var3","var4","peso2","peso3","peso4","dim2","var5",
         "var6","var7","var8","var9","var10","var11","peso5","peso6","peso7","peso8","peso9","peso10","peso11","dim3",
         "var12","var13","var14","var15","var16","peso12","peso13","peso14","peso15","peso16","dim4","carpond","clasipm",
         "totpesres","totpescar","totint","tsaude","teduca","tpcv","tpnv","rdpc","sexo","cor")

base <- al10dp[var]

# Agregando por domicílios (V0300)
base$V0001 = as.numeric(base$V0001)
attach(base)

# se quizer mudar a agregação de municipio em by=list(V0002) para por exemplo estado mudar by=list(V0001)obs: confirmar se esse mesmo o codigo de estado
ipm. <- aggregate(base, by=list(V0002), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","V0002","carpond","dim1","dim2","dim3","dim4","clasipm")
ipm1 <- ipm.[ipm1]
colnames(ipm1)[1]<-"mun"


ipm. <- aggregate(base, by=list(V0002), FUN=sum, na.rm=T)       
ipm.$h <- ipm.$totpescar/ipm.$totpesres         # Taxa de incidência (H)
ipm.$a <- ipm.$totint/ipm.$totpescar            # Intensidade da pobreza (A)
ipm.$ipm <- ipm.$a*ipm.$h                       # IPM
ipm.$csaude <- ipm.$tsaude/ipm.$totpesres/ipm.$ipm
ipm.$ceduca <- ipm.$teduca/ipm.$totpesres/ipm.$ipm
ipm.$cpcv <- ipm.$tpcv/ipm.$totpesres/ipm.$ipm
ipm.$cpnv <- ipm.$tpnv/ipm.$totpesres/ipm.$ipm

ipm2 <- c("Group.1","totpesres","totpescar","h","a","ipm","csaude","ceduca","cpcv","cpnv")
ipm2 <- ipm.[ipm2]
colnames(ipm2)[1]<-"mun"

baseipm <- merge(ipm1,ipm2, by="mun")
baseipm[is.na(baseipm)]<-0
detach(base)


# Mergeando com a base
var <- names(base) %in% c("carpon","dim1","dim2","dim3","dim4","clasipm","totpesresd","totpescar","carpond","totpesres")
base <- base[!var]

attach(baseipm)
baseipm_10 <- baseipm[order(V0002),]

#Renomeando as variáveis
baseipm_10 = baseipm_10 %>%
  dplyr::rename(
    carpond.10 = carpond,
    totpesres.10 = totpesres,
    totpescar.10 = totpescar,
    h.10 = h,
    a.10 = a,
    ipm.10 = ipm,
    csaude.10 = csaude,
    ceduca.10 = ceduca,
    cpcv.10 = cpcv,
    cpnv.10 = cpnv
  )
var = c("mun","carpond.10", "clasipm", "totpesres.10","totpescar.10","h.10","a.10",
        "ipm.10","csaude.10","ceduca.10","cpcv.10","cpnv.10")
baseipm_10 = baseipm_10[var]
detach(baseipm)


#*************************************** IPM URBANO ======================================================
############################### Estimativa do IPM
# Criar variáveis e dimensões
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
al10urb$var1 <- ifelse(al10urb$V6633-al10urb$V6643 > 0, 1, 0)
al10urb$var1[which(is.na(al10urb$var1))] <- 0


al10urb$var17 <- ifelse(al10urb$var17 > 0, 1, 0)
al10urb$var17[which(is.na(al10urb$var17))] <- 0

al10urb$var18 <- ifelse(al10urb$var18 > 0, 1, 0)
al10urb$var18[which(is.na(al10urb$var18))] <- 0


al10urb$peso1 <- al10urb$var1*(1/4)/3
al10urb$peso17 <- al10urb$var17*(1/4)/3
al10urb$peso18 <- al10urb$var18*(1/4)/3

al10urb$dim1 <- al10urb$peso1+al10urb$peso17+al10urb$peso18


################ Dimensão Educação
################ Dimenssão Educação
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
al10urb$var2 <- ifelse((al10urb$V6400 == 1 & al10urb$V0502 > 1), 1, 0)
al10urb$var2[which(is.na(al10urb$var2))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
al10urb$var3 <- ifelse((al10urb$V0502 == 1) & (al10urb$V0627==2), 1, 0)
al10urb$var3[which(is.na(al10urb$var3))] <- 0

#### (V6036: idade calculada em anos e V0628: anos de estudo)
# Critério: Crianças que não frequentam a escola
al10urb$var4 <- ifelse((al10urb$V0628 >= 3 & al10urb$V0628 <= 4) &
                         (al10urb$V6036 >= 4 & al10urb$V6036 <= 14), 1, 0)
al10urb$var4[which(is.na(al10urb$var4))] <- 0

al10urb$peso2 <- al10urb$var3*(1/4)/3
al10urb$peso3 <- al10urb$var3*(1/4)/3
al10urb$peso4 <- al10urb$var4*(1/4)/3

al10urb$dim2 <- al10urb$peso2+al10urb$peso3+al10urb$peso4


################ Dimensão Condição de vida 
# Energia elética  (V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)

# Habitação provisória Coletiva (V4001) v5
al10urb$var5 <- ifelse((al10urb$V4001 >= 5 & 
                          al10urb$V0628 <= 6), 1, 0)
al10urb$var5[which(is.na(al10urb$var5))] <- 0

# Densidade Domiciliar (V6204)
al10urb$var6 <- ifelse((al10urb$V6204a > 5), 1, 0)
al10urb$var6[which(is.na(al10urb$var6))] <- 0

# Estrutura do Domicílio
al10urb$var7 <- ifelse((al10urb$V0202 >= 4 & al10urb$V0202 <=9), 1, 0)
al10urb$var7[which(is.na(al10urb$var7))] <- 0


#### Esgotamento sanitário (variável V0211 - tipo de esgotamento sanitário)
# critário: não tem esgotamento sanitário adequado (3 a 6)
al10urb$var8 <- ifelse((al10urb$V0207 >= 3 & al10urb$V0207 <=6), 1, 0)
al10urb$var8[which(is.na(al10urb$var8))] <- 0

#### Destino do lixo (variável destino do lixo)
al10urb$var9 <- ifelse((al10urb$V0210 >= 3 & al10urb$V0210 <=7), 1, 0)
al10urb$var9[which(is.na(al10urb$var9))] <- 0

#### Acesso a Eletrecidade
al10urb$var10 <- ifelse(al10urb$V0211 ==3, 1, 0)
al10urb$var10[which(is.na(al10urb$var10))] <- 0

#### Acesso à Água
al10urb$var11 <- ifelse((al10urb$V0208 >= 3 & al10urb$V0208 <= 8)|(al10urb$V0208 == 10)
                        |(al10urb$V0209 >= 2 & al10urb$V0209 <= 3) , 1, 0)
al10urb$var11[which(is.na(al10urb$var11))] <- 0

al10urb$peso5 <- al10urb$var5*(1/4)/7
al10urb$peso6 <- al10urb$var6*(1/4)/7
al10urb$peso7 <- al10urb$var7*(1/4)/7
al10urb$peso8 <- al10urb$var8*(1/4)/7
al10urb$peso9 <- al10urb$var9*(1/4)/7
al10urb$peso10 <- al10urb$var10*(1/4)/7
al10urb$peso11 <- al10urb$var11*(1/4)/7

al10urb$dim3 <- al10urb$peso5+al10urb$peso6+al10urb$peso7+al10urb$peso8+
  al10urb$peso9+al10urb$peso10+al10urb$peso11


#### Condição de Vida (Bens de consumo e Trabalho)
# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
al10urb$var12 <- ifelse((al10urb$V6525 ==0)& (al10urb$V0502 == 1) & (al10urb$V0657 ==1) |
                          (al10urb$V6525 ==0)& (al10urb$V0502 == 1) & (al10urb$V0658 ==1), 1, 0)
al10urb$var12[which(is.na(al10urb$var12))] <- 0


# Trabalho Remunerado (V4525: 0 | V0402=1)
al10urb$var13 <- ifelse((al10urb$V6525 ==0) & (al10urb$V0502 == 1), 1, 0)
al10urb$var13[which(is.na(al10urb$var13))] <- 0

# Geladeira (V0215: 2 )
al10urb$var14 <- ifelse((al10urb$V0216 ==2), 1, 0)
al10urb$var14[which(is.na(al10urb$var14))] <- 0


# MicroComputador, Televisores (V0220: 2 | V0221:0)
al10urb$var15 <- ifelse(al10urb$V0220 ==2 | al10urb$V0217 ==2, 1, 0)
al10urb$var15[which(is.na(al10urb$var15))] <- 0

# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
al10urb$var16 <- ifelse(al10urb$V0222 ==2 & al10urb$V0215 ==2, 1, 0)
al10urb$var16[which(is.na(al10urb$var16))] <- 0


al10urb$peso12 <- al10urb$var12*(1/4)/5
al10urb$peso13 <- al10urb$var13*(1/4)/5
al10urb$peso14 <- al10urb$var14*(1/4)/5
al10urb$peso15 <- al10urb$var15*(1/4)/5
al10urb$peso16 <- al10urb$var16*(1/4)/5


al10urb$dim4 <- al10urb$peso12+al10urb$peso13+al10urb$peso14+al10urb$peso15+
  al10urb$peso16

#_____________________________________________________
##### Geração da Carência Ponderada
#_____________________________________________________
al10urb$carpond <- al10urb$dim1+al10urb$dim2+al10urb$dim3+al10urb$dim4

al10urb$clasipm[al10urb$carpond <=0.25] <- 0
al10urb$clasipm[al10urb$carpond >0.25] <- 1


## Aux Taxa de Incidencia (H)
al10urb$totpesres <- al10urb$V0401                        # pode ser usado também o numpes (numpes no domicilio)
al10urb$totpescar <- al10urb$totpesres*al10urb$clasipm

## Aux Intensidade da Pobreza (A)
al10urb$totint <- al10urb$carpond*al10urb$totpesres*al10urb$clasipm

## Contribuições das dimensões
# Saúde
al10urb$tsaude <- al10urb$peso1*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso17*al10urb$totpesres*al10urb$clasipm+al10urb$peso18*al10urb$totpesres*al10urb$clasipm

# Educação
al10urb$teduca <- al10urb$peso2*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso3*al10urb$totpesres*al10urb$clasipm+al10urb$peso4*al10urb$totpesres*al10urb$clasipm


# Padrão Habitação
al10urb$tpcv <- al10urb$peso5*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso6*al10urb$totpesres*al10urb$clasipm+al10urb$peso7*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso8*al10urb$totpesres*al10urb$clasipm+al10urb$peso9*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso10*al10urb$totpesres*al10urb$clasipm+al10urb$peso11*al10urb$totpesres*al10urb$clasipm


# Padrão Renda
al10urb$tpnv <- al10urb$peso12*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso13*al10urb$totpesres*al10urb$clasipm+al10urb$peso14*al10urb$totpesres*al10urb$clasipm+
  al10urb$peso15*al10urb$totpesres*al10urb$clasipm+al10urb$peso16*al10urb$totpesres*al10urb$clasipm


# GERANDO A RENDA DOMICILIAR PERCAPITA
al10urb$rdpc <- al10urb$V6531


#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é mulher [V0601(2)]
al10urb$sexo <- ifelse((al10urb$V0502 == 1 & al10urb$V0601 == 2),1,0) 
al10urb$sexo[which(is.na(al10urb$sexo))] <- 0

#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é da cor preta [V0606(2)]
al10urb$cor <- ifelse((al10urb$V0502 == 1 & al10urb$V0606 == 2),1,0)
al10urb$cor[which(is.na(al10urb$cor))] <- 0

#Deixando apenas as variáveis que serão usadas no modelo
var <- c("V0001","V0002", "V0300","var1","var17","var18","peso1","dim1","var2","var3","var4","peso2","peso3","peso4","dim2","var5",
         "var6","var7","var8","var9","var10","var11","peso5","peso6","peso7","peso8","peso9","peso10","peso11","dim3",
         "var12","var13","var14","var15","var16","peso12","peso13","peso14","peso15","peso16","dim4","carpond","clasipm",
         "totpesres","totpescar","totint","tsaude","teduca","tpcv","tpnv","rdpc","sexo","cor")

base <- al10urb[var]

# Agregando por domicílios (V0300)
base$V0001 = as.numeric(base$V0001)
attach(base)

# se quizer mudar a agregação de municipio em by=list(V0002) para por exemplo estado mudar by=list(V0001)obs: confirmar se esse mesmo o codigo de estado
ipm. <- aggregate(base, by=list(V0002), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","V0002","carpond","dim1","dim2","dim3","dim4","clasipm")
ipm1 <- ipm.[ipm1]
colnames(ipm1)[1]<-"mun"


ipm. <- aggregate(base, by=list(V0002), FUN=sum, na.rm=T)       
ipm.$h <- ipm.$totpescar/ipm.$totpesres         # Taxa de incidência (H)
ipm.$a <- ipm.$totint/ipm.$totpescar            # Intensidade da pobreza (A)
ipm.$ipm <- ipm.$a*ipm.$h                       # IPM
ipm.$csaude <- ipm.$tsaude/ipm.$totpesres/ipm.$ipm
ipm.$ceduca <- ipm.$teduca/ipm.$totpesres/ipm.$ipm
ipm.$cpcv <- ipm.$tpcv/ipm.$totpesres/ipm.$ipm
ipm.$cpnv <- ipm.$tpnv/ipm.$totpesres/ipm.$ipm

ipm2 <- c("Group.1","totpesres","totpescar","h","a","ipm","csaude","ceduca","cpcv","cpnv")
ipm2 <- ipm.[ipm2]
colnames(ipm2)[1]<-"mun"

baseipm <- merge(ipm1,ipm2, by="mun")
baseipm[is.na(baseipm)]<-0
detach(base)


# Mergeando com a base
var <- names(base) %in% c("carpon","dim1","dim2","dim3","dim4","clasipm","totpesresd","totpescar","carpond","totpesres")
base <- base[!var]

attach(baseipm)
baseipm_10.urb <- baseipm[order(V0002),]

#Renomeando as variáveis
baseipm_10.urb = baseipm_10.urb %>%
  dplyr::rename(
    carpond.10.urb = carpond,
    totpesres.10.urb = totpesres,
    totpescar.10.urb = totpescar,
    h.10.urb = h,
    a.10.urb = a,
    ipm.10.urb = ipm,
    csaude.10.urb = csaude,
    ceduca.10.urb = ceduca,
    cpcv.10.urb = cpcv,
    cpnv.10.urb = cpnv
  )
var = c("mun","carpond.10.urb", "clasipm", "totpesres.10.urb","totpescar.10.urb","h.10.urb","a.10.urb",
        "ipm.10.urb","csaude.10.urb","ceduca.10.urb","cpcv.10.urb","cpnv.10.urb")
baseipm_10.urb = baseipm_10.urb[var]

detach(baseipm)

#*************************************** IPM RURAL 2010 ======================================================
############################### Estimativa do IPM
# Criar variáveis e dimensões
################ Dimensão Saúde
#### Total de Filhos Nascidos Vivos (V4620) - Total de Filhos Nascidos Vivos que estavam vivos (V0463) > 0
# Critério: V4620-V0463 >0
al10rur$var1 <- ifelse(al10rur$V6633-al10rur$V6643 > 0, 1, 0)
al10rur$var1[which(is.na(al10rur$var1))] <- 0

al10rur$var17 <- ifelse(al10rur$var17 > 0, 1, 0)
al10rur$var17[which(is.na(al10rur$var17))] <- 0

al10rur$var18 <- ifelse(al10rur$var18 > 0, 1, 0)
al10rur$var18[which(is.na(al10rur$var18))] <- 0


al10rur$peso1 <- al10rur$var1*(1/4)/3
al10rur$peso17 <- al10rur$var17*(1/4)/3
al10rur$peso18 <- al10rur$var18*(1/4)/3

al10rur$dim1 <- al10rur$peso1+al10rur$peso17+al10rur$peso18

################ Dimensão Educação
################ Dimenssão Educação
#### Ensino Fund. Incompleto (V0432: Curso mais elevado; V0434: Concluiu o curso?)
# Critério: Crianças de 4 a 14 anos de idade que não frequentam escola
al10rur$var2 <- ifelse((al10rur$V6400 == 1 & al10rur$V0502 > 1), 1, 0)
al10rur$var2[which(is.na(al10rur$var2))] <- 0

#### Analfabetos (V4572: idade calculada em anos e V4300: anos de estudo)
# Critério: Responsável não sabe ler nem escrever
al10rur$var3 <- ifelse((al10rur$V0502 == 1) & (al10rur$V0627==2), 1, 0)
al10rur$var3[which(is.na(al10rur$var3))] <- 0

#### (V6036: idade calculada em anos e V0628: anos de estudo)
# Critério: Crianças que não frequentam a escola
al10rur$var4 <- ifelse((al10rur$V0628 >= 3 & al10rur$V0628 <= 4) &
                         (al10rur$V6036 >= 4 & al10rur$V6036 <= 14), 1, 0)
al10rur$var4[which(is.na(al10rur$var4))] <- 0

al10rur$peso2 <- al10rur$var3*(1/4)/3
al10rur$peso3 <- al10rur$var3*(1/4)/3
al10rur$peso4 <- al10rur$var4*(1/4)/3

al10rur$dim2 <- al10rur$peso2+al10rur$peso3+al10rur$peso4


################ Dimensão Condição de vida 
# Energia elética  (V0213: energia elétrica - 1 Sim, 2 Não)
# Destino do lixo  (V0212: destino do lixo - 1 e 2 Coletado, 3 - 7 Não coletado)
# Esgotamento sanitário  (V0211: tipo de esgotamento sanitário - 1 e 2 Rede/F.Séptica, 3 - 6 Outros)
# Acesso à água (V0207 e V0208)
# Densidade Domiciliar (V7204a)
# Habitação provisória Coletiva (V0201)

# Habitação provisória Coletiva (V4001) v5
al10rur$var5 <- ifelse((al10rur$V4001 >= 5 & 
                          al10rur$V0628 <= 6), 1, 0)
al10rur$var5[which(is.na(al10rur$var5))] <- 0

# Densidade Domiciliar (V6204)
al10rur$var6 <- ifelse((al10rur$V6204a > 5), 1, 0)
al10rur$var6[which(is.na(al10rur$var6))] <- 0

# Estrutura do Domicílio
al10rur$var7 <- ifelse((al10rur$V0202 >= 4 & al10rur$V0202 <=9), 1, 0)
al10rur$var7[which(is.na(al10rur$var7))] <- 0


#### Esgotamento sanitário (variável V0211 - tipo de esgotamento sanitário)
# critário: não tem esgotamento sanitário adequado (3 a 6)
al10rur$var8 <- ifelse((al10rur$V0207 >= 3 & al10rur$V0207 <=6), 1, 0)
al10rur$var8[which(is.na(al10rur$var8))] <- 0

#### Destino do lixo (variável destino do lixo)
al10rur$var9 <- ifelse((al10rur$V0210 >= 3 & al10rur$V0210 <=7), 1, 0)
al10rur$var9[which(is.na(al10rur$var9))] <- 0

#### Acesso a Eletrecidade
al10rur$var10 <- ifelse(al10rur$V0211 ==3, 1, 0)
al10rur$var10[which(is.na(al10rur$var10))] <- 0

#### Acesso à Água
al10rur$var11 <- ifelse((al10rur$V0208 >= 3 & al10rur$V0208 <= 8)|(al10rur$V0208 == 10)
                        |(al10rur$V0209 >= 2 & al10rur$V0209 <= 3) , 1, 0)
al10rur$var11[which(is.na(al10rur$var11))] <- 0

# Terreno Cedido
al10rur$var19 <- ifelse((al10rur$V0201 >= 4 & al10rur$V0201 <=6), 1, 0)
al10rur$var19[which(is.na(al10rur$var19))] <- 0

al10rur$peso5 <- al10rur$var5*(1/4)/8
al10rur$peso6 <- al10rur$var6*(1/4)/8
al10rur$peso7 <- al10rur$var7*(1/4)/8
al10rur$peso8 <- al10rur$var8*(1/4)/8
al10rur$peso9 <- al10rur$var9*(1/4)/8
al10rur$peso10 <- al10rur$var10*(1/4)/8
al10rur$peso11 <- al10rur$var11*(1/4)/8
al10rur$peso19 <- al10rur$var19*(1/4)/8

al10rur$dim3 <- al10rur$peso5+al10rur$peso6+al10rur$peso7+al10rur$peso8+
  al10rur$peso9+al10rur$peso10+al10rur$peso11+al10rur$peso19


#### Condição de Vida (Bens de consumo e Trabalho)
# Programas Sociais (V4525: 0/ v4593: 0/ V4603: > 0/  V4613: 0/ v4573: 0 | V0402=1)
al10rur$var12 <- ifelse((al10rur$V0657 ==0) & (al10rur$V0502 == 1) |  
                          (al10rur$V0502 == 1) & (al10rur$V0658 ==0), 1, 0)
al10rur$var12[which(is.na(al10rur$var12))] <- 0


# Trabalho Remunerado (V4525: 0 | V0402=1)
al10rur$var13 <- ifelse((al10rur$V6525 ==0) & (al10rur$V0502 == 1), 1, 0)
al10rur$var13[which(is.na(al10rur$var13))] <- 0

# Geladeira (V0215: 2 )
al10rur$var14 <- ifelse((al10rur$V0216 ==2), 1, 0)
al10rur$var14[which(is.na(al10rur$var14))] <- 0


# MicroComputador, Televisores (V0220: 2 | V0221:0)
al10rur$var15 <- ifelse(al10rur$V0220 ==2 | al10rur$V0217 ==2, 1, 0)
al10rur$var15[which(is.na(al10rur$var15))] <- 0

# Automóvel, Máquina de Lavar e Telefone (V0222: 0 | V0217:2 | V0219:2)
al10rur$var16 <- ifelse(al10rur$V0221 ==2 | al10rur$V0222 ==2, 1, 0)
al10rur$var16[which(is.na(al10rur$var16))] <- 0


al10rur$peso12 <- al10rur$var12*(1/4)/5
al10rur$peso13 <- al10rur$var13*(1/4)/5
al10rur$peso14 <- al10rur$var14*(1/4)/5
al10rur$peso15 <- al10rur$var15*(1/4)/5
al10rur$peso16 <- al10rur$var16*(1/4)/5


al10rur$dim4 <- al10rur$peso12+al10rur$peso13+al10rur$peso14+al10rur$peso15+
  al10rur$peso16

#_____________________________________________________
##### Geração da Carência Ponderada
#_____________________________________________________
al10rur$carpond <- al10rur$dim1+al10rur$dim2+al10rur$dim3+al10rur$dim4

al10rur$clasipm[al10rur$carpond <=0.25] <- 0
al10rur$clasipm[al10rur$carpond >0.25] <- 1


## Aux Taxa de Incidencia (H)
al10rur$totpesres <- al10rur$V0401                        # pode ser usado também o numpes (numpes no domicilio)
al10rur$totpescar <- al10rur$totpesres*al10rur$clasipm

## Aux Intensidade da Pobreza (A)
al10rur$totint <- al10rur$carpond*al10rur$totpesres*al10rur$clasipm

## Contribuições das dimensões
# Saúde
al10rur$tsaude <- al10rur$peso1*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso17*al10rur$totpesres*al10rur$clasipm+al10rur$peso18*al10rur$totpesres*al10rur$clasipm

# Educação
al10rur$teduca <- al10rur$peso2*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso3*al10rur$totpesres*al10rur$clasipm+al10rur$peso4*al10rur$totpesres*al10rur$clasipm


# Padrão Habitação
al10rur$tpcv <- al10rur$peso5*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso6*al10rur$totpesres*al10rur$clasipm+al10rur$peso7*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso8*al10rur$totpesres*al10rur$clasipm+al10rur$peso9*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso10*al10rur$totpesres*al10rur$clasipm+al10rur$peso11*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso19*al10rur$totpesres*al10rur$clasipm+al10rur$peso19*al10rur$totpesres*al10rur$clasipm


# Padrão Renda
al10rur$tpnv <- al10rur$peso12*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso13*al10rur$totpesres*al10rur$clasipm+al10rur$peso14*al10rur$totpesres*al10rur$clasipm+
  al10rur$peso15*al10rur$totpesres*al10rur$clasipm+al10rur$peso16*al10rur$totpesres*al10rur$clasipm




# GERANDO A RENDA DOMICILIAR PERCAPITA
al10rur$rdpc <- al10rur$V6531


#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é mulher [V0601(2)]
al10rur$sexo <- ifelse((al10rur$V0502 == 1 & al10rur$V0601 == 2),1,0) 
al10rur$sexo[which(is.na(al10rur$sexo))] <- 0

#Dummie indicadora se o responsável pelo domicílio [V0502(1)]  é da cor preta [V0606(2)]
al10rur$cor <- ifelse((al10rur$V0502 == 1 & al10rur$V0606 == 2),1,0)
al10rur$cor[which(is.na(al10rur$cor))] <- 0

#Deixando apenas as variáveis que serão usadas no modelo
var <- c("V0001","V0002", "V0300","var1","var17","var18","peso1","dim1","var2","var3","var4","peso2","peso3","peso4","dim2","var5",
         "var6","var7","var8","var9","var10","var11","var19","peso5","peso6","peso7","peso8","peso9","peso10","peso11","peso19","dim3",
         "var12","var13","var14","var15","var16","peso12","peso13","peso14","peso15","peso16","dim4","carpond","clasipm",
         "totpesres","totpescar","totint","tsaude","teduca","tpcv","tpnv","rdpc","sexo","cor")

base <- al10rur[var]

# Agregando por domicílios (V0300)
base$V0001 = as.numeric(base$V0001)
attach(base)

# se quizer mudar a agregação de municipio em by=list(V0002) para por exemplo estado mudar by=list(V0001)obs: confirmar se esse mesmo o codigo de estado
ipm. <- aggregate(base, by=list(V0002), FUN=mean, na.rm=T)
ipm1 <- c("Group.1","V0002","carpond","dim1","dim2","dim3","dim4","clasipm")
ipm1 <- ipm.[ipm1]
colnames(ipm1)[1]<-"mun"


ipm. <- aggregate(base, by=list(V0002), FUN=sum, na.rm=T)       
ipm.$h <- ipm.$totpescar/ipm.$totpesres         # Taxa de incidência (H)
ipm.$a <- ipm.$totint/ipm.$totpescar            # Intensidade da pobreza (A)
ipm.$ipm <- ipm.$a*ipm.$h                       # IPM
ipm.$csaude <- ipm.$tsaude/ipm.$totpesres/ipm.$ipm
ipm.$ceduca <- ipm.$teduca/ipm.$totpesres/ipm.$ipm
ipm.$cpcv <- ipm.$tpcv/ipm.$totpesres/ipm.$ipm
ipm.$cpnv <- ipm.$tpnv/ipm.$totpesres/ipm.$ipm

ipm2 <- c("Group.1","totpesres","totpescar","h","a","ipm","csaude","ceduca","cpcv","cpnv")
ipm2 <- ipm.[ipm2]
colnames(ipm2)[1]<-"mun"

baseipm <- merge(ipm1,ipm2, by="mun")
baseipm[is.na(baseipm)]<-0
detach(base)


# Mergeando com a base
var <- names(base) %in% c("carpon","dim1","dim2","dim3","dim4","clasipm","totpesresd","totpescar","carpond","totpesres")
base <- base[!var]

attach(baseipm)
baseipm_10.rur <- baseipm[order(V0002),]

#Renomeando as variáveis
baseipm_10.rur = baseipm_10.rur %>%
  dplyr::rename(
    carpond.10.rur = carpond,
    totpesres.10.rur = totpesres,
    totpescar.10.rur = totpescar,
    h.10.rur = h,
    a.10.rur = a,
    ipm.10.rur = ipm,
    csaude.10.rur = csaude,
    ceduca.10.rur = ceduca,
    cpcv.10.rur = cpcv,
    cpnv.10.rur = cpnv
  )
var = c("mun","carpond.10.rur", "clasipm", "totpesres.10.rur","totpescar.10.rur","h.10.rur","a.10.rur",
        "ipm.10.rur","csaude.10.rur","ceduca.10.rur","cpcv.10.rur","cpnv.10.rur")
baseipm_10.rur = baseipm_10.rur[var]
detach(baseipm)
rm(saude23,ipm.,ipm1,ipm2, al10dp,al10mortvo,al10rur,al10urb,base,baseipm)

#+++++++++++++++++ FIM DA ROTINA ======================================================