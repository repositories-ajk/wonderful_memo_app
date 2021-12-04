3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = 'test1234'
  end

  50.times do |ii|
    ii += 1
    user.memos.find_or_create_by!(title: "No.#{ii}: user00#{i}の記事") do |memo|
      memo.content = "No.#{ii}: user00#{i}の記事の本文"
    end
  end
end