// module.exports = {
//   module: {
//     rules: [
//       {
//         test: /\.s[ac]ss$/i,
//         use: [
//           // Creates `style` nodes from JS strings
//           "style-loader",
//           // Translates CSS into CommonJS
//           "css-loader",
//           // Compiles Sass to CSS
//           "sass-loader",
//         ],
//       },
//     ],
//   },
// };

var Promise = require('es6-promise').Promise;
var path = require('path');

module.exports = {
    context: path.join(__dirname, 'src'),
    entry: {
        myEntry: './my/entry.js'
    }
}