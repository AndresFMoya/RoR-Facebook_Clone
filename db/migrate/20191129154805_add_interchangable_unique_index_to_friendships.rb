class AddInterchangableUniqueIndexToFriendships < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        connection.execute(%q(
                    create unique index index_friendships_on_interchangable_user_id_and_friend_id on friendships(greatest(user_id,friend_id), least(user_id,friend_id));
                    create unique index index_friendships_on_interchangable_friend_id_and_user_id on friendships(least(user_id,friend_id), greatest(user_id,friend_id));
                ))
      end

      dir.down do
        connection.execute(%q(
                    drop index index_friendships_on_interchangable_user_id_and_friend_id;
                    drop index index_friendships_on_interchangable_friend_id_and_user_id;
                ))
      end
    end
  end
end
