bar_df = data.frame(obs=1:10,
                    var_1 = rep( c("A","B","C"), 10),
                    value = sample(1:100, size=10),
                    stringsAsFactors = FALSE)
# var_1 = rep( c("A","B","C"), 10) : ABC를 총 10회씩 반복
bar_df
library("ggplot2")

# 평범한 막대 그래프
ggplot(data=bar_df, aes(x=obs, y=value))+geom_bar(stat="identity")

# 막대그래프 색상 적용 1
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) + geom_bar(stat="identity")
# 그래스 내부에 선색만 적용

# 막대그래프 색상적용 2
ggplot(data=bar_df, aes(x=obs, y=value,
                        fill=value)) + geom_bar(stat="identity")
# 그래프에 색 적용

# 막대그래프 색상적용 3
# as.factor : 각자의 값 표시를 뜻함
ggplot(data=bar_df, aes(x=obs, y=value,
                        fill=as.factor(value))) + geom_bar(stat="identity")

# 막대그래프 색상적용 4
ggplot(data=bar_df, aes(x=as.factor(obs), y=value,
                        fill=as.factor(value))) + geom_bar(stat="identity")

# 막대그래프 position
# 같은 값 3개의 누적 내용
ggplot(data=bar_df, aes(x=as.factor(obs), y=value,
                        fill=as.factor(value))) + geom_bar(stat="identity",
                                                           position="stack")
# 중복내용 제외된 각각의 내용
ggplot(data=bar_df, aes(x=as.factor(obs), y=value,
                        fill=as.factor(value))) + geom_bar(stat="identity",
                                                           position="dodge")
# 각각 3개의 그래프가 펼쳐진 내용
ggplot(data=bar_df, aes(x=var_1, y=value,
                        fill=as.factor(value))) + geom_bar(stat="identity",
                                                           position="dodge")

bar_df = data.frame(obs=1:10,
                    var = rep( c("A","B","C"), length.out=10),
                    value = sample(1:100, size=10),
                    stringsAsFactors = FALSE)
# length.out=10 : 총 10회 안에서 반복
bar_df

# barplot의 또 다른 예(geom_bar->geom_col)
ggplot(data=bar_df, aes(x=obs, y=value)) + geom_col()
ggplot(data=bar_df, aes(x=obs, y=value, fill=value)) + geom_col()
ggplot(data=bar_df, aes(x=obs, y=value, fill=as.factor(value)))+geom_col(size=3)

# 추가옵션 : 축 눈금값들의 사이즈 조정
ggplot(data=bar_df, aes(x=obs, y=value, fill=as.factor(value))) + 
  geom_col(size=5) + 
  theme(axis.text = element_text(size=15))

ggplot(data=bar_df, aes(x=var, y=value, fill=as.factor(value))) + 
  geom_col(size=5, position="dodge") + 
  theme(axis.text = element_text(size=15))

# 그래프의 색상설정 1
color_df = data.frame(obs=1:10,
                      var = rep( c("A","B","C"), length.out=10),
                      value = sample(1:100, size=10),
                      stringsAsFactors = FALSE)
color_df

# 컬럼 이름이 아닌 색상이름을 지정하면 아래와 같이 지정되지 않은 색이 표시됩니다
# blue를 텍스트 혹은 데이터로 인식하므로 파란색이 표시되지 않음
ggplot(data=color_df, aes(x=var, y=value, fill="blue")) + 
  geom_bar(stat="identity", position="stack")

# aes밖에 색상 설정 시, 색이 전혀 적용되지 않음
ggplot(data=color_df, aes(x=var, y=value), fill="blue") + 
  geom_bar(stat="identity", position="stack")

# geom_bar 안에 지정해야 적용됨
ggplot(data=color_df, aes(x=var, y=value)) + 
  geom_bar(stat="identity", position="stack", fill="blue")

# alpha를 이용한 투명도 지정
ggplot(data=color_df, aes(x=var, y=value)) + 
  geom_bar(stat="identity", position="stack", fill="blue", alpha=0.3)

# 그래프의 색상설정 2
# geom_line에서 size는 굵기 표시
ggplot(data=color_df, aes(x=obs, y=value, color=value)) + 
  geom_line(size=3)

ggplot(data=color_df, aes(x=obs, y=value)) + 
  geom_line(size=3, color='blue')

# var값으로 그룹을 설정 & 그룹에 색깔 설정
# 회색 톤의 색 설정
ggplot(data=color_df, aes(x=as.factor(obs), y=value, group=var, color=var)) + 
  geom_line(size=3) +
  scale_color_grey(start=0.2, end=0.8)

# R프로그램이 제공하는 팔레트 번호로 설정
ggplot(data=color_df, aes(x=obs, y=value, group=var, color=var)) + 
  geom_line(size=3) +
  scale_color_brewer(palette=15) # 1~18번까지 사용가능

# 사용자가 직접 설정한 색을 적용
ggplot(data=color_df, aes(x=obs, y=value, group=var, color=var)) + 
  geom_line(size=3) +
  scale_color_manual(values=c("A"="red",
                              "B"="blue",
                              "C"="green"))
