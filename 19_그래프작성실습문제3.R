# 1. marathon_2015_2017.csv 파일을 읽어와서 변수에 저장
marathon = read.delim("marathon_2015_2017.csv", sep=",", 
                      stringsAsFactors=FALSE)
library("ggplot2")
colnames(marathon)
# 2. 최종기록을 연령에 따라 point로 표시합니다
#    필요한 설정사항이 있다면 적절히 설정합니다
ggplot(data=marathon, aes(x=Age, y=Official.Time, group=M.F, color=M.F))+
  geom_point(size=2, alpha=0.2) + 
  labs(title="연령별 최종기록 분포",x="연령", y="최종기록", 
       fill="성별", color="Gender")+
  scale_color_manual(values=c("M"="blue", "F"="red"))+
  scale_x_continuous(limits=c(18,85),
                     breaks = seq(18,85,5), labels = seq(18,85,5) ) +
  scale_y_continuous(limits=c(0,40000),
                     breaks = seq(0,40000,2000), labels = seq(0,40000,2000))+
  theme(plot.title = element_text(size=20, face="bold", hjust=0.5),
        axis.title = element_text(face="bold"),
        legend.title=element_text(size=15),
        legend.text =element_text(size=15),
        legend.position="right")
# 3. 남자 참가자와 여자 참가자를 빨간색과 파란색으로 구분합니다
# 4. 겹쳐서 보이지 않는 포인트가 없도록 투명도를 조정합니다
# 5. 차트의 제목 축 및 범례의 조정은 임의조정합니다