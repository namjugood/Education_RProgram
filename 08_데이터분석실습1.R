# 1. marathon_results_2017.csv 파일을 읽어서 marathon_2017 변수에 저장
marathon_2017 = read.csv("./R_Script/marathon_results_2017.csv", 
                         stringsAsFactors = FALSE)
# 2. 행 개수와 열 개수를 파악하고 구조를 출력해봅니다
# (nrow, ncol, dim, summury, colnames)
nrow(marathon_2017)
ncol(marathon_2017)
dim(marathon_2017)
summary(marathon_2017)
colnames(marathon_2017)
# 3. Bib, X, X.1, Citizen, Porj.Time 열을 제외한 나머지 열들만 필터링해서
# marathon_2017_clean 변수에 저장합니다
marathon_2017_clean = marathon_2017[,c(3:8,11:20,22:25)]
ncol(marathon_2017_clean)
# 4. 모든 값이 '2017'로 저장되는 Year 열을 추가합니다
marathon_2017_clean[,"Year"]='2017'
#--------------------------------------------------------------------------
# 5. 최종 기록(Official Time)을 초단위로 모두 변환하여 저장합니다
marathon_split= cSplit(marathon_2017_clean, splitCols="Official.Time", sep=":")
marathon_2017_clean[,"Final_Second"]=
  marathon_split[,"Official.Time_1"] * 3600 + # 시 변환
  marathon_split[,"Official.Time_2"] * 60   + # 분 변환
  marathon_split[,"Official.Time_3"]

# 5-1 데이터 형태 변환해서 계산
k = as.data.frame(marathon_split)
marathon_2017_clean[ ,"Final_Second2"] = 
  as.integer(k[,"Official.Time_1"]) * 3600 + # 시 변환
  as.integer(k[,"Official.Time_2"]) * 60   + # 분 변환
  as.integer(k[,"Official.Time_3"])


head(marathon_split, 3)
# 6. 나이가 60세 이상의 참가자에 TRUE값이 들어가고, 아닌 참가자에 FALSE값이
# 들어가는 Senior 열을 추가합니다.
marathon_2017_clean[ , "Senior"] = marathon_2017_clean[ ,"Age"]>=60
head(marathon_2017_clean, 3)
