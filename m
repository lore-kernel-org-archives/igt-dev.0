Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B86D10E1A5
 for <igt-dev@lists.freedesktop.org>; Mon, 15 May 2023 10:49:58 +0000 (UTC)
Message-ID: <4e39db9d-61ff-a5d1-6b68-d1f25e020d02@linux.intel.com>
Date: Mon, 15 May 2023 11:49:55 +0100
MIME-Version: 1.0
Content-Language: en-US
To: fei.yang@intel.com, igt-dev@lists.freedesktop.org
References: <20230512175108.1171586-1-fei.yang@intel.com>
 <20230512175108.1171586-2-fei.yang@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20230512175108.1171586-2-fei.yang@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH v3 1/1] test/gem_create: exercise
 gem_create_ext_set_pat
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On 12/05/2023 18:51, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Gem_create uAPI has been extended with capability of setting PAT index.
> Add a test case to exercise this new extension.
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>   lib/i915/i915_drm_local.h | 34 ++++++++++++++++++++++++++++++
>   tests/i915/gem_create.c   | 44 +++++++++++++++++++++++++++++++++++++++
>   2 files changed, 78 insertions(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index af017650..35929a0c 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -26,6 +26,40 @@ extern "C" {
>   #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
>   #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
>   
> +#define I915_GEM_CREATE_EXT_SET_PAT 2
> +
> +/**
> + * struct drm_i915_gem_create_ext_set_pat - The
> + * I915_GEM_CREATE_EXT_SET_PAT extension.
> + *
> + * If this extension is provided, the specified caching policy (PAT index) is
> + * applied to the buffer object.
> + *
> + * Below is an example on how to create an object with specific caching policy:
> + *
> + * .. code-block:: C
> + *
> + *	struct drm_i915_gem_create_ext_set_pat set_pat_ext = {
> + *		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> + *		.pat_index = 0,
> + *	};
> + *	struct drm_i915_gem_create_ext create_ext = {
> + *		.size = PAGE_SIZE,
> + *		.extensions = (uintptr_t)&set_pat_ext,
> + *	};
> + *
> + *	int err = ioctl(fd, DRM_IOCTL_I915_GEM_CREATE_EXT, &create_ext);
> + *	if (err) ...
> + */
> +struct drm_i915_gem_create_ext_set_pat {
> +	/** @base: Extension link. See struct i915_user_extension. */
> +	struct i915_user_extension base;
> +	/** @pat_index: PAT index to be set */
> +	__u32 pat_index;
> +	/** @rsvd: reserved for future use */
> +	__u32 rsvd;
> +};
> +
>   #if defined(__cplusplus)
>   }
>   #endif
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index c719ab6c..20c71afb 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -537,6 +537,45 @@ static void create_ext_placement_each(int fd)
>   	free(regions);
>   }
>   
> +static void create_ext_set_pat(int fd)
> +{
> +	struct drm_i915_gem_create_ext_set_pat setparam_pat = {
> +		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> +		.pat_index = 0,
> +	};
> +	struct drm_i915_gem_create_ext_set_pat setparam_inv_pat = {
> +		.base = { .name = I915_GEM_CREATE_EXT_SET_PAT },
> +		.pat_index = 65,
> +	};
> +	struct drm_i915_gem_caching arg;
> +	uint64_t size;
> +	uint32_t handle;
> +	int ret;
> +
> +	size = PAGE_SIZE;
> +
> +	ret = __gem_create_ext(fd, &size, 0, &handle, &setparam_pat.base);
> +
> +	/* Returning -EFAULT indicates set_pat extension is not supported */
> +	if (ret == -EFAULT)
> +		igt_info("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");

Is this correct? EFAULT should be data access issues while unsupported 
extensions should be EINVAL.

> +	igt_assert(ret == 0);

Extension not supported should be a skip I would say.

EFAULT test is then something else, ie. hitting this path from the 
kernel ioctl handler:

ext_set_pat()
...
+	if (copy_from_user(&ext, base, sizeof(ext)))
+		return -EFAULT;

> +
> +	/* {set|get}_caching ioctl should fail for objects created with set_pat */
> +	igt_assert(__gem_set_caching(fd, handle, 1) == -EOPNOTSUPP);

Easy to test get too as the comment suggests?

Regards,

Tvrtko

> +
> +	memset(&arg, 0, sizeof(arg));
> +	arg.handle = handle;
> +	igt_assert(ioctl(fd, DRM_IOCTL_I915_GEM_GET_CACHING, &arg) < 0 &&
> +		   errno == EOPNOTSUPP);
> +
> +	/* gem_create should fail with -EINVAL if invalid pat index specified */
> +	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle, &setparam_inv_pat.base),
> +		      -EINVAL);
> +
> +	gem_close(fd, handle);
> +}
> +
>   static bool supports_needs_cpu_access(int fd)
>   {
>   	struct drm_i915_gem_memory_class_instance regions[] = {
> @@ -897,6 +936,11 @@ igt_main
>   	igt_subtest("create-ext-placement-all")
>   		create_ext_placement_all(fd);
>   
> +	igt_describe("Create objects with specific cache setting"
> +		     " create-ext.");
> +	igt_subtest("create-ext-set-pat")
> +		    create_ext_set_pat(fd);
> +
>   	igt_describe("Verify the basic functionally and expected ABI contract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>   	igt_subtest("create-ext-cpu-access-sanity-check") {
>   		igt_require(supports_needs_cpu_access(fd));
