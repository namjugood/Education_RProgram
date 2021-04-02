# for문은 구현이나 코딩은 이해하기 쉽지만, apply 또는 ifelse 보다 비교적
# 속도가 느립니다.
# apply와 ifelse가 코드도 간결하고 빠른 연산이 가능합니다

# ifelse : if문의 간결한 형태이며, 문법도 유사합니다
df = data.frame(aa=1:5, bb=letters[1:5])
df
df[,"new"] = ifelse(test=df$aa != 1, yes="yes", no="no")
df
colnames(df)[3]="new1"
df
df[,"new2"] = ifelse(df$aa != 3, "yes", "no")
df

for(n in 1:nrow(df)){
  if(df[n,"aa"]==5){
    df[n, "new3"]="yes"
  }else{
    df[n, "new3"] = "no"
  }
}
df


# 다른 조건 추가 시
# df[,"new2"] = ifelse(df$aa != 3, "yes", ifelse( 조건 )  )

# 파일을 읽어와서 앞선 예제에서 계산한 경도와 위도값을 ifelse로 계산합니다
marathon = read.delim("marathon_2015_2017.csv", sep=",", 
                      stringsAsFactors=FALSE)
library("ggplot2")
colnames(marathon)
# 2. 체크타임 기준 현재 위치 위도와 경도 값을 얻어냅니다
# 리스트 데이터 생성 및 이용
# 함수사용 권장, check_time = 7200

Lat=0
Long=0
marathon[,"Lat"]=ifelse(marathon$X40K<7200, 42.35, 
                 ifelse(marathon$X35K<7200, 42.35, 
                 ifelse(marathon$X30K<7200, 42.34, 
                 ifelse(marathon$X25K<7200, 42.32,
                 ifelse(marathon$X20K<7200, 42.29,
                 ifelse(marathon$X15K<7200, 42.28,
                 ifelse(marathon$X10K<7200, 42.27, 42.24
                  )))))))

marathon[,"Long"]=ifelse(marathon$X40K<7200, -71.08,
                  ifelse(marathon$X35K<7200, -71.12,
                  ifelse(marathon$X30K<7200, -71.21,
                  ifelse(marathon$X25K<7200, -71.25,
                  ifelse(marathon$X20K<7200, -71.28,
                  ifelse(marathon$X15K<7200, -71.36,
                  ifelse(marathon$X10K<7200, -71.42, -71.47
                  )))))))
tail(marathon, 3)

# 반복문 대체 apply()
data(iris)
df=iris[1:10, 1:4]
df
apply(X=df, MARGIN = 2, FUN = "sum") # 각 컬럼들의 합계
apply(X=df, MARGIN = 1, FUN = "sum") # 각 행들의 합계

# MARGIN값 2를 설정한 결과와 동일
sapply(df, "sum")
sapply(df, "class") # class : 자료형

data("CO2")
head(CO2)
df = CO2[, 4:5]
df[, "sum"] = apply(X=df, MARGIN=1, FUN="sum")
df[, "mean"] = apply(X=df, MARGIN=1, FUN="mean")
head(df)
