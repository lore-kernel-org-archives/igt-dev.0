Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBC9710E15F
 for <igt-dev@lists.freedesktop.org>; Thu, 24 Feb 2022 13:32:06 +0000 (UTC)
Date: Thu, 24 Feb 2022 14:32:02 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <YheIwpKZgNFMW067@zkempczy-mobl2>
References: <20220223043939.25783-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220223043939.25783-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/prime_mmap_coherency.c: Use
 intel_bb and intel_buf to remove libdrm dependency
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

On Wed, Feb 23, 2022 at 10:09:39AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Using intel_bb and intel_buf to remove libdrm dependency.
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/prime_mmap_coherency.c | 105 +++++++++++++++++++----------------
>  1 file changed, 56 insertions(+), 49 deletions(-)
> 
> diff --git a/tests/prime_mmap_coherency.c b/tests/prime_mmap_coherency.c
> index 2a074957..527c743e 100644
> --- a/tests/prime_mmap_coherency.c
> +++ b/tests/prime_mmap_coherency.c
> @@ -36,8 +36,8 @@ IGT_TEST_DESCRIPTION("Test dma-buf mmap on !llc platforms mostly and provoke"
>  		" coherency bugs so we know for sure where we need the sync ioctls.");
>  
>  int fd;
> -static drm_intel_bufmgr *bufmgr;
> -struct intel_batchbuffer *batch;
> +static struct buf_ops *bops;
> +static struct intel_bb *batch;
>  static int width = 1024, height = 1024;
>  
>  /*
> @@ -49,29 +49,34 @@ static int width = 1024, height = 1024;
>   */
>  static int test_read_flush(void)
>  {
> -	drm_intel_bo *bo_1;
> -	drm_intel_bo *bo_2;
> +	struct intel_buf *buffer_1;
> +	struct intel_buf *buffer_2;
>  	uint32_t *ptr_cpu;
>  	uint32_t *ptr_gtt;
>  	int dma_buf_fd, i;
>  	int stale = 0;
>  
> -	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
> +
> +	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
>  
>  	/* STEP #1: put the BO 1 in GTT domain. We use the blitter to copy and fill
>  	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
>  	 * the GTT domain. */
> -	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
> -	intel_copy_bo(batch, bo_1, bo_2, width * height);
> -	drm_intel_bo_unreference(bo_2);
>  
> +	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	intel_bb_copy_intel_buf(batch, buffer_1, buffer_2, width * height * 4);
> +	intel_buf_destroy(buffer_2);

Unluckily intel_bb_copy_intel_buf() uses (..., src, dst, ...) as arguments.
Fixing this lead test to run correctly.


>  	/* STEP #2: read BO 1 using the dma-buf CPU mmap. This dirties the CPU caches. */
> -	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
> +	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
>  
>  	/* STEP #3: write 0x11 into BO 1. */
> -	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
> -	ptr_gtt = gem_mmap__device_coherent(fd, bo_2->handle, 0, width * height, PROT_READ | PROT_WRITE);
> -	gem_set_domain(fd, bo_2->handle,
> +	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	ptr_gtt = gem_mmap__device_coherent(fd, buffer_2->handle, 0,
> +				width * height, PROT_READ | PROT_WRITE);
> +	gem_set_domain(fd, buffer_2->handle,
>  		       I915_GEM_DOMAIN_GTT, I915_GEM_DOMAIN_GTT);
>  	memset(ptr_gtt, 0xc5, width * height);
>  	munmap(ptr_gtt, width * height);
> @@ -85,8 +90,8 @@ static int test_read_flush(void)
>  		igt_assert_eq(ptr_cpu[i], 0);
>  	prime_sync_end(dma_buf_fd, false);
>  
> -	intel_copy_bo(batch, bo_1, bo_2, width * height);
> -	drm_intel_bo_unreference(bo_2);
> +	intel_bb_copy_intel_buf(batch, buffer_1, buffer_2, width * height);
> +	intel_buf_destroy(buffer_2);

Same here. 

>  
>  	/* STEP #4: read again using the CPU mmap. Doing #1 before #3 makes sure we
>  	 * don't do a full CPU cache flush in step #3 again. That makes sure all the
> @@ -99,7 +104,7 @@ static int test_read_flush(void)
>  			stale++;
>  	prime_sync_end(dma_buf_fd, false);
>  
> -	drm_intel_bo_unreference(bo_1);
> +	intel_buf_destroy(buffer_1);
>  	munmap(ptr_cpu, width * height);
>  
>  	close(dma_buf_fd);
> @@ -116,24 +121,26 @@ static int test_read_flush(void)
>   */
>  static int test_write_flush(void)
>  {
> -	drm_intel_bo *bo_1;
> -	drm_intel_bo *bo_2;
> +	struct intel_buf *buffer_1;
> +	struct intel_buf *buffer_2;
>  	uint32_t *ptr_cpu;
>  	uint32_t *ptr2_cpu;
>  	int dma_buf_fd, dma_buf2_fd, i;
>  	int stale = 0;
>  
> -	bo_1 = drm_intel_bo_alloc(bufmgr, "BO 1", width * height * 4, 4096);
> +	buffer_1 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
>  
>  	/* STEP #1: Put the BO 1 in GTT domain. We use the blitter to copy and fill
>  	 * zeros to BO 1, so commands will be submitted and likely to place BO 1 in
>  	 * the GTT domain. */
> -	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
> -	intel_copy_bo(batch, bo_1, bo_2, width * height);
> -	drm_intel_bo_unreference(bo_2);
> +	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	intel_bb_copy_intel_buf(batch, buffer_1, buffer_2, width * height * 4);

Same here.

> +	intel_buf_destroy(buffer_2);
>  
>  	/* STEP #2: Write '1's into BO 1 using the dma-buf CPU mmap. */
> -	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, bo_1->handle);
> +	dma_buf_fd = prime_handle_to_fd_for_mmap(fd, buffer_1->handle);
>  	igt_skip_on(errno == EINVAL);
>  
>  	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
> @@ -147,13 +154,14 @@ static int test_write_flush(void)
>  	prime_sync_end(dma_buf_fd, true);
>  
>  	/* STEP #3: Copy BO 1 into BO 2, using blitter. */
> -	bo_2 = drm_intel_bo_alloc(bufmgr, "BO 2", width * height * 4, 4096);
> -	intel_copy_bo(batch, bo_2, bo_1, width * height);
> +	buffer_2 = intel_buf_create(bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	intel_bb_copy_intel_buf(batch, buffer_2, buffer_1, width * height * 4);

And here.

>  
>  	/* STEP #4: compare BO 2 against written BO 1. In !llc hardware, there
>  	 * should be some cache lines that didn't get flushed out and are still 0,
>  	 * requiring cache flush before the write in step 2. */
> -	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, bo_2->handle);
> +	dma_buf2_fd = prime_handle_to_fd_for_mmap(fd, buffer_2->handle);
>  	igt_skip_on(errno == EINVAL);
>  
>  	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
> @@ -168,8 +176,8 @@ static int test_write_flush(void)
>  
>  	prime_sync_end(dma_buf2_fd, false);
>  
> -	drm_intel_bo_unreference(bo_1);
> -	drm_intel_bo_unreference(bo_2);
> +	intel_buf_destroy(buffer_1);
> +	intel_buf_destroy(buffer_2);
>  	munmap(ptr_cpu, width * height);
>  
>  	close(dma_buf2_fd);
> @@ -180,33 +188,32 @@ static int test_write_flush(void)
>  
>  static void blit_and_cmp(void)
>  {
> -	drm_intel_bo *bo_1;
> -	drm_intel_bo *bo_2;
> +	struct intel_buf *buffer_1;
> +	struct intel_buf *buffer_2;
>  	uint32_t *ptr_cpu;
>  	uint32_t *ptr2_cpu;
>  	int dma_buf_fd, dma_buf2_fd, i;
>  	int local_fd;
> -	drm_intel_bufmgr *local_bufmgr;
> -	struct intel_batchbuffer *local_batch;
> -
> +	struct buf_ops *local_bops;
> +	struct intel_bb *local_batch;
>  	/* recreate process local variables */
>  	local_fd = drm_open_driver(DRIVER_INTEL);

That it tricky - spawned children will have same fd id so using
multiprocess allocator here is not possible. They need to "detach"
allocator before entering this function. Correct code is in 

static void test_ioctl_errors(void) {
	...

		igt_fork(child, num_children) {
			intel_allocator_init();  <---- this will detach child and 
                                                       create allocator for process needs
			igt_while_interruptible(true) blit_and_cmp();
		}

	...
}

BTW how are you testing this change? On my test machine I encountered
failures for each 3 subtests. You need to have card which kernel module
disabled using relocations.

--
Zbigniew

> -	local_bufmgr = drm_intel_bufmgr_gem_init(local_fd, 4096);
> -	igt_assert(local_bufmgr);
> +	local_bops = buf_ops_create(local_fd);
>  
> -	local_batch = intel_batchbuffer_alloc(local_bufmgr, intel_get_drm_devid(local_fd));
> -	igt_assert(local_batch);
> +	local_batch = intel_bb_create(local_fd, 4096);
>  
> -	bo_1 = drm_intel_bo_alloc(local_bufmgr, "BO 1", width * height * 4, 4096);
> -	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, bo_1->handle);
> +	buffer_1 = intel_buf_create(local_bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	dma_buf_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_1->handle);
>  	igt_skip_on(errno == EINVAL);
>  
>  	ptr_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
>  		       MAP_SHARED, dma_buf_fd, 0);
>  	igt_assert(ptr_cpu != MAP_FAILED);
>  
> -	bo_2 = drm_intel_bo_alloc(local_bufmgr, "BO 2", width * height * 4, 4096);
> -	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, bo_2->handle);
> +	buffer_2 = intel_buf_create(local_bops, width, height, 32, 4096,
> +				I915_TILING_NONE, I915_COMPRESSION_NONE);
> +	dma_buf2_fd = prime_handle_to_fd_for_mmap(local_fd, buffer_2->handle);
>  
>  	ptr2_cpu = mmap(NULL, width * height, PROT_READ | PROT_WRITE,
>  			MAP_SHARED, dma_buf2_fd, 0);
> @@ -222,7 +229,7 @@ static void blit_and_cmp(void)
>  	prime_sync_end(dma_buf2_fd, true);
>  
>  	/* Copy BO 1 into BO 2, using blitter. */
> -	intel_copy_bo(local_batch, bo_2, bo_1, width * height);
> +	intel_bb_copy_intel_buf(local_batch, buffer_2, buffer_1, width * height * 4);

Same here, reversed copy order.

>  	usleep(0); /* let someone else claim the mutex */
>  
>  	/* Compare BOs. If prime_sync_* were executed properly, the caches
> @@ -232,16 +239,16 @@ static void blit_and_cmp(void)
>  		igt_fail_on_f(ptr2_cpu[i] != 0x11111111, "Found 0x%08x at offset 0x%08x\n", ptr2_cpu[i], i);
>  	prime_sync_end(dma_buf2_fd, false);
>  
> -	drm_intel_bo_unreference(bo_1);
> -	drm_intel_bo_unreference(bo_2);
> +	intel_buf_destroy(buffer_1);
> +	intel_buf_destroy(buffer_2);
>  	munmap(ptr_cpu, width * height);
>  	munmap(ptr2_cpu, width * height);
>  
>  	close(dma_buf_fd);
>  	close(dma_buf2_fd);
>  
> -	intel_batchbuffer_free(local_batch);
> -	drm_intel_bufmgr_destroy(local_bufmgr);
> +	intel_bb_destroy(local_batch);
> +	buf_ops_destroy(local_bops);
>  	close(local_fd);
>  }
>  
> @@ -286,8 +293,8 @@ igt_main
>  		fd = drm_open_driver(DRIVER_INTEL);
>  		igt_require_gem(fd);
>  
> -		bufmgr = drm_intel_bufmgr_gem_init(fd, 4096);
> -		batch = intel_batchbuffer_alloc(bufmgr, intel_get_drm_devid(fd));
> +		bops = buf_ops_create(fd);
> +		batch = intel_bb_create(fd, 4096);
>  	}
>  
>  	/* Cache coherency and the eviction are pretty much unpredictable, so
> @@ -315,8 +322,8 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		intel_batchbuffer_free(batch);
> -		drm_intel_bufmgr_destroy(bufmgr);
> +		intel_bb_destroy(batch);
> +		buf_ops_destroy(bops);
>  
>  		close(fd);
>  	}
> -- 
> 2.35.0
> 
