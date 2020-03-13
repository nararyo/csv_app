class ImportCsv < ApplicationRecord
    #CSVデータのパスを引数として受け取り、インポート処理を実行

    def self.users_data
        path = File.join Rails.root, "db/csv_data/csv_data.csv"
        #パスを指定

        list = []
        #CSVファイルからインポートするデータを配列で格納したい
    
        CSV.foreach(path, headers: true) do |row|  #foreachは１行ずつ展開するメソッド
            list << {
                name: row["name"],
                age: row["age"],
                address: row["address"]
            }
        #この時点では配列に格納されただけで、データベースには反映されていない
        end
        puts "インポート処理を開始"
        begin
            User.create!(list)
            puts "インポート完了"
        rescue ActiveModel::UnknownAttributeError => invalid
            puts "インポートに失敗:UnknownAttributeError"
        end       
    end
end
