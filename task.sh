git filter-repo --commit-callback '
if commit.author_email == b"abdalaziz.ali87@gmail.com":
    commit.author_name = b"Abdalaziz Mohamed"
    commit.author_email = b"abdalaziz.ali87@icloud.com"
if commit.committer_email == b"abdalaziz.ali87@gmail.com":
    commit.committer_name = b"Abdalaziz Mohamed"
    commit.committer_email = b"abdalaziz.ali87@icloud.com"
' --force

