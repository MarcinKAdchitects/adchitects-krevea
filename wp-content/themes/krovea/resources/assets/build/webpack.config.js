const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const UglifyJsPlugin = require("uglifyjs-webpack-plugin");

module.exports = (env) => {
  config = {
    entry: {
      main: "./resources/assets/scripts/main.js",
    },
    output: {
      path: path.resolve(__dirname, "..", "..", "..", "dist"),
      filename: "[name].bundle.js",
    },
    plugins: [
      new MiniCssExtractPlugin({
        filename: "[name].bundle.css",
      }),
    ],
    module: {
      rules: [
        {
          test: /\.(sa|sc|c)ss$/,
          use: [
            MiniCssExtractPlugin.loader,
            {
              loader: "css-loader",
              options: {
                url: false,
                importLoaders: 1,
              },
            },
            {
              loader: "postcss-loader",
              options: {
                sourceMap: false,
              },
              options: {
                postcssOptions: {
                  plugins: [require("postcss-easy-import")({ prefix: "_" }), require("postcss-import"), require("tailwindcss")(`${__dirname}/tailwind.config.js`), require("autoprefixer")],
                },
              },
            },
            {
              loader: "sass-loader",
            },
          ],
        },
      ],
    },
    optimization: {
      minimizer: [new CssMinimizerPlugin(), new UglifyJsPlugin()],
    },
  };

  return config;
};
