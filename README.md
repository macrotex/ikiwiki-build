## Summary

This container takes as input a Git repository, clones it, and runs it through ikiwiki putting the resulting static HTML site in the directory `/ikiwiki`.

This container does *not* do any serving of the content, rather, it only creates the static (HTML, CSS, etc) pages that could then be served by a web server.

For more information on ikiwiki see the [ikiwiki home page](https://ikiwiki.info/).

## How this container works:

There are two parameters:

   1. `GIT_URL`: an enviroment variable passed into the container that
   is a Git URL pointing to a git repository with the Markdown source.

   2. an output directory where the rendered ikiwiki pages will be placed.

Note that the output will be placed in the container's `/ikiwiki` directory, so you need to map that directory to a local directory
where you want the output to appear.

## Credentials

If your `GIT_URL` requires requires credentials in order to clone and uses https you can supply the username and password in the URL itself:

    https://USERNAME:PASSWORD@github.com/macrotex/testing.git

For example:

    https://joeuser:sekret@github.com/macrotex/testing.git

## Example

To generate the ikiwiki output contained in the Git repository `https://github.com/macrotex/testing.git` and place it in the local directory `/tmp/ikiwiki`.

    docker run \
      -e GIT_URL='https://github.com/macrotex/testing.git'
      -v /tmp/ikiwiki:/ikiwiki \
      ikiwiki-build

    # Same as above command but in one long line:
    docker run -e GIT_URL='https://github.com/macrotex/testing.git' -v /tmp/ikiwiki:/ikiwiki ikiwiki-gen 

