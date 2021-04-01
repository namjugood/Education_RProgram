# 반복문
for(num in 1:5){
  print(num) 
}
# R프로그램의 print명령은 한 번에 하나씩 출력만 가능하여
# print함수를 쓰는 것과 안쓰는 것의 차이가 거의 없습니다.

for(num in c(1,3,5,7,9)){
  print(num)
}

for(num in c(5,4,3,2,1)){
  print(num)
}

for(ch in letters[1:5]){
  print(ch)
}

df = data.frame(aa=letters[1:4], bb=1:4)
df
# new라는 컬럼을 새로 생성하고 각 행번호의 제곱값을 입력
for(num in 1:4){
  df[num, "new"] = num^2
}
df

# df의 행번호까지(nrow)
for(num in 1:nrow(df)){
  df[num, "new2"] = num^2
}
df


if(n==4){
  print("asdfdfg")
}

if(n==4){
  print("n은 4입니다")
}else{
  print("n은 4가 아닙니다")
}  

if(n>0){
  print("양수입니다")
}else if(n<0){
  print("음수입니다")
}else{
  print("0입니다")
}

# 데이터프레임 내부에서의 조건에 의한 필터링
df = data.frame(aa = letters[1:10], bb=1:10)
df

# 필터링 bb컬럼의 값이 5보다 큰 행들의 필터링
df[ df$bb >= 5, ]
# 필터링 aa컬럼의 값이 "b"와 같은 행들의 필터링
df[ df$aa == "b", ]
# bb가 3보다 크고, 8보다 작은 행들의 필터링
df[ df$bb >= 3 & df$bb <= 8, ]
