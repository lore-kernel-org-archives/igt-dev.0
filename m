Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 278B46E15E
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 04:44:10 +0000 (UTC)
Date: Mon, 4 Oct 2021 06:44:04 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211004044404.GC3975@zkempczy-mobl2>
References: <20211004042002.72534-1-ashutosh.dixit@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211004042002.72534-1-ashutosh.dixit@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib: Partially revert 22643ce4014a
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Sun, Oct 03, 2021 at 09:20:02PM -0700, Ashutosh Dixit wrote:
> In 22643ce4014a ("Return allocated size in gem_create_in_memory_regions()
> and friends") we modified __gem_create_in_memory_regions and
> gem_create_in_memory_regions to return the allocated size for buffer
> objects. However, this also unnecessarily complicates programming in the
> majority of cases where the allocated size is not needed. For example in
> several cases it requires tracking the requested and allocated sizes
> separately, the size used must be strictly uint64_t etc.
> 
> In order to simplify things and provide greater flexibility, here we change
> 22643ce4014a to follow the same scheme followed in gem_create_ext (and in
> gem_create) where __gem_create_ext returns the allocated size but
> gem_create_ext doesn't. With this change, __gem_create_in_memory_regions
> returns the allocated size for situations where it is needed but in the
> majority of cases where the allocated size is not needed we can just use
> gem_create_in_memory_regions for casual use as before.
> 
> v2: Store requested not allocated bo size in intel_buf->size (Zbigniew)
> 
> Cc: Zbigniew Kempczynski <zbigniew.kempczynski@intel.com>
> Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
> ---
>  lib/i915/intel_memory_region.c | 4 ++--
>  lib/i915/intel_memory_region.h | 2 +-
>  lib/intel_bufops.c             | 6 +++---
>  lib/ioctl_wrappers.c           | 2 +-
>  tests/i915/gem_exec_basic.c    | 6 +++---
>  tests/i915/gem_gpgpu_fill.c    | 3 +--
>  tests/i915/gem_media_fill.c    | 3 +--
>  tests/kms_addfb_basic.c        | 2 +-
>  tests/kms_prime.c              | 4 ++--
>  9 files changed, 15 insertions(+), 17 deletions(-)
> 
> diff --git a/lib/i915/intel_memory_region.c b/lib/i915/intel_memory_region.c
> index e59801a4cab..bc2f66dbff5 100644
> --- a/lib/i915/intel_memory_region.c
> +++ b/lib/i915/intel_memory_region.c
> @@ -202,12 +202,12 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
>   * @mem_regions: memory regions array (priority list)
>   * @num_regions: @mem_regions length
>   */
> -uint32_t gem_create_in_memory_region_list(int fd, uint64_t *size,
> +uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
>  					  struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions)
>  {
>  	uint32_t handle;
> -	int ret = __gem_create_in_memory_region_list(fd, &handle, size,
> +	int ret = __gem_create_in_memory_region_list(fd, &handle, &size,
>  						     mem_regions, num_regions);
>  	igt_assert_eq(ret, 0);
>  	return handle;
> diff --git a/lib/i915/intel_memory_region.h b/lib/i915/intel_memory_region.h
> index bf75831ccba..024c76d3644 100644
> --- a/lib/i915/intel_memory_region.h
> +++ b/lib/i915/intel_memory_region.h
> @@ -68,7 +68,7 @@ int __gem_create_in_memory_region_list(int fd, uint32_t *handle, uint64_t *size,
>  				       struct drm_i915_gem_memory_class_instance *mem_regions,
>  				       int num_regions);
>  
> -uint32_t gem_create_in_memory_region_list(int fd, uint64_t *size,
> +uint32_t gem_create_in_memory_region_list(int fd, uint64_t size,
>  					  struct drm_i915_gem_memory_class_instance *mem_regions,
>  					  int num_regions);
>  
> diff --git a/lib/intel_bufops.c b/lib/intel_bufops.c
> index 0cb7614234a..52794c1ac10 100644
> --- a/lib/intel_bufops.c
> +++ b/lib/intel_bufops.c
> @@ -813,6 +813,9 @@ static void __intel_buf_init(struct buf_ops *bops,
>  		size = bo_size;
>  	}
>  
> +	/* Store real bo size to avoid mistakes in calculating it again */
> +	buf->size = size;
> +

Ok, I'm going to clean this discrepancy (currently it keeps requested
size, not underlying bo size).

Your patch looks good:

Reviewed-by: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>

--
Zbigniew

>  	if (handle)
>  		buf->handle = handle;
>  	else {
> @@ -822,9 +825,6 @@ static void __intel_buf_init(struct buf_ops *bops,
>  			buf->handle = gem_create(bops->fd, size);
>  	}
>  
> -	/* Store real bo size to avoid mistakes in calculating it again */
> -	buf->size = size;
> -
>  	set_hw_tiled(bops, buf);
>  }
>  
> diff --git a/lib/ioctl_wrappers.c b/lib/ioctl_wrappers.c
> index 4d628e50aca..09eb3ce7b57 100644
> --- a/lib/ioctl_wrappers.c
> +++ b/lib/ioctl_wrappers.c
> @@ -635,7 +635,7 @@ uint32_t gem_buffer_create_fb_obj(int fd, uint64_t size)
>  	uint32_t handle;
>  
>  	if (gem_has_lmem(fd))
> -		handle = gem_create_in_memory_regions(fd, &size, REGION_LMEM(0));
> +		handle = gem_create_in_memory_regions(fd, size, REGION_LMEM(0));
>  	else
>  		handle = gem_create(fd, size);
>  
> diff --git a/tests/i915/gem_exec_basic.c b/tests/i915/gem_exec_basic.c
> index 04e2209cab4..008a35d0ae9 100644
> --- a/tests/i915/gem_exec_basic.c
> +++ b/tests/i915/gem_exec_basic.c
> @@ -28,12 +28,12 @@
>  
>  IGT_TEST_DESCRIPTION("Basic sanity check of execbuf-ioctl rings.");
>  
> -static uint32_t batch_create(int fd, uint64_t batch_size, uint32_t region)
> +static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
>  {
>  	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	uint32_t handle;
>  
> -	handle = gem_create_in_memory_regions(fd, &batch_size, region);
> +	handle = gem_create_in_memory_regions(fd, batch_size, region);
>  	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
>  
>  	return handle;
> @@ -44,7 +44,7 @@ igt_main
>  	const struct intel_execution_engine2 *e;
>  	struct drm_i915_query_memory_regions *query_info;
>  	struct igt_collection *regions, *set;
> -	uint64_t batch_size;
> +	uint32_t batch_size;
>  	const intel_ctx_t *ctx;
>  	int fd = -1;
>  
> diff --git a/tests/i915/gem_gpgpu_fill.c b/tests/i915/gem_gpgpu_fill.c
> index 76f4d7c61c8..74a227f678e 100644
> --- a/tests/i915/gem_gpgpu_fill.c
> +++ b/tests/i915/gem_gpgpu_fill.c
> @@ -68,7 +68,6 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	struct intel_buf *buf;
>  	uint8_t *ptr;
>  	uint32_t handle;
> -	uint64_t size = SIZE;
>  	int i;
>  
>  	buf = calloc(1, sizeof(*buf));
> @@ -78,7 +77,7 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	 * Legacy code uses 32 bpp after buffer creation.
>  	 * Let's do the same due to keep shader intact.
>  	 */
> -	handle = gem_create_in_memory_regions(data->drm_fd, &size, region);
> +	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
>  	intel_buf_init_using_handle(data->bops, handle, buf,
>  				    width/4, height, 32, 0,
>  				    I915_TILING_NONE, 0);
> diff --git a/tests/i915/gem_media_fill.c b/tests/i915/gem_media_fill.c
> index 3d7d6fa2b0f..1d08df2473d 100644
> --- a/tests/i915/gem_media_fill.c
> +++ b/tests/i915/gem_media_fill.c
> @@ -69,13 +69,12 @@ create_buf(data_t *data, int width, int height, uint8_t color, uint32_t region)
>  	struct intel_buf *buf;
>  	uint32_t handle;
>  	uint8_t *ptr;
> -	uint64_t size = SIZE;
>  	int i;
>  
>  	buf = calloc(1, sizeof(*buf));
>  	igt_assert(buf);
>  
> -	handle = gem_create_in_memory_regions(data->drm_fd, &size, region);
> +	handle = gem_create_in_memory_regions(data->drm_fd, SIZE, region);
>  
>  	/*
>  	 * Legacy code uses 32 bpp after buffer creation.
> diff --git a/tests/kms_addfb_basic.c b/tests/kms_addfb_basic.c
> index 62fa78a5da9..55f4852da16 100644
> --- a/tests/kms_addfb_basic.c
> +++ b/tests/kms_addfb_basic.c
> @@ -158,7 +158,7 @@ static void invalid_tests(int fd)
>  		igt_require(gem_has_lmem(fd));
>  		igt_calc_fb_size(fd, f.width, f.height,
>  				DRM_FORMAT_XRGB8888, 0, &size, &stride);
> -		handle = gem_create_in_memory_regions(fd, &size, REGION_SMEM);
> +		handle = gem_create_in_memory_regions(fd, size, REGION_SMEM);
>  		f.handles[0] = handle;
>  		do_ioctl_err(fd, DRM_IOCTL_MODE_ADDFB2, &f, EREMOTE);
>  	}
> diff --git a/tests/kms_prime.c b/tests/kms_prime.c
> index ea459414901..5cdb559778b 100644
> --- a/tests/kms_prime.c
> +++ b/tests/kms_prime.c
> @@ -112,10 +112,10 @@ static void prepare_scratch(int exporter_fd, struct dumb_bo *scratch,
>  		igt_calc_fb_size(exporter_fd, mode->hdisplay, mode->vdisplay, DRM_FORMAT_XRGB8888,
>  				 DRM_FORMAT_MOD_NONE, &scratch->size, &scratch->pitch);
>  		if (gem_has_lmem(exporter_fd))
> -			scratch->handle = gem_create_in_memory_regions(exporter_fd, &scratch->size,
> +			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
>  								       REGION_LMEM(0), REGION_SMEM);
>  		else
> -			scratch->handle = gem_create_in_memory_regions(exporter_fd, &scratch->size,
> +			scratch->handle = gem_create_in_memory_regions(exporter_fd, scratch->size,
>  								       REGION_SMEM);
>  
>  		ptr = gem_mmap__device_coherent(exporter_fd, scratch->handle, 0, scratch->size,
> -- 
> 2.33.0
> 
