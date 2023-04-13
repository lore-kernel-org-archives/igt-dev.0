Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854EA10E027
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Apr 2023 10:44:09 +0000 (UTC)
Date: Thu, 13 Apr 2023 12:44:03 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230413104403.xxfhocvrcr64diyg@kamilkon-desk1>
References: <20230413012426.503658-1-zack@kde.org>
 <20230413012426.503658-3-zack@kde.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230413012426.503658-3-zack@kde.org>
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/8] lib: Add vmwgfx support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: banackm@vmware.com, krastevm@vmware.com, iforbes@vmware.com,
 mombasawalam@vmware.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Zack,

On 2023-04-12 at 21:24:20 -0400, Zack Rusin wrote:
> From: Maaz Mombasawala <mombasawalam@vmware.com>
> 
> Introduce basic support for vmwgfx into igt library functions and
> build system.
> This includes functions for accessing vmwgfx specific ioctls and
> other common functionality to be used by tests.
> 
> Signed-off-by: Roye Eshed <reshed@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Signed-off-by: Maaz Mombasawala <mombasawalam@vmware.com>
> Reviewed-by: Martin Krastev <krastevm@vmware.com>
> ---
>  lib/drmtest.c    |    3 +
>  lib/drmtest.h    |    1 +
>  lib/igt_vmwgfx.c | 1366 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_vmwgfx.h |  275 ++++++++++
>  lib/meson.build  |    1 +
>  meson.build      |    7 +
>  6 files changed, 1653 insertions(+)
>  create mode 100644 lib/igt_vmwgfx.c
>  create mode 100644 lib/igt_vmwgfx.h
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 3f669740..c91a9142 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -199,6 +199,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_VMWGFX, "vmwgfx" },
>  	{ DRIVER_XE, "xe" },
>  	{}
>  };
> @@ -560,6 +561,8 @@ static const char *chipset_to_str(int chipset)
>  		return "msm";
>  	case DRIVER_XE:
>  		return "xe";
> +	case DRIVER_VMWGFX:
> +		return "vmwgfx";
>  	case DRIVER_ANY:
>  		return "any";

Thank you for improving this patchseries,
I plan on merging this early next week.

There is only minor concern but it may be fixed later:

WARNING: else is not generally useful after a break or return
#161: FILE: lib/igt_vmwgfx.c:97:
+                       return false;
+               } else {

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

Regards,
Kamil

>  	default:
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 392470ac..5878f651 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -52,6 +52,7 @@
>  #define DRIVER_PANFROST	(1 << 5)
>  #define DRIVER_MSM	(1 << 6)
>  #define DRIVER_XE	(1 << 7)
> +#define DRIVER_VMWGFX   (1 << 8)
>  
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> diff --git a/lib/igt_vmwgfx.c b/lib/igt_vmwgfx.c
> new file mode 100644
> index 00000000..8fb6e553
> --- /dev/null
> +++ b/lib/igt_vmwgfx.c
> @@ -0,0 +1,1366 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/**********************************************************
> + * Copyright 2021-2023 VMware, Inc.
> + *
> + * Permission is hereby granted, free of charge, to any person
> + * obtaining a copy of this software and associated documentation
> + * files (the "Software"), to deal in the Software without
> + * restriction, including without limitation the rights to use, copy,
> + * modify, merge, publish, distribute, sublicense, and/or sell copies
> + * of the Software, and to permit persons to whom the Software is
> + * furnished to do so, subject to the following conditions:
> + *
> + * The above copyright notice and this permission notice shall be
> + * included in all copies or substantial portions of the Software.
> + *
> + * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
> + * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
> + * MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
> + * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
> + * BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
> + * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
> + * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
> + * SOFTWARE.
> + *
> + **********************************************************/
> +
> +#include "igt_vmwgfx.h"
> +
> +/**
> + * SECTION:igt_vmwgfx
> + * @short_description: VMWGFX support library
> + * @title: VMWGFX
> + * @include: igt.h
> + *
> + * This library provides various auxiliary helper functions for writing VMWGFX
> + * tests.
> + */
[...]
