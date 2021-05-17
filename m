Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A6E86E921
 for <igt-dev@lists.freedesktop.org>; Mon, 17 May 2021 10:25:04 +0000 (UTC)
Date: Mon, 17 May 2021 13:26:34 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YKJE2lzbAp11yVuZ@platvala-desk.ger.corp.intel.com>
References: <20210515230142.1816456-1-alan.previn.teres.alexis@intel.com>
 <20210515230142.1816456-5-alan.previn.teres.alexis@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210515230142.1816456-5-alan.previn.teres.alexis@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 04/17] Add basic PXP testing of buffer
 and context alloc
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
To: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sat, May 15, 2021 at 04:01:29PM -0700, Alan Previn wrote:
> Test PXP capability support as well as the allocation of protected
> buffers and protected contexts.
> =

> Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
> ---
>  tests/i915/gem_pxp.c | 381 +++++++++++++++++++++++++++++++++++++++++++
>  tests/meson.build    |   1 +
>  2 files changed, 382 insertions(+)
>  create mode 100644 tests/i915/gem_pxp.c
> =

> diff --git a/tests/i915/gem_pxp.c b/tests/i915/gem_pxp.c
> new file mode 100644
> index 00000000..be7b2749
> --- /dev/null
> +++ b/tests/i915/gem_pxp.c
> @@ -0,0 +1,381 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +
> +#include <sys/ioctl.h>
> +
> +#include "igt.h"
> +#include "i915/gem.h"
> +
> +IGT_TEST_DESCRIPTION("Test PXP that manages protected content through ar=
bitrated HW-PXP-session");
> +/* Note: PXP =3D "Protected Xe Path" */
> +
> +static bool is_pxp_hw_supported(int i915)
> +{
> +	uint32_t devid =3D intel_get_drm_devid(i915);
> +
> +	if (IS_TIGERLAKE(devid) || IS_ROCKETLAKE(devid) || IS_ALDERLAKE_S(devid=
))
> +		return true;
> +
> +	return false;
> +}
> +
> +static int create_bo_ext(int i915, uint32_t size, bool protected_is_true=
, uint32_t *bo_out)
> +{
> +	int ret;
> +
> +	struct drm_i915_gem_create_ext_protected_content protected_ext =3D {
> +		.base =3D { .name =3D I915_GEM_CREATE_EXT_PROTECTED_CONTENT },
> +		.flags =3D 0,
> +	};
> +
> +	struct drm_i915_gem_create_ext create_ext =3D {
> +		.size =3D size,
> +		.extensions =3D 0,
> +	};
> +
> +	if (protected_is_true)
> +		create_ext.extensions =3D (uintptr_t)&protected_ext;
> +
> +	ret =3D ioctl(i915, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);


Why the naked ioctl on a DRM ioctl instead of the many wrappers we
have in lib? (do_ioctl, do_ioctl_err, igt_ioctl, ...)


-- =

Petri Latvala
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
