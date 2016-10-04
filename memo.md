# Ruby2.3のbundler環境でsinatraをminitestするための下準備

Sinatraをテストする勉強をしているのですが、古い情報そのままだと動きません。

なので、いくつかメモ的に情報を残していきます。

## 前提

* rbenv 1.0.0
* Ruby 2.3
* bundler 1.12.5

# 手順

1. `bundle init`
1. Gemfileを編集
1. `bundle install`
1. アプリケーションを書く
1. テストを書く
1. テストを実行する

## Gemfile

```
gem "sinatra"
gem "minitest"
gem "rack-test"
```

## テスト対象のアプリ

app.rbに対して以下を記述

```
require "sinatra"

get "/" do
  "Hello World"
end
```

## テストファイルのテンプレート

test_app.rbに以下を記述

```ruby

require './app'
require 'minitest/autorun'
require 'rack/test'

ENV['RACK_ENV'] = 'test'

# This class is test.
class HelloWorldTest < MiniTest::Unit::TestCase
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  def test_it_says_hello_world
    get '/'
    assert last_response.ok?
    assert_equal 'Hello World', last_response.body
  end
end
```

## 実行

```
bundle exec ruby test_app.rb
```

## テストを書くための参考になりそうなページ

* [Minitestに関するGithub](https://github.com/seattlerb/minitest)
* [Minitestのassertionのドキュメント](http://docs.seattlerb.org/minitest/Minitest/Assertions.html)
* [Rack::TestのGithub](https://github.com/brynary/rack-test)
* [Rack::Testで使いそうなメソッドの実態](https://github.com/brynary/rack-test/blob/master/lib/rack/test.rb)

## 参考情報

* [Testing Sinatra with Rack::Test](http://www.sinatrarb.com/testing.html)
* [load-error-rack-test](http://stackoverflow.com/questions/10369458/load-error-rack-test)