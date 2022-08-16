Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0B79798E
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 08:31:48 +0000 (UTC)
Date: Tue, 16 Aug 2022 11:30:33 +0300
From: Petri Latvala <petri.latvala@intel.com>
To: Jake Freeland <jake@technologyfriends.net>
Message-ID: <YvtVqT6ENAUeIFEo@platvala-desk.ger.corp.intel.com>
References: <20220816015413.1187415-1-jfree@freebsd.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220816015413.1187415-1-jfree@freebsd.org>
Subject: Re: [igt-dev] [PATCH i-g-t] replaced /bin/bash shebangs with
 /bin/sh for BSD compatibility
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Jake Freeland <jakesfreeland@gmail.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 15, 2022 at 08:54:13PM -0500, Jake Freeland wrote:
> From: Jake Freeland <jakesfreeland@gmail.com>
> 
> ---
>  man/rst2man.sh                   | 2 +-
>  meson.sh                         | 2 +-
>  scripts/code_cov_capture         | 2 +-
>  scripts/code_cov_gather_on_build | 2 +-
>  scripts/code_cov_gen_report      | 2 +-
>  scripts/code_cov_selftest.sh     | 2 +-
>  scripts/generate_clear_kernel.sh | 2 +-
>  scripts/run-tests.sh             | 2 +-
>  scripts/who.sh                   | 2 +-
>  tests/generate_testlist.sh       | 6 +++---
>  tests/igt_command_line.sh        | 2 +-
>  11 files changed, 13 insertions(+), 13 deletions(-)

Some of these contain bashisms, reports below.

> 
> diff --git a/man/rst2man.sh b/man/rst2man.sh
> index 49a98fc5..b7f28991 100755
> --- a/man/rst2man.sh
> +++ b/man/rst2man.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  rst2man=$1
>  input=$2
> diff --git a/meson.sh b/meson.sh
> index 7cf9d4a3..e112a93c 100755
> --- a/meson.sh
> +++ b/meson.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  cat > Makefile <<EOF
>  
> diff --git a/scripts/code_cov_capture b/scripts/code_cov_capture
> index 8662b0f1..73c1567d 100755
> --- a/scripts/code_cov_capture
> +++ b/scripts/code_cov_capture
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  trap 'catch $LINENO' ERR

possible bashism in scripts/code_cov_capture line 3 (trap with ERR|DEBUG|RETURN):
trap 'catch $LINENO' ERR


>  catch() {
> diff --git a/scripts/code_cov_gather_on_build b/scripts/code_cov_gather_on_build
> index eebee89f..a095aa10 100755
> --- a/scripts/code_cov_gather_on_build
> +++ b/scripts/code_cov_gather_on_build
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  KSRC=$1
>  KOBJ=$2
> diff --git a/scripts/code_cov_gen_report b/scripts/code_cov_gen_report
> index b7c90b11..b6bc703f 100755
> --- a/scripts/code_cov_gen_report
> +++ b/scripts/code_cov_gen_report
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh

possible bashism in scripts/code_cov_gen_report line 7 (trap with ERR|DEBUG|RETURN):
trap 'catch $LINENO' ERR
possible bashism in scripts/code_cov_gen_report line 44 (should be 'b = a'):
		if [ "$2" == "" ]; then
possible bashism in scripts/code_cov_gen_report line 52 (should be 'b = a'):
		if [ "$2" == "" ]; then
possible bashism in scripts/code_cov_gen_report line 60 (should be 'b = a'):
		if [ "$2" == "" ]; then
possible bashism in scripts/code_cov_gen_report line 68 (should be 'b = a'):
		if [ "$2" == "" ]; then
possible bashism in scripts/code_cov_gen_report line 79 (should be 'b = a'):
		if [ "$2" == "" ]; then
possible bashism in scripts/code_cov_gen_report line 101 (should be 'b = a'):
if [ "x$RESULTS" == "x" -o "x$KSRC" == "x" -o "x$DEST_DIR" == "x" -o "x$MODE" == "x" ]; then
possible bashism in scripts/code_cov_gen_report line 101 (should be 'b = a'):
if [ "x$RESULTS" == "x" -o "x$KSRC" == "x" -o "x$DEST_DIR" == "x" -o "x$MODE" == "x" ]; then
possible bashism in scripts/code_cov_gen_report line 140 (${parm/?/pat[/str]}):
			TITLE=${TITLE/.tar.gz/}
possible bashism in scripts/code_cov_gen_report line 157 (${parm/?/pat[/str]}):
		TITLE=${TITLE/.tar.gz/}
possible bashism in scripts/code_cov_gen_report line 179 (${parm/?/pat[/str]}):
		TITLE=${TITLE/.info/}



>  
>  MERGED_INFO="merged"
>  GATHER_ON_BUILD="code_cov_gather_on_build.sh"
> diff --git a/scripts/code_cov_selftest.sh b/scripts/code_cov_selftest.sh
> index 1c4bd96a..8d84b44c 100755
> --- a/scripts/code_cov_selftest.sh
> +++ b/scripts/code_cov_selftest.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  trap 'catch $LINENO' ERR

possible bashism in scripts/code_cov_selftest.sh line 3 (trap with ERR|DEBUG|RETURN):
trap 'catch $LINENO' ERR


>  catch() {
> diff --git a/scripts/generate_clear_kernel.sh b/scripts/generate_clear_kernel.sh
> index 90bbdf5d..b000daed 100755
> --- a/scripts/generate_clear_kernel.sh
> +++ b/scripts/generate_clear_kernel.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh


possible bashism in scripts/generate_clear_kernel.sh line 28 ('function' is useless):
function get_help {
possible bashism in scripts/generate_clear_kernel.sh line 43 ('function' is useless):
function include_array # $1=array_name - update Mesa output with desired format
possible bashism in scripts/generate_clear_kernel.sh line 50 ('function' is useless):
function prefix_header # $1=filename $2=comment
possible bashism in scripts/generate_clear_kernel.sh line 63 ('function' is useless):
function check_output_file #check output file
possible bashism in scripts/generate_clear_kernel.sh line 67 (echo -e):
echo -e "Warning: The \"$output_file\" file already exist - choose another file\n"
possible bashism in scripts/generate_clear_kernel.sh line 73 (echo -e):
echo -e "Output file not specified - using default file \"$gen_device-cb_assembled\"\n"
possible bashism in scripts/generate_clear_kernel.sh line 77 ('function' is useless):
function asm_cb_kernel # as-root <args>
possible bashism in scripts/generate_clear_kernel.sh line 85 (echo -e):
echo -e "Failed to assemble CB Kernel with Mesa tool\n"
possible bashism in scripts/generate_clear_kernel.sh line 91 (should be 'b = a'):
if [ "$gen_device" == "hsw" ]; then
possible bashism in scripts/generate_clear_kernel.sh line 99 (should be 'b = a'):
elif [ "$gen_device" == "ivb" ]; then
possible bashism in scripts/generate_clear_kernel.sh line 116 (echo -e):
echo -e "Unknown option: -$OPTARG\n"
possible bashism in scripts/generate_clear_kernel.sh line 125 (echo -e):
echo -e "Unknown option: $1\n"
possible bashism in scripts/generate_clear_kernel.sh line 130 (should be 'b = a'):
if [ "x$mesa_i965_asm" == "x" ]; then
possible bashism in scripts/generate_clear_kernel.sh line 131 (echo -e):
echo -e "i965_asm binary not found\n"
possible bashism in scripts/generate_clear_kernel.sh line 137 (should be 'b = a'):
if [ "$gen_device" == "hsw" ]; then
possible bashism in scripts/generate_clear_kernel.sh line 139 (should be 'b = a'):
elif [ "$gen_device" == "ivb" ]; then
possible bashism in scripts/generate_clear_kernel.sh line 142 (echo -e):
echo -e "Unknown platform specified\n"
possible bashism in scripts/generate_clear_kernel.sh line 148 (echo -e):
echo -e "Platform generation not specified\n"


>  #
>  # SPDX-License-Identifier: MIT
>  #
> diff --git a/scripts/run-tests.sh b/scripts/run-tests.sh
> index 6986232e..1ee5e5fb 100755
> --- a/scripts/run-tests.sh
> +++ b/scripts/run-tests.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh

possible bashism in scripts/run-tests.sh line 41 ('function' is useless):
function find_file # basename <possible paths>
possible bashism in scripts/run-tests.sh line 75 ('function' is useless):
function find_runner_binary # basename
possible bashism in scripts/run-tests.sh line 92 ('function' is useless):
function find_lcov_binary # basename
possible bashism in scripts/run-tests.sh line 94 (should be >word 2>&1):
if command -v $LCOV_CMD &> /dev/null; then
possible bashism in scripts/run-tests.sh line 101 ('function' is useless):
function download_piglit {
possible bashism in scripts/run-tests.sh line 105 ('function' is useless):
function execute_runner # as-root <runner> <args>
possible bashism in scripts/run-tests.sh line 115 ($EUID should be "$(id -u)"):
if [ "$need_root" -ne 0 -a "$EUID" -ne 0 ]; then
possible bashism in scripts/run-tests.sh line 122 ('function' is useless):
function print_help {
possible bashism in scripts/run-tests.sh line 194 (should be 'b = a'):
if [ "x$PIGLIT" == "x" ]; then
possible bashism in scripts/run-tests.sh line 244 (should be 'b = a'):
if [ "x$COV_ARGS" != "x" -a "x$COV_PER_TEST" == "x" ]; then
possible bashism in scripts/run-tests.sh line 244 (should be 'b = a'):
if [ "x$COV_ARGS" != "x" -a "x$COV_PER_TEST" == "x" ]; then
possible bashism in scripts/run-tests.sh line 255 (should be 'b = a'):
if [ "$SUMMARY" == "html" ]; then



>  #
>  # Copyright © 2014 Intel Corporation
>  #
> diff --git a/scripts/who.sh b/scripts/who.sh
> index b2216398..205cdca0 100755
> --- a/scripts/who.sh
> +++ b/scripts/who.sh
> @@ -1,4 +1,4 @@
> -#!/bin/bash
> +#!/bin/sh
>  #
>  # usage: sudo who.sh
>  #
> diff --git a/tests/generate_testlist.sh b/tests/generate_testlist.sh
> index 87637fc8..d506b149 100755
> --- a/tests/generate_testlist.sh
> +++ b/tests/generate_testlist.sh
> @@ -1,16 +1,16 @@
> -#!/bin/bash
> +#!/bin/sh
>  
>  OUTPUT=$1
>  shift
>  
>  echo TESTLIST > $OUTPUT
>  
> -if [[ $# -gt 0 ]] ; then
> +if [ $# -gt 0 ] ; then
>  	echo -n $1 >> $OUTPUT
>  	shift
>  fi
>  
> -while [[ $# -gt 0 ]] ; do
> +while [ $# -gt 0 ] ; do
>  	echo -n " $1" >> $OUTPUT
>  	shift
>  done

possible bashism in tests/generate_testlist.sh line 18 (echo -e):
echo -e "\nEND TESTLIST" >> $OUTPUT


-- 
Petri Latvala
