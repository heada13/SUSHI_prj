// const VueLoaderPlugin = require("vue-loader/lib/plugin")
// module.exports = {
//     configureWebpack: {
//         mode: "development",
//         module: {
//             rules: [
//                 {
//                     test: /\.vue$/,
//                     loader: "vue-loader",
//                 },
//                 {
//                     test: /\.js$/,
//                     loader: "babel-loader",
//                 },
//                 {
//                     test: /\.scss$/,
//                     use: [
//                         "vue-style-loader",
//                         {
//                             loader: "css-loader",
//                             options: { sourceMap: true },
//                         },
//                         {
//                             loader: "sass-loader",
//                             options: { sourceMap: true },
//                         },
//                 ],
//                 },
//             ]
//         },
//         plugins: [
//             new VueLoaderPlugin()
//         ],
//         resolve: {
//             extensions: [".vue", ".js"],
//             alias: {
//                 "vue$": "vue/dist/vue.esm.js"
//             }
//         },
//     }
// }

// module.exports = {
//     css: {
//         loaderOptions: {
//         scss: {
//             prependData: '@import "./src/assets/sass/modal.scss";'
//             }
//         }
//     }
// };