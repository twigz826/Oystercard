# GUIDE

## Step 1

1. `bundle init` - initializes Gemfile
2. `rvm install 2.7.1` - install required version of ruby
3. Added this to the Gemfile:
```
group :development, :test do
  gem "rspec"
end
```
4. Add `ruby '2.7.1'` to the Gemfile
5. `bundle` - installs necessary gems

## Step 2

1. Create first spec file, with Oystercard class.
