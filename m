Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B60F10E39E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jun 2023 19:27:19 +0000 (UTC)
Date: Tue, 6 Jun 2023 21:27:14 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230606192714.zqllcgdt6udlvuqq@zkempczy-mobl2>
References: <20230606085015.6751-1-sai.gowtham.ch@intel.com>
 <20230606085015.6751-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230606085015.6751-2-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/2] lib/xe/xe_spin: Integrate
 igt_spin_new with Xe
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

On Tue, Jun 06, 2023 at 02:20:14PM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Extending the spin_create implementation and allocator handle support in xe,
> where it submits dummy work loads to engine. This Implementation is wrapped
> around vm_bind and unbind as we are supposed to do it manually for xe.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/igt_dummyload.c | 38 +++++++++++++++---
>  lib/igt_dummyload.h | 11 +++++
>  lib/xe/xe_spin.c    | 97 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h    |  6 ++-
>  4 files changed, 146 insertions(+), 6 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 740a58f3..0c2a2029 100644
> --- a/lib/igt_dummyload.c
> +++ b/lib/igt_dummyload.c
> @@ -46,6 +46,7 @@
>  #include "intel_reg.h"
>  #include "ioctl_wrappers.h"
>  #include "sw_sync.h"
> +#include "xe/xe_spin.h"
>  
>  /**
>   * SECTION:igt_dummyload
> @@ -447,7 +448,18 @@ spin_create(int fd, const struct igt_spin_factory *opts)
>  igt_spin_t *
>  __igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  {
> -	return spin_create(fd, opts);
> +	if (is_xe_device(fd)) {
> +		igt_spin_t *spin;
> +
> +		spin = xe_spin_create(fd, opts);
> +
> +		pthread_mutex_lock(&list_lock);
> +		igt_list_add(&spin->link, &spin_list);
> +		pthread_mutex_unlock(&list_lock);
> +
> +		return spin;
> +	} else
> +		return spin_create(fd, opts);
>  }
>  
>  /**
> @@ -467,6 +479,16 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  {
>  	igt_spin_t *spin;
>  
> +	if (is_xe_device(fd)) {
> +		spin = xe_spin_create(fd, opts);
> +
> +		pthread_mutex_lock(&list_lock);
> +		igt_list_add(&spin->link, &spin_list);
> +		pthread_mutex_unlock(&list_lock);
> +
> +		return spin;
> +	}
> +
>  	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine != ALL_ENGINES) {
>  		unsigned int class;
>  
> @@ -597,8 +619,12 @@ void igt_spin_end(igt_spin_t *spin)
>  	if (!spin)
>  		return;
>  
> -	igt_gettime(&spin->last_signal);
> -	sync_write(spin, MI_BATCH_BUFFER_END);
> +	if (is_xe_device(spin->fd))

Use { for both if/else sequence if any of it > 1 line.

> +		xe_spin_end(spin->xe_spin);

This check may be called on already closed filedescriptor leading to SIGSEGV.
I was a little bit surprised so I've added some debugging info to find out
the reason:

Program received signal SIGINT, Interrupt.
0x00007ffff7d2c51a in __GI___clock_nanosleep (clock_id=<optimized out>, clock_id@entry=0, flags=flags@entry=0, req=req@entry=0x7fffffffe070,
    rem=rem@entry=0x7fffffffe070) at ../sysdeps/unix/sysv/linux/clock_nanosleep.c:73
Download failed: Function not implemented.  Continuing without source file ./time/../sysdeps/unix/sysv/linux/clock_nanosleep.c.
73      ../sysdeps/unix/sysv/linux/clock_nanosleep.c: No such file or directory.
(gdb) bt
#0  0x00007ffff7d2c51a in __GI___clock_nanosleep (clock_id=<optimized out>, clock_id@entry=0, flags=flags@entry=0, req=req@entry=0x7fffffffe070,
    rem=rem@entry=0x7fffffffe070) at ../sysdeps/unix/sysv/linux/clock_nanosleep.c:73
#1  0x00007ffff7d31ac7 in __GI___nanosleep (req=req@entry=0x7fffffffe070, rem=rem@entry=0x7fffffffe070) at ../sysdeps/unix/sysv/linux/nanosleep.c:25
#2  0x00007ffff7d319fe in __sleep (seconds=0) at ../sysdeps/posix/sleep.c:55
#3  0x00007ffff7f35eca in igt_spin_end (spin=0x5555555978a0) at ../lib/igt_dummyload.c:627
#4  0x00007ffff7f36192 in igt_terminate_spins () at ../lib/igt_dummyload.c:703
#5  0x00007ffff7f2c230 in call_exit_handlers (sig=0) at ../lib/igt_core.c:2825
#6  0x00007ffff7f2c2ac in igt_atexit_handler () at ../lib/igt_core.c:2845
#7  0x00007ffff7c98147 in __run_exit_handlers (status=0, listp=0x7ffff7e34738 <__exit_funcs>, run_list_atexit=run_list_atexit@entry=true,
    run_dtors=run_dtors@entry=true) at exit.c:108
#8  0x00007ffff7c982f0 in __GI_exit (status=<optimized out>) at exit.c:139
#9  0x00007ffff7f2b172 in igt_exit () at ../lib/igt_core.c:2319
#10 0x0000555555555e0b in main (argc=1, argv=0x7fffffffe2e8) at ../tests/xe/xe_spin_batch.c:157
(gdb) frame 3
#3  0x00007ffff7f35eca in igt_spin_end (spin=0x5555555978a0) at ../lib/igt_dummyload.c:627
627                     sleep(100);
(gdb) print *spin
$1 = {link = {prev = 0x7ffff7fb2830 <spin_list>, next = 0x55555559a080}, handle = 10, poll_handle = 0, batch = 0x0, condition = 0x0, cmd_precondition = 0,
  poll = 0x0, last_signal = {tv_sec = 0, tv_nsec = 0}, timer_thread = 0, timerfd = 0, out_fence = 0, obj = {{handle = 0, relocation_count = 0, relocs_ptr = 0,
      alignment = 0, offset = 0, flags = 0, {rsvd1 = 0, pad_to_size = 0}, rsvd2 = 0}, {handle = 0, relocation_count = 0, relocs_ptr = 0, alignment = 0, offset = 0,
      flags = 0, {rsvd1 = 0, pad_to_size = 0}, rsvd2 = 0}}, execbuf = {buffers_ptr = 0, buffer_count = 0, batch_start_offset = 0, batch_len = 0, DR1 = 0, DR4 = 0,
    num_cliprects = 0, cliprects_ptr = 0, flags = 0, rsvd1 = 0, rsvd2 = 0}, flags = 0, opts = {ctx_id = 0, ctx = 0x0, dependency = 0, dependency_size = 0,
    engine = 0, flags = 0, fence = 0, ahnd = 1, hwe = 0x5555555987c6, vm = 1}, xe_spin = 0x7ffff5844000, fd = 3, bo_size = 65536, address = 851968, engine = 10,
  vm = 1, syncobj = 10}

I think the best is to cache 'driver' in the spinner during creation.

> +	else {
> +		igt_gettime(&spin->last_signal);
> +		sync_write(spin, MI_BATCH_BUFFER_END);
> +	}
>  }
>  
>  static void __igt_spin_free(int fd, igt_spin_t *spin)
> @@ -646,12 +672,14 @@ void igt_spin_free(int fd, igt_spin_t *spin)
>  {
>  	if (!spin)
>  		return;
> -
>  	pthread_mutex_lock(&list_lock);
>  	igt_list_del(&spin->link);
>  	pthread_mutex_unlock(&list_lock);
>  
> -	__igt_spin_free(fd, spin);
> +	if (is_xe_device(fd))
> +		xe_spin_free(fd, spin);
> +	else
> +		__igt_spin_free(fd, spin);
>  }
>  
>  void igt_terminate_spins(void)
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index b247ab02..bfeb489d 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -54,6 +54,8 @@ typedef struct igt_spin_factory {
>  	unsigned int flags;
>  	int fence;
>  	uint64_t ahnd;
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint32_t vm;
>  } igt_spin_factory_t;
>  
>  typedef struct igt_spin {
> @@ -83,6 +85,15 @@ typedef struct igt_spin {
>  #define SPIN_CLFLUSH (1 << 0)
>  
>  	struct igt_spin_factory opts;
> +
> +	struct xe_spin *xe_spin;
> +	int fd;
> +	size_t bo_size;
> +	uint64_t address;
> +	unsigned int engine;
> +	uint32_t vm;
> +	uint32_t syncobj;
> +
>  } igt_spin_t;
>  
>  
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 856d0ba2..43b4e691 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -82,6 +82,103 @@ void xe_spin_end(struct xe_spin *spin)
>  	spin->end = 0;
>  }
>  
> +/**
> + * xe_spin_create:
> + *@opt: controlling options such as allocator handle, engine, vmetc
> + *
> + * igt_spin_new for xe, xe_spin_create submits a batch using xe_spin_init
> + * which wraps around vm bind and unbinding the object associated to it.
> + * This returs a spinner after submitting a dummy load.
> + *
> + */
> +igt_spin_t *
> +xe_spin_create(int fd, const struct igt_spin_factory *opt)
> +{
> +	size_t bo_size = xe_get_default_alignment(fd);
> +	uint64_t ahnd = opt->ahnd, addr;
> +	struct igt_spin *spin;
> +	struct xe_spin *xe_spin;
> +	struct drm_xe_sync sync = {
> +		.flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = 1,
> +		.num_syncs = 1,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +
> +	igt_assert(ahnd);
> +	spin = calloc(1, sizeof(struct igt_spin));
> +	igt_assert(spin);
> +
> +	spin->syncobj = syncobj_create(fd, 0);
> +	spin->vm = opt->vm;
> +	spin->engine = opt->engine;
> +
> +	if (!spin->vm)
> +		spin->vm = xe_vm_create(fd, 0, 0);
> +
> +	if (!spin->engine) {
> +

Unnecessary blank line.

Rest looks fine for me.

I think one respin and I'll accept it.

--
Zbigniew

> +		if (opt->hwe)
> +			spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
> +		else
> +			spin->engine = xe_engine_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
> +	}
> +
> +	spin->handle = xe_bo_create(fd, 0, spin->vm, bo_size);
> +	xe_spin = xe_bo_map(fd, spin->handle, bo_size);
> +	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
> +	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
> +
> +	xe_spin_init(xe_spin, addr, true);
> +	exec.engine_id = spin->engine;
> +	exec.address = addr;
> +	sync.handle = spin->syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +	xe_spin_wait_started(xe_spin);
> +
> +	spin->bo_size = bo_size;
> +	spin->address = addr;
> +	spin->xe_spin = xe_spin;
> +	spin->fd = fd;
> +	spin->opts = *opt;
> +
> +	return spin;
> +}
> +
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +{
> +	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0, NULL));
> +}
> +
> +/*
> + * xe_spin_free:
> + *@spin: spin state from igt_spin_new()
> + *
> + * Wrapper to free spinner whhich is triggered by xe_spin_create.
> + * which distroys vm, engine and unbinds the vm which is binded to
> + * the engine and bo.
> + *
> + */
> +void xe_spin_free(int fd, struct igt_spin *spin)
> +{
> +	xe_spin_end(spin->xe_spin);
> +	xe_spin_sync_wait(fd, spin);
> +	xe_vm_unbind_sync(fd, spin->vm, 0, spin->address, spin->bo_size);
> +	syncobj_destroy(fd, spin->syncobj);
> +	gem_munmap(spin->xe_spin, spin->bo_size);
> +	gem_close(fd, spin->handle);
> +
> +	if (!spin->opts.engine)
> +		xe_engine_destroy(fd, spin->engine);
> +
> +	if (!spin->opts.vm)
> +		xe_vm_destroy(fd, spin->vm);
> +
> +	free(spin);
> +}
> +
>  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  		  struct xe_cork *cork)
>  {
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 73f9a026..60f6e751 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -13,6 +13,7 @@
>  #include <stdbool.h>
>  
>  #include "xe_query.h"
> +#include "lib/igt_dummyload.h"
>  
>  /* Mapped GPU object */
>  struct xe_spin {
> @@ -21,11 +22,14 @@ struct xe_spin {
>  	uint32_t start;
>  	uint32_t end;
>  };
> -
> +void xe_spin_user_vm_engine(int fd, const struct igt_spin_factory *opt, struct igt_spin *spin);
> +igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
>  void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
>  bool xe_spin_started(struct xe_spin *spin);
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>  void xe_spin_wait_started(struct xe_spin *spin);
>  void xe_spin_end(struct xe_spin *spin);
> +void xe_spin_free(int fd, struct igt_spin *spin);
>  
>  struct xe_cork {
>  	struct xe_spin *spin;
> -- 
> 2.39.1
> 
