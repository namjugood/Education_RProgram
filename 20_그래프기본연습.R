# 사용자 정의 함수
# 사용자 정의 함수를 모아서 포장하는 절차를 거치면 그것이 패키지가 될 수
# 있습니다.
# apply() 관련 함수와 같이 사용하면 소요시간이 다소 단축 가능합니다.

# 함수의 생성
# 1. 전달인수가 없는 함수
aaa = function(){
  print("함수 aaa 실행")
}
# 함수의 호출
aaa()

# 2. 전달인수가 있는 함수
bbb = function(x){
  print("함수 bbb 실행")
  print(x)
}
bbb(10)
# x : 전달인수를 받아서 사용할 변수의 이름
# 변수의 이름은 임의 변경 가능합니다
# 함수의 사용(호출)시 반드시 변수에 저장할 전달값이 있어야 합니다.

# 3. 함수의 전달값의 기본값
ddd = function(x=5){
  print(x * 4)
}
ddd()

# 4. 리턴값이 있는 함수
# 함수에서 연산 결과는 함수 내부에서만 사용할 수 있는 경우가 대부분이므로
# (지역변수에 저장한 경우) 함수 외부에서 사용하려면 리턴값으로 전달 후 
# 사용합니다.
# 다만 R프로그램에서는 지역변수를 구분없이 사용이 가능하기도 합니다.
eee=function(x){
  y <<- x * x
  return(y)
}
k = eee(25)
print(k)
print(y)
