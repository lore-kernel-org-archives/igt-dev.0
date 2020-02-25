Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D0496EAA0
 for <igt-dev@lists.freedesktop.org>; Tue, 25 Feb 2020 11:27:56 +0000 (UTC)
Date: Tue, 25 Feb 2020 13:27:50 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200225112750.GB13686@intel.com>
References: <20200221082243.19807-1-akeem.g.abodunrin@intel.com>
 <20200221082243.19807-2-akeem.g.abodunrin@intel.com>
 <20200224094808.GA3839@platvala-desk.ger.corp.intel.com>
 <20200224134758.GY13686@intel.com>
 <20200225091204.GC3839@platvala-desk.ger.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200225091204.GC3839@platvala-desk.ger.corp.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/1] tools/generate_cb_buffer: Add
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
To: Petri Latvala <petri.latvala@intel.com>
Cc: jani.nikula@intel.com, chris.p.wilson@intel.com, igt-dev@lists.freedesktop.org, jon.bloomfield@intel.com, daniel.vetter@intel.com, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 11:12:04AM +0200, Petri Latvala wrote:
> On Mon, Feb 24, 2020 at 03:47:58PM +0200, Ville Syrj=E4l=E4 wrote:
> > On Mon, Feb 24, 2020 at 11:48:08AM +0200, Petri Latvala wrote:
> > > On Fri, Feb 21, 2020 at 12:22:43AM -0800, Akeem G Abodunrin wrote:
> > > > This patch adds script and applicable assembly sources, so that we =
can use
> > > > igt to assemble Clear Batch Buffer kernel for gen7 and gen7.5 devic=
es -
> > > > Resultant header files would be imported to i915, and used as they =
are...
> > > > =

> > > > With this patch, user need to have mesa configured on their platfor=
m,
> > > > before igt could be used to achieve the purpose of assembling the k=
ernel
> > > > from source.
> > > > =

> > > > This is needed for "Security mitigation for Intel Gen7/7.5 HWs"
> > > > Intel ID: PSIRT-TA-201910-001/CVEID: CVE-2019-14615
> > > > =

> > > > v2: Addressed formatting, -g option and other minor issues (Petri)
> > > > V3: Update script due to suggested changes in i915, and Mesa tool
> > > > v4: Update help comment with Mesa build option with meson (Petri)
> > > > =

> > > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > > Cc: Jani Nikula <jani.nikula@intel.com>
> > > > Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > > > Cc: Petri Latvala <petri.latvala@intel.com>
> > > > Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> > > > Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> > > > ---
> > > >  scripts/asm_eu_kernel.sh                | 153 ++++++++++++++++++++=
++++
> > > >  tools/assembly_source/hsw_clear_buf.asm | 141 ++++++++++++++++++++=
++
> > > >  tools/assembly_source/ivb_clear_buf.asm | 139 +++++++++++++++++++++
> > > >  3 files changed, 433 insertions(+)
> > > >  create mode 100755 scripts/asm_eu_kernel.sh
> > > >  create mode 100644 tools/assembly_source/hsw_clear_buf.asm
> > > >  create mode 100644 tools/assembly_source/ivb_clear_buf.asm
> > > > =

> > > > diff --git a/scripts/asm_eu_kernel.sh b/scripts/asm_eu_kernel.sh
> > > > new file mode 100755
> > > > index 00000000..1958829c
> > > > --- /dev/null
> > > > +++ b/scripts/asm_eu_kernel.sh
> > > > @@ -0,0 +1,153 @@
> > > > +#!/bin/bash
> > > > +#
> > > > +# SPDX-License-Identifier: MIT
> > > > +#
> > > > +# Copyright =A9 2020 Intel Corporation
> > > > +#
> > > > +# Permission is hereby granted, free of charge, to any person obta=
ining a
> > > > +# copy of this software and associated documentation files (the "S=
oftware"),
> > > > +# to deal in the Software without restriction, including without l=
imitation
> > > > +# the rights to use, copy, modify, merge, publish, distribute, sub=
license,
> > > > +# and/or sell copies of the Software, and to permit persons to who=
m the
> > > > +# Software is furnished to do so, subject to the following conditi=
ons:
> > > > +#
> > > > +# The above copyright notice and this permission notice (including=
 the next
> > > > +# paragraph) shall be included in all copies or substantial portio=
ns of the
> > > > +# Software.
> > > > +#
> > > > +# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, =
EXPRESS OR
> > > > +# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANT=
ABILITY,
> > > > +# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVE=
NT SHALL
> > > > +# THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGE=
S OR OTHER
> > > > +# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, =
ARISING
> > > > +# FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OT=
HER DEALINGS
> > > > +# IN THE SOFTWARE.
> > > > +
> > > > +export ASSEMBLY_SOURCE=3D./tools/assembly_source
> > > > +
> > > > +function get_help {
> > > > +        echo "Usage:    asm_eu_kernel.sh [options]"
> > > > +        echo "Note: hsw_clear_kernel.c/ivb_clear_kernel.c automati=
cally generated by this script should never be modified - it would be impor=
ted to i915, to use as it is..."
> > > > +        echo " "
> > > > +        echo "Please make sure your Mesa tool is compiled with "-D=
tools=3Dintel" and "-Ddri-drivers=3Di965", and run this script from IGT sou=
rce root directory"
> > > > +        echo " "
> > > > +        echo "Options are:"
> > > > +        echo " -h                       display this help message,=
 and exit"
> > > > +        echo " -g=3Dplatform              generation of device: us=
e "hsw" for gen7.5, and "ivb" for gen7 devices"
> > > > +        echo " -o=3Dname_of_file          output file to store Mes=
a assembled c-literal for the device - If none specified, default file will=
 be used - ivb/hsw-cb_assembled"
> > > > +        echo " -m=3Dmesa                  Mesa source directory"
> > > > +        echo " "
> > > > +        echo " Usage example: \"scripts/asm_eu_kernel.sh -g hsw -o=
 hsw_clear_buffer.h -m /path/to/Mesa/source/directory\""
> > > > +}
> > > > +
> > > > +function include_array # $1=3Darray_name
> > > > +{
> > > > +	echo "static const u32 $(basename $1)_clear_kernel[] =3D {"
> > > > +}
> > > > +function prefix_header # $1=3Dfilename $2=3Dcomment
> > > > +{
> > > > +	array_name=3D$(include_array $1)
> > > > +
> > > > +	cat <<EOF
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright =A9 2020 Intel Corporation
> > > > + *
> > > > + * Generated by: IGT Gpu Tools on $(date)
> > > > + */
> > > > +
> > > > +$array_name
> > > > +EOF
> > > > +}
> > > > +
> > > > +function postfix_footer # filename
> > > > +{
> > > > +	cat <<EOF
> > > > +};
> > > > +EOF
> > > > +}
> > > > +
> > > > +function check_output_file #check output file
> > > > +{
> > > > +        if [ "x$output_file" !=3D "x" ]; then
> > > > +                if [ -f "$output_file" ]; then
> > > > +                        echo -e "Warning: The \"$output_file\" fil=
e already exist - choose another file\n"
> > > > +                        get_help
> > > > +                        exit 1
> > > > +                fi
> > > > +        else
> > > > +                # It is okay to overwrite default file created
> > > > +                echo -e "Output file not specified - using default=
 file \"$gen_device-cb_assembled\"\n"
> > > > +                output_file=3D"$gen_device-cb_assembled"
> > > > +        fi
> > > > +}
> > > > +function asm_cb_kernel # as-root <args>
> > > > +{
> > > > +        check_output_file
> > > > +
> > > > +        # Using i965_asm tool to assemble hex file from assembly s=
ource
> > > > +        $I965_ASM -g $gen_device -t c_literal  $input_asm_source -=
o $output_file
> > > > +
> > > > +        # Generate header file
> > > > +        if [ "$gen_device" =3D=3D "hsw" ]; then
> > > > +                echo "Generating gen7.5 CB Kernel assembled file \=
"hsw_clear_kernel.c\" for i915 driver..."
> > > > +
> > > > +                i915_filename=3Dhsw_clear_kernel.c
> > > > +                prefix_header $gen_device > $i915_filename
> > > > +                cat $output_file >> $i915_filename
> > > > +                postfix_footer $i915_filename >> $i915_filename
> > > > +
> > > > +        elif [ "$gen_device" =3D=3D "ivb" ]; then
> > > > +                echo "Generating gen7 CB Kernel assembled file \"i=
vb_clear_kernel.c\" for i915 driver..."
> > > > +
> > > > +                i915_filename=3Divb_clear_kernel.c
> > > > +                prefix_header $gen_device > $i915_filename
> > > > +                cat $output_file >> $i915_filename
> > > > +                postfix_footer $i915_filename >> $i915_filename
> > > > +        fi
> > > > +}
> > > > +
> > > > +while getopts "hg:o:m:" opt; do
> > > > +	case $opt in
> > > > +		h) get_help; exit 0;;
> > > > +		g) gen_device=3D"$OPTARG" ;;
> > > > +		o) output_file=3D"$OPTARG" ;;
> > > > +                m) mesa_dir=3D"$OPTARG" ;;
> > > > +		\?)
> > > > +			echo -e "Unknown option: -$OPTARG\n"
> > > > +			get_help
> > > > +			exit 1
> > > > +			;;
> > > > +	esac
> > > > +done
> > > > +shift $(($OPTIND-1))
> > > > +
> > > > +if [ "x$1" !=3D "x" ]; then
> > > > +	echo -e "Unknown option: $1\n"
> > > > +	get_help
> > > > +	exit 1
> > > > +fi
> > > > +
> > > > +I965_ASM=3D"$mesa_dir/build/debug/src/intel/tools/i965_asm"
> > > =

> > > Should this be $mesa_dir/build/src/intel/tools/i965_asm instead?
> > =

> > Both assume the user specied the build directly exactly like so
> > when building Mesa. We should probably ask the user to point at
> > either the binary itself or the build directory.
> =

> We could just say "assuming build directory name is 'build'", Mesa's
> build instructions recommend that.

Only works for people who have just a single build directory, and who
read the noob docs. So mostly normal users that have no use for the
assembler in the first place. Developers are much more likely to have
several build directories.

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
