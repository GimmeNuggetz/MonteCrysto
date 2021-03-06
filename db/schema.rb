# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_07_04_224406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currencies", force: :cascade do |t|
    t.string "symbol", null: false
    t.string "name", null: false
    t.integer "popularity"
    t.index ["symbol"], name: "index_currencies_on_symbol", unique: true
  end

  create_table "portfolio_histories", force: :cascade do |t|
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_portfolio_histories_on_user_id", unique: true
  end

  create_table "portfolios", force: :cascade do |t|
    t.integer "portfolio_history_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "account_value"
    t.index ["portfolio_history_id"], name: "index_portfolios_on_portfolio_history_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "ticker", null: false
    t.integer "popularity"
    t.float "price"
    t.float "price_change"
    t.string "name", null: false
    t.index ["ticker"], name: "index_stocks_on_ticker", unique: true
  end

  create_table "transactions", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "ticker", null: false
    t.integer "buy_price", null: false
    t.integer "quantity", null: false
    t.float "net_worth_of_user"
    t.integer "stock_id", null: false
    t.datetime "created_at", null: false
    t.index ["stock_id"], name: "index_transactions_on_stock_id"
    t.index ["user_id"], name: "index_transactions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "password_digest", null: false
    t.string "session_token", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.integer "portfolio_id"
    t.string "email", null: false
    t.float "funds_usd"
    t.index ["session_token"], name: "index_users_on_session_token", unique: true
  end

  create_table "watchlist_stock_joins", force: :cascade do |t|
    t.integer "watchlist_id", null: false
    t.integer "stock_id", null: false
    t.index ["watchlist_id", "stock_id"], name: "index_watchlist_stock_joins_on_watchlist_id_and_stock_id", unique: true
    t.index ["watchlist_id"], name: "index_watchlist_stock_joins_on_watchlist_id"
  end

  create_table "watchlists", force: :cascade do |t|
    t.integer "user_id", null: false
    t.index ["user_id"], name: "index_watchlists_on_user_id"
  end

end
