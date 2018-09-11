# hlf-1.2.0

## Hyperledger Network 개발 환경 구성
```
cd ~ #홈디렉토리로 이동
mkdir github
git checkout https://github.com/simon0210/hlf-1.2.0.git

```



---

## basic-network 예제와 marbles 연동하기(1)

**2018-09-04 16:00**

<br>

### 개요

IBM-Blockchain에서 Marbles 예제를 제공한다. 이 예제에서는 owner의 자산(marble) 추가, 이동 그리고 블록의 생성을 시각화하여 보여준다. 실습은 다음의 순서로 진행할 것이다.

1. Fabric-sample의 basic-network를 띄우고,
2. Marbles를 연결하여
3. Event(Block Listener, Event Client)를 확인한다.

이번 실습에서는 basic-network와 marbles를 연동해볼 것이다.

<br>

### fabric-sample

#### fabric-sample 다운로드

```
git clone https://github.com/hyperledger/fabric-samples.git
```

 <br>

#### bootstrap.sh 파일 수정 및 실행

vim에 줄 넘버 표시

```
:set number
```

160번대 라인을 보면, `DOCKER`, `SAMPLES`, `BINARIES`에 관한 flag가 설정되어 있다. `DOCKER=TRUE`는 docker image를, `SAMPLES=TRUE`는 fabric-sample을, `BINARIES=TRUE`는 바이너리 파일을 다운로드하겠다는 의미이다. 이미 우리는 위의 과정을 통해 `SAMPLES`와 `BINARIES`을 다운로드했기 때문에 flag를 `FALSE`로 설정하고 진행할 것이다.

수정 후 docker image를 다운로드해 보자.

```shell
 ./bootstrap.sh
```

<br>

#### 네트워크 시작

`fabric-samples/fabcar` 경로에 있는 `startFabric.sh` 파일로 네트워크를 시작한다.

```
./startFabric.sh
```

<br>

#### node module 설치

`fabric-samples/fabcar` 경로에서 다음의 명령으로 node module을 설치한다.

```
npm install
```

<br>

#### Admin 등록

```
node enrollAdmin.js
```

<br>

#### user 등록

```
node registerUser.js
```

여기까지 하면 `hfc-key-store` 디렉토리가 생긴다. 여기에는 등록된 user의 key file이 저장된다.

<br>

### IBM-Blockchain의 marbles

#### 다운로드

상세 내용은 [이 링크](https://github.com/IBM-Blockchain/marbles)에서 확인할 수 있다. **홈 디렉토리**에서 clone하자. (홈 디렉토리가 아닐 경우 경로를 직접 잡아 주어야 한다.)

```
git clone https://github.com/IBM-Blockchain/marbles.git
```

<br>

#### node module 설치

```
cd marbles
npm install
```

<br>

#### 체인코드 설치

```
cd script
node install_chaincode.js
```

<br>

#### 체인코드 instantiate

```
node instantiate_chaincode.js
```

<br>

#### 동작 확인

`localhost:3001`에서 확인할 수 있다.

<br>

### 기타

#### keystore를 찾을 수 없다고 할 때?

**keystore directory를 통으로 날린 후, admin과 user를 재등록**한다.