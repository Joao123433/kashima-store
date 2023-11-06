const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      width: {
        '3/4': 'calc(100vw - 100px)'
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans]
      },
      fontWeight: {
        normal: '300'
      },     
      colors: {
        'kashima-gray': '#F1F1F1'
      },
      borderColor: {
        'primary': '#18181B'
      },
      fontSize: {
        'h1': '1.5rem'
      },
      padding: {
        '8': '2rem',
        '40': '150px'
      },
      margin: {
        '4': '1rem',
        '6': '2.5rem',
        '40': '150px'
      },
      textAlign: {
        'justify': 'justify'
      },
      gridTemplateColumns: {
        '2': 'repeat(2, minmax(0, 1fr))'
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
