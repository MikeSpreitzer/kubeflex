package main

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"

	in "mcc.ibm.org/kubeflex/cmd/kflex/init"
)

func main() {
	var rootCmd = &cobra.Command{
		Use:   "kflex",
		Short: "CLI for kubeflex",
		Long:  `A flexible and scalable solution for running Kubernetes control plane APIs`,
	}

	var initCmd = &cobra.Command{
		Use:   "init",
		Short: "Initialize kubeflex",
		Long:  `Installs the default storage backend and the kubeflex operator`,
		Args:  cobra.ExactArgs(0),
		Run: func(cmd *cobra.Command, args []string) {
			//fmt.Printf("init called with parameter %#v and flag %v\n", args, cmd.Flag("flag").Value)
			kubeconfig := ""
			if cmd.Flags().Lookup("kubeconfig").Changed {
				kubeconfig = cmd.Flag("kubeconfig").Value.String()
			}
			in.Init(kubeconfig)
		},
	}

	initCmd.Flags().StringP("kubeconfig", "k", "", "path to kubeconfig file")

	var createCmd = &cobra.Command{
		Use:   "create",
		Short: "Create a control plane instance",
		Long:  `Create a control plane instance`,
		Args:  cobra.ExactArgs(1),
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Printf("create called with parameter %s and flag %v\n", args[0], cmd.Flag("flag").Value)
		},
	}

	createCmd.Flags().StringP("flag", "f", "", "A flag to be used with create")

	rootCmd.AddCommand(initCmd)
	rootCmd.AddCommand(createCmd)

	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
