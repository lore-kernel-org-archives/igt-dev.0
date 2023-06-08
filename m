Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D6C010E196
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jun 2023 14:10:36 +0000 (UTC)
Date: Thu, 8 Jun 2023 14:10:01 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: <sai.gowtham.ch@intel.com>
Message-ID: <ZIHhOWPLemyQaois@DUT025-TGLU.fm.intel.com>
References: <20230505053528.25967-1-sai.gowtham.ch@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230505053528.25967-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/xe/xe_spin: Integrate igt_spin_new
 with Xe.
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

On Fri, May 05, 2023 at 11:05:28AM +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Extending the spin_create implementation and allocator handle support in xe,
> where it submits dummy work loads to engine. This Implementation is wrapped
> around vm_bind and unbind as we are supposed to do it manually for xe.
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>


Who asked for this? I intentionally didn't use the existing IGT spin
stuff in Xe as that code is a mess.

Matt

> ---
>  lib/igt_dummyload.c | 28 ++++++++++++++------
>  lib/igt_dummyload.h |  8 ++++++
>  lib/xe/xe_spin.c    | 63 +++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_spin.h    |  7 +++++
>  4 files changed, 98 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/igt_dummyload.c b/lib/igt_dummyload.c
> index 740a58f3..92507819 100644
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
> +	else
> +		return spin_create(fd, opts);
>  }
>  
>  /**
> @@ -480,8 +484,13 @@ igt_spin_factory(int fd, const struct igt_spin_factory *opts)
>  		igt_require(!gem_engine_has_cmdparser(fd, &opts->ctx->cfg,
>  						      opts->engine));
>  	}
> -
> -	spin = spin_create(fd, opts);
> +	if (is_xe_device(fd)) {
> +		spin = xe_spin_create(fd, opts);
> +		return spin;
> +	} else {
> +		spin = spin_create(fd, opts);
> +		return spin;
> +	}
>  
>  	if (!(opts->flags & IGT_SPIN_INVALID_CS)) {
>  		/*
> @@ -647,11 +656,14 @@ void igt_spin_free(int fd, igt_spin_t *spin)
>  	if (!spin)
>  		return;
>  
> -	pthread_mutex_lock(&list_lock);
> -	igt_list_del(&spin->link);
> -	pthread_mutex_unlock(&list_lock);
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
> index b247ab02..7efbb464 100644
> --- a/lib/igt_dummyload.h
> +++ b/lib/igt_dummyload.h
> @@ -83,6 +83,14 @@ typedef struct igt_spin {
>  #define SPIN_CLFLUSH (1 << 0)
>  
>  	struct igt_spin_factory opts;
> +	union {
> +		uint64_t pad;
> +		uint32_t start;
> +		uint32_t end;
> +		uint32_t vm;
> +		uint32_t syncobj;
> +	};
> +
>  } igt_spin_t;
>  
>  
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 856d0ba2..b79b5a0c 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -15,6 +15,7 @@
>  #include "intel_reg.h"
>  #include "xe_ioctl.h"
>  #include "xe_spin.h"
> +#include "lib/igt_dummyload.h"
>  
>  /**
>   * xe_spin_init:
> @@ -82,6 +83,68 @@ void xe_spin_end(struct xe_spin *spin)
>  	spin->end = 0;
>  }
>  
> +igt_spin_t *
> +xe_spin_create(int fd, const struct igt_spin_factory *opt)
> +{
> +	struct drm_xe_engine_class_instance *eci;
> +	size_t bo_size = xe_get_default_alignment(fd);
> +	uint32_t vm, bo, engine, syncobj;
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
> +	xe_spin = calloc(1, sizeof(struct xe_spin));
> +	igt_assert(xe_spin);
> +	spin = calloc(1, sizeof(struct igt_spin));
> +	igt_assert(spin);
> +
> +	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	spin = xe_bo_map(fd, bo, 0x1000);
> +	spin->handle = bo;
> +	spin->vm = xe_vm_create(fd, 0, 0);
> +	engine = xe_engine_create(fd, vm, eci, 0);
> +	spin->syncobj = syncobj_create(fd, 0);
> +
> +	if (ahnd)
> +		addr = intel_allocator_alloc_with_strategy(ahnd, bo, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	xe_spin_init(xe_spin, addr, true);
> +	exec.engine_id = engine;
> +	exec.address = addr;
> +	sync.handle = syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	spin->batch = xe_spin->batch;
> +	spin->start = xe_spin->start;
> +	spin->end = xe_spin->end;
> +	return spin;
> +
> +}
> +
> +void xe_spin_sync_wait(int fd, struct igt_spin *spin)
> +{
> +	igt_assert(syncobj_wait(fd, &spin->syncobj, 1, INT64_MAX, 0,
> +				NULL));
> +}
> +
> +void xe_spin_free(int fd, struct igt_spin *spin)
> +{
> +	spin->end = 0;
> +	xe_vm_destroy(fd, spin->vm);
> +	gem_close(fd, spin->handle);
> +}
> +
>  void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>  		  struct xe_cork *cork)
>  {
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> index 73f9a026..48867eb8 100644
> --- a/lib/xe/xe_spin.h
> +++ b/lib/xe/xe_spin.h
> @@ -13,19 +13,26 @@
>  #include <stdbool.h>
>  
>  #include "xe_query.h"
> +#include "lib/igt_dummyload.h"
>  
>  /* Mapped GPU object */
> +
>  struct xe_spin {
>  	uint32_t batch[16];
>  	uint64_t pad;
>  	uint32_t start;
>  	uint32_t end;
> +
>  };
>  
> +igt_spin_t *
> +xe_spin_create(int fd, const struct igt_spin_factory *opt);
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
