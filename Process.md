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

Create first spec file, with Oystercard class.

## Step 3

Create first ruby script, with Oystercard class.

## Step 4

1. First issue created with irb test that fails
```
irb -r "./lib/oystercard"
2.7.1 :001 > card = Oystercard.new
2.7.1 :002 > card.balance
NoMethodError (undefined method `balance' for #<Oystercard:0x00007f7eef1b8c88>)
```
2. Wrote a unit test to check whether oystercard balance starts at 0.
3. Wrote code to make the test pass
4. Replaced balance method with an instance variable in initialize and an attr_reader

## Step 5

1. Feature test saved to issues.
2. Unit tests created
3. Code written to make tests pass

## Step 6

1. Feature test for max balance saved to issues.
