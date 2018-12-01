## How this container works:

There are two parameters:

   1. `GITURL`:  Git URL pointing to a git repository with the Markdown source. 

   2. an output directory where the rendered ikiwiki pages will be placed.

Note that the output will be placed in the container's `/ikiwiki`
directory, so you need to map that directory to a local directory
where you want the output to appear.

## Credentials

Later.

## Example

To generate the ikiwiki output contained in the Git repository
`https://github.com/macrotex/testing.git` and place it in the local directory
`/tmp/ikiwiki`.

    docker run \
      -e GIT_URL='https://github.com/macrotex/testing.git'
      -v /tmp/ikiwiki:/ikiwiki \
      ikiwiki-gen

    docker run -e GIT_URL='https://github.com/macrotex/testing.git' -v /tmp/ikiwiki:/ikiwiki ikiwiki-gen 

