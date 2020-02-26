Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 637586E25A
 for <igt-dev@lists.freedesktop.org>; Wed, 26 Feb 2020 08:58:41 +0000 (UTC)
Date: Wed, 26 Feb 2020 10:58:36 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200226085836.GH3839@platvala-desk.ger.corp.intel.com>
References: <20200224174217.84103-1-akeem.g.abodunrin@intel.com>
 <20200224174217.84103-2-akeem.g.abodunrin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200224174217.84103-2-akeem.g.abodunrin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v5 1/1] tools/generate_cb_buffer: Add
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
Cc: jani.nikula@intel.com, chris.p.wilson@intel.com, igt-dev@lists.freedesktop.org, jon.bloomfield@intel.com, daniel.vetter@intel.com, mika.kuoppala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Feb 24, 2020 at 09:42:17AM -0800, Akeem G Abodunrin wrote:
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

> v2: Addressed formatting, -g option and other minor issues (Petri)
> v3: Update script due to suggested changes in i915, and Mesa tool
> v4: Update help comment with Mesa build option with meson (Petri)
> v5: Modify how user specify i965_asm - script now takes binary, instead
> of Mesa tool source directory (Ville).
> =

> Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Petri Latvala <petri.latvala@intel.com>
> Cc: Bloomfield Jon <jon.bloomfield@intel.com>
> Signed-off-by: Akeem G Abodunrin <akeem.g.abodunrin@intel.com>
> ---
>  scripts/asm_eu_kernel.sh                | 158 ++++++++++++++++++++++++
>  tools/assembly_source/hsw_clear_buf.asm | 141 +++++++++++++++++++++
>  tools/assembly_source/ivb_clear_buf.asm | 139 +++++++++++++++++++++
>  3 files changed, 438 insertions(+)
>  create mode 100755 scripts/asm_eu_kernel.sh
>  create mode 100644 tools/assembly_source/hsw_clear_buf.asm
>  create mode 100644 tools/assembly_source/ivb_clear_buf.asm
> =

> diff --git a/scripts/asm_eu_kernel.sh b/scripts/asm_eu_kernel.sh
> new file mode 100755
> index 00000000..ddf44b38
> --- /dev/null
> +++ b/scripts/asm_eu_kernel.sh
> @@ -0,0 +1,158 @@
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
> +        echo "Note: hsw_clear_kernel.c/ivb_clear_kernel.c automatically =
generated by this script should never be modified - it would be imported to=
 i915, to use as it is..."
> +        echo " "
> +        echo "Please make sure your Mesa tool is compiled with "-Dtools=
=3Dintel" and "-Ddri-drivers=3Di965", and run this script from IGT source r=
oot directory"
> +        echo " "
> +        echo "Options are:"
> +        echo " -h                       display this help message, and e=
xit"
> +        echo " -g=3Dplatform              generation of device: use "hsw=
" for gen7.5, and "ivb" for gen7 devices"
> +        echo " -o=3Dname_of_file          output file to store Mesa asse=
mbled c-literal for the device - If none specified, default file will be us=
ed - ivb/hsw-cb_assembled"
> +        echo " -m=3Dmesa                  Path to Mesa i965_asm binary"

What Ville said was that the name of the build directory can be
something other than 'build'. Within that build directory the path to
i965_asm binary is always src/intel/tools/i965_asm. But that's just
bikeshedding at this point.

I was able to test the script now, thanks Akeem for the Mesa side
changes link.

There's only the cosmetic things left to fix on IGT's side and then
this can be merged as soon as the Mesa side is merged. Namely, names:

The patch subject talks about tools/generate_cb_buffer but no such
file is created with it. The name asm_eu_kernel.sh sounds a bit too
generic when this is for very particular shaders to assemble. Speaking
of shaders, we already have a directory for shader sources where they
should go.

Suggestions for naming:

The assembly sources could go to lib/i915/shaders/clear_buffer/hsw.asm
and lib/i915/shaders/clear_buffer/ivb.asm

The script itself could be called scripts/generate_cb_shader.sh or
something. Not sure what the correct terminology is for these shaders.

Opinions, people who are better at naming than me?


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
