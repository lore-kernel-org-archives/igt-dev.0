Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7301910E60F
 for <igt-dev@lists.freedesktop.org>; Fri, 23 Jun 2023 07:32:15 +0000 (UTC)
Date: Fri, 23 Jun 2023 09:32:10 +0200
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20230623093210.755a537b@maurocar-mobl2>
In-Reply-To: <20230608140208.41492-1-matthew.brost@intel.com>
References: <20230608140208.41492-1-matthew.brost@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/2] tests/xe: Sync with latest uAPI
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

On Thu,  8 Jun 2023 07:02:07 -0700
Matthew Brost <matthew.brost@intel.com> wrote:

> Mostly just recompile tests, only real change is update bind array
> tests to zero pad field.
> 
> Signed-off-by: Matthew Brost <matthew.brost@intel.com>

LGTM.
Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  include/drm-uapi/xe_drm.h | 65 +++++++++++++++++++++++++++++++--------
>  tests/xe/xe_vm.c          |  3 +-
>  2 files changed, 55 insertions(+), 13 deletions(-)
> 
> diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
> index 593b01ba5..39a1ce897 100644
> --- a/include/drm-uapi/xe_drm.h
> +++ b/include/drm-uapi/xe_drm.h
> @@ -37,7 +37,7 @@ extern "C" {
>   */
>  
>  /**
> - * struct i915_user_extension - Base class for defining a chain of extensions
> + * struct xe_user_extension - Base class for defining a chain of extensions
>   *
>   * Many interfaces need to grow over time. In most cases we can simply
>   * extend the struct and have userspace pass in more data. Another option,
> @@ -55,20 +55,20 @@ extern "C" {
>   *
>   * .. code-block:: C
>   *
> - *	struct i915_user_extension ext3 {
> + *	struct xe_user_extension ext3 {
>   *		.next_extension = 0, // end
>   *		.name = ...,
>   *	};
> - *	struct i915_user_extension ext2 {
> + *	struct xe_user_extension ext2 {
>   *		.next_extension = (uintptr_t)&ext3,
>   *		.name = ...,
>   *	};
> - *	struct i915_user_extension ext1 {
> + *	struct xe_user_extension ext1 {
>   *		.next_extension = (uintptr_t)&ext2,
>   *		.name = ...,
>   *	};
>   *
> - * Typically the struct i915_user_extension would be embedded in some uAPI
> + * Typically the struct xe_user_extension would be embedded in some uAPI
>   * struct, and in this case we would feed it the head of the chain(i.e ext1),
>   * which would then apply all of the above extensions.
>   *
> @@ -77,7 +77,7 @@ struct xe_user_extension {
>  	/**
>  	 * @next_extension:
>  	 *
> -	 * Pointer to the next struct i915_user_extension, or zero if the end.
> +	 * Pointer to the next struct xe_user_extension, or zero if the end.
>  	 */
>  	__u64 next_extension;
>  	/**
> @@ -87,11 +87,11 @@ struct xe_user_extension {
>  	 *
>  	 * Also note that the name space for this is not global for the whole
>  	 * driver, but rather its scope/meaning is limited to the specific piece
> -	 * of uAPI which has embedded the struct i915_user_extension.
> +	 * of uAPI which has embedded the struct xe_user_extension.
>  	 */
>  	__u32 name;
>  	/**
> -	 * @flags: MBZ
> +	 * @pad: MBZ
>  	 *
>  	 * All undefined bits must be zero.
>  	 */
> @@ -99,7 +99,7 @@ struct xe_user_extension {
>  };
>  
>  /*
> - * i915 specific ioctls.
> + * xe specific ioctls.
>   *
>   * The device specific ioctl range is [DRM_COMMAND_BASE, DRM_COMMAND_END) ie
>   * [0x40, 0xa0) (a0 is excluded). The numbers below are defined as offset
> @@ -184,7 +184,8 @@ struct drm_xe_query_config {
>  #define XE_QUERY_CONFIG_VA_BITS			3
>  #define XE_QUERY_CONFIG_GT_COUNT		4
>  #define XE_QUERY_CONFIG_MEM_REGION_COUNT	5
> -#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MEM_REGION_COUNT + 1
> +#define XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY	6
> +#define XE_QUERY_CONFIG_NUM_PARAM		XE_QUERY_CONFIG_MAX_ENGINE_PRIORITY + 1
>  	__u64 info[];
>  };
>  
> @@ -290,6 +291,9 @@ struct drm_xe_gem_create {
>  	 */
>  	__u32 handle;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> @@ -334,6 +338,9 @@ struct drm_xe_ext_vm_set_property {
>  #define XE_VM_PROPERTY_BIND_OP_ERROR_CAPTURE_ADDRESS		0
>  	__u32 property;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @value: property value */
>  	__u64 value;
>  
> @@ -378,6 +385,9 @@ struct drm_xe_vm_bind_op {
>  	 */
>  	__u32 obj;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	union {
>  		/**
>  		 * @obj_offset: Offset into the object, MBZ for CLEAR_RANGE,
> @@ -397,10 +407,10 @@ struct drm_xe_vm_bind_op {
>  	__u64 addr;
>  
>  	/**
> -	 * @gt_mask: Mask for which GTs to create binds for, 0 == All GTs,
> +	 * @tile_mask: Mask for which tiles to create binds for, 0 == All tiles,
>  	 * only applies to creating new VMAs
>  	 */
> -	__u64 gt_mask;
> +	__u64 tile_mask;
>  
>  	/** @op: Operation to perform (lower 16 bits) and flags (upper 16 bits) */
>  	__u32 op;
> @@ -446,6 +456,14 @@ struct drm_xe_vm_bind_op {
>  	 * than differing the MAP to the page fault handler.
>  	 */
>  #define XE_VM_BIND_FLAG_IMMEDIATE	(0x1 << 18)
> +	/*
> +	 * When the NULL flag is set, the page tables are setup with a special
> +	 * bit which indicates writes are dropped and all reads return zero.  In
> +	 * the future, the NULL flags will only be valid for XE_VM_BIND_OP_MAP
> +	 * operations, the BO handle MBZ, and the BO offset MBZ. This flag is
> +	 * intended to implement VK sparse bindings.
> +	 */
> +#define XE_VM_BIND_FLAG_NULL		(0x1 << 19)
>  
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
> @@ -468,6 +486,9 @@ struct drm_xe_vm_bind {
>  	/** @num_binds: number of binds in this IOCTL */
>  	__u32 num_binds;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	union {
>  		/** @bind: used if num_binds == 1 */
>  		struct drm_xe_vm_bind_op bind;
> @@ -481,6 +502,9 @@ struct drm_xe_vm_bind {
>  	/** @num_syncs: amount of syncs to wait on */
>  	__u32 num_syncs;
>  
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
>  	/** @syncs: pointer to struct drm_xe_sync array */
>  	__u64 syncs;
>  
> @@ -496,6 +520,9 @@ struct drm_xe_ext_engine_set_property {
>  	/** @property: property to set */
>  	__u32 property;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @value: property value */
>  	__u64 value;
>  };
> @@ -611,6 +638,9 @@ struct drm_xe_sync {
>  #define DRM_XE_SYNC_USER_FENCE		0x3
>  #define DRM_XE_SYNC_SIGNAL		0x10
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	union {
>  		__u32 handle;
>  		/**
> @@ -655,6 +685,9 @@ struct drm_xe_exec {
>  	 */
>  	__u16 num_batch_buffer;
>  
> +	/** @pad: MBZ */
> +	__u16 pad[3];
> +
>  	/** @reserved: Reserved */
>  	__u64 reserved[2];
>  };
> @@ -717,6 +750,8 @@ struct drm_xe_wait_user_fence {
>  #define DRM_XE_UFENCE_WAIT_ABSTIME	(1 << 1)
>  #define DRM_XE_UFENCE_WAIT_VM_ERROR	(1 << 2)
>  	__u16 flags;
> +	/** @pad: MBZ */
> +	__u32 pad;
>  	/** @value: compare value */
>  	__u64 value;
>  	/** @mask: comparison mask */
> @@ -749,6 +784,9 @@ struct drm_xe_vm_madvise {
>  	/** @vm_id: The ID VM in which the VMA exists */
>  	__u32 vm_id;
>  
> +	/** @pad: MBZ */
> +	__u32 pad;
> +
>  	/** @range: Number of bytes in the VMA */
>  	__u64 range;
>  
> @@ -793,6 +831,9 @@ struct drm_xe_vm_madvise {
>  	/** @property: property to set */
>  	__u32 property;
>  
> +	/** @pad2: MBZ */
> +	__u32 pad2;
> +
>  	/** @value: property value */
>  	__u64 value;
>  
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 861822b48..c33fb199e 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -904,9 +904,10 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>  		bind_ops[i].obj_offset = 0;
>  		bind_ops[i].range = bo_size;
>  		bind_ops[i].addr = addr;
> -		bind_ops[i].gt_mask = 0x1 << eci->gt_id;
> +		bind_ops[i].tile_mask = 0x1 << eci->gt_id;
>  		bind_ops[i].op = XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC;
>  		bind_ops[i].region = 0;
> +		bind_ops[i].pad = 0;
>  		bind_ops[i].reserved[0] = 0;
>  		bind_ops[i].reserved[1] = 0;
>  
