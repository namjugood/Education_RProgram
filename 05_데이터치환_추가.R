aa = read.delim("AWS_sample.txt", sep="#", stringsAsFactors = FALSE)

# 1행의 모든 값을 1로 치환
aa[1, ] = 1
aa[1, ]
# 1, 3, 6 행의 모든 값을 9999로 치환
aa[c(1,3,6),] = 9999
aa[3, ]
# 인덱싱 연산을 사용한 컬럼 삽입
aa[,6] = "안녕"  # 컬럼개수보다 큰 인덱싱은 새로 컬럼 생성
aa[,ncol(aa)+1]="hi" # 컬럼개수+1로 컬럼 생성
aa[,"good"]="morning"  # 없는 컬럼이 지목되면 새로 컬럼을 생성
head(aa)

# 기존의 컬럼에 컬럼명을 추가하거나 치환
colnames(aa)[6] = "col_6"
colnames(aa)[7] = "col_7"
colnames(aa)[7:8] = c("col_7_1","col_8")
head(aa, 1)