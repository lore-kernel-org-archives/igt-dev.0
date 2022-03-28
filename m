Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1674F10E4B1
 for <igt-dev@lists.freedesktop.org>; Mon, 28 Mar 2022 06:41:20 +0000 (UTC)
Date: Mon, 28 Mar 2022 08:41:15 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <YkFYi4BIvwJFfqCG@zkempczy-mobl2>
References: <20220324141917.36759-1-kamil.konieczny@linux.intel.com>
 <20220324141917.36759-3-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220324141917.36759-3-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_concurrent_all: Add
 no-reloc capability
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

On Thu, Mar 24, 2022 at 03:19:17PM +0100, Kamil Konieczny wrote:
> Add noreloc mode for GPU gens without relocations. Also
> while at this, add some caching for required properties.
> Change also snoop function so it will work on DG1.
> 
> Tested with ./gem_concurrent_blit --run '4KiB-tiny-gpu-*'
> and 256KiB with modified drm-tip to allow softpinning.
> 
> v5: rebase, fix caching in bit17_require, changes according
>     to Zbigniew review: simplify cache of !gem_has_llc, drop
>     multiprocess start/stop, use ALLOC_STRATEGY_HIGH_TO_LOW,
>     correct offset and flags
> v4: corrected alloc_open and first ahnd setting
> 
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  tests/i915/gem_concurrent_all.c | 165 +++++++++++++++++++++++++++-----
>  1 file changed, 142 insertions(+), 23 deletions(-)
> 
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
> index d0f9b62e..d17c19fc 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -60,6 +60,7 @@ int fd, devid, gen;
>  int vgem_drv = -1;
>  int all;
>  int pass;
> +uint64_t ahnd;
>  
>  struct create {
>  	const char *name;
> @@ -239,8 +240,16 @@ unmapped_create_bo(const struct buffers *b)
>  
>  static void create_snoop_require(const struct create *create, unsigned count)
>  {
> +	static bool check_llc = true;
> +	static bool has_snoop;
> +
>  	create_cpu_require(create, count);
> -	igt_require(!gem_has_llc(fd));
> +	if (check_llc) {
> +		has_snoop = !gem_has_llc(fd);
> +		check_llc = false;
> +	}
> +
> +	igt_require(has_snoop);
>  }
>  
>  static struct intel_buf *
> @@ -249,7 +258,7 @@ snoop_create_bo(const struct buffers *b)
>  	struct intel_buf *buf;
>  
>  	buf = unmapped_create_bo(b);
> -	gem_set_caching(fd, buf->handle, I915_CACHING_CACHED);
> +	__gem_set_caching(fd, buf->handle, I915_CACHING_CACHED);
>  
>  	return buf;
>  }
> @@ -578,16 +587,32 @@ static void bit17_require(void)
>  		uint32_t swizzle_mode;
>  		uint32_t phys_swizzle_mode;
>  	} arg;
> +	static bool has_tiling2;
>  #define DRM_IOCTL_I915_GEM_GET_TILING2	DRM_IOWR (DRM_COMMAND_BASE + DRM_I915_GEM_GET_TILING, struct drm_i915_gem_get_tiling2)
>  
>  	if (arg.handle == 0) {
> +		bool has_tiling;
> +		int err;
> +
> +		has_tiling2 = false;
>  		arg.handle = gem_create(fd, 4096);
> -		gem_set_tiling(fd, arg.handle, I915_TILING_X, 512);
> +		err = __gem_set_tiling(fd, arg.handle, I915_TILING_X, 512);
> +		if (!err) {
> +			has_tiling = true;
> +			igt_ioctl(fd, DRM_IOCTL_I915_GEM_GET_TILING2, &arg);
> +			if (!errno)
> +				has_tiling2 = true;
> +
> +			errno = 0;
> +		} else {
> +			has_tiling = false;
> +		}
>  
> -		do_ioctl(fd, DRM_IOCTL_I915_GEM_GET_TILING2, &arg);
>  		gem_close(fd, arg.handle);
> +		igt_require(has_tiling);
>  	}
>  	igt_require(arg.phys_swizzle_mode == arg.swizzle_mode);
> +	igt_require(has_tiling2);

I think you can simplify this to:

	if (arg.handle == 0) {
		int err;

		arg.handle = gem_create(fd, 4096);
		err = __gem_set_tiling(fd, arg.handle, I915_TILING_X, 512);
		igt_require(!err);

		igt_ioctl(fd, DRM_IOCTL_I915_GEM_GET_TILING2, &arg);
		gem_close(fd, arg.handle);
	}
	igt_require(arg.phys_swizzle_mode == arg.swizzle_mode);

If first set_tiling() is failing we can immediate skip. But if we can
set-tiling on bo then after get-tiling2 swizzle mode must be same.

Maybe someone will complain on igt_require(!err), but imo looking at
set-tiling it is clear - we need to support this, if not test can
be skipped.

>  }
>  
>  static void wc_require(void)
> @@ -670,11 +695,21 @@ gpu_set_bo(struct buffers *buffers, struct intel_buf *buf, uint32_t val)
>  	struct drm_i915_gem_exec_object2 gem_exec[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	uint32_t tmp[10], *b;
> +	uint64_t addr = 0;
>  
>  	memset(reloc, 0, sizeof(reloc));
>  	memset(gem_exec, 0, sizeof(gem_exec));
>  	memset(&execbuf, 0, sizeof(execbuf));
>  
> +	if (ahnd) {
> +		addr = buf->addr.offset;
> +		if (INVALID_ADDR(addr)) {
> +			addr = intel_allocator_alloc(buffers->ibb->allocator_handle,
> +						     buf->handle, buf->size, 0);
> +			buf->addr.offset = addr;
> +		}
> +	}
> +
>  	b = tmp;
>  	*b++ = XY_COLOR_BLT_CMD_NOLEN |
>  		((gen >= 8) ? 5 : 4) |
> @@ -691,9 +726,9 @@ gpu_set_bo(struct buffers *buffers, struct intel_buf *buf, uint32_t val)
>  	reloc[0].target_handle = buf->handle;
>  	reloc[0].read_domains = I915_GEM_DOMAIN_RENDER;
>  	reloc[0].write_domain = I915_GEM_DOMAIN_RENDER;
> -	*b++ = 0;
> +	*b++ = addr;
>  	if (gen >= 8)
> -		*b++ = 0;
> +		*b++ = addr >> 32;
>  	*b++ = val;
>  	*b++ = MI_BATCH_BUFFER_END;
>  	if ((b - tmp) & 1)
> @@ -703,8 +738,19 @@ gpu_set_bo(struct buffers *buffers, struct intel_buf *buf, uint32_t val)
>  	gem_exec[0].flags = EXEC_OBJECT_NEEDS_FENCE;
>  
>  	gem_exec[1].handle = gem_create(fd, 4096);
> -	gem_exec[1].relocation_count = 1;
> -	gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> +	if (!ahnd) {
> +		gem_exec[1].relocation_count = 1;
> +		gem_exec[1].relocs_ptr = to_user_pointer(reloc);
> +	} else {
> +		gem_exec[1].offset = CANONICAL(intel_allocator_alloc(ahnd,
> +								     gem_exec[1].handle,
> +								     4096, 0));
> +		gem_exec[1].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +
> +		gem_exec[0].offset = CANONICAL(buf->addr.offset);
> +		gem_exec[0].flags |= EXEC_OBJECT_PINNED | EXEC_OBJECT_WRITE |
> +				     EXEC_OBJECT_SUPPORTS_48B_ADDRESS;
> +	}
>  
>  	execbuf.buffers_ptr = to_user_pointer(gem_exec);
>  	execbuf.buffer_count = 2;
> @@ -716,6 +762,7 @@ gpu_set_bo(struct buffers *buffers, struct intel_buf *buf, uint32_t val)
>  	gem_execbuf(fd, &execbuf);
>  
>  	gem_close(fd, gem_exec[1].handle);
> +	put_offset(ahnd, gem_exec[1].handle);
>  }
>  
>  static void
> @@ -766,6 +813,18 @@ static bool set_max_map_count(int num_buffers)
>  	return max > num_buffers;
>  }
>  
> +static uint64_t alloc_open(void)
> +{
> +	return ahnd ? intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
> +						ALLOC_STRATEGY_HIGH_TO_LOW, 0) : 0;
> +}
> +
> +static struct intel_bb *bb_create(int i915, uint32_t size)
> +{
> +	return ahnd ? intel_bb_create_no_relocs(i915, size) :
> +		      intel_bb_create_with_relocs(i915, size);
> +}
> +
>  static void buffers_init(struct buffers *b,
>  			 const char *name,
>  			 const struct create *create,
> @@ -796,7 +855,7 @@ static void buffers_init(struct buffers *b,
>  	igt_assert(b->src);
>  	b->dst = b->src + num_buffers;
>  
> -	b->ibb = intel_bb_create(_fd, 4096);
> +	b->ibb = bb_create(_fd, 4096);
>  }
>  
>  static void buffers_destroy(struct buffers *b)
> @@ -829,6 +888,27 @@ static void buffers_destroy(struct buffers *b)
>  	}
>  }
>  
> +static void bb_destroy(struct buffers *b)
> +{
> +	if (b->ibb) {
> +		intel_bb_destroy(b->ibb);
> +		b->ibb = NULL;
> +	}
> +}
> +
> +static void __bufs_destroy(struct buffers *b)
> +{
> +	buffers_destroy(b);
> +	if (b->ibb) {
> +		intel_bb_destroy(b->ibb);
> +		b->ibb = NULL;
> +	}
> +	if (b->bops) {
> +		buf_ops_destroy(b->bops);
> +		b->bops = NULL;
> +	}
> +}
> +
>  static void buffers_create(struct buffers *b)
>  {
>  	int count = b->num_buffers;
> @@ -838,32 +918,57 @@ static void buffers_create(struct buffers *b)
>  	igt_assert(b->count == 0);
>  	b->count = count;
>  
> +	ahnd = alloc_open();
>  	for (int i = 0; i < count; i++) {
>  		b->src[i] = b->mode->create_bo(b);
>  		b->dst[i] = b->mode->create_bo(b);
>  	}
>  	b->spare = b->mode->create_bo(b);
>  	b->snoop = snoop_create_bo(b);
> +	if (b->ibb)
> +		intel_bb_destroy(b->ibb);
> +
> +	b->ibb = bb_create(fd, 4096);
>  }
>  
>  static void buffers_reset(struct buffers *b)
>  {
>  	b->bops = buf_ops_create(fd);
> -	b->ibb = intel_bb_create(fd, 4096);
> +	b->ibb = bb_create(fd, 4096);
> +}
> +
> +static void __buffers_create(struct buffers *b)
> +{
> +	b->bops = buf_ops_create(fd);
> +	igt_assert(b->bops);
> +	igt_assert(b->num_buffers > 0);
> +	igt_assert(b->mode);
> +	igt_assert(b->mode->create_bo);
> +
> +	b->count = 0;
> +	for (int i = 0; i < b->num_buffers; i++) {
> +		b->src[i] = b->mode->create_bo(b);
> +		b->dst[i] = b->mode->create_bo(b);
> +	}
> +	b->count = b->num_buffers;
> +	b->spare = b->mode->create_bo(b);
> +	b->snoop = snoop_create_bo(b);
> +	ahnd = alloc_open();
> +	b->ibb = bb_create(fd, 4096);
>  }
>  
>  static void buffers_fini(struct buffers *b)
>  {
>  	if (b->bops == NULL)
>  		return;
> -
>  	buffers_destroy(b);
>  
>  	free(b->tmp);
>  	free(b->src);
> -
> -	intel_bb_destroy(b->ibb);
> -	buf_ops_destroy(b->bops);
> +	if (b->ibb)
> +		intel_bb_destroy(b->ibb);
> +	if (b->bops)
> +		buf_ops_destroy(b->bops);
>  
>  	memset(b, 0, sizeof(*b));
>  }
> @@ -1306,6 +1411,8 @@ static void run_single(struct buffers *buffers,
>  		       do_hang do_hang_func)
>  {
>  	pass = 0;
> +	bb_destroy(buffers);
> +	buffers->ibb = bb_create(fd, 4096);
>  	do_test_func(buffers, do_copy_func, do_hang_func);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
>  }
> @@ -1316,6 +1423,8 @@ static void run_interruptible(struct buffers *buffers,
>  			      do_hang do_hang_func)
>  {
>  	pass = 0;
> +	bb_destroy(buffers);
> +	buffers->ibb = bb_create(fd, 4096);
>  	igt_while_interruptible(true)
>  		do_test_func(buffers, do_copy_func, do_hang_func);
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> @@ -1332,10 +1441,18 @@ static void run_child(struct buffers *buffers,
>  	 * leading to the child closing an object without the parent knowing.
>  	 */
>  	pass = 0;
> -	igt_fork(child, 1)
> +	__bufs_destroy(buffers);
> +
> +	igt_fork(child, 1) {
> +		/* recreate process local variables */
> +		intel_allocator_init();
> +		__buffers_create(buffers);
>  		do_test_func(buffers, do_copy_func, do_hang_func);
> +	}
>  	igt_waitchildren();
> +
>  	igt_assert_eq(intel_detect_and_clear_missed_interrupts(fd), 0);
> +	buffers_reset(buffers);
>  }
>  
>  static void __run_forked(struct buffers *buffers,
> @@ -1346,24 +1463,20 @@ static void __run_forked(struct buffers *buffers,
>  
>  {
>  	/* purge the caches before cloing the process */
> -	buffers_destroy(buffers);
> -	intel_bb_destroy(buffers->ibb);
> -	buf_ops_destroy(buffers->bops);
> +	__bufs_destroy(buffers);
>  
>  	igt_fork(child, num_children) {
>  		int num_buffers;
>  
>  		/* recreate process local variables */
>  		fd = gem_reopen_driver(fd);
> -
> +		intel_allocator_init(); //detach from thread

We agreed to use C-style comments, so change to /* */ or remove.

>  		num_buffers = buffers->num_buffers / num_children;
>  		num_buffers += MIN_BUFFERS;
>  		if (num_buffers < buffers->num_buffers)
>  			buffers->num_buffers = num_buffers;
>  
> -		buffers_reset(buffers);
> -		buffers_create(buffers);
> -
> +		__buffers_create(buffers);
>  		igt_while_interruptible(interrupt) {
>  			for (pass = 0; pass < loops; pass++)
>  				do_test_func(buffers,
> @@ -1773,6 +1886,7 @@ igt_main
>  		{ "16MiB", 2048, 2048 },
>  		{ NULL}
>  	};
> +
>  	uint64_t pin_sz = 0;
>  	void *pinned = NULL;
>  	char name[80];
> @@ -1792,6 +1906,12 @@ igt_main
>  		rendercopy = igt_get_render_copyfunc(devid);
>  
>  		vgem_drv = __drm_open_driver(DRIVER_VGEM);
> +
> +		ahnd = intel_allocator_open_full(fd, 0, 0, 0, INTEL_ALLOCATOR_SIMPLE,
> +						 ALLOC_STRATEGY_HIGH_TO_LOW, 0);
> +		put_ahnd(ahnd);
> +		if (ahnd)
> +			intel_bb_track(true);
>  	}
>  
>  	for (const struct create *c = create; c->name; c++) {
> @@ -1864,7 +1984,6 @@ igt_main
>  				igt_fixture
>  					igt_stop_shrink_helper();
>  			}
> -
>  			/* Use the entire mappable aperture, force swapping */
>  			snprintf(name, sizeof(name), "%s%s-%s",
>  				 c->name, s->name, "swap");
> -- 
> 2.32.0
>

Other things looks fine for me. Please change above and I'm going
to merge this.

--
Zbigniew 
