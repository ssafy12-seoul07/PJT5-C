## PJT5-C 프로젝트 보고서

---

### **1. 프로젝트 개요**

**프로젝트명:** SSAFIT_DB  
**참여 인원:** 정우, 재현, 혜민  
**프로젝트 유형:** MySQL 활용 데이터베이스 구축

---

### **2. ERD 초안 설명 및 SQL Query문 초안 작성**

#### **ERD 개요**
SSAFIT_DB의 ERD는 사용자 관리, 비디오 관리, 댓글, 즐겨찾기 비디오 및 팔로우 관계를 포함하고 있음. 각 테이블 간에는 외래 키를 통해 연관 관계가 형성되며, 효율적인 데이터 관리와 검색이 가능하도록 설계되었음. 이 ERD는 총 5개의 주요 테이블로 구성되어 있음.

#### **각 테이블의 설명**

1. **User Table (사용자 정보 테이블)**  
   - 사용자 정보를 저장하며, `user_id`는 Primary Key로 사용자가 고유하게 식별됨. 이메일 필드는 중복을 방지하기 위해 UNIQUE 제약 조건이 부여됨.

2. **Video Table (비디오 정보 테이블)**  
   - 비디오의 제목, 설명, 조회수 등의 정보를 저장함. `category` 필드는 비디오의 카테고리를 나타내며, 비어 있을 수 있도록 NULL 허용 조건이 설정됨.

3. **Comment Table (댓글 정보 테이블)**  
   - 사용자와 비디오 간의 연관성을 나타내는 댓글 정보를 저장함. 댓글 작성자는 반드시 `User` 테이블의 사용자를 참조하며, 댓글이 달린 비디오는 반드시 존재하는 비디오여야 함.

4. **FavoriteVideo Table (즐겨찾기 정보 테이블)**  
   - 사용자가 즐겨찾기한 비디오 정보를 저장함. 외래 키를 통해 사용자와 비디오 간의 관계를 나타내며, 즐겨찾기된 비디오는 반드시 `Video` 테이블에 존재해야 함.

5. **Follow Table (팔로우 관계 테이블)**  
   - 사용자 간의 팔로우 관계를 나타냄. 팔로우하는 사용자와 팔로우되는 사용자 모두 `User` 테이블의 사용자를 참조하며, 이를 통해 팔로우 관계를 관리함.

#### **SQL Query문 초안**
다음은 각 테이블에 대한 SQL 생성문임.

```sql
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    datetime TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Video (
    video_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    view_count INT DEFAULT 0 NOT NULL,
    category VARCHAR(100) NULL
);

CREATE TABLE Comment (
    comment_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (video_id) REFERENCES Video(video_id)
);

CREATE TABLE FavoriteVideo (
    favorite_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    video_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (video_id) REFERENCES Video(video_id)
);

CREATE TABLE Follow (
    followrelationship_id INT AUTO_INCREMENT PRIMARY KEY,
    follower_id INT,
    following_id INT,
    FOREIGN KEY (follower_id) REFERENCES User(user_id),
    FOREIGN KEY (following_id) REFERENCES User(user_id)
);
```

---

### **3. 보완할 점**

현재 데이터베이스 설계와 관련하여 **식별관계**와 **비식별관계**에 대해 정확히 학습하고 설계하는 것이 필요함. 특히 각 테이블 간의 관계 설정 시, 식별관계를 사용하는 경우와 비식별관계를 사용하는 경우를 명확하게 구분해야 함. 예를 들어, `Comment` 테이블의 `user_id`와 `video_id`가 식별관계로 처리될지, 비식별관계로 처리될지 고려하여 데이터 무결성과 효율성을 높이는 설계가 필요함.

또한, 일부 테이블에 NULL 허용 여부를 더욱 명확하게 정의하는 것도 중요함. 예를 들어, `category` 필드와 같은 선택적 데이터는 NULL 허용이 적합하지만, 필수적인 정보는 반드시 NULL 불가능으로 설정해야 함.

---

### **4. 다음 목표**

이 프로젝트는 7월부터 시작되어 중간에 여러 부분이 분절된 채 진행된 것이 느껴짐. 따라서 프로젝트를 처음부터 다시 체계적으로 진행할 계획임. 구체적으로는 **Java - JSON 연결 - 프론트엔드 - 백엔드 - DB 순서**로 프로젝트를 전개하면서 각 단계가 유기적으로 연결될 수 있도록 할 예정임. 이를 통해 프로젝트의 전체적인 흐름을 다시 정립하고, 데이터베이스 설계의 이해도를 높이며 효율적인 협업을 이어나갈 계획임.

---
