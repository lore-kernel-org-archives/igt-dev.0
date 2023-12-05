Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA75C10E546
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Dec 2023 14:07:38 +0000 (UTC)
Date: Tue, 5 Dec 2023 15:07:15 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231205140715.vq644vdl4gymet76@kamilkon-desk.igk.intel.com>
References: <20231205134927.19409-1-nirmoy.das@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231205134927.19409-1-nirmoy.das@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] Revert "test/xe_spin_batch: Add
 spin-fixed-duration-with-preempter"
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Nirmoy Das <nirmoy.das@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Nirmoy,
On 2023-12-05 at 14:49:27 +0100, Nirmoy Das wrote:
> This reverts commit cf47431af14903a71d77283fe74e71ed29f2a17e
> which is causing build failures.
> 
> Signed-off-by: Nirmoy Das <nirmoy.das@intel.com>

Acked-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/intel/xe_spin_batch.c | 126 ++----------------------------------
>  1 file changed, 4 insertions(+), 122 deletions(-)
> 
> diff --git a/tests/intel/xe_spin_batch.c b/tests/intel/xe_spin_batch.c
> index 87e1a86a2..c75709c4e 100644
> --- a/tests/intel/xe_spin_batch.c
> +++ b/tests/intel/xe_spin_batch.c
> @@ -136,102 +136,12 @@ static void spin_all(int fd, int gt, int class)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> -struct data {
> -	uint32_t batch[16];
> -	uint64_t pad;
> -	uint32_t data;
> -	uint64_t addr;
> -};
> -
> -static void store_dword_batch(struct data *data, uint64_t addr, int value)
> -{
> -	int b;
> -	uint64_t batch_offset = (char *)&(data->batch) - (char *)data;
> -	uint64_t batch_addr = addr + batch_offset;
> -	uint64_t sdi_offset = (char *)&(data->data) - (char *)data;
> -	uint64_t sdi_addr = addr + sdi_offset;
> -
> -	b = 0;
> -	data->batch[b++] = MI_STORE_DWORD_IMM_GEN4;
> -	data->batch[b++] = sdi_addr;
> -	data->batch[b++] = sdi_addr >> 32;
> -	data->batch[b++] = value;
> -	data->batch[b++] = MI_BATCH_BUFFER_END;
> -	igt_assert(b <= ARRAY_SIZE(data->batch));
> -
> -	data->addr = batch_addr;
> -}
> -
> -static void preempter(int fd, struct drm_xe_engine_class_instance *hwe)
> -{
> -	struct drm_xe_sync sync = {
> -		.flags = DRM_XE_SYNC_FLAG_SYNCOBJ | DRM_XE_SYNC_FLAG_SIGNAL
> -	};
> -	struct drm_xe_exec exec = {
> -		.num_batch_buffer = 1,
> -		.num_syncs = 1,
> -		.syncs = to_user_pointer(&sync),
> -	};
> -	struct drm_xe_ext_set_property ext = {
> -		.base.next_extension = 0,
> -		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> -		.value = 2, /* High priority */
> -	};
> -	struct data *data;
> -	uint32_t vm;
> -	uint32_t exec_queue;
> -	uint32_t syncobj;
> -	size_t bo_size;
> -	int value = 0x123456;
> -	uint64_t addr = 0x100000;
> -	uint32_t bo = 0;
> -
> -	syncobj = syncobj_create(fd, 0);
> -	sync.handle = syncobj;
> -
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -	bo_size = sizeof(*data);
> -	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> -			xe_get_default_alignment(fd));
> -
> -	bo = xe_bo_create_flags(fd, vm, bo_size,
> -				visible_vram_if_possible(fd, hwe->gt_id));
> -
> -	xe_vm_bind_async(fd, vm, hwe->gt_id, bo, 0, addr, bo_size, &sync, 1);
> -	data = xe_bo_map(fd, bo, bo_size);
> -	store_dword_batch(data, addr, value);
> -
> -	exec_queue = xe_exec_queue_create(fd, vm, hwe, to_user_pointer(&ext));
> -	exec.exec_queue_id = exec_queue;
> -	exec.address = data->addr;
> -	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> -	xe_exec(fd, &exec);
> -
> -	igt_assert(syncobj_wait(fd, &syncobj, 1, INT64_MAX, 0, NULL));
> -	igt_assert_eq(data->data, value);
> -
> -	syncobj_destroy(fd, syncobj);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	xe_exec_queue_destroy(fd, exec_queue);
> -	xe_vm_destroy(fd, vm);
> -}
> -
> -#define SPIN_FIX_DURATION_NORMAL		0
> -#define SPIN_FIX_DURATION_PREEMPT		1
>  /**
>   * SUBTEST: spin-fixed-duration
>   * Description: Basic test which validates the functionality of xe_spin with fixed duration.
>   * Run type: FULL
>   */
> -/**
> - * SUBTEST: spin-fixed-duration-with-preempter
> - * Description: Basic test which validates the functionality of xe_spin preemption which gets preempted with a short duration high-priority task.
> - * Run type: FULL
> - */
> -static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
> +static void xe_spin_fixed_duration(int fd)
>  {
>  	struct drm_xe_sync sync = {
>  		.handle = syncobj_create(fd, 0),
> @@ -243,20 +153,12 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  		.num_syncs = 1,
>  		.syncs = to_user_pointer(&sync),
>  	};
> -	struct drm_xe_ext_set_property ext_prio = {
> -		.base.next_extension = 0,
> -		.base.name = DRM_XE_EXEC_QUEUE_EXTENSION_SET_PROPERTY,
> -		.property = DRM_XE_EXEC_QUEUE_SET_PROPERTY_PRIORITY,
> -		.value = 0, /* Low priority */
> -	};
> -	struct drm_xe_engine_class_instance *hwe = NULL, *_hwe;
>  	const uint64_t duration_ns = NSEC_PER_SEC / 10; /* 100ms */
>  	uint64_t spin_addr;
>  	uint64_t ahnd;
>  	uint32_t exec_queue;
>  	uint32_t vm;
>  	uint32_t bo;
> -	uint64_t ext = 0;
>  	size_t bo_size;
>  	struct xe_spin *spin;
>  	struct timespec tv;
> @@ -264,18 +166,8 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  	igt_stats_t stats;
>  	int i;
>  
> -	if (flags & SPIN_FIX_DURATION_PREEMPT)
> -		ext = to_user_pointer(&ext_prio);
> -
> -	xe_for_each_hw_engine(fd, _hwe)
> -		if (_hwe->engine_class == class && _hwe->gt_id == gt)
> -			hwe = _hwe;
> -
> -	if (!hwe)
> -		return;
> -
>  	vm = xe_vm_create(fd, 0, 0);
> -	exec_queue = xe_exec_queue_create(fd, vm, hwe, ext);
> +	exec_queue = xe_exec_queue_create_class(fd, vm, DRM_XE_ENGINE_CLASS_COPY);
>  	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_RELOC);
>  	bo_size = ALIGN(sizeof(*spin) + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>  	bo = xe_bo_create(fd, vm, bo_size, vram_if_possible(fd, 0), 0);
> @@ -295,17 +187,13 @@ static void xe_spin_fixed_duration(int fd, int gt, int class, int flags)
>  		igt_gettime(&tv);
>  		xe_exec(fd, &exec);
>  		xe_spin_wait_started(spin);
> -		if (flags & SPIN_FIX_DURATION_PREEMPT)
> -			preempter(fd, hwe);
> -
>  		igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
>  		igt_stats_push_float(&stats, igt_nsec_elapsed(&tv) * 1e-6);
>  		syncobj_reset(fd, &sync.handle, 1);
>  		igt_debug("i=%d %.2fms\n", i, stats.values_f[i]);
>  	}
>  	elapsed_ms = igt_stats_get_median(&stats);
> -	igt_info("%s: %.0fms spin took %.2fms (median)\n", xe_engine_class_string(hwe->engine_class),
> -		 duration_ns * 1e-6, elapsed_ms);
> +	igt_info("%.0fms spin took %.2fms (median)\n", duration_ns * 1e-6, elapsed_ms);
>  	igt_assert(elapsed_ms < duration_ns * 1.5e-6 && elapsed_ms > duration_ns * 0.5e-6);
>  
>  	xe_vm_unbind_sync(fd, vm, 0, spin_addr, bo_size);
> @@ -343,13 +231,7 @@ igt_main
>  	}
>  
>  	igt_subtest("spin-fixed-duration")
> -		xe_spin_fixed_duration(fd, 0, DRM_XE_ENGINE_CLASS_COPY, SPIN_FIX_DURATION_NORMAL);
> -
> -
> -	igt_subtest("spin-fixed-duration-with-preempter")
> -		xe_for_each_gt(fd, gt)
> -			xe_for_each_hw_engine_class(class)
> -				xe_spin_fixed_duration(fd, gt, class, SPIN_FIX_DURATION_PREEMPT);
> +		xe_spin_fixed_duration(fd);
>  
>  	igt_fixture
>  		drm_close_driver(fd);
> -- 
> 2.42.0
> 
