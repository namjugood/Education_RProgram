bar_df = data.frame(obs=1:10,
                    var = rep( c("A","B","C"), length.out=10),
                    value = sample(1:100, size=10),
                    stringsAsFactors = FALSE)
bar_df
library("ggplot2")

# point 그래프
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10)

# 비어있는 point
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10, shape=1)

# 세모 모양의 포인트
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10, shape=2)

# 데이터마다 포인트의 모양을 변경
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value, shape=var)) +
  geom_point(size=10) +
  scale_shape_manual(values=c("A"=7,
                              "B"=8,
                              "C"=9))

ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value, shape=var)) +
  geom_point(size=10) +
  scale_shape_manual(values=c("A"=7,
                              "B"="가",
                              "C"=9))
# 7, 8, 9 중 하나를 문자로 변경 시 모두 문자로 표시됨

# 차트 제목 및 축 제목 등의 텍스트 설정
# 축 제목 및 축 눈금값들의 조정
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  theme(axis.title = element_text(size=20,
                                  face="bold",
                                  angle=45))

ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  theme(axis.text.x = element_text(size=20,
                                  face="italic",
                                  angle=45),
        axis.text.y = element_text(size=20,
                                  face="bold",
                                  angle=180),
        axis.title = element_text(size=20,
                                  face="bold"))

# 차트제목과 축의 내용(label)과 서식 조정
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  labs(x="x축 제목",
       y="y축 제목",
       title="차트의 제목") +
  theme(axis.title = element_text(size=20),
        plot.title = element_text(size=35,
                                  hjust=0.5))
# hjust=0.5 : 수평위치 가운데

# 차트제목과 축의 내용을 표시하는 또 다른 방식
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  scale_x_continuous(name="x축 제목") +
  scale_y_continuous(name="y축 제목") +
  ggtitle("Title Graph") +
  theme(axis.title = element_text(size=20), # 축 제목
        plot.title = element_text(size=35, hjust=0.5)) # 표 제목

# 차트 제목과 내용의 서식지정하는 또 다른 방법
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  scale_x_continuous(name="x축 제목") +
  scale_y_continuous(name="y축 제목") +
  ggtitle("Title Graph") +
  theme(plot.title = element_text(size=35,
                                  hjust=0.5),
        axis.title.x = element_text(size=20,
                                  hjust=0.1),
        axis.title.y = element_text(size=20,
                                    hjust=0.1))

# x or y 축 제목을 생략
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  scale_x_continuous(name="x축 제목") +
  scale_y_continuous(name="y축 제목") +
  ggtitle("Title Graph") +
  theme(plot.title = element_text(size=35,
                                  hjust=0.5),
        axis.title.x = element_blank(),
        axis.title.y = element_text(size=20))

# 부제목
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  labs(x="x축 제목",
       y="y축 제목",
       title="차트의 제목",
       subtitle="여기는 부제목") +
  theme(axis.title = element_text(size=20),
        plot.title = element_text(size=35,
                                  hjust=0.5),
        plot.subtitle = element_text(size=15,
                                  hjust=0.1))

# annotate함수(그래프 내부에 텍스트(label)를 넣는 방법 )
ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  annotate(geom="text",
           label = "annotate 사용",
           size=10,
           x=5,
           y=80)

ggplot(data=bar_df, aes(x=obs, y=value,
                        color=value)) +
  geom_point(size=10) +
  annotate(geom="rect",
           fill="#FFA500",
           xmin=5, xmax=7,
           ymin=20, ymax=30)
