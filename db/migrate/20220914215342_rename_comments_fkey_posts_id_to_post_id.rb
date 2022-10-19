# rename column posts_id to post_id
class RenameCommentsFkeyPostsIdToPostId < ActiveRecord::Migration[7.0]
    def change
      rename_column :comments, :posts_id, :post_id
    end
end
