Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AAAB6E0FD
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 12:41:47 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so21492388wrs.11
 for <igt-dev@lists.freedesktop.org>; Wed, 29 Jul 2020 05:41:47 -0700 (PDT)
Date: Wed, 29 Jul 2020 14:41:43 +0200
From: daniel@ffwll.ch
Message-ID: <20200729124143.GM6419@phenom.ffwll.local>
References: <20200708132015.334750-1-lionel.g.landwerlin@intel.com>
 <20200708132015.334750-2-lionel.g.landwerlin@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200708132015.334750-2-lionel.g.landwerlin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/5] drm-uapi: bump i915_drm.h for
 timeline semaphores
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: 
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Jul 08, 2020 at 04:20:11PM +0300, Lionel Landwerlin wrote:
> To be updated with proper drm-next snapshot.

I'm assuming you'll respin this with the right sha1 once the kernel side
has made it into drm-next? With that

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  include/drm-uapi/i915_drm.h | 65 +++++++++++++++++++++++++++++++++++--
>  1 file changed, 62 insertions(+), 3 deletions(-)
> 
> diff --git a/include/drm-uapi/i915_drm.h b/include/drm-uapi/i915_drm.h
> index 2b55af13..6de897f0 100644
> --- a/include/drm-uapi/i915_drm.h
> +++ b/include/drm-uapi/i915_drm.h
> @@ -619,6 +619,13 @@ typedef struct drm_i915_irq_wait {
>   */
>  #define I915_PARAM_PERF_REVISION	54
>  
> +/* Query whether DRM_I915_GEM_EXECBUFFER2 supports supplying an array of
> + * timeline syncobj through drm_i915_gem_execbuf_ext_timeline_fences. See
> + * I915_EXEC_USE_EXTENSIONS.
> + */
> +#define I915_PARAM_HAS_EXEC_TIMELINE_FENCES 55
> +
> +
>  /* Must be kept compact -- no holes and well documented */
>  
>  typedef struct drm_i915_getparam {
> @@ -1046,6 +1053,42 @@ struct drm_i915_gem_exec_fence {
>  	__u32 flags;
>  };
>  
> +enum drm_i915_gem_execbuffer_ext {
> +	/**
> +	 * See drm_i915_gem_execbuf_ext_timeline_fences.
> +	 */
> +	DRM_I915_GEM_EXECBUFFER_EXT_TIMELINE_FENCES = 1,
> +
> +	DRM_I915_GEM_EXECBUFFER_EXT_MAX /* non-ABI */
> +};
> +
> +/**
> + * This structure describes an array of drm_syncobj and associated points for
> + * timeline variants of drm_syncobj. It is invalid to append this structure to
> + * the execbuf if I915_EXEC_FENCE_ARRAY is set.
> + */
> +struct drm_i915_gem_execbuffer_ext_timeline_fences {
> +	struct i915_user_extension base;
> +
> +	/**
> +	 * Number of element in the handles_ptr & value_ptr arrays.
> +	 */
> +	__u64 fence_count;
> +
> +	/**
> +	 * Pointer to an array of struct drm_i915_gem_exec_fence of length
> +	 * fence_count.
> +	 */
> +	__u64 handles_ptr;
> +
> +	/**
> +	 * Pointer to an array of u64 values of length fence_count. Values
> +	 * must be 0 for a binary drm_syncobj. A Value of 0 for a timeline
> +	 * drm_syncobj is invalid as it turns a drm_syncobj into a binary one.
> +	 */
> +	__u64 values_ptr;
> +};
> +
>  struct drm_i915_gem_execbuffer2 {
>  	/**
>  	 * List of gem_exec_object2 structs
> @@ -1062,8 +1105,15 @@ struct drm_i915_gem_execbuffer2 {
>  	__u32 num_cliprects;
>  	/**
>  	 * This is a struct drm_clip_rect *cliprects if I915_EXEC_FENCE_ARRAY
> -	 * is not set.  If I915_EXEC_FENCE_ARRAY is set, then this is a
> -	 * struct drm_i915_gem_exec_fence *fences.
> +	 * & I915_EXEC_USE_EXTENSIONS are not set.
> +	 *
> +	 * If I915_EXEC_FENCE_ARRAY is set, then this is a pointer to an array
> +	 * of struct drm_i915_gem_exec_fence and num_cliprects is the length
> +	 * of the array.
> +	 *
> +	 * If I915_EXEC_USE_EXTENSIONS is set, then this is a pointer to a
> +	 * single struct drm_i915_gem_base_execbuffer_ext and num_cliprects is
> +	 * 0.
>  	 */
>  	__u64 cliprects_ptr;
>  #define I915_EXEC_RING_MASK              (0x3f)
> @@ -1181,7 +1231,16 @@ struct drm_i915_gem_execbuffer2 {
>   */
>  #define I915_EXEC_FENCE_SUBMIT		(1 << 20)
>  
> -#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_FENCE_SUBMIT << 1))
> +/*
> + * Setting I915_EXEC_USE_EXTENSIONS implies that
> + * drm_i915_gem_execbuffer2.cliprects_ptr is treated as a pointer to an linked
> + * list of i915_user_extension. Each i915_user_extension node is the base of a
> + * larger structure. The list of supported structures are listed in the
> + * drm_i915_gem_execbuffer_ext enum.
> + */
> +#define I915_EXEC_USE_EXTENSIONS	(1 << 21)
> +
> +#define __I915_EXEC_UNKNOWN_FLAGS (-(I915_EXEC_USE_EXTENSIONS<<1))
>  
>  #define I915_EXEC_CONTEXT_ID_MASK	(0xffffffff)
>  #define i915_execbuffer2_set_context_id(eb2, context) \
> -- 
> 2.27.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
