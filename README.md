## Keppler Contact Us

Es un Engine que proporciona un formulario de contacto básico

## Caracteristicas

- Envío de correo
- Recaptcha para evitar el span
- Configuración para personalización

## Requerimientos

* Ruby >= 2.0.0
* Rails >= 4.0.0
* Keppler-admin >= 2.0.0

## Instalación

Añadir la siguiente línea a su Gemfile

```ruby
gem 'keppler_contact_us', git: "https://github.com/slicegroup/keppler_contact_us.git", tag: '1.0.0'
gem "recaptcha", require: "recaptcha/rails"
```

Ubicarse en la ruta del proyecto desde la terminal y ejecutar

```ruby
Bundle install
```

La siguiente linea habilitará las rutas del engine, debe ser colocada en el archivo `config/routes.rb`

```ruby
mount KepplerContactUs::Engine, :at => '/', as: 'messages'
```

Para agregar `config/initializers/keppler_contact_us.rb` y asi establecer los datos de configuración debe ejecutar

```ruby
rake contact_us:copy_initializer
```

Seguido a esto debemos cargar los assets de la gema, agregando lo siguiente

en application.coffee

```
#= require keppler_contact_us/application
```

Luego importar migraciones y crear las tablas de contactos desde la consola

```
rake keppler_contact_us:install:migrations
```
```
rake db:migrate

```
Asignale permisos al modulo en el archivo app/models/ability.rb.

```ruby
  can :manage, KepplerContactUs::Message
  can :manage, KepplerContactUs::MessageSetting
```

Para poder acceder al módulo desde el sidebar se debe agregar lo siguiente a `config/menu.yml`

```
  keppler_messages:
    name: keppler messages
    current: ['keppler_contact_us/messages', 'keppler_contact_us/message_settings']
    icon: envelope
    model: KepplerContactUs::Message
    submenu:
      - messages:
          name: Messages
          url_path: /admin/messages
          current: ['keppler_contact_us/messages']
      - message_settings:
          name: Message Settings
          url_path: /admin/message_settings
          current: ['keppler_contact_us/message_settings']
```

## Formulario de contactos
Para usar el formulario de contacto colocar el la acción del controlador lo siguiente:

```ruby
@message = KepplerContactUs::Message.new
```
luego usar el render en la vista donde necesites el formulario.

```ruby
= render "keppler_contact_us/messages/form"
```

## Configuración

En el archivo `config/initializers/contact_us.rb` se puede establecer los datos de configuración.

```ruby
KepplerContactUs.setup do |config|
	config.mailer_from = "no-reply@example.com"
	#Route redirection after send
	config.redirection = "/contact_us"
end
```

En el archivo `config/initializers/recaptcha.rb` se encuentran establecidas las `site_key` y la `secret_key`

```ruby
Recaptcha.configure do |config|
  # Localhost keys
  config.site_key = Rails.application.secrets.site_key
  config.secret_key = Rails.application.secrets.secret_key
end
```

Para configurar estas llaves del Recaptcha para que éste funcione en `localhost:3000` en modo *development*, se establecen en el `config/secrets.yml` de la siguiente manera:

```
development:
  ...
  site_key: 6LcMNyQUAAAAAAXR84bWieZOIOdSYevYBPd0KrU8
  secret_key: 6LcMNyQUAAAAAGxnJL2ChqpQCeKc6AdeCiREJERc
  ...
 ```

 **Nota:** Puede obtener otras llaves de Recaptcha desde esta dirección [Recaptcha Keys](https://www.google.com/recaptcha/admin#list)

## Vistas

Para copiar las vistas en `app/views/contact_us` y asi personalizarlas para adaptarlas a sus necesidades debe ejecutar

```ruby
rake contact_us:copy_views
```
