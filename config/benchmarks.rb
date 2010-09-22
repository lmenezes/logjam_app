# create benchmarker instance
RAILS_BENCHMARKER = RailsBenchmark.new

# If your session storage is ActiveRecordStore, and if you want
# sessions to be automatically deleted after benchmarking, use
# RAILS_BENCHMARKER = RailsBenchmarkWithActiveRecordStore.new

# WARNING: don't use RailsBenchmarkWithActiveRecordStore running on
# your production database!

# If your application runs from a url which is not your servers root,
# you should set relative_url_root on the benchmarker instance,
# especially if you use page caching.
# RAILS_BENCHMARKER.relative_url_root = '/blog'

# Customize the code below if your benchmark needs session data
# and/or your application specifies a custom session key.

# require 'user'
# RAILS_BENCHMARKER.session_data = {'account' => User.find_first("name='stefan'")}
# RAILS_BENCHMARKER.session_key = "my_secret_cookie_name"

RAILS_BENCHMARKER.class_eval <<EVA
  def establish_test_session(*args); end
  def update_test_session_data(*args); end
  def set_session_data(*args); end
EVA
