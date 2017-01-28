var path = require('path');
var webpack = require('webpack');
var js_dist = path.join(__dirname, './app/assets/javascripts/components');

module.exports = [{
    name: 'chartComponent',
    entry: {
        line: './app/assets/javascripts/components/line.jsx',
    },
    output: {
        filename: './app/assets/javascripts/line.js'
    },
    module: {
        loaders: [
            {
                test: [/\.jsx$/],
                loaders: ["jsx-loader?insertPragma=React.DOM&harmony"],
            }
        ],
    },
    resolve: {
        extensions: ['', '.webpack.js', '.web.js', '.js', '.jsx']
    }
}];
