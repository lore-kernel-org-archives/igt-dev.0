Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5365F6E9AB
 for <igt-dev@lists.freedesktop.org>; Thu, 19 Aug 2021 16:44:53 +0000 (UTC)
Date: Thu, 19 Aug 2021 19:44:48 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YR6KgNnLEAxgx7Al@intel.com>
References: <20210819115942.23920-1-thomas.hellstrom@linux.intel.com>
 <20210819115942.23920-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20210819115942.23920-4-thomas.hellstrom@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] lib/igt_fb: Support fbs backed by
 local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, apoorva1.singh@intel.com, zbigniew.kempczynski@intel.com, Ramalingam C <ramalingam.c@intel.com>, Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>, Dominik Grzegorzek <dominik.grzegorzek@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Aug 19, 2021 at 01:59:42PM +0200, Thomas Hellstr=F6m wrote:
> From: Ramalingam C <ramalingam.c@intel.com>
>=20
> When local memory is supported, buffer object, backing the framebuffer
> should be allocated from local memory.
>=20
> Dumb buffer allocation takes care of this requirement from kernel
> itself. So when we allocate BO through gem_create we make sure that
> BO is from local memory.
>=20
> Cc: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> ---
>  lib/igt_fb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 2e53d922..618842df 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -49,6 +49,7 @@
>  #include "intel_batchbuffer.h"
>  #include "intel_chipset.h"
>  #include "intel_bufops.h"
> +#include "i915/intel_memory_region.h"
> =20
>  /**
>   * SECTION:igt_fb
> @@ -1102,9 +1103,10 @@ static int create_bo_for_fb(struct igt_fb *fb, boo=
l prefer_sysmem)
>  		fb->is_dumb =3D false;
> =20
>  		if (is_i915_device(fd)) {
> +			uint32_t region =3D gem_has_lmem(fd) ? REGION_LMEM(0) : REGION_SMEM;
>  			int err;
> =20
> -			fb->gem_handle =3D gem_create(fd, fb->size);
> +			fb->gem_handle =3D gem_create_in_memory_regions(fd, fb->size, region);

Shouldn't we just have a gem_create_dtrt() for these sorts of things?

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  			err =3D __gem_set_tiling(fd, fb->gem_handle,
>  					       igt_fb_mod_to_tiling(fb->modifier),
>  					       fb->strides[0]);
> --=20
> 2.31.1

--=20
Ville Syrj=E4l=E4
Intel
