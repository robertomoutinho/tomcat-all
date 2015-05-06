module TomcatAll
  module TomcatUsers

    USERS_DATA_BAG = 'tomcat_users'

    class << self


      def tomcat_users(data_bag = 'tomcat_users', search = '*:*')
        @users ||= find_users(data_bag, search)
      end

      # Returns an array of roles assigned to the users in the Tomcat Users
      # data bag.
      #
      # @raise [TomcatCookbook::InvalidUserDataBagItem] if an invalid item was
      #   found in the Tomcat users data bag.
      #
      # @return [Array<String>]
      def tomcat_roles

        @users.map do |item|
          item['roles']
        end.flatten.uniq
      end

      private

      def find_users(data_bag, search)
        items = Chef::Search::Query.new.search(data_bag, search, encrypted_secret)[0]
        Chef::Log.warn("items#{items}")
        users = decrypt_items(items)
        #Chef::Log.warn("users=#{users}")
        users
      end


      def decrypt_items(items)
        items.map do |item|
          Chef::EncryptedDataBagItem.new(item, encrypted_secret)
        end
      end

      def encrypted_secret
        @encrypted_secret ||= Chef::EncryptedDataBagItem.load_secret
      end
    end
  end
end