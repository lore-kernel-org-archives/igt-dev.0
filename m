Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B47A6EA9A
 for <igt-dev@lists.freedesktop.org>; Thu, 29 Jul 2021 08:22:47 +0000 (UTC)
Date: Thu, 29 Jul 2021 11:25:18 +0300
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <YQJl7pgkajR8K01r@platvala-desk.ger.corp.intel.com>
References: <20210728051700.21223-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210728051700.21223-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Add i915_drm_local.h
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
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Jul 27, 2021 at 10:17:00PM -0700, Ashutosh Dixit wrote:
> It is necessary on occasion to add uapi declarations to IGT before they
> appear in imported kernel uapi headers. This is typically done at present
> using LOCAL declarations (or #ifndef's) which are dispersed across multip=
le
> source and header files. Such declarations sometimes linger on in the code
> for months or years till someone thinks of cleaning them up.
> =

> As opposed to this, provide a central location (in i915_drm_local.h) for
> such early uapi declarations in IGT. These declarations will be added to
> i915_drm_local.h exactly as they are expected to appear in the kernel uapi
> headers, i.e. without the LOCAL_ or local_ prefix. They can be cleaned up
> when the uapi headers are sync'd or they can live on (if they don't
> conflict with the kernel headers) but at least they will be in a single
> place and more visible. At least that is the hope.
> =

> Cc: Petri Latvala <petri.latvala@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>

Centralizing these should make cleanup easier and happen more
often.

Reviewed-by: Petri Latvala <petri.latvala@intel.com>

> ---
>  lib/i915/i915_drm_local.h | 27 +++++++++++++++++++++++++++
>  lib/igt_gt.h              |  1 +
>  2 files changed, 28 insertions(+)
>  create mode 100644 lib/i915/i915_drm_local.h
> =

> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> new file mode 100644
> index 00000000000..dd646aedf49
> --- /dev/null
> +++ b/lib/i915/i915_drm_local.h
> @@ -0,0 +1,27 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =A9 2021 Intel Corporation
> + */
> +#ifndef _I915_DRM_LOCAL_H_
> +#define _I915_DRM_LOCAL_H_
> +
> +#if defined(__cplusplus)
> +extern "C" {
> +#endif
> +
> +/*
> + * It is necessary on occasion to add uapi declarations to IGT before th=
ey
> + * appear in imported kernel uapi headers. This header is provided for t=
his
> + * purpose.
> +
> + * Early uapi declarations should be added here exactly as they are
> + * expected to appear in the kernel uapi headers, i.e. without the LOCAL_
> + * or local_ prefix and without any #ifndef's. Attempt should be made to
> + * clean these up when kernel uapi headers are sync'd.
> + */
> +
> +#if defined(__cplusplus)
> +}
> +#endif
> +
> +#endif /* _I915_DRM_LOCAL_H_ */
> diff --git a/lib/igt_gt.h b/lib/igt_gt.h
> index 2ea360cc48a..d87fae2d39c 100644
> --- a/lib/igt_gt.h
> +++ b/lib/igt_gt.h
> @@ -28,6 +28,7 @@
>  #include "igt_dummyload.h"
>  #include "igt_core.h"
>  =

> +#include "i915/i915_drm_local.h"
>  #include "i915_drm.h"
>  =

>  void igt_require_hang_ring(int fd, int ring);
> -- =

> 2.31.1
> =

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
