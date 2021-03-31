sample = data.frame(aa=c("abc_adfsfd", "abc_asdfasdf", "ccd"),
                    bb=1:3, stringsAsFactors = FALSE)
sample

# 문자의 개수 count
sample[1,1]
nchar(sample[1,1])
nchar(sample[2,1])

# 한 열의 모든 데이터를 제공하고 특정 문자열의 위치를 확인
# 특정문자 위치 확인
which( sample[,1]=="ccd")

# 대소문자 변환
toupper(sample[1,1])  # 모두 대문자로
tolower(sample[2,1])  # 모두 소문자로

# 필요한 패키지 설치
install.packages("splitstackshape")
# 파이썬의 import와 같은 역할의 함수
library("splitstackshape")

# 데이터 프레임 대상 문자열의 분리
# sep 기준으로 aa컬럼의 문자열들을 분리
cSplit(sample, splitCols = "aa", sep="_")
# 원본은 보존되고 csplit 결과를 별도의 변수에 저장할 수 있습니다
result = cSplit(sample, splitCols = "aa", sep="_")
result
sample

# 문자열 이어붙이기
paste(sample[,1], sample[,2]) # 중간에 공백을 삽입하여 붙임
paste0(sample[,1], sample[,2]) # 공백없이 붙임
# 중간글자를 공백이 아닌 다른 글자로 지정
paste(sample[,1], sample[,2], sample[,1], sep="@@@")

# 문자열의 일부 추출 subbstr
substr(sample[,1], start=1, stop=2)
substr(sample[,1], start=1, stop=4)

# 자료형들 간의 자료형 변환
as.logical("123")
as.logical("")
as.logical(123.12)
as.logical(0)
as.numeric("123")
as.character(23.45)
as.character(23)
as.integer(123.123)
as.numeric("123")
as.character(23.45)
