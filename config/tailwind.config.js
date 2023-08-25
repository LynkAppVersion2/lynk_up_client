const defaultTheme = require('tailwindcss/defaultTheme')
/** @type {import('tailwindcss').Config} */

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  purge: [                                                                                                                                                                               
    "./app/**/*.html.erb",                                                                                                                                                               
    "./app/javascript/**/*.vue",                                                                                                                                                         
  ],  
  theme: {
    extend: {
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
        // sans: ['Graphik', 'sans-serif'],
        // serif: ['Merriweather', 'serif'],
      },

      colors: {
        transparent: 'transparent',
        current: 'currentColor',
        // 'background': '#E7DCDC',
        'background': '#ddffa373',
        // 'navigation': '#282030e3',
        // 'navigation': '#202323',
        'navigation': '#232626',


        // 'white': '#ffffff',
        // 'purple': '#3f3cbb',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
