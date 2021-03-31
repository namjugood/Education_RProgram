# R프로그램에서 사용자 정의함수 제작 방법
# 함수이름 = funcion(x){
#   함수 내용
# }
# x는 매개변수(벡터, 값, 데이터프레임 등이 전달될 수 있음)
# 별도의 리턴 명령은 없고, 함수의 마지막 명령 실행결과가
# 함수이름으로 전달되어 그 값이 곧 리턴값이 됩니다

# 시:분:초 형식의 기록이 있는 데이터프레임에서
# 데이터 프레임 이름과 시:분:초 형식의 데이터필드명을 전달인수로 받아 
# 초로 환산한 시간을 리턴하는 함수
toSec = function(df, col){
  df_split = cSplit(df, splitCols = col, sep=":")
  df_split = as.data.frame(df_split)
  as.integer(df_split[,paste0(col,"_1")]) *3600 +
    as.integer(df_split[,paste0(col,"_2")]) *60 +
    as.integer(df_split[,paste0(col,"_3")])
}
# marathon_2017_clean[ ,"x5k"] = toSec(marathon_2017_clean, "x5k")

# 1. marathon_results_2015.csv / marathon_results_2016.csv /
# marathon_results_2017.csv 세 파일을 읽어옵니다
marathon_results_2015=read.csv("marathon_results_2015.csv")
marathon_results_2016=read.csv("marathon_results_2016.csv")
marathon_results_2017=read.csv("marathon_results_2017.csv")

# 2. 각 데이터프레임에서 각 참가년도를 저장하는 Year열을 생성하세요
marathon_results_2015[,"Year"]="2015"
marathon_results_2016[,"Year"]="2016"
marathon_results_2017[,"Year"]="2017"

# 3. 세 개의 파일을 하나의 변수에 합칩니다(변수명 : marathon_2015_2017)
marathon_2015_2017 = rbind(marathon_results_2015, marathon_results_2017)
marathon_2015_2017 = marathon_2015_2017[,-c(1,10)]
marathon_results_2016 = marathon_results_2016[,-c(9)]
marathon_2015_2017 = rbind(marathon_2015_2017, marathon_results_2016)

colnames(marathon_results_2015)
colnames(marathon_results_2016)
colnames(marathon_results_2017)
colnames(marathon_2015_2017)

# 4. 유효하지 않은 열을 삭제합니다
marathon_2015_2017_clean = marathon_2015_2017[,-c(1,6,8,19,23)]
colnames(marathon_2015_2017_clean)

# 5. 각 기록을 초 단위로 변경합니다
marathon_2015_2017_clean[ ,"X5K"] = toSec(marathon_2015_2017_clean, "X5K")
marathon_2015_2017_clean[ ,"X10K"] = toSec(marathon_2015_2017_clean, "X10K")
marathon_2015_2017_clean[ ,"X15K"] = toSec(marathon_2015_2017_clean, "X15K")
marathon_2015_2017_clean[ ,"X20K"] = toSec(marathon_2015_2017_clean, "X20K")
marathon_2015_2017_clean[ ,"Half"] = toSec(marathon_2015_2017_clean, "Half")
marathon_2015_2017_clean[ ,"X25K"] = toSec(marathon_2015_2017_clean, "X25K")
marathon_2015_2017_clean[ ,"X30K"] = toSec(marathon_2015_2017_clean, "X30K")
marathon_2015_2017_clean[ ,"X35K"] = toSec(marathon_2015_2017_clean, "X35K")
marathon_2015_2017_clean[ ,"X40K"] = toSec(marathon_2015_2017_clean, "X40K")
marathon_2015_2017_clean[ ,"Pace"] = toSec(marathon_2015_2017_clean, "Pace")
marathon_2015_2017_clean[ ,"Official.Time"] = 
                        toSec(marathon_2015_2017_clean, "Official.Time")

# 6. 현재 데이터프레임을 파일로 저장합니다
# write.csv(데이터프레임이름, '파일명', row.names=FALSE)
write.csv(marathon_2015_2017_clean, 'marathon_2015_2017.csv', row.names=FALSE)
