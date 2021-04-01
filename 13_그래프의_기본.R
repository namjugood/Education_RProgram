aa=read.delim("AWS_sample.txt", sep="#", stringsAsFactors = FALSE)
head(aa)
plot(aa$TA)


plot(1:10, 1:10)
plot(1:10, 1:10, col="red")
plot(1:10, 1:10, col="red", type='b')

# 유용한 사이트
# ggplot의 매뉴얼로 사용할 사이트
# https://ggplot2.tidyverse.org/reference

# R스튜디오와 차트에 대한 노하우를 모아놓은 사이트
# https://rstudio.com/resources/cheatsheets

# 색상에 관한 조합 및 코드 제공 사이트
# https://color.adobe.com
# #00FF00 각 두 자리씩 16진수로 표시된 색
# 첫 번째 두자리 : R(빨간색)
# 두 번째 두자리 : G(녹색)
# 세 번째 두자리 : B(파란색)

# #FF0000 : 빨간색
# #0000FF : 파란색
# #FF00FF : 보라색

install.packages("ggplot2")
library("ggplot2")

data_point = data.frame(xx=1:10, yy=sample(1:10, 10))
# sample(1:10, 10) - 1:10의 랜덤숫자 10개 생성
data_point

# 작성스타일 -1
ggplot(data=data_point, aes(x=xx, y=yy))+geom_point()
# 대상데이터 : data_point
# x축 : xx컬럼    /    y축 : yy컬럼
# geom_point() : point chart 제작

# 작성스타일 -2
ggplot(data=data_point, aes(xx,yy))+geom_point()
# 포맷이 같은 데이터를 각기 다른 차트로 만들 때 ggplot에 데이터 입력

# 작성스타일 -3
ggplot() + geom_point(data=data_point, aes(x=xx, y=yy))
# 각각의 차트를 각각의 데이터로 만들 때 geom_~~에 입력

# 작성스타일 -4
ggplot() + geom_point(data=data_point, aes(xx,yy))

# 스타일 1
#ggplot( data = OBJECT,
#        aes(x=col1, y=col2))+
#        geom_그래프형() + option
# OBJECT : 그래프를 그릴 객체(데이터프레임)
# x=col1 , y=col2 : x축, y축에 사용할 열 이름
# geom_그래프형() : 그래프 종류
# option : 추가 옵션
# geom_그래프형()는 그리고 싶은 그래프의 종류별 함수를 사용

# 선형(라인) 그래프
gplot( data=data_point, aes(x=xx, y=yy))+geom_line()

# 스타일 2
# ggplot() + geom_그래프형(data=OBJECT, aes(x=col1, y=col2)) + a
ggplot() + geom_line(data=data_point, aes(x=xx, y=yy))

# 막대그래프
data_bar = data.frame(xx=1:10, yy=sample(1:3, 10, replace=T))
# sample(1:3, 10, replace=T)
# sample 함수로 랜덤하게 모집단 내에서 선택을 할 때, 데이터 중복을 허용
# replace=T가 없거나 FALSE면 두 번째 요소 10(size)이 모집단인 첫 번째
# 데이터의 개수보다 작거나 같아야 합니다
data_bar
ggplot(data=data_bar, aes(x=yy)) + geom_bar()
# 각 1,2,3에 대한 y의 개수가 나옴
ggplot(data=data_bar, aes(x=xx, y=yy))+geom_bar(stat="identity")
# y의 값이 개수로 나타남
