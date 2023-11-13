namespace :dev do
  desc 'Setando dados teste ao BD'
  task setup: :environment do
    show_spinner('Agando BD') { %x(rails db:drop) }
    show_spinner('Criando BD') { %x(rails db:create) }
    show_spinner('Migrando BD') { %x(rails db:migrate) }
    %x(rails dev:add_clothings)
    %x(rails dev:add_admin)
  end

  desc 'Cria o Usuario root'
  task add_admin: :environment do
    show_spinner('Criando o usuario root') do
      Admin.create!(
        email: 'admin@teste.com',
        password: 123456,
        password_confirmation: 123456
      )
    end
  end

  desc 'Cria dados teste para o banco de dados clothing'
  task add_clothings: :environment do
    show_spinner('Criando dados teste DB clothing') do
      clothings = [
        {
          label: 'Camiseta Good Times Preta',
          price: 189.90,
          path: 'camiseta-1',
          quant: 56,
          description: 'Camiseta manga curta preta pré-encolhida 100% algodão, com estampa em silk bege Good Times Company na frente e nas costas e tag têxtil com logo da Bolovo em preto na barra das costas.'
        },
        {
          label: 'Camiseta Bolovo Aesthetics Amarela',
          price: 189.90,
          path: 'camiseta-2',
          quant: 90,
          description: 'Camiseta manga curta amarela com silk colorido frente e costas, composição: 100% Algodão Penteado'
        },
        {
          label: 'Camiseta Burn Some Memories Verde',
          price: 189.90,
          path: 'camiseta-3',
          quant: 56,
          description: 'Camiseta manga curta verde com silk off white na frente, composição: 100% Algodão Cardado'
        },
        {
          label: 'Camiseta Manga Longa Where Next',
          price: 209,
          path: 'camiseta-4',
          quant: 78,
          description: 'Camiseta manga longa azul com silk colorido frente e costas, composição: 100% Algodão Penteado'
        },
        {
          label: 'Camiseta Geographic Levels Off White',
          price: 189.90,
          path: 'camiseta-5',
          quant: 77,
          description: 'Camiseta manga curta off white com silk colorido na frente e costas, composição: 100% Algodão Penteado.'
        },
        {
          label: 'Camiseta Manga Longa Hemisfério Sul Preta',
          price: 209,
          path: 'camiseta-6',
          quant: 5,
          description: 'Camiseta manga longa preta com silk colorido na frente e costas, composição: 100% Algodão Penteado'
        }
      ]
      clothings.each { |c| Clothing.find_or_create_by(c) }
    end
  end

  private

  def show_spinner(msg_star, msg_end = 'Concluído')
    spinner = TTY::Spinner.new("[:spinner] #{msg_star} ...", format: :arrow_pulse)
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})")
  end
end
