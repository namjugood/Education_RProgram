aa = read.delim("AWS_sample.txt", sep="#", stringsAsFactors = FALSE)
aaa = aa[1:3, 2:4]
bbb = aa[9:11, 2:4]

aaa
bbb

# 행 단위의 병합 - 병합하고자 하는 데이터를 제한없이 붙여 병합
rbind(aaa, bbb)
rbind(aaa, bbb, aaa, bbb, aaa, bbb)
# 행 단위의 병합은 병합할 데이터들의 열 개수가 일치해야 가능

# 열 단위의 병합
cbind(aaa, bbb)
cbind(aaa, bbb, aaa)
# 열 단위의 병합은 병합할 데이터들의 행 개수가 일치해야 가능합니다

# 행 또는 열 개수가 맞지 않으면 rbind든 cbind든 모두 에러입니다
aaa = aa[1:5, 2:4]
bbb = aa[9:11, 2:4]
# cbind(aaa, bbb)에러
aaa = aa[1:3, 1:5]
bbb = aa[9:11, 2:4]
# rbind(aaa, bbb)에러

# 테이블 함수
# 파이썬의 values_count와 같은 역할
table(aa$AWS_ID)  # 값의 종류와 개수 표시
table(aa$AWS_ID, aa$X.) # 행에는 AWS_DI 값들이 제목으로,
# 열에는 X값들이 열의 제목으로 표시되면서 크로싱된 개수 표시

aa[2500:3100, "X."] = "+"
table(aa$AWS_ID, aa$X.)

# 테이블이 표시하는 값을 비율값으로 변환
prop.table(table(aa$AWS_ID))
prop.table(table(aa$AWS_ID, aa$X.))

# 100을 곱한 백분율을 값으로 표시
prop.table(table(aa$AWS_ID, aa$X.))*100

# 반올림
round(prop.table(table(aa$AWS_ID, aa$X.))*100, 1)

# "%"기호를 붙여서 표시(문자열 함수는 다음 단원에서 자세히 학습)
paste0(round(prop.table(table(aa$AWS_ID, aa$X.))*100, 1), "%")
