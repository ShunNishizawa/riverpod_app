# riverpod_app

## Providerの種類
### Provider
- 最も基本的なやつ。外部から変更できない値を公開できる；

### StateProvider
- 外部から変更可能な状態を提供する

### StateNotifierProvider
- 外部から変更可能な状態と、状態操作メソッドクラスを提供する
- 単純な状態の保持だけでなく、ユーザ操作などにより、変化するステートを管理する。

### FutureProvider
- 非同期で取得した値を提供する
- HTTPリクエストやファイルの読み取り、その他Futureを取り扱う処理全般で使用する

### StreamProvider
- 断続的に最頻の値を提供する

### ChangeNotifierProvider
- 変更可能な状態を持つクラスを提供する
