aa = read.delim("AWS_sample.txt", sep="#", stringsAsFactors = FALSE)
head(aa, 3)

# 데이터 단순 파일 출력 -> 인덱스번호 출력됨
write.csv(aa, "aws_test_1.csv")
# 행번호(인덱스) 생략 저장
write.csv(aa, "aws_test_2.csv", row.names = FALSE)

# 데이터 저장 시 row.names T일때
write.csv(aa, "aws_test_3.csv", row.names = T)
aa=read.delim("aws_test_3.csv", sep="#", stringsAsFactors = TRUE)
head(aa, 3)