Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45A1610E1BE
 for <igt-dev@lists.freedesktop.org>; Mon,  5 Jun 2023 11:20:00 +0000 (UTC)
Date: Mon, 5 Jun 2023 13:19:55 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: sai.gowtham.ch@intel.com
Message-ID: <20230605111955.lbvuljbsaet3ectm@zkempczy-mobl2>
References: <20230604195811.9487-1-sai.gowtham.ch@intel.com>
 <20230604195811.9487-2-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230604195811.9487-2-sai.gowtham.ch@intel.com>
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

On Mon, Jun 05, 2023 at 01:28:10AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Extending the spin_create implementation and allocator handle support in xe,
> where it submits dummy work loads to engine. This Implementation is wrapped
> around vm_bind and unbind as we are supposed to do it manually for xe.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  lib/igt_dummyload.c |  24 ++++++---
>  lib/igt_dummyload.h |  12 +++++
>  lib/xe/xe_spin.c    | 121 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h    |   6 ++-
>  4 files changed, 156 insertions(+), 7 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 740a58f3..6e89b72d 100644
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
> @@ -447,7 +448,10 @@ spin_create(int fd, const struct igt_spin_factory *opts)
>  igt_spin_t *
>  __igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  {
> -	return spin_create(fd, opts);
> +	if (is_xe_device(fd))
> +		return xe_spin_create(fd, opts);

Add spinner to spin_list to handle igt_terminate_spins() in igt_core.c.
If test will fail you cannot leave dangling spinners.

Add 'intel_driver' to the struct and store which driver executed the spinner,
you'll need it in igt_spin_end().

> +	else
> +		return spin_create(fd, opts);
>  }
>  
>  /**
> @@ -467,6 +471,11 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  {
>  	igt_spin_t *spin;
>  
> +	if (is_xe_device(fd)) {
> +		spin = xe_spin_create(fd, opts);
> +		return spin;
> +	}

In this path too, you may create some wrapper if you want to avoid code duplication
in __igt_spin_factory() and igt_spin_factory().

> +
>  	if ((opts->flags & IGT_SPIN_POLL_RUN) && opts->engine != ALL_ENGINES) {
>  		unsigned int class;
>  
> @@ -647,11 +656,14 @@ void igt_spin_free(int fd, igt_spin_t *spin)
>  	if (!spin)
>  		return;
>  
> -	pthread_mutex_lock(&list_lock);
> -	igt_list_del(&spin->link);
> -	pthread_mutex_unlock(&list_lock);

This can stay here, will handle both i915 and xe spinners.

> -
> -	__igt_spin_free(fd, spin);
> +	if (is_xe_device(fd)) {
> +		xe_spin_free(fd, spin);
> +	} else {
> +		pthread_mutex_lock(&list_lock);
> +		igt_list_del(&spin->link);
> +		pthread_mutex_unlock(&list_lock);
> +		__igt_spin_free(fd, spin);
> +	}
>  }
>  
>  void igt_terminate_spins(void)
> diff --git a/lib/igt_dummyload.h b/lib/igt_dummyload.h
> index b247ab02..c5d7b993 100644
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
> @@ -83,6 +85,16 @@ typedef struct igt_spin {
>  #define SPIN_CLFLUSH (1 << 0)
>  
>  	struct igt_spin_factory opts;
> +
> +	struct xe_spin *xe_spin;
> +	size_t bo_size;
> +	uint64_t address;
> +	unsigned int engine;
> +	uint32_t vm;
> +	uint32_t syncobj;
> +	bool is_user_vm;
> +	bool is_user_engine;

Those two vars are not necessary, reuse opts, see below.

> +
>  } igt_spin_t;
>  
>  
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 856d0ba2..c5a4479b 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -82,6 +82,127 @@ void xe_spin_end(struct xe_spin *spin)
>  	spin->end = 0;
>  }
>  
> +/**
> + * xe_spin_user_vm_engine:
> + * @spin: spin state from igt_spin_new()
> + * @opt: controlling options such as allocator handle, engine, vm etc
> + *
> + * Wrapper function collects the vm and engine data from the user,
> + * if engine is not given from the user, engine will be created.
> + *
> + */
> +void xe_spin_user_vm_engine(int fd, const struct igt_spin_factory *opt, struct igt_spin *spin)
> +{
> +	spin->vm = opt->vm;
> +	spin->is_user_vm = true;
> +	if (opt->engine) {
> +		spin->engine = opt->engine;
> +		spin->is_user_engine = true;
> +	} else {
> +		if (opt->hwe)
> +			spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
> +		else
> +			spin->engine = xe_engine_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
> +
> +		spin->is_user_engine = false;
> +	}
> +}

Too complicated, especially you don't need is_user_ variables, maybe:

@@ -139,17 +113,17 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
 
        spin->syncobj = syncobj_create(fd, 0);
 
-       if (opt->vm) {
-               xe_spin_user_vm_engine(fd, opt, spin);
+       spin->vm = opt->vm;
+       spin->engine = opt->engine;
 
-       } else {
+       if (!spin->vm)
                spin->vm = xe_vm_create(fd, 0, 0);
+
+       if (!spin->engine) {
                if (opt->hwe)
                        spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
                else
                        spin->engine = xe_engine_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
-               spin->is_user_vm = false;
-               spin->is_user_engine = false;
        }
 
        spin->handle = xe_bo_create(fd, 0, spin->vm, bo_size);
@@ -167,6 +141,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
        spin->bo_size = bo_size;
        spin->address = addr;
        spin->xe_spin = xe_spin;
+       spin->opts = *opt;
 
        return spin;
 }
@@ -194,10 +169,10 @@ void xe_spin_free(int fd, struct igt_spin *spin)
        gem_munmap(spin->xe_spin, spin->bo_size);
        gem_close(fd, spin->handle);
 
-       if (!spin->is_user_engine)
+       if (!spin->opts.engine)
                xe_engine_destroy(fd, spin->engine);
 
-       if (!spin->is_user_vm)
+       if (!spin->opts.vm)
                xe_vm_destroy(fd, spin->vm);
 
        free(spin);

--
Zbigniew

> +
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
> +
> +	if (opt->vm) {
> +		xe_spin_user_vm_engine(fd, opt, spin);
> +
> +	} else {
> +		spin->vm = xe_vm_create(fd, 0, 0);
> +		if (opt->hwe)
> +			spin->engine = xe_engine_create(fd, spin->vm, opt->hwe, 0);
> +		else
> +			spin->engine = xe_engine_create_class(fd, spin->vm, DRM_XE_ENGINE_CLASS_COPY);
> +		spin->is_user_vm = false;
> +		spin->is_user_engine = false;
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
> +	if (!spin->is_user_engine)
> +		xe_engine_destroy(fd, spin->engine);
> +
> +	if (!spin->is_user_vm)
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
