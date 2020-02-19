Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBB536EB72
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Feb 2020 11:06:16 +0000 (UTC)
Date: Wed, 19 Feb 2020 13:06:10 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200219110610.GS25209@platvala-desk.ger.corp.intel.com>
References: <20200218163540.12637-1-akeem.g.abodunrin@intel.com>
 <20200218163540.12637-2-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218163540.12637-2-akeem.g.abodunrin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tools/generate_cb_buffer: Add
 script to assemble CB kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
Cc: tony.luck@intel.com, omer.aran@intel.com, jani.nikula@intel.com, chris.p.wilson@intel.com, david.c.stewart@intel.com, igt-dev@lists.freedesktop.org, pragyansri.pathi@intel.com, jon.bloomfield@intel.com, daniel.vetter@intel.com, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 08:35:40AM -0800, Akeem G Abodunrin wrote:
> This patch adds script and applicable assembly sources, so that we can use
> igt to assemble Clear Batch Buffer kernel for gen7 and gen7.5 devices -
> Resultant header files would be imported to i915, and used as they are...
> =

> With this patch, user need to have mesa configured on their platform,
> before igt could be used to achieve the purpose of assembling the kernel
> from source.
> =

> This is needed for "Security mitigation for Intel Gen7/7.5 HWs"
> Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615
> =

> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>  scripts/asm_eu_kernel.sh                | 149 ++++++++++++++++++++++++
>  tools/assembly_source/hsw_clear_buf.asm | 141 ++++++++++++++++++++++
>  tools/assembly_source/ivb_clear_buf.asm | 139 ++++++++++++++++++++++
>  3 files changed, 429 insertions(+)
>  create mode 100755 scripts/asm_eu_kernel.sh
>  create mode 100644 tools/assembly_source/hsw_clear_buf.asm
>  create mode 100644 tools/assembly_source/ivb_clear_buf.asm
> =

> diff --git a/scripts/asm_eu_kernel.sh b/scripts/asm_eu_kernel.sh
> new file mode 100755
> index 00000000..f2669e52
> --- /dev/null
> +++ b/scripts/asm_eu_kernel.sh
> @@ -0,0 +1,149 @@
> +#!/bin/bash
> +#
> +# SPDX-License-Identifier: MIT
> +#
> +# Copyright =A9 2020 Intel Corporation
> +#
> +# Permission is hereby granted, free of charge, to any person obtaining a
> +# copy of this software and associated documentation files (the "Softwar=
e"),
> +# to deal in the Software without restriction, including without limitat=
ion
> +# the rights to use, copy, modify, merge, publish, distribute, sublicens=
e,
> +# and/or sell copies of the Software, and to permit persons to whom the
> +# Software is furnished to do so, subject to the following conditions:
> +#
> +# The above copyright notice and this permission notice (including the n=
ext
> +# paragraph) shall be included in all copies or substantial portions of =
the
> +# Software.
> +#
> +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHA=
LL
> +# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR O=
THER
> +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
> +# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DE=
ALINGS
> +# IN THE SOFTWARE.
> +
> +export ASSEMBLY_SOURCE=3D./tools/assembly_source
> +
> +function get_help {
> +        echo "Usage:    asm_eu_kernel.sh [options]"
> +        echo "Remember to run this as root"

I can't spot why this would need root.


> +        echo " "
> +        echo "Please make sure your MESA tool is compiled, and run this =
script from igt home directory"

Mesa written as "Mesa" and IGT written as "IGT". And it's "source root
directory", not "home directory".

Does the assembler require specific build options for Mesa? Note them here.

> +        echo " "
> +        echo "Options are:"
> +        echo " -h                       display this help message, and e=
xit"
> +        echo " -g=3Dplatform              generation of device: use "hsw=
" for gen7.5, and "ivb" for gen7 devices"
> +        echo " -o=3Dname_of_file          output file to store result - =
otherwise default would be used"

output file to store result - default "name of the default filename"

> +        echo " -m=3Dmesa                  directory specify mesa directo=
ry"

"Mesa source directory"

> +        echo " "
> +        echo " Usage example: \"scripts/asm_eu_kernel.sh -g hsw -o hsw_c=
lear_buffer.h -m /home/OgbojuOde/intel_gpu/mesa\""

For an example Mesa directory, use something that's more obviously a placeh=
older.   -m /path/to/mesa/sources


This script writes two files, does it not? And -o only selects one of
them, other being hardcoded... That could use a mention in the help
text.


> +}
> +
> +function include_guard # $1=3Dfilename
> +{
> +	echo "__$(basename $1)__" | tr [:lower:] [:upper:] | tr [:punct:] _
> +}
> +
> +function prefix_header # $1=3Dfilename $2=3Dcomment
> +{
> +	guard=3D$(include_guard $1)
> +	comment=3D$2
> +
> +	cat <<EOF
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2020 Intel Corporation
> + *
> + * Generate by: Intel-gpu-tools on $(date)

"Generated"

"IGT Gpu Tools"


> + */
> +
> +#ifndef $guard
> +#define $guard
> +
> +#include <linux/types.h>
> +
> +/* $comment */
> +EOF
> +}
> +
> +function postfix_footer # filename
> +{
> +	guard=3D$(include_guard $1)
> +
> +	cat <<EOF
> +
> +
> +#endif /* $guard */
> +EOF
> +}
> +
> +function asm_cb_kernel # as-root <args>
> +{
> +        if [ -f "$output_file" ]; then
> +                echo -e "Warning: The \"$output_file\" file already exis=
t - choose another file name"
> +                echo -e "Otherwise, it will be overwritten, and default =
file for i915 will be generated\n"
> +        fi

You print this warning, and yet still overwrite the file?


> +
> +        # Using i965_asm tool to assemble hex file from assembly source
> +        $I965_ASM -g $gen_device -t c_literal  $input_asm_source -o $out=
put_file
> +
> +        # Generate header file
> +        if [ "$gen_device" =3D=3D "hsw" ]; then
> +                echo "Generating gen7.5 CB Kernel header file \"gen7_5_c=
learbuffer.h\" for i915 driver..."
> +
> +                i915_filename=3Dgen7_5_clearbuffer.h
> +                prefix_header $i915_filename "Media CB Kernel for gen7.5=
 devices" > $i915_filename
> +                cat $output_file >> $i915_filename
> +                postfix_footer $i915_filename >> $i915_filename
> +
> +        elif [ "$gen_device" =3D=3D "ivb" ]; then
> +                echo "Generating gen7 CB Kernel header file \"gen7_clear=
buffer.h\" for i915 driver..."
> +
> +                i915_filename=3Dgen7_clearbuffer.h
> +                prefix_header $i915_filename "Media CB Kernel for gen7 d=
evices" > $i915_filename
> +                cat $output_file >> $i915_filename
> +                postfix_footer $i915_filename >> $i915_filename
> +        fi
> +}
> +
> +while getopts "hg:o:m:" opt; do
> +	case $opt in
> +		h) get_help; exit 0;;
> +		g) gen_device=3D"$OPTARG" ;;
> +		o) output_file=3D"$OPTARG" ;;
> +                m) mesa_dir=3D"$OPTARG" ;;
> +		\?)
> +			echo "Unknown option: -$OPTARG"
> +			get_help
> +			exit 1
> +			;;
> +	esac
> +done
> +shift $(($OPTIND-1))
> +
> +if [ "x$1" !=3D "x" ]; then
> +	echo "Unknown option: $1"
> +	get_help
> +	exit 1
> +fi
> +
> +I965_ASM=3D"$mesa_dir/build/debug/src/intel/tools/i965_asm"
> +if [ ! -f ${I965_ASM} ]; then
> +        echo "i965_asm not found at ${I965_ASM}"
> +        get_help
> +        exit 1
> +fi
> +
> +if [ "x$gen_device" !=3D "x" ]; then
> +        if [ "$gen_device" =3D=3D "hsw" ]; then
> +                input_asm_source=3D"${ASSEMBLY_SOURCE}/hsw_clear_buf.asm"
> +        elif [ "$gen_device" =3D=3D "ivb" ]; then
> +                input_asm_source=3D"${ASSEMBLY_SOURCE}/ivb_clear_buf.asm"
> +        else
> +                echo "Unknown platform specified"
> +                get_help
> +                exit 1
> +        fi
> +	asm_cb_kernel
> +fi

If -g is not given at all, the script exits silently.



-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
