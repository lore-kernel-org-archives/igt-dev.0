Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F8310E696
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 18:47:27 +0000 (UTC)
Date: Tue, 12 Dec 2023 13:47:18 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
Subject: Re: [PATCH v1 5/6] drm-uapi/xe: Remove DRM_XE_UFENCE_WAIT_MASK_*
Message-ID: <ZXiqtiskA092Zlq-@intel.com>
References: <20231212173059.7-1-francois.dugast@intel.com>
 <20231212173059.7-6-francois.dugast@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231212173059.7-6-francois.dugast@intel.com>
MIME-Version: 1.0
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

On Tue, Dec 12, 2023 at 05:30:58PM +0000, Francois Dugast wrote:
> Align with commit ("drm/xe/uapi: Remove DRM_XE_UFENCE_WAIT_MASK_*")
> 
> Signed-off-by: Francois Dugast <francois.dugast@intel.com>

Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 12 +++++++-----
>  lib/xe/xe_ioctl.h         |  2 ++
>  2 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index b543207bf..8f09e9681 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -1040,11 +1040,13 @@ struct drm_xe_wait_user_fence {
>  	/** @value: compare value */
>  	__u64 value;
>  
> -#define DRM_XE_UFENCE_WAIT_MASK_U8	0xffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U16	0xffffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U32	0xffffffffu
> -#define DRM_XE_UFENCE_WAIT_MASK_U64	0xffffffffffffffffu
> -	/** @mask: comparison mask */
> +	/**
> +	 * @mask: comparison mask, values can be for example:
> +	 *  - 0xffu for u8
> +	 *  - 0xffffu for u16
> +	 *  - 0xffffffffu for u32
> +	 *  - 0xffffffffffffffffu for u64
> +	 */
>  	__u64 mask;
>  
>  	/**
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> index 05480e40b..7dcc20e57 100644
> --- a/lib/xe/xe_ioctl.h
> +++ b/lib/xe/xe_ioctl.h
> @@ -15,6 +15,8 @@
>  #include <stdint.h>
>  #include <xe_drm.h>
>  
> +#define DRM_XE_UFENCE_WAIT_MASK_U64    0xffffffffffffffffu
> +
>  uint32_t xe_cs_prefetch_size(int fd);
>  uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
>  int  __xe_vm_bind(int fd, uint32_t vm, uint32_t exec_queue, uint32_t bo,
> -- 
> 2.34.1
> 
