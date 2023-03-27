# frozen_string_literal: true

# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 20_230_327_223_023) do
  create_table 'followers', force: :cascade do |t|
    t.integer 'follower_id'
    t.integer 'followee_id'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  create_table 'sleeps', force: :cascade do |t|
    t.integer 'user_id', null: false
    t.datetime 'clock_in'
    t.datetime 'clock_out'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.integer 'sleep_duration', default: 0
    t.index ['user_id'], name: 'index_sleeps_on_user_id'
  end

  create_table 'users', force: :cascade do |t|
    t.string 'name'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end

  add_foreign_key 'sleeps', 'users'
end
