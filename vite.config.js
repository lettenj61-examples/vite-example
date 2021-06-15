import elm from 'vite-plugin-elm';

export default {
  plugins: [
    elm({
      exclude: 'elm-stuff/**',
      compiler: {
        debug: true,
      }
    }),
  ]
};
