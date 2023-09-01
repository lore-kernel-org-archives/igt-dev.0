Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 1 Sep 2023 13:21:58 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230901112158.nnctj5rt2yiimibx@kamilkon-desk.igk.intel.com>
References: <20230830214719.113454-1-rodrigo.vivi@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230830214719.113454-1-rodrigo.vivi@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] drm-uapi/xe_drm: Remove max_page_size
 and align with latest uapi.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rodrigo,
On 2023-08-30 at 17:47:19 -0400, Rodrigo Vivi wrote:
> Align with commit ("drm/xe/uapi: Remove useless max_page_size")
> 
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  include/drm-uapi/xe_drm.h | 27 ++++++++++++---------------
>  tests/xe/xe_query.c       |  9 ++++-----
>  2 files changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index d1d49cd71..c78abc6ae 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -174,10 +174,6 @@ struct drm_xe_query_mem_region {
>  	 * kernel.
>  	 */
>  	__u32 min_page_size;
> -	/**
> -	 * @max_page_size: Max page-size in bytes for this region.
> -	 */
> -	__u32 max_page_size;
>  	/**
>  	 * @total_size: The usable size in bytes for this region.
>  	 */
> @@ -256,7 +252,7 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_REV_AND_DEVICE_ID	0
>  #define XE_QUERY_CONFIG_FLAGS			1
>  	#define XE_QUERY_CONFIG_FLAGS_HAS_VRAM		(0x1 << 0)
> -#define XE_QUERY_CONFIG_MIN_ALIGNEMENT		2
> +#define XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> @@ -449,7 +445,6 @@ struct drm_xe_gem_create {
>  	 * If a VM is specified, this BO must:
>  	 *
>  	 *  1. Only ever be bound to that VM.
> -	 *
>  	 *  2. Cannot be exported as a PRIME fd.
>  	 */
>  	__u32 vm_id;
> @@ -489,7 +484,7 @@ struct drm_xe_gem_mmap_offset {
>   * struct drm_xe_vm_bind_op_error_capture - format of VM bind op error capture
>   */
>  struct drm_xe_vm_bind_op_error_capture {
> -	/** @error: errno that occured */
> +	/** @error: errno that occurred */
>  	__s32 error;
>  
>  	/** @op: operation that encounter an error */
> @@ -609,7 +604,7 @@ struct drm_xe_vm_bind_op {
>  	 * caused the error will be captured in drm_xe_vm_bind_op_error_capture.
>  	 * Once the user sees the error (via a ufence +
>  	 * XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS), it should free memory
> -	 * via non-async unbinds, and then restart all queue'd async binds op via
> +	 * via non-async unbinds, and then restart all queued async binds op via
>  	 * XE_VM_BIND_OP_RESTART. Or alternatively the user should destroy the
>  	 * VM.
>  	 *
> @@ -620,7 +615,7 @@ struct drm_xe_vm_bind_op {
>  #define XE_VM_BIND_FLAG_ASYNC		(0x1 << 17)
>  	/*
>  	 * Valid on a faulting VM only, do the MAP operation immediately rather
> -	 * than differing the MAP to the page fault handler.
> +	 * than deferring the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
>  	/*
> @@ -727,7 +722,7 @@ struct drm_xe_exec_queue_set_property {
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_TRIGGER		6
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_NOTIFY		7
>  #define XE_EXEC_QUEUE_SET_PROPERTY_ACC_GRANULARITY		8
> -	/** @property: property to set */
> +	/** @property: property to be set */
>  	__u32 property;
>  
>  	/** @value: property value */
> @@ -796,7 +791,7 @@ struct drm_xe_exec_queue_get_property {
>  	__u32 exec_queue_id;
>  
>  #define XE_EXEC_QUEUE_GET_PROPERTY_BAN			0
> -	/** @property: property to get */
> +	/** @property: property to be gotten */
>  	__u32 property;
>  
>  	/** @value: property value */
> @@ -907,7 +902,7 @@ struct drm_xe_mmio {
>  /**
>   * struct drm_xe_wait_user_fence - wait user fence
>   *
> - * Wait on user fence, XE will wakeup on every HW engine interrupt in the
> + * Wait on user fence, XE will wake-up on every HW engine interrupt in the
>   * instances list and check if user fence is complete::
>   *
>   *	(*addr & MASK) OP (VALUE & MASK)
> @@ -1039,9 +1034,11 @@ struct drm_xe_vm_madvise {
>  	 */
>  #define DRM_XE_VM_MADVISE_PRIORITY		5
>  #define		DRM_XE_VMA_PRIORITY_LOW		0
> -#define		DRM_XE_VMA_PRIORITY_NORMAL	1	/* Default */
> -#define		DRM_XE_VMA_PRIORITY_HIGH	2	/* Must be elevated user */
> -	/* Pin the VMA in memory, must be elevated user */
> +		/* Default */
> +#define		DRM_XE_VMA_PRIORITY_NORMAL	1
> +		/* Must be user with elevated privileges */
> +#define		DRM_XE_VMA_PRIORITY_HIGH	2
> +	/* Pin the VMA in memory, must be user with elevated privileges */
>  #define DRM_XE_VM_MADVISE_PIN			6
>  	/** @property: property to set */
>  	__u32 property;
> diff --git a/tests/xe/xe_query.c b/tests/xe/xe_query.c
> index a4e40afdd..afdfe282b 100644
> --- a/tests/xe/xe_query.c
> +++ b/tests/xe/xe_query.c
> @@ -227,9 +227,8 @@ test_query_mem_usage(int fd)
>  			mem_usage->regions[i].used,
>  			mem_usage->regions[i].total_size
>  		);
> -		igt_info("min_page_size=0x%x, max_page_size=0x%x\n",
> -		       mem_usage->regions[i].min_page_size,
> -		       mem_usage->regions[i].max_page_size);
> +		igt_info("min_page_size=0x%x\n",
> +			 mem_usage->regions[i].min_page_size);
>  
>  		igt_info("visible size=%lluMiB\n",
>  			 mem_usage->regions[i].cpu_visible_size >> 20);
> @@ -371,8 +370,8 @@ test_query_config(int fd)
>  	igt_info("  XE_QUERY_CONFIG_FLAGS_HAS_VRAM\t%s\n",
>  		config->info[XE_QUERY_CONFIG_FLAGS] &
>  		XE_QUERY_CONFIG_FLAGS_HAS_VRAM ? "ON":"OFF");
> -	igt_info("XE_QUERY_CONFIG_MIN_ALIGNEMENT\t\t%#llx\n",
> -		config->info[XE_QUERY_CONFIG_MIN_ALIGNEMENT]);
> +	igt_info("XE_QUERY_CONFIG_MIN_ALIGNMENT\t\t%#llx\n",
> +		config->info[XE_QUERY_CONFIG_MIN_ALIGNMENT]);
>  	igt_info("XE_QUERY_CONFIG_VA_BITS\t\t\t%llu\n",
>  		config->info[XE_QUERY_CONFIG_VA_BITS]);
>  	igt_info("XE_QUERY_CONFIG_GT_COUNT\t\t%llu\n",
> -- 
> 2.41.0
> 
