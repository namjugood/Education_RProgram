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
median(number)
sort
