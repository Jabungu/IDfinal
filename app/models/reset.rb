class Reset < ActiveRecord::Base
    before_save -> item { item. status = "pending" }, unless: :status?
end
