# 1. marathon_2015_2017.csv 파일을 읽어와서 변수에 저장
marathon = read.delim("marathon_2015_2017.csv", sep=",", 
                      stringsAsFactors=FALSE)
# 2. 나이별 참가자의 인원수를 bar차트로 그립니다
library("ggplot2")
colnames(marathon)
ggplot(data=marathon, aes(Age, group=M.F, fill=M.F)) + 
  geom_bar(position="dodge")+
# 3. 차트의 제목을 "연령별 참석 인원"으로 설정합니다
# 4. 성별로 그룹을 설정하여 두 개의 막대그래프가 인접되어 나오도록 설정합니다.
# 5. X축 제목을 연령, y축 제목을 참여인원으로 설정합니다
  labs(x="연령",
       y="참여인원",
       title="연령별 참석인원") +
# 6. X축의 표현범위(limits)를 18~80세로 설정합니다. 구간간격 및 표현값은 10세
#    단위로 지정합니다. y축도 조정하되 적절한 설정값을 입력하여 지정합니다
  scale_x_continuous(limits=c(18,80),
                     breaks = seq(18,80,10), labels = seq(18,80,10) ) +
  scale_y_continuous(limits=c(0,2000),
                     breaks = seq(0,2000,200), labels = seq(0,2000,200))+
# 7. 차트 제목의 크기, 축제목과 눈금값의 크기 등을 적당한 값으로 설정합니다.
  theme(axis.title = element_text(size=15),
        plot.title = element_text(size=20, face="bold", hjust=0.5),
        axis.text = element_text(size=15),
# 8. 범례는 그래프 하단에 적절한 텍스트 크기로 조정하여 설정합니다.
# 9. 범례의 제목은 '성별'로 설정하고 크기조정합니다
        legend.title=element_text(size=15),
        legend.text =element_text(size=15),
        legend.position="bottom")
