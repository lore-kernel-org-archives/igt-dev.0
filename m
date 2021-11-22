Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660EB6E0E5
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Nov 2021 09:03:36 +0000 (UTC)
Date: Mon, 22 Nov 2021 10:03:31 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211122090331.GC7458@zkempczy-mobl2>
References: <20211122064849.785894-1-apoorva1.singh@intel.com>
 <20211122064849.785894-2-apoorva1.singh@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211122064849.785894-2-apoorva1.singh@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t,
 v2 1/3] lib/i915: Introduce libraries i915_blt and intel_mocs
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: apoorva1.singh@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 22, 2021 at 12:18:47PM +0530, apoorva1.singh@intel.com wrote:

<cut>

I've also wondered - should be the code below part of separate patch?

--
Zbigniew

> diff --git a/lib/i915/intel_mocs.c b/lib/i915/intel_mocs.c
> new file mode 100644
> index 00000000..cbb1cc69
> --- /dev/null
> +++ b/lib/i915/intel_mocs.c
> @@ -0,0 +1,75 @@
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *      Apoorva Singh <apoorva1.singh@intel.com>
> + *
> + */
> +#include "igt.h"
> +#include "i915/gem.h"
> +#include "intel_mocs.h"
> +
> +static void get_mocs_index(int fd, struct drm_i915_mocs_index *mocs)
> +{
> +	uint16_t devid =3D intel_get_drm_devid(fd);
> +
> +	/*
> +	 * Gen >=3D 12 onwards don't have a setting for PTE,
> +	 * so using I915_MOCS_PTE as mocs index may leads to
> +	 * some undefined MOCS behavior.
> +	 * Correct MOCS index should be referred from BSPCES
> +	 * and programmed accordingly.
> +	 * This helper function is providing current UC as well
> +	 * as WB MOCS index based on platform.
> +
> +	 */
> +	if (IS_DG1(devid)) {
> +		mocs->uc_index =3D 1;
> +		mocs->wb_index =3D 5;
> +	} else if (IS_GEN12(devid)) {
> +		mocs->uc_index =3D 3;
> +		mocs->wb_index =3D 2;
> +	} else {
> +		mocs->uc_index =3D I915_MOCS_PTE;
> +		mocs->wb_index =3D I915_MOCS_CACHED;
> +	}
> +}
> +
> +/* BitField [6:1] represents index to MOCS Tables
> + * BitField [0] represents Encryption/Decryption
> + */
> +
> +uint8_t intel_get_wb_mocs(int fd)
> +{
> +	struct drm_i915_mocs_index mocs;
> +
> +	get_mocs_index(fd, &mocs);
> +	return mocs.wb_index << 1;
> +}
> +
> +uint8_t intel_get_uc_mocs(int fd)
> +{
> +	struct drm_i915_mocs_index mocs;
> +
> +	get_mocs_index(fd, &mocs);
> +	return mocs.uc_index << 1;
> +}
> diff --git a/lib/i915/intel_mocs.h b/lib/i915/intel_mocs.h
> new file mode 100644
> index 00000000..8289ab1f
> --- /dev/null
> +++ b/lib/i915/intel_mocs.h
> @@ -0,0 +1,43 @@
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + *
> + * Permission is hereby granted, free of charge, to any person obtaining=
 a
> + * copy of this software and associated documentation files (the "Softwa=
re"),
> + * to deal in the Software without restriction, including without limita=
tion
> + * the rights to use, copy, modify, merge, publish, distribute, sublicen=
se,
> + * and/or sell copies of the Software, and to permit persons to whom the
> + * Software is furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice (including the =
next
> + * paragraph) shall be included in all copies or substantial portions of=
 the
> + * Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
> + * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
> + * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SH=
ALL
> + * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
> + * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG
> + * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER D=
EALINGS
> + * IN THE SOFTWARE.
> + *
> + * Authors:
> + *      Apoorva Singh <apoorva1.singh@intel.com>
> + *
> + */
> +#ifndef _INTEL_MOCS_H
> +#define _INTEL_MOCS_H
> +
> +#define XY_FAST_COLOR_BLT_MOCS_SHIFT		21
> +#define XY_BLOCK_COPY_BLT_MOCS_SHIFT		21
> +#define XY_FAST_COPY_BLT_MOCS_SHIFT		17
> +#define XY_CTRL_SURF_COPY_BLT_MOCS_SHIFT	25
> +#define MEM_COPY_MOCS_SHIFT			25
> +
> +struct drm_i915_mocs_index {
> +	uint8_t uc_index;
> +	uint8_t wb_index;
> +};
> +
> +uint8_t intel_get_wb_mocs(int fd);
> +uint8_t intel_get_uc_mocs(int fd);
> +#endif /* _INTEL_MOCS_H */
> diff --git a/lib/meson.build b/lib/meson.build
> index 297b0ad2..525d62f9 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -11,6 +11,8 @@ lib_sources =3D [
>  	'i915/gem_mman.c',
>  	'i915/gem_vm.c',
>  	'i915/intel_memory_region.c',
> +	'i915/intel_mocs.c',
> +	'i915/i915_blt.c',
>  	'igt_collection.c',
>  	'igt_color_encoding.c',
>  	'igt_debugfs.c',
> --=20
> 2.25.1
>=20
