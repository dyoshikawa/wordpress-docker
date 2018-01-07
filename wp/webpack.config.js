const path = require('path');

module.exports = {
  entry: './src/js/app.js',
  output: {
    filename: 'bundle.js',
    path: path.join(__dirname, './path')
  },
  resolve: {
    alias: {
      'vue$': 'vue/dist/vue.esm.js'
    }
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        loader: 'babel-loader',
        exclude: /node_modules/
      }
    ]
  }
};