Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8F210E277
 for <igt-dev@lists.freedesktop.org>; Mon, 29 May 2023 11:09:00 +0000 (UTC)
Date: Mon, 29 May 2023 13:08:56 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230529110856.wneo36ymuad4vztn@kamilkon-desk1>
References: <20230526172221.1438998-1-fei.yang@intel.com>
 <20230526172221.1438998-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230526172221.1438998-2-fei.yang@intel.com>
Subject: Re: [igt-dev] [PATCH v6 1/1] test/gem_create: exercise
 gem_create_ext_set_pat
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: fei.yang@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-05-26 at 10:22:21 -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Gem_create uAPI has been extended with capability of setting PAT index.
> Add a test case to exercise it.
> 
> PAT index is a page attribute that gets programmed into Page Table
> Entry (PTE) for caching policy control. Please refer to kernel patch
> for implementation details.
> 
> https://patchwork.freedesktop.org/series/116870/
> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  lib/i915/i915_drm_local.h | 34 +++++++++++++++++++++
>  tests/i915/gem_create.c   | 64 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 98 insertions(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index bb2ebef3..0f47578c 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -41,6 +41,40 @@ extern "C" {
>  #define __I915_PMU_RC6_RESIDENCY(gt)		___I915_PMU_OTHER(gt, 3)
>  #define __I915_PMU_SOFTWARE_GT_AWAKE_TIME(gt)	___I915_PMU_OTHER(gt, 4)
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
>  #if defined(__cplusplus)
>  }
>  #endif
> diff --git a/tests/i915/gem_create.c b/tests/i915/gem_create.c
> index 3320717f..e9e8216d 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -635,6 +635,66 @@ static void create_ext_placement_each(int fd)
>  	free(regions);
>  }
>  
> +/**
> +  * TEST: GEM create uAPI
> +  * Category: Infrastructure
> +  * Description: Tests the DRM_IOCTL_I915_GEM_CREATE_EXT ioctl.
> +  * Feature: core
> +  * Functionality: Create GEM object with specific PAT index
> +  * Run type: BAT
> +  * Sub-category: i915
> +  * Test category: GEM_Legacy
> +  *
> +  * SUBTEST: create-ext-set-pat
> +  */
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
> +	/*
> +	 * With a valid PAT index specified, returning -EINVAL here
> +	 * indicates set_pat extension is not supported
> +	 */
> +	if (ret == -EINVAL)
> +		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
> +	igt_assert(ret == 0);
> +
> +	/*
> +	 * {set|get}_caching ioctl should fail for objects created with set_pat
> +	 * Also note, dGPU doesn't support {set|get}_caching ioctl, so checking
> +	 * this for iGPU only.
> +	 */
> +	if (!gem_has_lmem(fd)) {
> +		igt_assert_eq(__gem_set_caching(fd, handle, 1), -EOPNOTSUPP);
> +
> +		memset(&arg, 0, sizeof(arg));
> +		arg.handle = handle;
> +		igt_assert(ioctl(fd, DRM_IOCTL_I915_GEM_GET_CACHING, &arg) < 0 &&
> +			   errno == EOPNOTSUPP);
> +	}
> +
> +	/* gem_create should fail with -EINVAL if invalid pat index specified */
> +	igt_assert_eq(__gem_create_ext(fd, &size, 0, &handle, &setparam_inv_pat.base),
> +		      -EINVAL);
> +
> +	gem_close(fd, handle);
> +}
> +
>  static bool supports_needs_cpu_access(int fd)
>  {
>  	struct drm_i915_gem_memory_class_instance regions[] = {
> @@ -995,6 +1055,10 @@ igt_main
>  	igt_subtest("create-ext-placement-all")
>  		create_ext_placement_all(fd);
>  
> +	igt_describe("Validate basic creation of objects with PAT cache setting.");
> +	igt_subtest("create-ext-set-pat")
> +		create_ext_set_pat(fd);
> +
>  	igt_describe("Verify the basic functionally and expected ABI contract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>  	igt_subtest("create-ext-cpu-access-sanity-check") {
>  		igt_require(supports_needs_cpu_access(fd));
> -- 
> 2.25.1
> 
