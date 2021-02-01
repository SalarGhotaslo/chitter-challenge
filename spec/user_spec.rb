require 'database_helpers'

describe User do
  context '.create' do
    it 'creates a new user' do
      user = User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'Pa55word')

      persisted_data = persisted_data(table: :users, id: user.id)

      expect(user).to be_a User
      expect(user.id).to eq persisted_data.first['id']
      expect(user.email).to eq 'Salar@example.com'
    end

    it 'hashes the password using BCrypt' do
      expect(BCrypt::Password).to receive(:create).with('Pa55word')

      User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'Pa55word')
    end
  end

  context '.find' do
    it 'finds a user by ID' do
      user = User.create('Salar Ghotaslo', 'SGhotaslo', 'Salar@example.com', 'Pa55word')
      result = User.find(id: user)

      expect(result.id).to eq user.id
      expect(result.email).to eq user.email
    end

    it 'returns nil if there is no ID given' do
      expect(User.find(nil)).to eq nil
    end
  end

  context '.authenticate' do
    it 'returns a user given a correct username and password, if one exists' do
      user = User.create('Salar', 'Salaring123', 'Salar@example.com', 'Pa55word')
      authenticated_user = User.authenticate('Salar@example.com', 'Pa55word')

      expect(authenticated_user.id).to eq user.id
    end

    it 'returns nil given an incorrect email address' do
      user = User.create('Salar', 'Salaring123', 'Salar@example.com', 'Pa55word')

      expect(User.authenticate('nottherightemail@me.com', 'Pa55word')).to be_nil
    end

    it 'returns nil given an incorrect password' do
      user = User.create('Salar', 'Salaring123', 'Salar@example.com', 'Pa55word')

     expect(User.authenticate('Salar@example.com', 'wrongpassword')).to be_nil
   end
  end
end