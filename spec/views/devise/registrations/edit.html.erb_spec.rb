require 'spec_helper'

describe 'devise/registrations/edit.html.erb' do
  before(:each) do
    #stubbing out devise methods
    view.stub(:resource).and_return(User.new)
    view.stub(:resource_name).and_return('user')
    view.stub(:devise_mapping).and_return(Devise.mappings[:user])
  end

  it 'shows required labels' do
    render
    expect(rendered).to have_text('Account details')
    expect(rendered).to have_text('First name')
    expect(rendered).to have_text('Last name')
    expect(rendered).to have_text('Email')
    expect(rendered).to have_text('Unhappy?')
  end

  it 'shows avatar image' do
    view.stub(:gravatar_for).and_return('img_link')
    render
    expect(rendered).to have_css('img')
    expect(rendered).to have_xpath("//img[contains(@src, 'img_link')]")
  end


  it 'shows required user fields' do
    render
    expect(rendered).to have_field('First name')
    expect(rendered).to have_field('Last name')
    expect(rendered).to have_field('Email')
  end

  it 'shows Update button' do
    render
    expect(rendered).to have_button('Update')

  end

  it 'shows Cancel my account button' do
    render
    expect(rendered).to have_button('Cancel my account')
  end

  it 'shows Update button' do
    render
    expect(rendered).to have_button('Update')

  end

  it 'shows Cancel my account button' do
    render
    expect(rendered).to have_button('Cancel my account')
  end

  #it 'shows Back button' do
  #  render
  #  expect(rendered).to have_link('Back')
  #end

  #it '#devise_error_messages_flash shows error messages ' do
  #  user = User.new
  #  user.password = ''
  #  user.save
  #
  #  view.stub(:resource).and_return(user)
  #
  #  render
  #  expect(rendered).to have_text("Password can't be blank")
  #end


end



