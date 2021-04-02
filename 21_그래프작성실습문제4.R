# 1. marathon_2015_2017.csv 파일을 읽어와서 변수에 저장
marathon = read.delim("marathon_2015_2017.csv", sep=",", 
                      stringsAsFactors=FALSE)
library("ggplot2")
colnames(marathon)
# 2. 체크타임 기준 현재 위치 위도와 경도 값을 얻어냅니다
# 리스트 데이터 생성 및 이용
# 함수사용 권장, check_time = 7200
point = list(x5k=c(42.24, -71.47), x10k=c(42.27, -71.42), x15k=c(42.28, -71.36), 
             x20k=c(42.29, -71.28), x25k=c(42.32, -71.25), x30k=c(42.34, -71.21),
             x35k=c(42.35, -71.12), x40k=c(42.35, -71.08) )

Lat=0
Long=0
cul_Lat=function(x){
  if(x$X40K < 7200){    Lat = point$x40k[1]
  }else if(x$X35K < 7200){    Lat = point$x35k[1]
  }else if(x$X30K < 7200){    Lat = point$x30k[1]
  }else if(x$X25K < 7200){    Lat = point$x25k[1]
  }else if(x$X20K < 7200){    Lat = point$x20k[1]
  }else if(x$X15K < 7200){    Lat = point$x15k[1]
  }else if(x$X10K < 7200){    Lat = point$x10k[1]
  }else if(x$X5K < 7200){    Lat = point$x5k[1]
  }
  return(Lat)
}  

cul_Long=function(x){
  if(x$X40K < 7200){    Long = point$x40K[2]
  }else if(x$X35K < 7200){    Long = point$x35k[2]
  }else if(x$X30K < 7200){    Long = point$x30k[2]
  }else if(x$X25K < 7200){    Long = point$x25k[2]
  }else if(x$X20K < 7200){    Long = point$x20k[2]
  }else if(x$X15K < 7200){    Long = point$x15k[2]
  }else if(x$X10K < 7200){    Long = point$x10k[2]
  }else if(x$X5K < 7200){    Long = point$x5k[2]
  }
  return(Long)
}  

# 참가자 한 명당 기록상 7200초를 넘기는 지점의 위도와 경도를 새로운 컬럼으로
# 저장합니다
# marathon[, "Lat"] marathon[, "Long"]
for(i in 1:nrow(marathon)){
  marathon[i,"Lat"]=cul_Lat(marathon[i,])
  marathon[i,"Long"]=cul_Long(marathon[i,])
}

tail(marathon, 3)


# 3. 위도 경도별 인원수를 계산합니다

# marathon 데이터에서 Lat+Long(세트표시) 컬럼을 기준으로
# Official.Time 컬럼의 length(길이, 개수)를 계산합니다
# 파이썬의 groupby와 유사한 함수
marathon_agg = aggregate(Official.Time ~ Lat+Long, marathon, length)
marathon_agg

marathonL = marathon[, c("Lat","Long")]
k=table(marathonL)
k

p=data.frame(Lat=c(42.27, 42.28, 42.29, 42.32, 42.34, 42.35, 42.35),
             Long=c(-71.42, -71.36, -71.28, -71.25, -71.12, -71.12, -71.08),
             cnt=c(135,12161,40653,23870,2579,164,76),
             stringsAsFactors = FALSE)
head(p,3)

ggplot(data=p, aes(x=Lat, y=Long, color=cnt))+
  geom_point(size=sqrt(p$cnt)/8, alpha=0.5) +
  annotate(geom="text", label=p$cnt, size=5, x=p$Lat, y=p$Long)+
  labs(title="2시간 경과 후 구간 인원 수",
       color="인원 수")+
  theme(axis.title = element_text(size=15),
        plot.title = element_text(size=35, hjust=0.5),
        axis.text = element_text(size=15),
        legend.title = element_text(size=15),
        legend.text = element_text(size=15))
