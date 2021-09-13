module github.com/spf13/cobra

go 1.15

require (
	github.com/cpuguy83/go-md2man/v2 v2.0.1
	github.com/inconshreveable/mousetrap v1.0.0
	github.com/spf13/pflag v1.0.5
	github.com/spf13/viper v1.8.1
	gopkg.in/yaml.v2 v2.4.0
)

replace github.com/spf13/cobra v1.2.1 => github.com/cdoern/cobra v1.2.3

replace github.com/spf13/pflag v1.0.5 => github.com/cdoern/pflag v1.0.7
