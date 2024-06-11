package models



type User struct {
	FirebaseUID string `json:"firebase_uid" gorm:"primary_key"`
	Username string `json:"username"`
	Email string `json:"email" gorm:"unique"`
	Todos []Todo `json:"todos" gorm:"foreignKey:FirebaseUID" OnDelete:"CASCADE"`
}
