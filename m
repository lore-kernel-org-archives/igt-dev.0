Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ECA810E0FC
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Mar 2023 19:01:48 +0000 (UTC)
Date: Thu, 23 Mar 2023 20:01:44 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Message-ID: <20230323190144.obtrny6va6beiloe@zkempczy-mobl2>
References: <20230320100017.2913328-1-bhanuprakash.modem@intel.com>
 <20230320100017.2913328-3-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230320100017.2913328-3-bhanuprakash.modem@intel.com>
Subject: Re: [igt-dev] [i-g-t 2/5] lib/igt_fb: Add support for allocating
 buffers for XE
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

On Mon, Mar 20, 2023 at 03:30:14PM +0530, Bhanuprakash Modem wrote:
> Add support to create a buffer object to the XE driver.
> 
> Signed-off-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> ---
>  lib/igt_fb.c | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index ba89e1f60..63f8923dc 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -49,6 +49,8 @@
>  #include "intel_batchbuffer.h"
>  #include "intel_chipset.h"
>  #include "intel_bufops.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
>  
>  /**
>   * SECTION:igt_fb
> @@ -434,7 +436,7 @@ void igt_get_fb_tile_size(int fd, uint64_t modifier, int fb_bpp,
>  
>  	switch (modifier) {
>  	case DRM_FORMAT_MOD_LINEAR :
> -		if (is_i915_device(fd))
> +		if (is_intel_device(fd))
>  			*width_ret = 64;
>  		else
>  			*width_ret = 1;
> @@ -924,6 +926,9 @@ static uint64_t calc_fb_size(struct igt_fb *fb)
>  		size += calc_plane_size(fb, plane);
>  	}
>  
> +	if (is_xe_device(fb->fd))
> +		size = ALIGN(size, xe_get_default_alignment(fb->fd));
> +
>  	return size;
>  }
>  
> @@ -1143,8 +1148,8 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>  	 * them, so we need to make sure to use a device BO then.
>  	 */
>  	if (fb->modifier || fb->size || fb->strides[0] ||
> -	    (is_i915_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
> -	    (is_i915_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
> +	    (is_intel_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
> +	    (is_intel_device(fd) && igt_format_is_fp16(fb->drm_format)) ||
>  	    (is_amdgpu_device(fd) && igt_format_is_yuv(fb->drm_format)) ||
>  	    is_nouveau_device(fd))
>  		device_bo = true;
> @@ -1168,6 +1173,11 @@ static int create_bo_for_fb(struct igt_fb *fb, bool prefer_sysmem)
>  					       fb->strides[0]);
>  			/* If we can't use fences, we won't use ggtt detiling later. */
>  			igt_assert(err == 0 || err == -EOPNOTSUPP);
> +		} else if (is_xe_device(fd)) {
> +			fb->gem_handle = xe_bo_create_flags(fd, 0, fb->size,
> +							    xe_has_vram(fd) ?
> +							      vram_memory(fd, 0) :
> +							      system_memory(fd));

Isn't better to use vram_if_possible(fd, 0)?

With this fixed:

Acked-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  		} else if (is_vc4_device(fd)) {
>  			fb->gem_handle = igt_vc4_create_bo(fd, fb->size);
>  
> -- 
> 2.40.0
> 
