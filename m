Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BEE10E3D3
 for <igt-dev@lists.freedesktop.org>; Wed, 17 May 2023 09:31:11 +0000 (UTC)
Date: Wed, 17 May 2023 11:31:08 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230517093108.qqxjt2dap746ysx7@kamilkon-desk1>
References: <20230516181646.1372351-1-fei.yang@intel.com>
 <20230516181646.1372351-2-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230516181646.1372351-2-fei.yang@intel.com>
Subject: Re: [igt-dev] [PATCH v4 1/1] test/gem_create: exercise
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

Hi Fei,

On 2023-05-16 at 11:16:46 -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> Gem_create uAPI has been extended with capability of setting PAT index.

Please decipher here what is the meaning of PAT.

> Add a test case to exercise this new extension.
----------------------------- ^^^^^^^^^^^^^^^^^^
s/this new extension/it/

Please also put here link to proposed kernel patch which
adds PAT index extension and subject line of e-mail (links can breake
in future).

> 
> Signed-off-by: Fei Yang <fei.yang@intel.com>
> ---
>  lib/i915/i915_drm_local.h | 34 ++++++++++++++++++++++++++++
>  tests/i915/gem_create.c   | 47 +++++++++++++++++++++++++++++++++++++++
>  2 files changed, 81 insertions(+)
> 
> diff --git a/lib/i915/i915_drm_local.h b/lib/i915/i915_drm_local.h
> index af017650..35929a0c 100644
> --- a/lib/i915/i915_drm_local.h
> +++ b/lib/i915/i915_drm_local.h
> @@ -26,6 +26,40 @@ extern "C" {
>  #define DRM_I915_PERF_PROP_OA_ENGINE_CLASS	9
>  #define DRM_I915_PERF_PROP_OA_ENGINE_INSTANCE	10
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
> index c719ab6c..b2de84b8 100644
> --- a/tests/i915/gem_create.c
> +++ b/tests/i915/gem_create.c
> @@ -537,6 +537,48 @@ static void create_ext_placement_each(int fd)
>  	free(regions);
>  }

Please also see patchseries from Mauro with new descriptions,
maybe it is worth adding them here.

https://patchwork.freedesktop.org/series/117382/
Better document i915 tests

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
> +	/*
> +	 * With a valida PAT index specified, returning -EINVAL here
-----------------------^
s/valida/valid/

> +	 * indicates set_pat extension is not supported
> +	 */
> +	if (ret == -EINVAL)
> +		igt_skip("I915_GEM_CREATE_EXT_SET_PAT is not supported\n");
> +	igt_assert(ret == 0);
> +
> +	/* {set|get}_caching ioctl should fail for objects created with set_pat */
> +	igt_assert(__gem_set_caching(fd, handle, 1) == -EOPNOTSUPP);

imho better use igt_assert_eq to see actual return value if failed.
Even better will be to use igt_assert_f and describe what failed
and print errno (here and below).

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
>  static bool supports_needs_cpu_access(int fd)
>  {
>  	struct drm_i915_gem_memory_class_instance regions[] = {
> @@ -897,6 +939,11 @@ igt_main
>  	igt_subtest("create-ext-placement-all")
>  		create_ext_placement_all(fd);
>  
> +	igt_describe("Create objects with specific cache setting"
> +		     " create-ext.");

Why not in one single line ? btw imho better:

	igt_describe("Validate basic creation of objects with PAT cache setting.");

Regards,
Kamil

> +	igt_subtest("create-ext-set-pat")
> +		    create_ext_set_pat(fd);
> +
>  	igt_describe("Verify the basic functionally and expected ABI contract around I915_GEM_CREATE_EXT_FLAG_NEEDS_CPU_ACCESS");
>  	igt_subtest("create-ext-cpu-access-sanity-check") {
>  		igt_require(supports_needs_cpu_access(fd));
> -- 
> 2.25.1
> 
