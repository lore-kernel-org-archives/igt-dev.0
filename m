Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E4E10E0DA
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 11:38:11 +0000 (UTC)
Date: Tue, 14 Mar 2023 12:38:08 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230314113808.qj5osq4phyxgqivi@zkempczy-mobl2>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-6-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230314105452.2169208-6-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 5/5] lib/igt_kms: Cache xe_device info for kms
 tests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Mar 14, 2023 at 04:24:52PM +0530, Bhanuprakash Modem wrote:
> Create or get xe_device data from Cache, so that all KMS tests
> will utilize.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_kms.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/lib/igt_kms.c b/lib/igt_kms.c
> index 84091d5ce..d88863a90 100644
> --- a/lib/igt_kms.c
> +++ b/lib/igt_kms.c
> @@ -59,6 +59,7 @@
>  #include "igt_device.h"
>  #include "igt_sysfs.h"
>  #include "sw_sync.h"
> +#include "xe/xe_query.h"
>  #ifdef HAVE_CHAMELIUM
>  #include "igt_chamelium.h"
>  #endif
> @@ -2541,6 +2542,9 @@ void igt_display_require(igt_display_t *display, int drm_fd)
>  	}
>  #endif
>  
> +	if (is_xe_device(drm_fd))
> +		xe_device_get(drm_fd);
> +

Maybe in the future we will try to use xe_device more explicitly but at
the moment it would require to rewrite almost everything. So for this
change in the library:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	/*
>  	 * With non-contiguous pipes display, crtc mapping is not always same
>  	 * as pipe mapping, In i915 pipe is enum id of i915's crtc object.
> @@ -2889,6 +2893,10 @@ static void igt_output_fini(igt_output_t *output)
>  void igt_display_fini(igt_display_t *display)
>  {
>  	int i;
> +	int drm_fd = display->drm_fd;
> +
> +	if (is_xe_device(drm_fd))
> +		xe_device_put(drm_fd);
>  
>  	for (i = 0; i < display->n_planes; ++i) {
>  		igt_plane_t *plane = &display->planes[i];
> -- 
> 2.39.1
> 
