package repositories

import "gorm.io/gorm"

type UserRepository interface {
	// TODO(ota): ログイン処理を実装する
	// TODO(ota): ユーザー登録処理を実装する
	// TODO(ota): ユーザー情報取得処理を実装する
	// TODO(ota): ユーザー情報更新処理を実装する
	// TODO(ota): ユーザー情報削除処理を実装する
}

type userRepository struct {
	db *gorm.DB
}

func SetupUserRepository(db *gorm.DB) UserRepository {
	return &userRepository{db: db}
}


