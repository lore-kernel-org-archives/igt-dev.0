Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9A6089CDF
 for <igt-dev@lists.freedesktop.org>; Tue, 28 Sep 2021 06:52:46 +0000 (UTC)
Date: Tue, 28 Sep 2021 08:52:41 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20210928065241.GA4608@zkempczy-mobl2>
References: <20210928031100.34317-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210928031100.34317-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Return allocated size in
 gem_create_in_memory_regions() and friends
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
Cc: igt-dev@lists.freedesktop.org, Andrzej Turko <andrzej.turko@linux.intel.com>, John Harrison <John.C.Harrison@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Sep 27, 2021 at 08:11:00PM -0700, Ashutosh Dixit wrote:
> Often the allocated size is of interest and is different from the
> requested size. Therefore return allocated size for the object (by
> __gem_create_ext()) in gem_create_in_memory_regions() and friends.
> 
> Cc: Andrzej Turko <andrzej.turko@linux.intel.com>
> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Cc: John Harrison <John.C.Harrison@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 6 +++---
>  lib/i915/intel_memory_region.h | 4 ++--
>  lib/intel_bufops.c             | 2 +-
>  lib/ioctl_wrappers.c           | 2 +-
>  tests/i915/gem_exec_basic.c    | 6 +++---
>  tests/i915/gem_gpgpu_fill.c    | 3 ++-
>  tests/i915/gem_media_fill.c    | 3 ++-
>  tests/kms_addfb_basic.c        | 2 +-
>  tests/kms_prime.c              | 4 ++--
>  9 files changed, 17 insertions(+), 15 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index 3de40549319..e59801a4cab 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -183,7 +183,7 @@ bool gem_has_lmem(int fd)
>  
>  /* A version of gem_create_in_memory_region_list which can be allowed to
>     fail so that the object creation can be retried */
> -int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
> +int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
>  				       struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions)
>  {
> @@ -193,7 +193,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
>  		.regions = to_user_pointer(mem_regions),
>  	};
>  
> -	return __gem_create_ext(fd, &size, handle, &ext_regions.base);
> +	return __gem_create_ext(fd, size, handle, &ext_regions.base);
>  }
>  
>  /* gem_create_in_memory_region_list:
> @@ -202,7 +202,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
>   * @mem_regions: memory regions array (priority list)
>   * @num_regions: @mem_regions length
>   */
> -uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
> +uint32_t gem_create_in_memory_region_list(int fd, uint64_t *size,
>  					  struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions)
>  {
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index 70b74944b51..bf75831ccba 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -64,11 +64,11 @@ bool gem_has_lmem(int fd);
>  
>  struct drm_i915_gem_memory_class_instance;
>  
> -int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t size,
> +int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
>  				       struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions);
>  
> -uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
> +uint32_t gem_create_in_memory_region_list(int fd, uint64_t *size,
>  					  struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions);
>  
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index d1395c1605d..52794c1ac10 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -819,7 +819,7 @@ static void __intel_buf_init(struct buf_ops *bops,
>  	if (handle)
>  		buf->handle = handle;
>  	else {
> -		if (!__gem_create_in_memory_regions(bops->fd, &handle, size, region))
> +		if (!__gem_create_in_memory_regions(bops->fd, &handle, &size, region))
>  			buf->handle = handle;
>  		else
>  			buf->handle = gem_create(bops->fd, size);

As size can be different we pass we should update buf->size accordingly.
Look at few lines above:

	/* Store real bo size to avoid mistakes in calculating it again */
	buf->size = size;

I think these lines can be moved at the bottom of the condition.

buf->size is returned as a call to intel_buf_bo_size() and used in
intel_bb_add_object(). This can be important for no-reloc mode to avoid
overlapping object on softpin and hitting -ENOSPC.

--
Zbigniew 

> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 09eb3ce7b57..4d628e50aca 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -635,7 +635,7 @@ uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size)
>  	uint32_t handle;
>  
>  	if (gem_has_lmem(fd))
> -		handle = gem_create_in_memory_regions(fd, size, REGION_LMEM(0));
> +		handle = gem_create_in_memory_regions(fd, &size, REGION_LMEM(0));
>  	else
>  		handle = gem_create(fd, size);
>  
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 008a35d0ae9..04e2209cab4 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -28,12 +28,12 @@
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
>  
> -static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
> +static uint32_t batch_create(int fd, uint64_t batch_size, uint32_t region)
>  {
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t handle;
>  
> -	handle = gem_create_in_memory_regions(fd, batch_size, region);
> +	handle = gem_create_in_memory_regions(fd, &batch_size, region);
>  	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>  
>  	return handle;
> @@ -44,7 +44,7 @@ igt_main
>  	const struct intel_execution_engine2 *e;
>  	struct drm_i915_query_memory_regions *query_info;
>  	struct igt_collection *regions, *set;
> -	uint32_t batch_size;
> +	uint64_t batch_size;
>  	const intel_ctx_t *ctx;
>  	int fd = -1;
>  
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index 74a227f678e..76f4d7c61c8 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -68,6 +68,7 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	struct intel_buf *buf;
>  	uint8_t *ptr;
>  	uint32_t handle;
> +	uint64_t size = SIZE;
>  	int i;
>  
>  	buf = calloc(1, sizeof(*buf));
> @@ -77,7 +78,7 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	 * Legacy code uses 32 bpp after buffer creation.
>  	 * Let's do the same due to keep shader intact.
>  	 */
> -	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
> +	handle = gem_create_in_memory_regions(data->drm_fd, &size, region);
>  	intel_buf_init_using_handle(data->bops, handle, buf,
>  				    width/4, height, 32, 0,
>  				    I915_TILING_NONE, 0);
> diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
> index 1d08df2473d..3d7d6fa2b0f 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -69,12 +69,13 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	struct intel_buf *buf;
>  	uint32_t handle;
>  	uint8_t *ptr;
> +	uint64_t size = SIZE;
>  	int i;
>  
>  	buf = calloc(1, sizeof(*buf));
>  	igt_assert(buf);
>  
> -	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
> +	handle = gem_create_in_memory_regions(data->drm_fd, &size, region);
>  
>  	/*
>  	 * Legacy code uses 32 bpp after buffer creation.
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 55f4852da16..62fa78a5da9 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -158,7 +158,7 @@ static void invalid_tests(int fd)
>  		igt_require(gem_has_lmem(fd));
>  		igt_calc_fb_size(fd, f.width, f.height,
>  				DRM_FORMAT_XRGB8888, 0, &size, &stride);
> -		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
> +		handle = gem_create_in_memory_regions(fd, &size, REGION_SMEM);
>  		f.handles[0] = handle;
>  		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
>  	}
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index 5cdb559778b..ea459414901 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -112,10 +112,10 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>  		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>  				 DRM_FORMAT_MOD_NONE, &scratch->size, &scratch->pitch);
>  		if (gem_has_lmem(exporter_fd))
> -			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
> +			scratch->handle = gem_create_in_memory_regions(exporter_fd, &scratch->size,
>  								       REGION_LMEM(0), REGION_SMEM);
>  		else
> -			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
> +			scratch->handle = gem_create_in_memory_regions(exporter_fd, &scratch->size,
>  								       REGION_SMEM);
>  
>  		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
> -- 
> 2.33.0
> 
