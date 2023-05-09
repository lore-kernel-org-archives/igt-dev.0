Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C67C10E357
 for <igt-dev@lists.freedesktop.org>; Tue,  9 May 2023 08:19:08 +0000 (UTC)
Date: Tue, 9 May 2023 10:18:53 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230509081853.wu5quf26q3aa6tix@kamilkon-desk1>
References: <20230427180212.655926-1-anna.karas@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230427180212.655926-1-anna.karas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] lib/i915: Move gem_reopen_driver() out
 to lib
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

Hi Anna,

please change description into:

lib/drmtest: Add function drm_reopen_driver()

On 2023-04-27 at 20:02:12 +0200, Anna Karas wrote:
> We need an equivalent of gem_reopen_driver() in XE. In order to not
> duplicate the code, move gem_reopen_driver() one directory up from
> lib/i915 to lib as drm_reopen_driver() so XE can use it too.
> 
> Rename gem_reopen_driver() across files.
> 
> Signed-off-by: Anna Karas <anna.karas@intel.com>
> ---
>  lib/drmtest.c                    | 18 ++++++++++++++++++
>  lib/drmtest.h                    |  2 ++
>  lib/i915/gem.c                   | 20 +-------------------
>  lib/i915/gem.h                   |  2 --
>  lib/i915/gem_ring.c              |  2 +-
>  lib/i915/gem_submission.c        |  4 ++--
>  tests/i915/api_intel_allocator.c |  6 +++---
>  tests/i915/drm_fdinfo.c          |  2 +-
>  tests/i915/gem_barrier_race.c    |  2 +-
>  tests/i915/gem_close_race.c      |  4 ++--
>  tests/i915/gem_concurrent_all.c  |  2 +-
>  tests/i915/gem_ctx_create.c      |  2 +-
>  tests/i915/gem_ctx_exec.c        |  2 +-
>  tests/i915/gem_ctx_param.c       |  3 +--
>  tests/i915/gem_ctx_persistence.c | 12 ++++++------
>  tests/i915/gem_ctx_shared.c      |  2 +-
>  tests/i915/gem_eio.c             |  2 +-
>  tests/i915/gem_exec_alignment.c  |  6 +++---
>  tests/i915/gem_exec_capture.c    |  2 +-
>  tests/i915/gem_exec_fair.c       |  2 +-
>  tests/i915/gem_exec_fence.c      |  2 +-
>  tests/i915/gem_exec_nop.c        |  2 +-
>  tests/i915/gem_exec_parallel.c   |  2 +-
>  tests/i915/gem_exec_whisper.c    |  4 ++--
>  tests/i915/gem_lmem_evict.c      |  2 +-
>  tests/i915/gem_lmem_swapping.c   |  6 +++---
>  tests/i915/gem_mmap_gtt.c        |  7 +++----
>  tests/i915/gem_mmap_offset.c     |  9 ++++-----
>  tests/i915/gem_reset_stats.c     | 30 +++++++++++++++---------------
>  tests/i915/gem_ringfill.c        |  2 +-
>  tests/i915/gem_softpin.c         |  2 +-
>  tests/i915/gem_userptr_blits.c   |  2 +-
>  tests/i915/gem_vm_create.c       |  2 +-
>  tests/i915/gem_watchdog.c        |  2 +-
>  tests/i915/gem_workarounds.c     |  2 +-
>  tests/i915/i915_suspend.c        |  2 +-
>  tests/i915/perf.c                |  2 +-
>  37 files changed, 87 insertions(+), 90 deletions(-)
> 
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index c91a9142..72eae7af 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -652,6 +652,24 @@ int drm_open_driver_render(int chipset)
>  	return fd;
>  }
>  
> +/**
> + * drm_reopen_driver:
> + * @fd: re-open the drm file descriptor
> + *
> + * Re-opens the drm fd which is useful in instances where a clean default
> + * context is needed.
> + */
> +int drm_reopen_driver(int fd)
> +{
> +	char path[256];
> +
> +	snprintf(path, sizeof(path), "/proc/self/fd/%d", fd);
> +	fd = open(path, O_RDWR);
> +	igt_assert_fd(fd);
> +

Please look also at patch from Bhanuprakash Modem
https://patchwork.freedesktop.org/patch/535285/?series=117263&rev=3
[i-g-t 2/6] lib: Cache xe_device at driver open/close level

and add here
	if (is_xe_device(fd))
		xe_device_get(fd);

Regards,
Kamil

> +	return fd;
> +}
> +
>  void igt_require_amdgpu(int fd)
>  {
>  	igt_require(is_amdgpu_device(fd));
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index 5878f651..9b7a81b6 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -98,6 +98,8 @@ int __drm_open_driver_another(int idx, int chipset);
>  int __drm_open_driver(int chipset);
>  int __drm_open_driver_render(int chipset);
>  
> +int drm_reopen_driver(int fd);
> +
>  void igt_require_amdgpu(int fd);
>  void igt_require_intel(int fd);
>  void igt_require_i915(int fd);
> diff --git a/lib/i915/gem.c b/lib/i915/gem.c
> index ed45a9ed..6da3e5c9 100644
> --- a/lib/i915/gem.c
> +++ b/lib/i915/gem.c
> @@ -147,7 +147,7 @@ void igt_require_gem(int i915)
>  	 * of a wedged device, not for actually waiting on outstanding
>  	 * requests! So create a new drm_file for the device that is clean.
>  	 */
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  
>  	/*
>  	 * Reset the global seqno at the start of each test. This ensures that
> @@ -189,21 +189,3 @@ void gem_quiescent_gpu(int i915)
>  	igt_drop_caches_set(i915,
>  			    DROP_ACTIVE | DROP_RETIRE | DROP_IDLE | DROP_FREED);
>  }
> -
> -/**
> - * gem_reopen_driver:
> - * @i915: re-open the i915 drm file descriptor
> - *
> - * Re-opens the drm fd which is useful in instances where a clean default
> - * context is needed.
> - */
> -int gem_reopen_driver(int i915)
> -{
> -	char path[256];
> -
> -	snprintf(path, sizeof(path), "/proc/self/fd/%d", i915);
> -	i915 = open(path, O_RDWR);
> -	igt_assert_fd(i915);
> -
> -	return i915;
> -}
> diff --git a/lib/i915/gem.h b/lib/i915/gem.h
> index feabac8d..06dcb546 100644
> --- a/lib/i915/gem.h
> +++ b/lib/i915/gem.h
> @@ -30,6 +30,4 @@
>  void igt_require_gem(int i915);
>  void gem_quiescent_gpu(int i915);
>  
> -int gem_reopen_driver(int i915);
> -
>  #endif /* I915_GEM_H */
> diff --git a/lib/i915/gem_ring.c b/lib/i915/gem_ring.c
> index 6d28b5d9..eb2c7c2c 100644
> --- a/lib/i915/gem_ring.c
> +++ b/lib/i915/gem_ring.c
> @@ -149,7 +149,7 @@ gem_measure_ring_inflight(int fd, unsigned int engine, enum measure_ring_flags f
>  {
>  	unsigned int min = ~0u;
>  
> -	fd = gem_reopen_driver(fd);
> +	fd = drm_reopen_driver(fd);
>  
>  	/* When available, disable execbuf throttling */
>  	fcntl(fd, F_SETFD, fcntl(fd, F_GETFD) | O_NONBLOCK);
> diff --git a/lib/i915/gem_submission.c b/lib/i915/gem_submission.c
> index 0358802e..adf5eb39 100644
> --- a/lib/i915/gem_submission.c
> +++ b/lib/i915/gem_submission.c
> @@ -30,7 +30,6 @@
>  
>  #include <i915_drm.h>
>  
> -#include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem_engine_topology.h"
>  #include "i915/gem_submission.h"
> @@ -42,6 +41,7 @@
>  #include "intel_chipset.h"
>  #include "intel_reg.h"
>  #include "ioctl_wrappers.h"
> +#include "drmtest.h"
>  
>  /**
>   * SECTION:gem_submission
> @@ -158,7 +158,7 @@ void gem_test_all_engines(int i915)
>  	};
>  	const intel_ctx_t *ctx;
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  	igt_assert(!is_wedged(i915));
>  
>  	ctx = intel_ctx_create_all_physical(i915);
> diff --git a/tests/i915/api_intel_allocator.c b/tests/i915/api_intel_allocator.c
> index e9039a21..1263e0fb 100644
> --- a/tests/i915/api_intel_allocator.c
> +++ b/tests/i915/api_intel_allocator.c
> @@ -498,7 +498,7 @@ static void reopen(int fd)
>  
>  	igt_require_gem(fd);
>  
> -	fd2 = gem_reopen_driver(fd);
> +	fd2 = drm_reopen_driver(fd);
>  
>  	__reopen_allocs(fd, fd2, true);
>  
> @@ -514,7 +514,7 @@ static void reopen_fork(int fd)
>  
>  	intel_allocator_multiprocess_start();
>  
> -	fd2 = gem_reopen_driver(fd);
> +	fd2 = drm_reopen_driver(fd);
>  
>  	igt_fork(child, 2) {
>  		igt_until_timeout(REOPEN_TIMEOUT)
> @@ -681,7 +681,7 @@ static void fork_reopen_allocator(int fd, uint8_t type)
>  		igt_assert(!intel_allocator_is_allocated(ctx_ahnd, 1, 123, offset));
>  		intel_allocator_alloc(ctx_ahnd, 2, 123, 0);
>  
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  		fd_ahnd = intel_allocator_open(fd, 0, type);
>  		igt_assert(!intel_allocator_is_allocated(fd_ahnd, 1, 123, offset));
>  		intel_allocator_alloc(fd_ahnd, 2, 123, 0);
> diff --git a/tests/i915/drm_fdinfo.c b/tests/i915/drm_fdinfo.c
> index 1b124755..ac668c29 100644
> --- a/tests/i915/drm_fdinfo.c
> +++ b/tests/i915/drm_fdinfo.c
> @@ -201,7 +201,7 @@ single(int gem_fd, const intel_ctx_t *ctx,
>  		igt_require(!gem_using_guc_submission(gem_fd));
>  
>  	if (flags & TEST_ISOLATION) {
> -		spin_fd = gem_reopen_driver(gem_fd);
> +		spin_fd = drm_reopen_driver(gem_fd);
>  		ctx = intel_ctx_create_all_physical(spin_fd);
>  	} else {
>  		spin_fd = gem_fd;
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index f446aab6..faeec361 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -95,7 +95,7 @@ static void intel_context_first_pin_last_unpin_loop(int fd, uint64_t engine, int
>  	 */
>  	const uint32_t batch[2] = { 0, MI_BATCH_BUFFER_END };
>  
> -	fd = gem_reopen_driver(fd);
> +	fd = drm_reopen_driver(fd);
>  
>  	do {
>  		uint32_t handle = gem_create(fd, 4096);
> diff --git a/tests/i915/gem_close_race.c b/tests/i915/gem_close_race.c
> index 9c646f42..dc88eca4 100644
> --- a/tests/i915/gem_close_race.c
> +++ b/tests/i915/gem_close_race.c
> @@ -170,7 +170,7 @@ static void process(int fd, int child)
>  {
>  	uint32_t handle;
>  
> -	fd = gem_reopen_driver(fd);
> +	fd = drm_reopen_driver(fd);
>  
>  	handle = load(fd);
>  	if ((child & 63) == 63)
> @@ -220,7 +220,7 @@ static void thread(int fd, struct drm_gem_open name,
>  
>  		memset(history, 0, sizeof(*history) * N_HISTORY);
>  
> -		crashme.fd = gem_reopen_driver(fd);
> +		crashme.fd = drm_reopen_driver(fd);
>  
>  		memset(&its, 0, sizeof(its));
>  		its.it_value.tv_nsec = msec(1) + (rand() % msec(150));
> diff --git a/tests/i915/gem_concurrent_all.c b/tests/i915/gem_concurrent_all.c
> index 25b7daf8..fb3b5f5d 100644
> --- a/tests/i915/gem_concurrent_all.c
> +++ b/tests/i915/gem_concurrent_all.c
> @@ -1465,7 +1465,7 @@ static void __run_forked(struct buffers *buffers,
>  		int num_buffers;
>  
>  		/* recreate process local variables */
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  
>  		intel_allocator_init(); /* detach from thread */
>  		num_buffers = buffers->num_buffers / num_children;
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 39f070af..a59abd08 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -106,7 +106,7 @@ static void files(int core, const intel_ctx_cfg_t *cfg,
>  
>  		clock_gettime(CLOCK_MONOTONIC, &start);
>  		do {
> -			fd = gem_reopen_driver(core);
> +			fd = drm_reopen_driver(core);
>  
>  			ctx = intel_ctx_create(fd, cfg);
>  			execbuf.rsvd1 = ctx->id;
> diff --git a/tests/i915/gem_ctx_exec.c b/tests/i915/gem_ctx_exec.c
> index 3d94f01d..20fa1159 100644
> --- a/tests/i915/gem_ctx_exec.c
> +++ b/tests/i915/gem_ctx_exec.c
> @@ -282,7 +282,7 @@ static void nohangcheck_hostile(int i915)
>  	 * we forcibly terminate that context.
>  	 */
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  
>  	dir = igt_params_open(i915);
>  	igt_require(dir != -1);
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index d119ea74..2526b09c 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -28,7 +28,6 @@
>  #include <limits.h>
>  
>  #include "igt.h"
> -#include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "i915/gem_vm.h"
>  
> @@ -81,7 +80,7 @@ static void set_priority(int i915)
>  	igt_permute_array(values, size, igt_exchange_int64);
>  
>  	igt_fork(flags, NEW_CTX | USER) {
> -		int fd = gem_reopen_driver(i915);
> +		int fd = drm_reopen_driver(i915);
>  		struct drm_i915_gem_context_param arg = {
>  			.param = I915_CONTEXT_PARAM_PRIORITY,
>  			.ctx_id = flags & NEW_CTX ? gem_context_create(fd) : 0,
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 9fb52818..c0197cea 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -598,7 +598,7 @@ static void test_nonpersistent_file(int i915)
>  	 * has been made nonpersistent, in which case it must be terminated.
>  	 */
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  
>  	ahnd = get_reloc_ahnd(i915, 0);
>  	gem_context_set_persistence(i915, 0, false);
> @@ -742,7 +742,7 @@ static void test_process(int i915)
>  		uint64_t ahnd;
>  
>  		intel_allocator_init();
> -		i915 = gem_reopen_driver(i915);
> +		i915 = drm_reopen_driver(i915);
>  		gem_quiescent_gpu(i915);
>  
>  		gem_context_set_persistence(i915, 0, false);
> @@ -790,7 +790,7 @@ static void test_userptr(int i915)
>  		uint64_t ahnd;
>  
>  		intel_allocator_init();
> -		i915 = gem_reopen_driver(i915);
> +		i915 = drm_reopen_driver(i915);
>  		gem_quiescent_gpu(i915);
>  
>  		gem_context_set_persistence(i915, 0, false);
> @@ -833,7 +833,7 @@ static void test_process_mixed(int pfd, const intel_ctx_cfg_t *cfg,
>  	igt_fork(child, 1) {
>  		int i915;
>  
> -		i915 = gem_reopen_driver(pfd);
> +		i915 = drm_reopen_driver(pfd);
>  		gem_quiescent_gpu(i915);
>  
>  		for (int persists = 0; persists <= 1; persists++) {
> @@ -1000,7 +1000,7 @@ static void test_processes(int i915)
>  			uint64_t ahnd;
>  
>  			intel_allocator_init();
> -			i915 = gem_reopen_driver(i915);
> +			i915 = drm_reopen_driver(i915);
>  			gem_context_set_persistence(i915, 0, i);
>  
>  			ahnd = get_reloc_ahnd(i915, 0);
> @@ -1069,7 +1069,7 @@ static void __smoker(int i915, const intel_ctx_cfg_t *cfg,
>  	const intel_ctx_t *ctx;
>  	uint64_t ahnd;
>  
> -	fd = gem_reopen_driver(i915);
> +	fd = drm_reopen_driver(i915);
>  	ctx = ctx_create_persistence(fd, cfg, expected > 0);
>  	ahnd = get_reloc_ahnd(fd, ctx->id);
>  	spin = igt_spin_new(fd, .ahnd = ahnd, .ctx = ctx, .engine = engine,
> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
> index 3d73db58..8629992e 100644
> --- a/tests/i915/gem_ctx_shared.c
> +++ b/tests/i915/gem_ctx_shared.c
> @@ -206,7 +206,7 @@ static void exhaust_shared_gtt(int i915, unsigned int flags)
>  		},
>  	};
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  
>  	vm_create_ext.param.value = gem_vm_create(i915);
>  
> diff --git a/tests/i915/gem_eio.c b/tests/i915/gem_eio.c
> index 8dbaa7a7..81e55e16 100644
> --- a/tests/i915/gem_eio.c
> +++ b/tests/i915/gem_eio.c
> @@ -450,7 +450,7 @@ static void set_heartbeat(int i915, int interval)
>  
>  static int reopen_device(int i915)
>  {
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  	igt_require_gem(i915);
>  	set_heartbeat(i915, 250); /* require gem restores defaults */
>  
> diff --git a/tests/i915/gem_exec_alignment.c b/tests/i915/gem_exec_alignment.c
> index a9fcd2a7..5059572f 100644
> --- a/tests/i915/gem_exec_alignment.c
> +++ b/tests/i915/gem_exec_alignment.c
> @@ -158,7 +158,7 @@ naughty_child(int i915, int link, uint32_t shared, unsigned int flags)
>  	uint64_t elapsed;
>  
>  	if (flags & ISOLATED)
> -		i915 = gem_reopen_driver(i915);
> +		i915 = drm_reopen_driver(i915);
>  
>  	if (!(flags & SHARED))
>  		shared = 0;
> @@ -449,7 +449,7 @@ static void forked(int i915, int timeout)
>  	struct drm_i915_gem_exec_object2 *obj;
>  	unsigned long count;
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  	igt_require(gem_uses_full_ppgtt(i915));
>  
>  	obj = setup_many(i915, &count);
> @@ -457,7 +457,7 @@ static void forked(int i915, int timeout)
>  		obj[i].handle = gem_flink(i915, obj[i].handle);
>  
>  	igt_fork(child, sysconf(_SC_NPROCESSORS_ONLN)) {
> -		i915 = gem_reopen_driver(i915);
> +		i915 = drm_reopen_driver(i915);
>  		for (unsigned long i = 0; i < count; i++)
>  			obj[i].handle = gem_open(i915, obj[i].handle);
>  		__many(i915, timeout, obj, count);
> diff --git a/tests/i915/gem_exec_capture.c b/tests/i915/gem_exec_capture.c
> index 9c391192..5d3e0905 100644
> --- a/tests/i915/gem_exec_capture.c
> +++ b/tests/i915/gem_exec_capture.c
> @@ -714,7 +714,7 @@ static void prioinv(int fd, int dir, const intel_ctx_t *ctx,
>  	igt_fork(child, 1) {
>  		const intel_ctx_t *ctx2;
>  		int fence_out;
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  		igt_debug("Submitting large capture [%ld x %dMiB objects]\n",
>  			  count, (int)(size >> 20));
>  
> diff --git a/tests/i915/gem_exec_fair.c b/tests/i915/gem_exec_fair.c
> index 8208ab40..67af4739 100644
> --- a/tests/i915/gem_exec_fair.c
> +++ b/tests/i915/gem_exec_fair.c
> @@ -728,7 +728,7 @@ static void fairness(int i915, const intel_ctx_cfg_t *cfg,
>  				if (common)
>  					dmabuf = prime_handle_to_fd(i915, common);
>  
> -				i915 = gem_reopen_driver(i915);
> +				i915 = drm_reopen_driver(i915);
>  
>  				if (dmabuf != -1)
>  					common = prime_fd_to_handle(i915, dmabuf);
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index c2d874f8..70f86da5 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -1655,7 +1655,7 @@ static void test_invalid_timeline_fence_array(int fd)
>  	uint64_t value;
>  	void *ptr;
>  
> -	fd = gem_reopen_driver(fd);
> +	fd = drm_reopen_driver(fd);
>  
>  	/* create an otherwise valid execbuf */
>  	memset(&obj, 0, sizeof(obj));
> diff --git a/tests/i915/gem_exec_nop.c b/tests/i915/gem_exec_nop.c
> index 497f57f0..f1ec23e8 100644
> --- a/tests/i915/gem_exec_nop.c
> +++ b/tests/i915/gem_exec_nop.c
> @@ -608,7 +608,7 @@ static void multiple(int fd, const intel_ctx_t *ctx,
>  		int i915;
>  		const intel_ctx_t *child_ctx;
>  
> -		i915 = gem_reopen_driver(fd);
> +		i915 = drm_reopen_driver(fd);
>  		child_ctx = intel_ctx_create(i915, &ctx->cfg);
>  		execbuf.rsvd1 = child_ctx->id;
>  
> diff --git a/tests/i915/gem_exec_parallel.c b/tests/i915/gem_exec_parallel.c
> index 705b22cb..97257ea4 100644
> --- a/tests/i915/gem_exec_parallel.c
> +++ b/tests/i915/gem_exec_parallel.c
> @@ -86,7 +86,7 @@ static void *thread(void *data)
>  	pthread_mutex_unlock(t->mutex);
>  
>  	if (t->flags & FDS) {
> -		fd = gem_reopen_driver(t->fd);
> +		fd = drm_reopen_driver(t->fd);
>  	} else {
>  		fd = t->fd;
>  	}
> diff --git a/tests/i915/gem_exec_whisper.c b/tests/i915/gem_exec_whisper.c
> index 29d96cdc..80e4b391 100644
> --- a/tests/i915/gem_exec_whisper.c
> +++ b/tests/i915/gem_exec_whisper.c
> @@ -98,7 +98,7 @@ static void init_hang(struct hang *h, int fd, const intel_ctx_cfg_t *cfg)
>  	uint32_t *batch;
>  	int i, gen;
>  
> -	h->fd = gem_reopen_driver(fd);
> +	h->fd = drm_reopen_driver(fd);
>  	igt_allow_hang(h->fd, 0, 0);
>  
>  	gen = intel_gen(intel_get_drm_devid(h->fd));
> @@ -329,7 +329,7 @@ static void whisper(int fd, const intel_ctx_t *ctx,
>  
>  		if (flags & FDS) {
>  			for (n = 0; n < 64; n++) {
> -				fds[n] = gem_reopen_driver(fd);
> +				fds[n] = drm_reopen_driver(fd);
>  			}
>  		}
>  		if (flags & (CONTEXTS | QUEUES | FDS)) {
> diff --git a/tests/i915/gem_lmem_evict.c b/tests/i915/gem_lmem_evict.c
> index 71a066de..d2611bd5 100644
> --- a/tests/i915/gem_lmem_evict.c
> +++ b/tests/i915/gem_lmem_evict.c
> @@ -57,7 +57,7 @@ static void test_dontneed_evict_race(int fd,
>  	igt_fork(child, 1) {
>  		uint32_t handle2;
>  
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  
>  		handle2 = gem_create_in_memory_region_list(fd,
>  							   size, 0,
> diff --git a/tests/i915/gem_lmem_swapping.c b/tests/i915/gem_lmem_swapping.c
> index 55b044ec..4177286b 100644
> --- a/tests/i915/gem_lmem_swapping.c
> +++ b/tests/i915/gem_lmem_swapping.c
> @@ -539,7 +539,7 @@ static void test_evict(int i915,
>  	fill_params(i915, &params, region, flags, nproc, false);
>  
>  	if (flags & TEST_PARALLEL) {
> -		int fd = gem_reopen_driver(i915);
> +		int fd = drm_reopen_driver(i915);
>  
>  		intel_allocator_multiprocess_start();
>  		ctx = intel_ctx_create_all_physical(fd);
> @@ -610,7 +610,7 @@ static void test_smem_oom(int i915,
>  
>  	/* process for testing lmem eviction */
>  	igt_fork(child, 1) {
> -		int fd = gem_reopen_driver(i915);
> +		int fd = drm_reopen_driver(i915);
>  		struct params params;
>  
>  		fill_params(i915, &params, region, 0, 1, true);
> @@ -637,7 +637,7 @@ static void test_smem_oom(int i915,
>  				}
>  			}
>  			igt_fork(child, 1) {
> -				int fd = gem_reopen_driver(i915);
> +				int fd = drm_reopen_driver(i915);
>  
>  				for (int pass = 0; pass < num_alloc; pass++) {
>  					if (READ_ONCE(*lmem_done))
> diff --git a/tests/i915/gem_mmap_gtt.c b/tests/i915/gem_mmap_gtt.c
> index c14ab50e..0b3a6e5b 100644
> --- a/tests/i915/gem_mmap_gtt.c
> +++ b/tests/i915/gem_mmap_gtt.c
> @@ -41,7 +41,6 @@
>  #include <sys/wait.h>
>  #include "drm.h"
>  
> -#include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "igt.h"
>  #include "igt_sysfs.h"
> @@ -360,8 +359,8 @@ static void
>  test_isolation(int i915)
>  {
>  	struct drm_i915_gem_mmap_gtt mmap_arg;
> -	int A = gem_reopen_driver(i915);
> -	int B = gem_reopen_driver(i915);
> +	int A = drm_reopen_driver(i915);
> +	int B = drm_reopen_driver(i915);
>  	uint64_t offset_a, offset_b;
>  	uint32_t a, b;
>  	void *ptr;
> @@ -448,7 +447,7 @@ test_flink_race(int i915)
>  	igt_assert(handles != MAP_FAILED);
>  
>  	igt_fork(child, ncpus + 1) {
> -		int fd = gem_reopen_driver(i915);
> +		int fd = drm_reopen_driver(i915);
>  
>  		do {
>  			struct drm_i915_gem_mmap_gtt mmap_arg = {};
> diff --git a/tests/i915/gem_mmap_offset.c b/tests/i915/gem_mmap_offset.c
> index 962fc1b7..e7659e30 100644
> --- a/tests/i915/gem_mmap_offset.c
> +++ b/tests/i915/gem_mmap_offset.c
> @@ -33,7 +33,6 @@
>  #include <unistd.h>
>  #include "drm.h"
>  
> -#include "i915/gem.h"
>  #include "i915/gem_create.h"
>  #include "i915/intel_memory_region.h"
>  #include "igt.h"
> @@ -299,8 +298,8 @@ static void isolation(int i915)
>  			struct drm_i915_gem_mmap_offset mmap_arg = {
>  				.flags = t->type
>  			};
> -			int A = gem_reopen_driver(i915);
> -			int B = gem_reopen_driver(i915);
> +			int A = drm_reopen_driver(i915);
> +			int B = drm_reopen_driver(i915);
>  			uint64_t offset_a, offset_b;
>  			uint32_t a, b;
>  			void *ptr;
> @@ -622,7 +621,7 @@ static void open_flood(int i915, int timeout)
>  			continue;
>  
>  		igt_fork(child, 1) {
> -			i915 = gem_reopen_driver(i915);
> +			i915 = drm_reopen_driver(i915);
>  			arg.handle = prime_fd_to_handle(i915, dmabuf);
>  
>  			do {
> @@ -636,7 +635,7 @@ static void open_flood(int i915, int timeout)
>  	igt_until_timeout(timeout) {
>  		int tmp;
>  
> -		tmp = gem_reopen_driver(i915);
> +		tmp = drm_reopen_driver(i915);
>  		handle = prime_fd_to_handle(i915, dmabuf);
>  
>  		for_each_mmap_offset_type(i915, t) {
> diff --git a/tests/i915/gem_reset_stats.c b/tests/i915/gem_reset_stats.c
> index 7b003d88..ddc61781 100644
> --- a/tests/i915/gem_reset_stats.c
> +++ b/tests/i915/gem_reset_stats.c
> @@ -267,7 +267,7 @@ static void test_rs(const struct intel_execution_ring *e,
>  	igt_debug("num fds=%d, hang index=%d\n", num_fds, hang_index);
>  
>  	for (i = 0; i < num_fds; i++) {
> -		fd[i] = gem_reopen_driver(device);
> +		fd[i] = drm_reopen_driver(device);
>  		assert_reset_status(i, fd[i], 0, RS_NO_ERROR);
>  	}
>  
> @@ -318,7 +318,7 @@ static void test_rs_ctx(const struct intel_execution_ring *e,
>  	test_rs(e, num_fds, -1, RS_NO_ERROR);
>  
>  	for (i = 0; i < num_fds; i++) {
> -		fd[i] = gem_reopen_driver(device);
> +		fd[i] = drm_reopen_driver(device);
>  		igt_assert(fd[i]);
>  		assert_reset_status(i, fd[i], 0, RS_NO_ERROR);
>  
> @@ -384,8 +384,8 @@ static void test_ban(const struct intel_execution_ring *e)
>  	int ban, retry = 10;
>  	int active_count = 0;
>  
> -	fd_bad = gem_reopen_driver(device);
> -	fd_good = gem_reopen_driver(device);
> +	fd_bad = drm_reopen_driver(device);
> +	fd_good = drm_reopen_driver(device);
>  
>  	assert_reset_status(fd_bad, fd_bad, 0, RS_NO_ERROR);
>  	assert_reset_status(fd_good, fd_good, 0, RS_NO_ERROR);
> @@ -438,7 +438,7 @@ static void test_ban_ctx(const struct intel_execution_ring *e)
>  	uint32_t ctx_good, ctx_bad;
>  	int active_count = 0;
>  
> -	fd = gem_reopen_driver(device);
> +	fd = drm_reopen_driver(device);
>  
>  	assert_reset_status(fd, fd, 0, RS_NO_ERROR);
>  
> @@ -494,8 +494,8 @@ static void test_unrelated_ctx(const struct intel_execution_ring *e)
>  	int fd1,fd2;
>  	int ctx_guilty, ctx_unrelated;
>  
> -	fd1 = gem_reopen_driver(device);
> -	fd2 = gem_reopen_driver(device);
> +	fd1 = drm_reopen_driver(device);
> +	fd2 = drm_reopen_driver(device);
>  	assert_reset_status(0, fd1, 0, RS_NO_ERROR);
>  	assert_reset_status(1, fd2, 0, RS_NO_ERROR);
>  	ctx_guilty = gem_context_create(fd1);
> @@ -530,7 +530,7 @@ static int get_reset_count(int fd, int ctx)
>  
>  static void test_close_pending_ctx(const struct intel_execution_ring *e)
>  {
> -	int fd = gem_reopen_driver(device);
> +	int fd = drm_reopen_driver(device);
>  	uint32_t ctx = gem_context_create(fd);
>  
>  	assert_reset_status(fd, fd, ctx, RS_NO_ERROR);
> @@ -544,7 +544,7 @@ static void test_close_pending_ctx(const struct intel_execution_ring *e)
>  
>  static void test_close_pending(const struct intel_execution_ring *e)
>  {
> -	int fd = gem_reopen_driver(device);
> +	int fd = drm_reopen_driver(device);
>  
>  	assert_reset_status(fd, fd, 0, RS_NO_ERROR);
>  
> @@ -588,7 +588,7 @@ static void noop_on_each_ring(int fd, const bool reverse)
>  static void test_close_pending_fork(const struct intel_execution_ring *e,
>  				    const bool reverse)
>  {
> -	int fd = gem_reopen_driver(device);
> +	int fd = drm_reopen_driver(device);
>  	igt_hang_t hang;
>  	int pid;
>  
> @@ -603,7 +603,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
>  	 */
>  	pid = fork();
>  	if (pid == 0) {
> -		const int fd2 = gem_reopen_driver(device);
> +		const int fd2 = drm_reopen_driver(device);
>  		igt_assert_lte(0, fd2);
>  
>  		/* The crucial component is that we schedule the same noop batch
> @@ -630,7 +630,7 @@ static void test_close_pending_fork(const struct intel_execution_ring *e,
>  static void test_reset_count(const struct intel_execution_ring *e,
>  			     const bool create_ctx)
>  {
> -	int fd = gem_reopen_driver(device);
> +	int fd = drm_reopen_driver(device);
>  	int ctx;
>  	long c1, c2;
>  
> @@ -733,7 +733,7 @@ static void test_params_ctx(void)
>  {
>  	int fd;
>  
> -	fd = gem_reopen_driver(device);
> +	fd = drm_reopen_driver(device);
>  	_test_param(fd, gem_context_create(fd));
>  	close(fd);
>  }
> @@ -742,7 +742,7 @@ static void test_params(void)
>  {
>  	int fd;
>  
> -	fd = gem_reopen_driver(device);
> +	fd = drm_reopen_driver(device);
>  	_test_param(fd, 0);
>  	close(fd);
>  }
> @@ -767,7 +767,7 @@ static void defer_hangcheck(const struct intel_execution_ring *engine)
>  	int fd, count_start, count_end;
>  	int seconds = 30;
>  
> -	fd = gem_reopen_driver(device);
> +	fd = drm_reopen_driver(device);
>  
>  	next = next_engine(fd, engine);
>  	igt_skip_on(next == engine);
> diff --git a/tests/i915/gem_ringfill.c b/tests/i915/gem_ringfill.c
> index afcd7b73..de6e26bf 100644
> --- a/tests/i915/gem_ringfill.c
> +++ b/tests/i915/gem_ringfill.c
> @@ -219,7 +219,7 @@ static void run_test(int fd, const intel_ctx_t *ctx, unsigned ring,
>  		igt_fork(child, nchild) {
>  			const intel_ctx_t *child_ctx = NULL;
>  			if (flags & NEWFD) {
> -				fd = gem_reopen_driver(fd);
> +				fd = drm_reopen_driver(fd);
>  				child_ctx = intel_ctx_create(fd, &ctx->cfg);
>  
>  				setup_execbuf(fd, child_ctx, &execbuf, obj, reloc, ring);
> diff --git a/tests/i915/gem_softpin.c b/tests/i915/gem_softpin.c
> index 8717860b..933daa4a 100644
> --- a/tests/i915/gem_softpin.c
> +++ b/tests/i915/gem_softpin.c
> @@ -1160,7 +1160,7 @@ static void *thread(void *data)
>  	uint32_t batch = MI_BATCH_BUFFER_END;
>  	int fd, ret, succeeded = 0;
>  
> -	fd = gem_reopen_driver(t->fd);
> +	fd = drm_reopen_driver(t->fd);
>  	ctx = intel_ctx_create(fd, &t->ctx->cfg);
>  	offset_obj = gem_detect_safe_start_offset(fd);
>  	offset_bb = ALIGN(offset_obj + 4096, gem_detect_safe_alignment(fd));
> diff --git a/tests/i915/gem_userptr_blits.c b/tests/i915/gem_userptr_blits.c
> index b00afc32..baba7cf3 100644
> --- a/tests/i915/gem_userptr_blits.c
> +++ b/tests/i915/gem_userptr_blits.c
> @@ -669,7 +669,7 @@ static void test_nohangcheck_hostile(int i915)
>  	 * Even if the user disables hangcheck, we must still recover.
>  	 */
>  
> -	i915 = gem_reopen_driver(i915);
> +	i915 = drm_reopen_driver(i915);
>  	gem_require_contexts(i915);
>  
>  	dir = igt_params_open(i915);
> diff --git a/tests/i915/gem_vm_create.c b/tests/i915/gem_vm_create.c
> index f47d8c55..44958cce 100644
> --- a/tests/i915/gem_vm_create.c
> +++ b/tests/i915/gem_vm_create.c
> @@ -306,7 +306,7 @@ static void isolation(int i915)
>  	struct drm_i915_gem_context_param arg = {
>  		.param = I915_CONTEXT_PARAM_VM,
>  	};
> -	int other = gem_reopen_driver(i915);
> +	int other = drm_reopen_driver(i915);
>  	uint32_t ctx[2], vm[2], result;
>  	int loops = 4096;
>  
> diff --git a/tests/i915/gem_watchdog.c b/tests/i915/gem_watchdog.c
> index 27f3a2d7..47ccd2ca 100644
> --- a/tests/i915/gem_watchdog.c
> +++ b/tests/i915/gem_watchdog.c
> @@ -564,7 +564,7 @@ igt_main
>  					timeout * 1000);
>  		default_timeout_wait_s = timeout * 5;
>  
> -		i915 = gem_reopen_driver(i915); /* Apply modparam. */
> +		i915 = drm_reopen_driver(i915); /* Apply modparam. */
>  		ctx = intel_ctx_create_all_physical(i915);
>  	}
>  
> diff --git a/tests/i915/gem_workarounds.c b/tests/i915/gem_workarounds.c
> index 7d119962..ae544adb 100644
> --- a/tests/i915/gem_workarounds.c
> +++ b/tests/i915/gem_workarounds.c
> @@ -198,7 +198,7 @@ static void check_workarounds(int fd, enum operation op, unsigned int flags)
>  	const intel_ctx_t *ctx;
>  
>  	if (flags & FD)
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  
>  	ctx = intel_ctx_0(fd);
>  	if (flags & CONTEXT) {
> diff --git a/tests/i915/i915_suspend.c b/tests/i915/i915_suspend.c
> index a9507964..5b289ecb 100644
> --- a/tests/i915/i915_suspend.c
> +++ b/tests/i915/i915_suspend.c
> @@ -178,7 +178,7 @@ test_shrink(int fd, unsigned int mode)
>  	gem_quiescent_gpu(fd);
>  
>  	igt_multi_fork(child, 1) {
> -		fd = gem_reopen_driver(fd);
> +		fd = drm_reopen_driver(fd);
>  		igt_purge_vm_caches(fd);
>  
>  		mem = igt_get_total_pinnable_mem(&size);
> diff --git a/tests/i915/perf.c b/tests/i915/perf.c
> index 9ca4d34b..cd73b1a9 100644
> --- a/tests/i915/perf.c
> +++ b/tests/i915/perf.c
> @@ -4513,7 +4513,7 @@ gen12_test_single_ctx_render_target_writes_a_counter(const struct intel_executio
>  	do {
>  		igt_fork_helper(&child) {
>  			/* A local device for local resources. */
> -			drm_fd = gem_reopen_driver(drm_fd);
> +			drm_fd = drm_reopen_driver(drm_fd);
>  
>  			igt_drop_root();
>  			gen12_single_ctx_helper(e);
> -- 
> 2.25.1
> 
