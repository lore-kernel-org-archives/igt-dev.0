Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BFB010E12C
 for <igt-dev@lists.freedesktop.org>; Tue, 14 Mar 2023 12:08:49 +0000 (UTC)
Date: Tue, 14 Mar 2023 13:08:45 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230314130845.27cd7d4a@maurocar-mobl2>
In-Reply-To: <20230314105452.2169208-6-bhanuprakash.modem@intel.com>
References: <20230314105452.2169208-1-bhanuprakash.modem@intel.com>
 <20230314105452.2169208-6-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 14 Mar 2023 16:24:52 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> Create or get xe_device data from Cache, so that all KMS tests
> will utilize.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

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
