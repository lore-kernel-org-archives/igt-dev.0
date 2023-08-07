Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F270410E1B8
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 03:37:00 +0000 (UTC)
Date: Mon, 7 Aug 2023 05:36:56 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230807033656.iccoi2dijo2mgm2c@zkempczy-mobl2>
References: <20230804084237.3940595-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230804084237.3940595-1-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t] tests/i915/kms_psr: Fix to use proper API to
 support XE
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

On Fri, Aug 04, 2023 at 02:12:37PM +0530, Bhanuprakash Modem wrote:
> As old API is not aware of XE memory reason, update the
> subtest with the new one to create the buffer for XE driver.
> 
> intel_buf_create_using_handle() --> intel_buf_create_full()
> 
> Fixes: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/337
> Cc: Jouni Högander <jouni.hogander@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  tests/i915/kms_psr.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/kms_psr.c b/tests/i915/kms_psr.c
> index 3f8f83b42..57a749ffb 100644
> --- a/tests/i915/kms_psr.c
> +++ b/tests/i915/kms_psr.c
> @@ -35,6 +35,7 @@
>  #include <stdio.h>
>  #include <string.h>
>  #include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  enum operations {
>  	PAGE_FLIP,
> @@ -144,6 +145,9 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
>  {
>  	uint32_t name, handle, tiling, stride, width, height, bpp, size;
>  	struct intel_buf *buf;
> +	enum intel_driver driver = buf_ops_get_driver(data->bops);
> +	uint64_t region = (driver == INTEL_DRIVER_XE) ?
> +				vram_if_possible(data->drm_fd, 0) : -1;
>  
>  	igt_assert_eq(fb->offsets[0], 0);
>  
> @@ -159,8 +163,8 @@ static struct intel_buf *create_buf_from_fb(data_t *data,
>  
>  	name = gem_flink(data->drm_fd, fb->gem_handle);
>  	handle = gem_open(data->drm_fd, name);
> -	buf = intel_buf_create_using_handle(data->bops, handle,
> -					    width, height, bpp, 0, tiling, 0);
> +	buf = intel_buf_create_full(data->bops, handle, width, height,
> +				    bpp, 0, tiling, 0, size, stride, region);
>  	intel_buf_set_ownership(buf, true);
>  
>  	return buf;
> -- 
> 2.40.0
> 

It's ok for me:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew
