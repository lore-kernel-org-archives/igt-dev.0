Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C88410E61A
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Apr 2023 08:25:02 +0000 (UTC)
Date: Tue, 4 Apr 2023 10:24:57 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: Vikas Srivastava <vikas.srivastava@intel.com>
Message-ID: <20230404082457.xk37eutjoafvqtci@kamilkon-desk1>
References: <20230331124717.3005947-1-vikas.srivastava@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230331124717.3005947-1-vikas.srivastava@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v4] tests/i915: skip gem_set_caching
 call for mtl
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

On 2023-03-31 at 18:17:17 +0530, Vikas Srivastava wrote:
> Call to gem_set_caching skips the test since i915_gem_set_caching_ioctl is
> deprecated for MTL. To avoid this add the check for set caching supported
> platforms.
> 
> FIXME: This is a temp solution to fix the IGT test issues where
> set caching call is used , there is alternate API available
> but support not yet available to use that.Once set_pat_index
> support available need to bring that change replacing this one.
> 
> Signed-off-by: Vikas Srivastava <vikas.srivastava@intel.com>

imho there may be added some improvements later, as it not touches
existing platforms other than MTL:

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> ---
>  lib/ioctl_wrappers.c                | 14 ++++++++++++++
>  lib/ioctl_wrappers.h                |  1 +
>  tests/i915/gem_caching.c            |  5 +++++
>  tests/i915/gem_exec_flush.c         |  6 ++++--
>  tests/i915/gem_exec_latency.c       |  3 ++-
>  tests/i915/gem_exec_suspend.c       |  6 ++++--
>  tests/i915/gem_render_tiled_blits.c |  3 ++-
>  tests/i915/gem_softpin.c            |  3 ++-
>  tests/i915/gem_userptr_blits.c      | 11 ++++++++---
>  tests/i915/gem_workarounds.c        |  6 ++++--
>  tests/i915/i915_pm_rpm.c            |  7 ++++---
>  tests/prime_vgem.c                  |  3 ++-
>  12 files changed, 52 insertions(+), 16 deletions(-)
> 
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 1ab41ab6d6..ebd8a2f36f 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -1297,3 +1297,17 @@ bool igt_has_drm_cap(int fd, uint64_t capability)
>  	igt_assert(drmIoctl(fd, DRM_IOCTL_GET_CAP, &cap) == 0);
>  	return cap.value;
>  }
> +
> +/**
> + * igt_has_set_caching:
> + * @devid: platform id.
> + *
> + * This helper verifies if the passed platform id
> + * has support for setting cache.
> + *
> + * Returns: Whether the cache setting  is supported or not.
> + */
> +bool igt_has_set_caching(uint32_t devid)
> +{
> +	return IS_METEORLAKE(devid) ? false : true;
> +}
> diff --git a/lib/ioctl_wrappers.h b/lib/ioctl_wrappers.h
> index e4d7c0d408..4c232078d0 100644
> --- a/lib/ioctl_wrappers.h
> +++ b/lib/ioctl_wrappers.h
> @@ -145,6 +145,7 @@ void prime_sync_end(int dma_buf_fd, bool write);
>  bool igt_has_fb_modifiers(int fd);
>  void igt_require_fb_modifiers(int fd);
>  bool igt_has_drm_cap(int fd, uint64_t capability);
> +bool igt_has_set_caching(uint32_t devid);
>  
>  /**
>   * __kms_addfb:
> diff --git a/tests/i915/gem_caching.c b/tests/i915/gem_caching.c
> index eb0170abca..d0c7aa035f 100644
> --- a/tests/i915/gem_caching.c
> +++ b/tests/i915/gem_caching.c
> @@ -158,6 +158,11 @@ igt_main
>  			igt_info("coherency broken on i965g/gm\n");
>  			flags = 0;
>  		}
> +
> +		if (!gem_has_lmem(data.fd))
> +			igt_require_f(igt_has_set_caching(data.devid),
> +				      " cache setting not supported on this target\n");
> +
>  		data.bops = buf_ops_create(data.fd);
>  
>  		scratch_buf = intel_buf_create(data.bops, BO_SIZE/4, 1,
> diff --git a/tests/i915/gem_exec_flush.c b/tests/i915/gem_exec_flush.c
> index bb120e0d6c..42ddbc529e 100644
> --- a/tests/i915/gem_exec_flush.c
> +++ b/tests/i915/gem_exec_flush.c
> @@ -142,7 +142,8 @@ static void run(int fd, unsigned ring, int nchild, int timeout,
>  				       I915_GEM_DOMAIN_WC);
>  		} else {
>  			snoop = flags & COHERENT;
> -			gem_set_caching(fd, obj[0].handle, snoop);
> +			if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +				gem_set_caching(fd, obj[0].handle, snoop);
>  			map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
>  			gem_set_domain(fd, obj[0].handle,
>  				       I915_GEM_DOMAIN_CPU,
> @@ -401,7 +402,8 @@ static void batch(int fd, unsigned ring, int nchild, int timeout,
>  		obj[0].handle = gem_create(fd, 4096);
>  		obj[0].flags |= EXEC_OBJECT_WRITE;
>  
> -		gem_set_caching(fd, obj[0].handle, !!(flags & COHERENT));
> +		if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +			gem_set_caching(fd, obj[0].handle, !!(flags & COHERENT));
>  		map = gem_mmap__cpu(fd, obj[0].handle, 0, 4096, PROT_WRITE);
>  
>  		gem_set_domain(fd, obj[0].handle,
> diff --git a/tests/i915/gem_exec_latency.c b/tests/i915/gem_exec_latency.c
> index fcdf7787b8..4838a70820 100644
> --- a/tests/i915/gem_exec_latency.c
> +++ b/tests/i915/gem_exec_latency.c
> @@ -770,7 +770,8 @@ static void context_switch(int i915, const intel_ctx_t *ctx,
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = gem_create(i915, 4096);
> -	gem_set_caching(i915, obj[0].handle, 1);
> +	if (igt_has_set_caching(intel_get_drm_devid(i915)))
> +		gem_set_caching(i915, obj[0].handle, 1);
>  	results = gem_mmap__cpu(i915, obj[0].handle, 0, 4096, PROT_READ);
>  	gem_set_domain(i915, obj[0].handle, I915_GEM_DOMAIN_CPU, 0);
>  
> diff --git a/tests/i915/gem_exec_suspend.c b/tests/i915/gem_exec_suspend.c
> index 1dadf06df0..8d56093faa 100644
> --- a/tests/i915/gem_exec_suspend.c
> +++ b/tests/i915/gem_exec_suspend.c
> @@ -116,8 +116,10 @@ static void run_test(int fd, const intel_ctx_t *ctx,
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = gem_create_in_memory_regions(fd, 4096, region);
> -	if (!gem_has_lmem(fd))
> -		gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
> +	if (!gem_has_lmem(fd)) {
> +		if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +			gem_set_caching(fd, obj[0].handle, !!(flags & CACHED));
> +	}
>  	obj[0].flags |= EXEC_OBJECT_WRITE;
>  	obj[1].handle = gem_create_in_memory_regions(fd, 4096, region);
>  	gem_write(fd, obj[1].handle, 0, &bbe, sizeof(bbe));
> diff --git a/tests/i915/gem_render_tiled_blits.c b/tests/i915/gem_render_tiled_blits.c
> index eae06a332e..3becf576fe 100644
> --- a/tests/i915/gem_render_tiled_blits.c
> +++ b/tests/i915/gem_render_tiled_blits.c
> @@ -117,7 +117,8 @@ static void run_test (int fd, int count)
>  	intel_buf_init(bops, &linear, WIDTH, HEIGHT, 32, 0,
>  		       I915_TILING_NONE, I915_COMPRESSION_NONE);
>  	if (snoop) {
> -		gem_set_caching(fd, linear.handle, 1);
> +		if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +			gem_set_caching(fd, linear.handle, 1);
>  		igt_info("Using a snoop linear buffer for comparisons\n");
>  	}
>  
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 7682f772a1..8717860b2d 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -525,7 +525,8 @@ static void test_evict_snoop(int fd, unsigned int flags)
>  	/* Create a snoop + uncached pair */
>  	object[0].handle = gem_create(fd, 4096);
>  	object[0].flags = EXEC_OBJECT_PINNED;
> -	gem_set_caching(fd, object[0].handle, 1);
> +	if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +		gem_set_caching(fd, object[0].handle, 1);
>  	object[1].handle = gem_create(fd, 4096);
>  	object[1].flags = EXEC_OBJECT_PINNED;
>  	gem_write(fd, object[1].handle, 4096-sizeof(bbe), &bbe, sizeof(bbe));
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index 07a453229a..b97e541118 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -1147,8 +1147,10 @@ static void test_relocations(int fd)
>  	memset(&obj, 0, sizeof(obj));
>  	igt_assert(posix_memalign(&ptr, PAGE_SIZE, size) == 0);
>  	gem_userptr(fd, ptr, size, 0, userptr_flags, &obj.handle);
> -	if (!gem_has_llc(fd))
> -		gem_set_caching(fd, obj.handle, 0);
> +	if (!gem_has_llc(fd)) {
> +		if (igt_has_set_caching(intel_get_drm_devid(fd)))
> +			gem_set_caching(fd, obj.handle, 0);
> +	}
>  	*(uint32_t *)ptr = MI_BATCH_BUFFER_END;
>  
>  	reloc = (typeof(reloc))((char *)ptr + PAGE_SIZE);
> @@ -2417,8 +2419,11 @@ igt_main_args("c:", NULL, help_str, opt_handler, NULL)
>  			test_sd_probe(fd);
>  		}
>  
> -		igt_subtest("set-cache-level")
> +		igt_subtest("set-cache-level") {
> +			igt_require_f(igt_has_set_caching(intel_get_drm_devid(fd)),
> +				      "set_caching not supported on this platform");
>  			test_set_caching(fd);
> +		}
>  
>  		igt_subtest("userfault")
>  			test_userfault(fd);
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index 30c68d1ac9..7d11996254 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -106,8 +106,10 @@ static int workaround_fail_count(int i915, const intel_ctx_t *ctx)
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[0].handle = gem_create(i915, result_sz);
> -	if (!gem_has_lmem(i915))
> -		gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
> +	if (!gem_has_lmem(i915)) {
> +		if (igt_has_set_caching(intel_get_drm_devid(i915)))
> +			gem_set_caching(i915, obj[0].handle, I915_CACHING_CACHED);
> +	}
>  	obj[1].handle = gem_create(i915, batch_sz);
>  	obj[1].relocs_ptr = to_user_pointer(reloc);
>  	obj[1].relocation_count = !ahnd ? num_wa_regs : 0;
> diff --git a/tests/i915/i915_pm_rpm.c b/tests/i915/i915_pm_rpm.c
> index 74935430c1..9a6408dd37 100644
> --- a/tests/i915/i915_pm_rpm.c
> +++ b/tests/i915/i915_pm_rpm.c
> @@ -1995,8 +1995,8 @@ static void pm_test_caching(void)
>  
>  	for (i = 0; i < ARRAY_SIZE(cache_levels); i++) {
>  		igt_assert(wait_for_suspended());
> -		gem_set_caching(drm_fd, handle, default_cache_level);
> -
> +		if (igt_has_set_caching(intel_get_drm_devid(drm_fd)))
> +			gem_set_caching(drm_fd, handle, default_cache_level);
>  		/* Ensure we bind the vma into the GGTT */
>  		memset(gem_buf, 16 << i, gtt_obj_max_size);
>  
> @@ -2008,7 +2008,8 @@ static void pm_test_caching(void)
>  		 */
>  		igt_debug("Setting cache level %u\n", cache_levels[i]);
>  		igt_assert(wait_for_suspended());
> -		gem_set_caching(drm_fd, handle, cache_levels[i]);
> +		if (igt_has_set_caching(intel_get_drm_devid(drm_fd)))
> +			gem_set_caching(drm_fd, handle, cache_levels[i]);
>  	}
>  
>  	igt_assert(munmap(gem_buf, gtt_obj_max_size) == 0);
> diff --git a/tests/prime_vgem.c b/tests/prime_vgem.c
> index 7b473c03df..9aa767c9cd 100644
> --- a/tests/prime_vgem.c
> +++ b/tests/prime_vgem.c
> @@ -330,7 +330,8 @@ static void test_userptr(int vgem, int i915)
>  	*ptr = MI_BATCH_BUFFER_END;
>  
>  	gem_userptr(i915, ptr, scratch.size, 0, 0, &obj.handle);
> -	gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
> +	if (igt_has_set_caching(intel_get_drm_devid(i915)))
> +		gem_set_caching(i915, obj.handle, I915_CACHING_NONE); /* for !llc exec */
>  
>  	gem_execbuf(i915, &execbuf);
>  	gem_close(i915, obj.handle);
> -- 
> 2.25.1
> 
