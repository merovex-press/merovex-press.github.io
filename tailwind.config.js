module.exports = {
  purge: false,// explicitely disabled
  darkMode: 'media', // or 'media' or 'class'
  variants: {
    extend: {
      typography: ['dark'],
    }
  },
  plugins: [
    require('@tailwindcss/typography'),
    require('@tailwindcss/forms')
  ],
  theme: {
    extend: {
      backgroundImage: (theme) => ({
        'hero-pattern': "url('/img/hero-pattern.svg')",
        'page-texture': "url('/assets/images/backgrounds/beige-paper.png')",
        'dark:page-texture': "url('/assets/images/backgrounds/beige-paperx.png')"
      }),
      typography: (theme) => ({
        DEFAULT: {
          css: {
            'background': 'none',
            "max-width": "70ch",
            color: theme('colors.black'),
            a: {
              color: theme('colors.blue.500'),
              '&:visited': {
                color: theme('colors.violet.500'),
              },
            },
            p: {
              "letter-spacing": "-0.03",
              "line-height": 1.58,
            },
            'p+p': {
              'text-indent': '2ch'
            }
          },
        },
        dark: {
          css: {
            color: theme('colors.gray.50'),
            a: {
              color: theme('colors.blue.200'),
              '&:hover': {
                color: theme('colors.blue.100'),
              },
            },
            'h1, h2, h3, h4, h5, h6': {
              color: theme('colors.gray.50'),
              'font-weight': 'semibold'
            },
            strong: {
              color: theme('colors.white'),
            },
            '&:visited': {
              color: theme('colors.violet.200'),
            },
          },
        }
      }),
    },
    fontFamily: {
      'sans': ["MerovexSans", '-apple-system', 'system-ui', "Segoe UI", 'Roboto', 'Lato', 'Helvetica', 'Arial', 'sans-serif'],
      'serif': ["MerovexSerif", 'Cambria', 'Georgia', "Times New Roman", 'Times', 'serif'],
      'display': ['IMFellEnglish', "MerovexSerif", 'Cambria', 'Georgia', "Times New Roman", 'Times', 'serif']
    },
    colors: { // https://tailwindpalette.jurs.me/
      'brand': {
        '50': '#8eb3d2',
        '100': '#799cba',
        '200': '#6385a1',
        '300': '#4e6e89',
        '400': '#385770',
        '500': '#234058',
        '600': '#1a3042',
        '700': '#12202c',
        '800': '#091016',
        '900': '#000000',
      },
      'secondary': {
        '50': '#e7e2de',
        '100': '#d3cbc4',
        '200': '#bfb4ab',
        '300': '#aa9d91',
        '400': '#968678',
        '500': '#826f5e',
        '600': '#68594b',
        '700': '#4e4339',
        '800': '#342d26',
        '900': '#1a1713',
      },
      'ternary': {
        '50': '#ffffff',
        '100': '#f4f1ed',
        '200': '#e9e4da',
        '300': '#ded6c8',
        '400': '#d3c9b5',
        '500': '#c8bba3',
        '600': '#b3a58c',
        '700': '#9e8f74',
        '800': '#88795d',
        '900': '#736345',
      },
      'red': {
        '50': '#efd7d5',
        '100': '#dfbab7',
        '200': '#cf9d99',
        '300': '#c0817a',
        '400': '#b0645c',
        '500': '#a0473e',
        '600': '#803932',
        '700': '#602b25',
        '800': '#3f1c19',
        '900': '#1f0e0c',
      },
      'orange': {
        '50': '#fcf8f5',
        '100': '#fcf1e9',
        '200': '#f9ddcd',
        '300': '#f7be9f',
        '400': '#f68f60',
        '500': '#f66434',
        '600': '#ea4121',
        '700': '#c63121',
        '800': '#9a2722',
        '900': '#79201f',
      },
      'yellow': {
        '50': '#fbfaf7',
        '100': '#fbf6ea',
        '200': '#f6e8ca',
        '300': '#f1d099',
        '400': '#e9a756',
        '500': '#e17e29',
        '600': '#c55819',
        '700': '#95421a',
        '800': '#6b331c',
        '900': '#51281a',
      },
      'green': {
        '50': '#c6e8d6',
        '100': '#aad6bf',
        '200': '#8ec4a8',
        '300': '#72b390',
        '400': '#56a179',
        '500': '#3a8f62',
        '600': '#2d6f4c',
        '700': '#205037',
        '800': '#133021',
        '900': '#06100b',
      },
      'blue': {
        '50': '#c6d8e8',
        '100': '#aac1d6',
        '200': '#8eabc4',
        '300': '#7294b3',
        '400': '#567ea1',
        '500': '#3a678f',
        '600': '#2d506f',
        '700': '#203a50',
        '800': '#132330',
        '900': '#060c10',
      },
      'indigo': {
        '50': '#f6f9fc',
        '100': '#ecf3fb',
        '200': '#d4dff9',
        '300': '#b9c6f7',
        '400': '#939bf5',
        '500': '#6a6df4',
        '600': '#4d4beb',
        '700': '#3e3bcf',
        '800': '#302f9e',
        '900': '#27277a',
      },
      'violet': {
        '50': '#f8f8fb',
        '100': '#f2f1fa',
        '200': '#e3daf7',
        '300': '#d3bdf4',
        '400': '#c08ff0',
        '500': '#a962ec',
        '600': '#8641e0',
        '700': '#6332bf',
        '800': '#49298e',
        '900': '#38226d',
      },
      'gray': {
        '50': '#eff0ef', // White
        '100': '#d7dad8',
        '200': '#bfc4c0',
        '300': '#a8ada9',
        '400': '#909791',
        '500': '#78817a', // Grey
        '600': '#636a64',
        '700': '#4d534f',
        '800': '#383c39', // Iron Gall
        '900': '#222523', // Black
      },
      'white': {
        'DEFAULT': '#eff0ef'
      },
      'bone-white': {
        'DEFAULT': '#FFFFFF'
      },
      'black': {
        'DEFAULT': '#222523'
      }
    }
  },
}
