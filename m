Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B94897C8
 for <igt-dev@lists.freedesktop.org>; Mon,  3 Apr 2023 10:58:05 +0000 (UTC)
Date: Mon, 3 Apr 2023 12:58:01 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230403105801.ha34wl757ijkshle@zkempczy-mobl2>
References: <20230327134119.2429388-1-mauro.chehab@linux.intel.com>
 <20230327134119.2429388-5-mauro.chehab@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230327134119.2429388-5-mauro.chehab@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 4/5] gen_opencl_kernel: add script to
 dynamically create OpenCL kernels
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Mar 27, 2023 at 03:41:18PM +0200, Mauro Carvalho Chehab wrote:
> From: Mauro Carvalho Chehab <mchehab@kernel.org>
> 
> Compute tests can be produced by using OpenCL, by calling ocloc.
> 
> While this can be part of IGT building system, for now, let's add
> a script for such purpose.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab@kernel.org>
> ---
>  opencl/README            | 11 +++++
>  opencl/gen_opencl_kernel | 86 ++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 97 insertions(+)
>  create mode 100644 opencl/README
>  create mode 100755 opencl/gen_opencl_kernel
> 
> diff --git a/opencl/README b/opencl/README
> new file mode 100644
> index 000000000000..5d0df2ad6c33
> --- /dev/null
> +++ b/opencl/README
> @@ -0,0 +1,11 @@
> +This directory contains some OpenCL compute files, and a script to be used
> +to produce a header file containing the binaries for the CL against
> +multiple platforms.
> +
> +For instance, to generate compute square Kernel binaries for TGL and ADL
> +variants, use this:
> +
> +    opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl \
> +	   xe_compute_square_kernels.c build/opencl tgllp adl-s adl-p adl-n
> +
> +    cp build/opencl/xe_compute_square_kernels.c lib/xe/

Fails on Ubuntu 22.04.2 LTS:

./opencl/gen_opencl_kernel xe_compute_square opencl/compute_square_kernel.cl xe_compute_square_kernels.c build/opencl tgllp 
tgllp
Generating build/opencl/tgllp_xe_compute_square.h
Usage:
       xxd [options] [infile [outfile]]
    or
       xxd -r [-s [-]offset] [-c cols] [-ps] [infile [outfile]]
Options:
    -a          toggle autoskip: A single '*' replaces nul-lines. Default off.
    -b          binary digit dump (incompatible with -ps,-i,-r). Default hex.
    -C          capitalize variable names in C include file style (-i).
    -c cols     format <cols> octets per line. Default 16 (-i: 12, -ps: 30).
    -E          show characters in EBCDIC. Default ASCII.
    -e          little-endian dump (incompatible with -ps,-i,-r).
    -g bytes    number of octets per group in normal output. Default 2 (-e: 4).
    -h          print this summary.
    -i          output in C include file style.
    -l len      stop after <len> octets.
    -o off      add <off> to the displayed file position.
    -ps         output in postscript plain hexdump style.
    -r          reverse operation: convert (or patch) hexdump into binary.
    -r -s off   revert with <off> added to file positions found in hexdump.
    -d          show offset in decimal instead of hex.
    -s [+][-]seek  start at <seek> bytes abs. (or +: rel.) infile offset.
    -u          use upper case hex letters.
    -v          show version: "xxd 2021-10-22 by Juergen Weigert et al.".
error in line 42

--
Zbigniew

> diff --git a/opencl/gen_opencl_kernel b/opencl/gen_opencl_kernel
> new file mode 100755
> index 000000000000..8bbc62a20cde
> --- /dev/null
> +++ b/opencl/gen_opencl_kernel
> @@ -0,0 +1,86 @@
> +#!/bin/bash
> +
> +trap 'catch $LINENO' ERR
> +
> +catch() {
> +    echo "error in line $1"
> +    exit 1
> +}
> +
> +
> +# Parse arguments
> +if [ $# -lt 5 ]; then
> +        echo -e 'Usage:\n\t$0: <Kernel name> <kernel.cl> <header name> <dest_dir> <GPU models>' >&2
> +        echo -e "Example:\n\t$0 kernel_foo kernel.cl kernels.c ../build/opencl tgllp rkl\n" >&2
> +        exit 1
> +fi
> +
> +kernel_name=$1
> +shift
> +
> +kernel_cl=$1
> +shift
> +
> +output_fname=$1
> +shift
> +
> +dest_dir=$1
> +shift
> +
> +mkdir -p $dest_dir
> +
> +args=( "$@" )
> +
> +echo $args
> +
> +out_files=""
> +for i in "${args[@]}"; do
> +	name="$dest_dir/${i}_${kernel_name}"
> +	out="$name.h"
> +        echo "Generating $out"
> +	ocloc compile -q -file ${kernel_cl} -device ${i} -output ${name}_bin -output_no_suffix
> +	xxd -n "${i}_${kernel_name}" -i ${name}_bin >$out
> +	sed "s,  ,\t,;s,.*unsigned int.*,,;s,\-,_,g;s,unsigned,static const unsigned," -i $out
> +	sed "1 i// Match ID: $(ocloc ids $i|grep -v "Matched ids:")" -i $out
> +	out_files+=" $out"
> +done
> +
> +output_fname="$dest_dir/$output_fname"
> +echo "Generating $output_fname"
> +
> +cat << PREFIX >$output_fname
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * This file is auto-generated from $kernel_cl:
> + *
> +PREFIX
> +
> +cat $kernel_cl |sed s,"^"," * ," >>$output_fname
> +
> +cat << INCLUDES >>$output_fname
> + */
> +
> +#include "intel_chipset.h"
> +#include "lib/xe/xe_compute.h"
> +
> +INCLUDES
> +
> +cat $out_files >>$output_fname
> +
> +echo "const struct xe_compute_kernels ${kernel_name}_kernels[] = {" >>$output_fname
> +
> +for i in "${args[@]}"; do
> +        out="$dest_dir/${i}_${kernel_name}.h"
> +        echo -e "\t{" >>$output_fname; \
> +	grep "Match ID:" $out|sed -E "s/.*\s([0-9]+)\.([0-9]+).*/\t\t.ip_ver = IP_VER(\1, \2),/" >>$output_fname;
> +	grep unsigned $out|sed -E "s/.*\s+([_a-zA-Z0-9]+)\[\].*/\t\t.size = sizeof(\1),/" >>$output_fname;
> +	grep unsigned $out|sed -E "s/.*\s+([_a-zA-Z0-9]+)\[\].*/\t\t.kernel = \1,/" >>$output_fname;
> +	echo -e "\t}," >>$output_fname;
> +done
> +
> +cat << SUFFIX >>$output_fname
> +	{}
> +};
> +SUFFIX
> +
> +echo "Done."
> -- 
> 2.39.2
> 

