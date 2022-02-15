Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B176510E467
 for <igt-dev@lists.freedesktop.org>; Tue, 15 Feb 2022 12:07:22 +0000 (UTC)
Date: Tue, 15 Feb 2022 13:07:16 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <YguXdMbh8Gv7pj6p@zkempczy-mobl2>
References: <20220203052543.13995-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220203052543.13995-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_sync: Add support for
 local memory
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: sai.gowtham.ch@intel.com
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 03, 2022 at 10:55:43AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> 
> Add support for local memory region (Device memory)
> 
> Signed-off-by: Ch Sai Gowtham <sai.gowtham.ch@intel.com>
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> ---
>  lib/igt_dummyload.c   |   8 +-
>  lib/igt_dummyload.h   |   1 +
>  tests/i915/gem_sync.c | 231 ++++++++++++++++++++++++++----------------
>  3 files changed, 147 insertions(+), 93 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 645db922..97dece71 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -71,7 +71,7 @@ static IGT_LIST_HEAD(spin_list);
>  static pthread_mutex_t list_lock = PTHREAD_MUTEX_INITIALIZER;
>  
>  static uint32_t
> -handle_create(int fd, size_t sz, unsigned long flags, uint32_t **mem)
> +handle_create(int fd, size_t sz, unsigned long flags, uint32_t **mem, uint32_t region)
>  {
>  	*mem = NULL;
>  
> @@ -85,7 +85,7 @@ handle_create(int fd, size_t sz, unsigned long flags, uint32_t **mem)
>  		return handle;
>  	}
>  
> -	return gem_create(fd, sz);
> +	return gem_create_in_memory_regions(fd, sz, region);
>  }
>  
>  static int
> @@ -157,7 +157,7 @@ emit_recursive_batch(igt_spin_t *spin,
>  	obj = memset(spin->obj, 0, sizeof(spin->obj));
>  
>  	obj[BATCH].handle =
> -		handle_create(fd, BATCH_SIZE, opts->flags, &spin->batch);
> +		handle_create(fd, BATCH_SIZE, opts->flags, &spin->batch, opts->region);
>  	if (!spin->batch) {
>  		spin->batch = gem_mmap__device_coherent(fd, obj[BATCH].handle,
>  						  0, BATCH_SIZE, PROT_WRITE);
> @@ -222,7 +222,7 @@ emit_recursive_batch(igt_spin_t *spin,
>  		}
>  
>  		spin->poll_handle =
> -			handle_create(fd, 4096, opts->flags, &spin->poll);
> +			handle_create(fd, 4096, opts->flags, &spin->poll, opts->region);
>  		obj[SCRATCH].handle = spin->poll_handle;
>  
>  		if (!spin->poll) {
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index f0205261..649b6ca4 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -81,6 +81,7 @@ typedef struct igt_spin_factory {
>  	unsigned int flags;
>  	int fence;
>  	uint64_t ahnd;
> +	uint32_t region;
>  } igt_spin_factory_t;
>  
>  #define IGT_SPIN_FENCE_IN      (1 << 0)

Separate the change in dummyload. Looks good for DG1, for DG2 we will got failures
but there rework regarding size and alignment is necessary.


> diff --git a/tests/i915/gem_sync.c b/tests/i915/gem_sync.c
> index 8c435845..93d7d992 100644
> --- a/tests/i915/gem_sync.c
> +++ b/tests/i915/gem_sync.c
> @@ -143,9 +143,20 @@ static void xchg_engine(void *array, unsigned i, unsigned j)
>  	igt_swap(E[i], E[j]);
>  }
>  
> +static uint32_t batch_create(int fd, uint32_t batch_size, uint32_t region)
> +{
> +	const uint32_t bbe = MI_BATCH_BUFFER_END;
> +	uint32_t handle;
> +
> +	handle = gem_create_in_memory_regions(fd, batch_size, region);
> +	gem_write(fd, handle, 0, &bbe, sizeof(bbe));
> +
> +	return handle;
> +}
> +
>  static void
>  sync_ring(int fd, const intel_ctx_t *ctx,
> -	  unsigned ring, int num_children, int timeout)
> +	  unsigned ring, int num_children, int timeout, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  
> @@ -155,15 +166,13 @@ sync_ring(int fd, const intel_ctx_t *ctx,
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, num_children) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object;
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double start, elapsed;
>  		unsigned long cycles;
>  
>  		memset(&object, 0, sizeof(object));
> -		object.handle = gem_create(fd, 4096);
> -		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
> +		object.handle = batch_create(fd, 4096, region);
>  
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -193,9 +202,8 @@ sync_ring(int fd, const intel_ctx_t *ctx,
>  
>  static void
>  idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
> -	  int num_children, int timeout)
> +	  int num_children, int timeout, uint32_t region)
>  {
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 object;
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	double start, elapsed;
> @@ -204,8 +212,7 @@ idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  	gem_require_ring(fd, ring);
>  
>  	memset(&object, 0, sizeof(object));
> -	object.handle = gem_create(fd, 4096);
> -	gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
> +	object.handle = batch_create(fd, 4096, region);
>  
>  	memset(&execbuf, 0, sizeof(execbuf));
>  	execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -234,7 +241,7 @@ idle_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  
>  static void
>  wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> -	    int timeout, int wlen)
> +	    int timeout, int wlen, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> @@ -244,7 +251,6 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, ied.nengines) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object;
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double end, this, elapsed, now, baseline;
> @@ -254,11 +260,10 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		ahnd = get_reloc_ahnd(fd, ctx->id);
>  
>  		memset(&object, 0, sizeof(object));
> -		object.handle = gem_create(fd, 4096);
> +		object.handle = batch_create(fd, 4096, region);
>  		object.offset = get_offset(ahnd, object.handle, 4096, 0);
>  		if (ahnd)
>  			object.flags = EXEC_OBJECT_PINNED;
> -		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
>  
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -339,7 +344,7 @@ wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  }
>  
>  static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
> -			int num_children, int timeout)
> +			int num_children, int timeout, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  	uint64_t ahnd = get_reloc_ahnd(fd, ctx->id);
> @@ -359,13 +364,15 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  					 .ahnd = ahnd,
>  					 .ctx = ctx,
>  					 .engine = ied_flags(&ied, child),
> -					 .flags = IGT_SPIN_FAST);
> +					 .flags = IGT_SPIN_FAST,
> +					 .region = region);
>  
>  		spin[1] = __igt_spin_new(fd,
>  					 .ahnd = ahnd,
>  					 .ctx = ctx,
>  					 .engine = ied_flags(&ied, child),
> -					 .flags = IGT_SPIN_FAST);
> +					 .flags = IGT_SPIN_FAST,
> +					 .region = region);
>  
>  		start = gettime();
>  		end = start + timeout;
> @@ -398,7 +405,7 @@ static void active_ring(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  
>  static void
>  active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> -		   int timeout, int wlen)
> +		   int timeout, int wlen, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  	uint64_t ahnd0 = get_reloc_ahnd(fd, 0);
> @@ -409,7 +416,6 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, ied.nengines) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object;
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double end, this, elapsed, now, baseline;
> @@ -420,11 +426,10 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		ahnd = get_reloc_ahnd(fd, ctx->id);
>  
>  		memset(&object, 0, sizeof(object));
> -		object.handle = gem_create(fd, 4096);
> +		object.handle = batch_create(fd, 4096, region);
>  		object.offset = get_offset(ahnd, object.handle, 4096, 0);
>  		if (ahnd)
>  			object.offset = EXEC_OBJECT_PINNED;
> -		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
>  
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -436,14 +441,16 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  					 .ahnd = ahnd0,
>  					 .engine = execbuf.flags,
>  					 .flags = (IGT_SPIN_POLL_RUN |
> -						   IGT_SPIN_FAST));
> +						   IGT_SPIN_FAST),
> +					 .region = region);
>  		igt_assert(igt_spin_has_poll(spin[0]));
>  
>  		spin[1] = __igt_spin_new(fd,
>  					 .ahnd = ahnd0,
>  					 .engine = execbuf.flags,
>  					 .flags = (IGT_SPIN_POLL_RUN |
> -						   IGT_SPIN_FAST));
> +						   IGT_SPIN_FAST),
> +					 .region = region);
>  
>  		gem_execbuf(fd, &execbuf);
>  
> @@ -529,7 +536,7 @@ active_wakeup_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  static void
>  store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> -	   int num_children, int timeout)
> +	   int num_children, int timeout, uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
>  	struct intel_engine_data ied;
> @@ -541,7 +548,6 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, num_children) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object[2];
>  		struct drm_i915_gem_relocation_entry reloc[1024];
>  		struct drm_i915_gem_execbuffer2 execbuf;
> @@ -559,14 +565,13 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		execbuf.rsvd1 = ctx->id;
>  
>  		memset(object, 0, sizeof(object));
> -		object[0].handle = gem_create(fd, 4096);
> -		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
> +		object[0].handle = batch_create(fd, 4096, region);
>  		execbuf.buffer_count = 1;
>  		gem_execbuf(fd, &execbuf);
>  
>  		object[0].flags |= EXEC_OBJECT_WRITE;
>  		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
> -		object[1].handle = gem_create(fd, 20*1024);
> +		object[1].handle = gem_create_in_memory_regions(fd, 20*1024, region);
>  
>  		object[1].relocs_ptr = to_user_pointer(reloc);
>  		object[1].relocation_count = has_relocs ? 1024 : 0;
> @@ -629,7 +634,7 @@ store_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  static void
>  switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
> -	    int num_children, int timeout)
> +	    int num_children, int timeout, uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
>  	struct intel_engine_data ied;
> @@ -653,7 +658,6 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		unsigned long cycles;
>  
>  		for (int i = 0; i < ARRAY_SIZE(contexts); i++) {
> -			const uint32_t bbe = MI_BATCH_BUFFER_END;
>  			const uint32_t sz = 32 << 10;
>  			struct context *c = &contexts[i];
>  			uint32_t *batch, *b;
> @@ -670,13 +674,12 @@ switch_ring(int fd, const intel_ctx_t *ctx, unsigned ring,
>  			c->execbuf.rsvd1 = c->ctx->id;
>  
>  			memset(c->object, 0, sizeof(c->object));
> -			c->object[0].handle = gem_create(fd, 4096);
> -			gem_write(fd, c->object[0].handle, 0, &bbe, sizeof(bbe));
> +			c->object[0].handle = batch_create(fd, 4096, region);
>  			c->execbuf.buffer_count = 1;
>  			gem_execbuf(fd, &c->execbuf);
>  
>  			c->object[0].flags |= EXEC_OBJECT_WRITE;
> -			c->object[1].handle = gem_create(fd, sz);
> +			c->object[1].handle = gem_create_in_memory_regions(fd, sz, region);
>  
>  			c->object[1].relocs_ptr = to_user_pointer(c->reloc);
>  			c->object[1].relocation_count = has_relocs ? 1024 * i : 0;
> @@ -813,10 +816,9 @@ static void *waiter(void *arg)
>  
>  static void
>  __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
> -	     int timeout, unsigned long *cycles)
> +	     int timeout, unsigned long *cycles, uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
> -	const uint32_t bbe = MI_BATCH_BUFFER_END;
>  	struct drm_i915_gem_exec_object2 object[2];
>  	struct drm_i915_gem_execbuffer2 execbuf;
>  	struct drm_i915_gem_relocation_entry reloc[1024];
> @@ -836,8 +838,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
>  	execbuf.rsvd1 = ctx->id;
>  
>  	memset(object, 0, sizeof(object));
> -	object[0].handle = gem_create(fd, 4096);
> -	gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
> +	object[0].handle = batch_create(fd, 4096, region);
>  	execbuf.buffer_count = 1;
>  	gem_execbuf(fd, &execbuf);
>  	object[0].flags |= EXEC_OBJECT_WRITE;
> @@ -880,8 +881,12 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
>  	for (int i = 0; i < ARRAY_SIZE(threads); i++) {
>  		threads[i].fd = fd;
>  		threads[i].object = object[1];
> -		threads[i].object.handle = gem_create(fd, 20*1024);
> -		gem_write(fd, threads[i].object.handle, 0, batch, 20*1024);
> +		if (i%2)

Code style, spaces and {}.

Use kernel checkpatch.pl and remove obvious code style errors.

> +			threads[i].object.handle = batch_create(fd, 20*1024, region);
> +		else {
> +			threads[i].object.handle = gem_create(fd, 20*1024);
> +			gem_write(fd, threads[i].object.handle, 0, batch, 20*1024);
> +		}
>  
>  		pthread_cond_init(&threads[i].cond, NULL);
>  		pthread_mutex_init(&threads[i].mutex, NULL);
> @@ -945,7 +950,7 @@ __store_many(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  static void
>  store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
> -	   int num_children, int timeout)
> +	   int num_children, int timeout, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  	unsigned long *shared;
> @@ -963,7 +968,8 @@ store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  			__store_many(fd, ctx,
>  				     ied_flags(&ied, n),
>  				     timeout,
> -				     &shared[n]);
> +				     &shared[n],
> +				     region);
>  	}
>  	igt_waitchildren();
>  
> @@ -976,7 +982,7 @@ store_many(int fd, const intel_ctx_t *ctx, unsigned int ring,
>  }
>  
>  static void
> -sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> +sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  
> @@ -985,15 +991,13 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, num_children) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object;
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double start, elapsed;
>  		unsigned long cycles;
>  
>  		memset(&object, 0, sizeof(object));
> -		object.handle = gem_create(fd, 4096);
> -		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
> +		object.handle = batch_create(fd, 4096, region);
>  
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -1023,7 +1027,7 @@ sync_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
>  }
>  
>  static void
> -store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
> +store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout, uint32_t region)
>  {
>  	const unsigned int gen = intel_gen(intel_get_drm_devid(fd));
>  	struct intel_engine_data ied;
> @@ -1034,7 +1038,6 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, num_children) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object[2];
>  		struct drm_i915_gem_relocation_entry reloc[1024];
>  		struct drm_i915_gem_execbuffer2 execbuf;
> @@ -1051,14 +1054,13 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
>  		execbuf.rsvd1 = ctx->id;
>  
>  		memset(object, 0, sizeof(object));
> -		object[0].handle = gem_create(fd, 4096);
> -		gem_write(fd, object[0].handle, 0, &bbe, sizeof(bbe));
> +		object[0].handle = batch_create(fd, 4096, region);
>  		execbuf.buffer_count = 1;
>  		gem_execbuf(fd, &execbuf);
>  
>  		object[0].flags |= EXEC_OBJECT_WRITE;
>  		object[0].flags |= has_relocs ? 0 : EXEC_OBJECT_PINNED;
> -		object[1].handle = gem_create(fd, 1024*16 + 4096);
> +		object[1].handle = gem_create_in_memory_regions(fd, 1024*16 + 4096, region);
>  
>  		object[1].relocs_ptr = to_user_pointer(reloc);
>  		object[1].relocation_count = has_relocs ? 1024 : 0;
> @@ -1126,7 +1128,7 @@ store_all(int fd, const intel_ctx_t *ctx, int num_children, int timeout)
>  
>  static void
>  preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
> -	int num_children, int timeout)
> +	int num_children, int timeout, uint32_t region)
>  {
>  	struct intel_engine_data ied;
>  	const intel_ctx_t *tmp_ctx[2];
> @@ -1144,7 +1146,6 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  
>  	intel_detect_and_clear_missed_interrupts(fd);
>  	igt_fork(child, num_children) {
> -		const uint32_t bbe = MI_BATCH_BUFFER_END;
>  		struct drm_i915_gem_exec_object2 object;
>  		struct drm_i915_gem_execbuffer2 execbuf;
>  		double start, elapsed;
> @@ -1153,11 +1154,10 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		ahnd = get_reloc_ahnd(fd, 0);
>  
>  		memset(&object, 0, sizeof(object));
> -		object.handle = gem_create(fd, 4096);
> +		object.handle = batch_create(fd, 4096, region);
>  		object.offset = get_offset(ahnd, object.handle, 4096, 0);
>  		if (ahnd)
>  			object.flags = EXEC_OBJECT_PINNED;
> -		gem_write(fd, object.handle, 0, &bbe, sizeof(bbe));
>  
>  		memset(&execbuf, 0, sizeof(execbuf));
>  		execbuf.buffers_ptr = to_user_pointer(&object);
> @@ -1202,13 +1202,13 @@ preempt(int fd, const intel_ctx_t *ctx, unsigned ring,
>  igt_main
>  {
>  	const int ncpus = sysconf(_SC_NPROCESSORS_ONLN);
> -	const struct {
> +	const struct test_each_engine{
>  		const char *name;
>  		void (*func)(int fd, const intel_ctx_t *ctx, unsigned int engine,
> -			     int num_children, int timeout);
> +			     int num_children, int timeout, uint32_t memregion);
>  		int num_children;
>  		int timeout;
> -	} all[] = {
> +	} *test_engine, all[] = {
>  		{ "basic-each", sync_ring, 1, 2 },
>  		{ "basic-store-each", store_ring, 1, 2 },
>  		{ "basic-many-each", store_many, 0, 2 },
> @@ -1236,11 +1236,50 @@ igt_main
>  		{ "forked-store", store_ring, ncpus, 20 },
>  		{}
>  	};
> +	const struct test {
> +		const char *name;
> +		void (*func) (int, const intel_ctx_t *, int, int, uint32_t);
> +		int num_children;
> +		int timeout;
> +	} *test, tests[] = {
> +		{ "basic-all", sync_all, 1, 2},
                                             ^ missing space there and below
> +		{ "basic-store-all", store_all, 1, 2},
> +		{ "all", sync_all, 1, 20},
> +		{ "store-all", store_all, 1, 20},
> +		{ "forked-all", sync_all, ncpus, 20},
> +		{ "forked-store-all", store_all, ncpus, 20},
> +		{}
> +	};
> +
> +#define subtest_for_each_combination(__name, __ctx, __num_children, __timeout, __func) \
> +	igt_subtest_with_dynamic(__name) { \
> +		for_each_combination(regions, 1, set) { \
> +			sub_name = memregion_dynamic_subtest_name(regions); \
> +			region = igt_collection_get_value(regions, 0); \
> +			igt_dynamic_f("%s", sub_name) \
> +				(__func)(fd, ctx, (__num_children), (__timeout), region); \
> +			free(sub_name); \
> +		} \
> +	}
> +
> +#define for_each_ctx_engine_combination(__e_name, __e_flags, ctx, __num_children, __timeout, __func) \
> +	for_each_combination(regions, 1, set) { \
> +		sub_name = memregion_dynamic_subtest_name(regions); \
> +		region = igt_collection_get_value(regions, 0); \
> +		igt_dynamic_f("%s-%s", (__e_name), sub_name) \
> +			(__func)(fd, ctx, (__e_flags), (__num_children), (__timeout), region); \
> +		free(sub_name); \
> +	}
> +
>  #define for_each_test(t, T) for(typeof(*T) *t = T; t->name; t++)
>  
>  	const struct intel_execution_engine2 *e;
>  	const intel_ctx_t *ctx;
>  	int fd = -1;
> +	struct drm_i915_query_memory_regions *query_info;
> +	struct igt_collection *regions, *set;
> +	char *sub_name;
> +	uint32_t region;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_INTEL);
> @@ -1250,49 +1289,48 @@ igt_main
>  		ctx = intel_ctx_create_all_physical(fd);
>  
>  		igt_fork_hang_detector(fd);
> +		query_info = gem_get_query_memory_regions(fd);
> +		igt_assert(query_info);
> +		set = get_memory_region_set(query_info,
> +					I915_SYSTEM_MEMORY,
> +					I915_DEVICE_MEMORY);
>  		intel_allocator_multiprocess_start();
>  	}
>  
>  	/* Legacy for selecting rings. */
> -	for_each_test(t, individual) {
> -		igt_subtest_with_dynamic_f("legacy-%s", t->name) {
> +	for (test_engine= individual; test_engine->name; test_engine++) {
                        ^--- same, checkpatch is also complaining here

> +		igt_subtest_with_dynamic_f("legacy-%s", test_engine->name) {
>  			for (const struct intel_execution_ring *l = intel_execution_rings; l->name; l++) {
> -				igt_dynamic_f("%s", l->name) {
> -					t->func(fd, intel_ctx_0(fd), eb_ring(l),
> -						t->num_children, t->timeout);
> -				}
> +				for_each_ctx_engine_combination(l->name, eb_ring(l), intel_ctx_0(fd),
> +						test_engine->num_children,
> +						test_engine->timeout,
> +						test_engine->func);
>  			}
>  		}
>  	}
>  
> -	igt_subtest("basic-all")
> -		sync_all(fd, ctx, 1, 2);
> -	igt_subtest("basic-store-all")
> -		store_all(fd, ctx, 1, 2);
> -
> -	igt_subtest("all")
> -		sync_all(fd, ctx, 1, 20);
> -	igt_subtest("store-all")
> -		store_all(fd, ctx, 1, 20);
> -	igt_subtest("forked-all")
> -		sync_all(fd, ctx, ncpus, 20);
> -	igt_subtest("forked-store-all")
> -		store_all(fd, ctx, ncpus, 20);
> +	for (test= tests; test->name; test++)
> +		subtest_for_each_combination(test->name, ctx, test->num_children, test->timeout, test->func);
>  
>  	for_each_test(t, all) {
> -		igt_subtest_f("%s", t->name)
> -			t->func(fd, ctx, ALL_ENGINES, t->num_children, t->timeout);
> +		igt_subtest_with_dynamic_f("%s", t->name) {
> +			for_each_combination(regions, 1, set) {
> +				sub_name = memregion_dynamic_subtest_name(regions);
> +				region = igt_collection_get_value(regions, 0);
> +				igt_dynamic_f("%s", sub_name)
> +					t->func(fd, ctx, ALL_ENGINES, t->num_children,
> +							t->timeout, region);
> +				free(sub_name);
> +			}
> +		}
>  	}
>  
>  	/* New way of selecting engines. */
> -	for_each_test(t, individual) {
> -		igt_subtest_with_dynamic_f("%s", t->name) {
> -			for_each_ctx_engine(fd, ctx, e) {
> -				igt_dynamic_f("%s", e->name) {
> -					t->func(fd, ctx, e->flags,
> -						t->num_children, t->timeout);
> -				}
> -			}
> +	for (test_engine= individual; test_engine->name; test_engine++) {
> +		igt_subtest_with_dynamic_f("%s", test_engine->name) {
> +			for_each_ctx_engine(fd, ctx, e)
> +				for_each_ctx_engine_combination(e->name, e->flags, ctx,
> +						test_engine->num_children, test_engine->timeout, test_engine->func);
>  		}
>  	}
>  
> @@ -1303,17 +1341,32 @@ igt_main
>  			igt_require(gem_scheduler_has_preemption(fd));
>  		}
>  
> -		igt_subtest("preempt-all")
> -			preempt(fd, ctx, ALL_ENGINES, 1, 20);
> +		igt_subtest_with_dynamic("preempt-all") {
> +			for_each_combination(regions, 1, set) {
> +				sub_name = memregion_dynamic_subtest_name(regions);
> +				region = igt_collection_get_value(regions, 0);
> +				igt_dynamic_f("%s", sub_name)
> +					preempt(fd, ctx, ALL_ENGINES, 1, 20, region);
> +				free(sub_name);
> +			}
> +		}
> +
>  		igt_subtest_with_dynamic("preempt") {
> -			for_each_ctx_engine(fd, ctx, e) {
> -				igt_dynamic_f("%s", e->name)
> -					preempt(fd, ctx, e->flags, ncpus, 20);
> +			for_each_combination(regions, 1, set) {
> +				sub_name = memregion_dynamic_subtest_name(regions);
> +				region = igt_collection_get_value(regions, 0);
> +				for_each_ctx_engine(fd, ctx, e) {
> +					igt_dynamic_f("%s-%s", e->name, sub_name)
> +						preempt(fd, ctx, e->flags, ncpus, 20, region);
> +					free(sub_name);
> +				}

Got memory corruption here (fix is trivial):

(gem_sync:86973) igt_core-CRITICAL: Invalid dynamic subtest name "bcs0-QS^U".
gem_sync: ../lib/igt_core.c:2108: igt_exit: Assertion `!test_with_subtests || skipped_one || succeeded_one || failed_one' failed.
Received signal SIGABRT.
Stack trace: 
 #0 [fatal_sig_handler+0x15c]
 #1 [__sigaction+0x50]
 #2 [pthread_kill+0xf8]
 #3 [raise+0x16]
 #4 [abort+0xd7]
 #5 [<unknown>+0xd7]
 #6 [__assert_fail+0x46]
 #7 [igt_exit+0x1b6]
 #8 [__igt_run_dynamic_subtest+0x156]
 #9 [__igt_unique____real_main1202+0xd31]
 #10 [main+0x2d]
 #11 [__libc_init_first+0x90]
 #12 [__libc_start_main+0x7d]
 #13 [_start+0x25]
Aborted

Anyway - code looks almost done, just fix code-style issues and that unlucky
double free issue.

--
Zbigniew

>  			}
>  		}
>  	}
>  
>  	igt_fixture {
> +		free(query_info);
> +		igt_collection_destroy(set);
>  		intel_allocator_multiprocess_stop();
>  		igt_stop_hang_detector();
>  		intel_ctx_destroy(fd, ctx);
> -- 
> 2.35.0
> 
