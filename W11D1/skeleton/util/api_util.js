export const fetchSearchGiphys = (searchTerm) => {
    const myKey = "by2a8HBr0S18O13FDzW79nAvAaFx0VVX";

    return $.ajax({
        method: "GET",
        url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${myKey}&limit=2`
    })
}