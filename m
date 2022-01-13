Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 13 Jan 2022 15:04:34 -0800
From: Matthew Brost <matthew.brost@intel.com>
Message-ID: <20220113230433.GA26128@jons-linux-dev-box>
References: <20220113195947.1536897-1-John.C.Harrison@Intel.com>
 <20220113195947.1536897-16-John.C.Harrison@Intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220113195947.1536897-16-John.C.Harrison@Intel.com>
Subject: Re: [igt-dev] [PATCH v3 i-g-t 15/15] tests/i915/gem_exec_capture:
 Restore engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: John.C.Harrison@Intel.com
Cc: IGT-Dev@Lists.FreeDesktop.Org, Intel-GFX@Lists.FreeDesktop.Org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 13, 2022 at 11:59:47AM -0800, John.C.Harrison@Intel.com wrote:
> From: John Harrison <John.C.Harrison@Intel.com>
> 
> The test was updated some engine properties but not restoring them
> afterwards. That would leave the system in a non-default state which
> could potentially affect subsequent tests. Fix it by using the new
> save/restore engine properties helper functions.
> 
> Signed-off-by: John Harrison <John.C.Harrison@Intel.com>

Reviewed-by: Matthew Brost <matthew.brost@intel.com>

> ---
>  tests/i915/gem_exec_capture.c | 37 ++++++++++++++++++++++++++---------
>  1 file changed, 28 insertions(+), 9 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 9beb36fc7..51db07c41 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -209,14 +209,21 @@ static int check_error_state(int dir, struct offset *obj_offsets, int obj_count,
>  	return blobs;
>  }
>  
> -static void configure_hangs(int fd, const struct intel_execution_engine2 *e, int ctxt_id)
> +static struct gem_engine_properties
> +configure_hangs(int fd, const struct intel_execution_engine2 *e, int ctxt_id)
>  {
> +	struct gem_engine_properties props;
> +
>  	/* Ensure fast hang detection */
> -	gem_engine_property_printf(fd, e->name, "preempt_timeout_ms", "%d", 250);
> -	gem_engine_property_printf(fd, e->name, "heartbeat_interval_ms", "%d", 500);
> +	props.engine = e;
> +	props.preempt_timeout = 250;
> +	props.heartbeat_interval = 500;
> +	gem_engine_properties_configure(fd, &props);
>  
>  	/* Allow engine based resets and disable banning */
>  	igt_allow_hang(fd, ctxt_id, HANG_ALLOW_CAPTURE | HANG_WANT_ENGINE_RESET);
> +
> +	return props;
>  }
>  
>  static bool fence_busy(int fence)
> @@ -256,8 +263,9 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	uint32_t *batch, *seqno;
>  	struct offset offset;
>  	int i, fence_out;
> +	struct gem_engine_properties saved_engine;
>  
> -	configure_hangs(fd, e, ctx->id);
> +	saved_engine = configure_hangs(fd, e, ctx->id);
>  
>  	memset(obj, 0, sizeof(obj));
>  	obj[SCRATCH].handle = gem_create_in_memory_regions(fd, 4096, region);
> @@ -371,6 +379,8 @@ static void __capture1(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	gem_close(fd, obj[BATCH].handle);
>  	gem_close(fd, obj[NOCAPTURE].handle);
>  	gem_close(fd, obj[SCRATCH].handle);
> +
> +	gem_engine_properties_restore(fd, &saved_engine);
>  }
>  
>  static void capture(int fd, int dir, const intel_ctx_t *ctx,
> @@ -417,8 +427,9 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  	uint32_t *batch, *seqno;
>  	struct offset *offsets;
>  	int i, fence_out;
> +	struct gem_engine_properties saved_engine;
>  
> -	configure_hangs(fd, e, ctx->id);
> +	saved_engine = configure_hangs(fd, e, ctx->id);
>  
>  	offsets = calloc(count, sizeof(*offsets));
>  	igt_assert(offsets);
> @@ -559,10 +570,12 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  
>  	qsort(offsets, count, sizeof(*offsets), cmp);
>  	igt_assert(offsets[0].addr <= offsets[count-1].addr);
> +
> +	gem_engine_properties_restore(fd, &saved_engine);
>  	return offsets;
>  }
>  
> -#define find_first_available_engine(fd, ctx, e) \
> +#define find_first_available_engine(fd, ctx, e, saved) \
>  	do { \
>  		ctx = intel_ctx_create_all_physical(fd); \
>  		igt_assert(ctx); \
> @@ -570,7 +583,7 @@ __captureN(int fd, int dir, uint64_t ahnd, const intel_ctx_t *ctx,
>  			for_each_if(gem_class_can_store_dword(fd, e->class)) \
>  				break; \
>  		igt_assert(e); \
> -		configure_hangs(fd, e, ctx->id); \
> +		saved = configure_hangs(fd, e, ctx->id); \
>  	} while(0)
>  
>  static void many(int fd, int dir, uint64_t size, unsigned int flags)
> @@ -580,8 +593,9 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  	uint64_t ram, gtt, ahnd;
>  	unsigned long count, blobs;
>  	struct offset *offsets;
> +	struct gem_engine_properties saved_engine;
>  
> -	find_first_available_engine(fd, ctx, e);
> +	find_first_available_engine(fd, ctx, e, saved_engine);
>  
>  	gtt = gem_aperture_size(fd) / size;
>  	ram = (intel_get_avail_ram_mb() << 20) / size;
> @@ -602,6 +616,8 @@ static void many(int fd, int dir, uint64_t size, unsigned int flags)
>  
>  	free(offsets);
>  	put_ahnd(ahnd);
> +
> +	gem_engine_properties_restore(fd, &saved_engine);
>  }
>  
>  static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
> @@ -697,8 +713,9 @@ static void userptr(int fd, int dir)
>  	void *ptr;
>  	int obj_size = 4096;
>  	uint32_t system_region = INTEL_MEMORY_REGION_ID(I915_SYSTEM_MEMORY, 0);
> +	struct gem_engine_properties saved_engine;
>  
> -	find_first_available_engine(fd, ctx, e);
> +	find_first_available_engine(fd, ctx, e, saved_engine);
>  
>  	igt_assert(posix_memalign(&ptr, obj_size, obj_size) == 0);
>  	memset(ptr, 0, obj_size);
> @@ -710,6 +727,8 @@ static void userptr(int fd, int dir)
>  	gem_close(fd, handle);
>  	put_ahnd(ahnd);
>  	free(ptr);
> +
> +	gem_engine_properties_restore(fd, &saved_engine);
>  }
>  
>  static bool has_capture(int fd)
> -- 
> 2.25.1
> 
