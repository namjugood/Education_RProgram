# 숫자 벡터 생성
number = c(1:100)
number

# sample함수 : 대상 데이터들 중 지정된 개수만큼 랜덤하게 선택하는 함수
set.seed(50)
number = sample(number, 15)
number

# order 함수는 대상 데이터들을 정렬하고 그 인덱스 값으로 결과를 표시
k= order(number) # 오름차순 정렬
# number[1] number[2] number[3] ... 
number[ k ]
number[order(number)]

order(number, decreasing=TRUE)  # 내림차순
number[order(-number)] # 오름차순

# 일반적인 정렬
sort(number)
sort(number, decreasing=TRUE)

# 기술통계량
# 최소값/최대값/평균값
min(number)
max(number)
mean(number)

# 중앙값(Median)
# 주어진 데이터들 중 위치상(인덱스)으로 가운데 위치한 값(값 기준)
# 2,4,5,6,7의 중앙값은 5
# 2,4,6,8 의 중앙값은 4와 6의 평균값 5.5
median(number)

number = sample(number, 10)
number = sort(number)
number
median(number) # 짝수개(10개) 데이터의 중앙값

# unique : 중복된 데이터값을 없앤 순수한 데이터만 리턴
a = c(1,1,1,2,3,4,4,4,4,4)
b = unique(a)
b # 1,2,3,4

c = match(a, b) # a 벡터데이터에서 b값과 매칭되는 값들을 찾음(인덱스)
c # 

p = tabulate(c) # 등장 횟수 카운트
p

# 최빈값
which.max(p) # 앞선 결과에서 개수가 가장 많은 값 출력
# 위에서 얻어낸 값으로 unique 결과에 인덱싱
b[ which.max(p)]

mode = function(x){
  ux = unique(x)
  ux[ which.max( tabulate(match(x, ux)) )]
}
mode( c(1,1,2,3,4,55,5,5,5,5))

# 분산과 표준편차
var(number)
sd(number)
# 편차 : 각 값들과 평균값들과의 차
# 편차 제곱 : 편차를 제곱한 값들
# 편차 제곱합 / 데이터 개수 : 분산
# 표준편차 : 분산의 

# 결측치가 포함되어있는 값의 평균 계산
mean( c(1,2,3, NA, 23) )  # 결과 NA

# 결측치를 삭제 후 평균을 계산하는 파라미터 추가
mean( c(1:3, NA, 23), na.rm = TRUE)
mean( c(1:3, NA, 23), na.rm = T)

# 문자가 포함된 값들의 평균 계산
mean( c(1:3, "사과", 23) ) # 평균 계산 불가능
mean( c(1:3, "사과", 23), na.rm = T) # 평균 계산 불가능
# 문자가 포함된 값들의 평균을 계산할 수 없습니다

# 데이터 내에서 결측치(NA)를 다른값으로 대체
a = c(2, 3, NA, 5, NA, 7)
is.na(a)
a[is.na(a)] = median(a, na.rm=TRUE)
a
mean(a)
