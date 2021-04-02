# 1. marathon_2015_2017.csv 파일을 읽어와서 변수에 저장
marathon = read.delim("marathon_2015_2017.csv", sep=",", 
                      stringsAsFactors=FALSE)
library("ggplot2")
colnames(marathon)
# 2. 나이에서 십의자리만 남기고 일의자리를 절사하여 연령대 필드명:Age_10을
# 만들고 절사한 값을 저장합니다.
marathon[,"Age_10"]=marathon[,"Age"]%/%10 * 10
# marathon[,"Age_10"]=ceiling(marathon[,"Age"]/10)*10 - 무조건 올림
# marathon[,"Age_10"]=floor(marathon[,"Age"]/10) * 10
colnames(marathon)
# 3. Age_10을 기준으로 한 bar차트를 그립니다
ggplot(data=marathon, aes(Age_10, group=M.F, fill=M.F))+
  geom_bar(position="dodge")+
# 4. 차트제목 : 연령대별 참석인원, 축제목은 y축만 인원으로 합니다
# 5. 성별로 그룹화하고, 빨간색과 파란색으로 차트 색을 설정
  labs(title="연령대별 참석인원",
       y="인원", fill="성별",
       x=element_blank()) +
  theme(plot.title = element_text(size=20, face="bold", hjust=0.5),
        axis.title = element_text(face="bold"),
        legend.title=element_text(size=15),
        legend.text =element_text(size=15),
        legend.position="right")+
  scale_x_continuous(limits=c(10,80),
                     breaks = seq(10,80,10), labels = seq(10,80,10) ) +
  scale_y_continuous(limits=c(0,14000),
                     breaks = seq(0,14000,1000), labels = seq(0,14000,1000))+
  scale_color_manual(values = c("M"="blue", "F"="red"), aesthetics="fill") +
  # scale_fill_manual(values = c("M"="blue", "F"="red"))
# 6. 가장 인원이 많은 연령대의 bar위에 "최대 참여 연령"이라고 annotate를
# 이용하여 텍스트를 표시합니다
  annotate(geom="text", label = "최대 참여 연령",
           size=5, x=40, y=14000)

# 7. 나머지 설정은 이전 차트의 내용을 따르거나 임의조정합니다
# (x축 눈금 표시, y축 눈금표시, 각 제목들의 글자크기, 범례설정 등)