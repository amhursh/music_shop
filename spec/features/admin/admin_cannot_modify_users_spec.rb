describe 'Admin cannot edit user information' do
  context 'admin can log in' do
    context 'admin can visit their edit page' do
      context 'admin can edit their information' do
        scenario 'admin cannot edit other users information' do

          admin = create(:user, role: 1)

          visit root_path

          click_on "Login"

          expect(current_path).to eq login_path

          fill_in "session[username]", with: admin.username
          fill_in "session[password]", with: admin.password
          click_button "Login"

          expect(current_path).to eq admin_dashboard_path

          click_on "Edit User"
          expect(current_path).to eq("/users/#{admin.id}/edit")

          fill_in "Full Name", with: "Joel Lindow"
          fill_in "Address", with: "1122 Booger Booger Avenue"

          click_on "Update"

          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("1122 Booger Booger Avenue")
          expect(page).to have_content("Joel Lindow")
        end
      end
    end
  end
end
