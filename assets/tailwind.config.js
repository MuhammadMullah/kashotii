module.exports = {
    purge: [
        "../**/*.html.eex",
        "../**/*.html.leex",
        "../**/views/**/*.ex",
        "../**/live/**/*.ex",
        "./js/**/*.js"
    ],
    content: [
        './js/**/*.js',
        '../lib/*_web/**/*.*ex'
    ],
    theme: {
        extend: {},
    },
    plugins: [],
}