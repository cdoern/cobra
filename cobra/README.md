# Cobra Generator

Cobra provides its own program that will create your application and add any
commands you want. It's the easiest way to incorporate Cobra into your application.

In order to use the cobra command, compile it using the following command:

    go get github.com/cdoern/cobra/cobra

This will create the cobra executable under your `$GOPATH/bin` directory.

### cobra init

The `cobra init [app]` command will create your initial application code
for you. It is a very powerful application that will populate your program with
the right structure so you can immediately enjoy all the benefits of Cobra. It
will also automatically apply the license you specify to your application.

Cobra init is pretty smart. You can either run it in your current application directory
or you can specify a relative path to an existing project. If the directory does not exist, it will be created for you.

Updates to the Cobra generator have now decoupled it from the GOPATH.
As such `--pkg-name` is required.

**Note:** init will no longer fail on non-empty directories.

```
mkdir -p newApp && cd newApp
cobra init --pkg-name github.com/spf13/newApp
```

or

```
cobra init --pkg-name github.com/spf13/newApp path/to/newApp
```

### cobra add

Once an application is initialized, Cobra can create additional commands for you.
Let's say you created an app and you wanted the following commands for it:

* app serve
* app config
* app config create

In your project directory (where your main.go file is) you would run the following:

```
cobra add serve
cobra add config
cobra add create -p 'configCmd'
```

*Note: Use camelCase (not snake_case/kebab-case) for command names.
Otherwise, you will encounter errors.
For example, `cobra add add-user` is incorrect, but `cobra add addUser` is valid.*

Once you have run these three commands you would have an app structure similar to
the following:

```
  ▾ app/
    ▾ cmd/
        serve.go
        config.go
        create.go
      main.go
```

At this point you can run `go run main.go` and it would run your app. `go run
main.go serve`, `go run main.go config`, `go run main.go config create` along
with `go run main.go help serve`, etc. would all work.

Obviously you haven't added your own code to these yet. The commands are ready
for you to give them their tasks. Have fun!

### Configuring the cobra generator

The Cobra generator will be easier to use if you provide a simple configuration
file which will help you eliminate providing a bunch of repeated information in
flags over and over.

An example ~/.cobra.yaml file:

```yaml
author: Steve Francia <spf@spf13.com>
license: MIT
```

You can also use built-in licenses. For example, **GPLv2**, **GPLv3**, **LGPL**,
**AGPL**, **MIT**, **2-Clause BSD** or **3-Clause BSD**.

You can specify no license by setting `license` to `none` or you can specify
a custom license:

```yaml
author: Steve Francia <spf@spf13.com>
year: 2020
license:
  header: This file is part of CLI application foo.
  text: |
    {{ .copyright }}

    This is my license. There are many like it, but this one is mine.
    My license is my best friend. It is my life. I must master it as I must
    master my life.
```

In the above custom license configuration the `copyright` line in the License
text is generated from the `author` and `year` properties. The content of the
`LICENSE` file is

```
Copyright © 2020 Steve Francia <spf@spf13.com>

This is my license. There are many like it, but this one is mine.
My license is my best friend. It is my life. I must master it as I must
master my life.
```

The `header` property is used as the license header files. No interpolation is
done. This is the example of the go file header.
```
/*
Copyright © 2020 Steve Francia <spf@spf13.com>
This file is part of CLI application foo.
*/
```
