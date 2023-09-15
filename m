Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5573210E150
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Sep 2023 12:24:20 +0000 (UTC)
Date: Fri, 15 Sep 2023 14:24:10 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230915122410.7ugcr2hy5ypp73hw@kamilkon-desk.igk.intel.com>
References: <20230915051832.9400-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230915051832.9400-1-sai.gowtham.ch@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/intel/xe_exec_store: Add
 cachelines and page-sized subtests.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: sai.gowtham.ch@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Sai,

remove dot from end of subject line:

[PATCH i-g-t] tests/intel/xe_exec_store: Add cachelines and page-sized subtests.
-------------------------------------------------------------------------------^
s/subtests./subtests/

Few more nits follow below.

On 2023-09-15 at 10:48:32 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 
> Intension of these subtests is to verify that each capable engine can store a
> dword to different cachelines/pages of a buffer object.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 106 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 106 insertions(+)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 14f7c9bec..0929a7717 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -105,6 +105,100 @@ static void store(int fd)
>  	xe_vm_destroy(fd, vm);
>  }
>  
> +#define PAGES 1
> +#define NCACHELINES (4096/64)
> +/**
> + * SUBTEST: %s
> + * Description: Verify that each capable engine can store a dword to different
> + * 		%arg[1] of a buffer object.
> + * Test category: functionality test
> + *
> + * arg[1]:
> + *
> + * @cachelines: cachelines
> + * @page-sized: page-sized
> + */
> +static void store_cachelines(int fd, int gt, int class, unsigned int flags)
> +{
> +	uint32_t vm;
> +	uint64_t ahnd;
> +	struct drm_xe_sync sync[2] = {
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +		{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
> +	};
> +	struct drm_xe_exec exec = {
> +		.num_batch_buffer = flags & PAGES ? NCACHELINES + 1 : 2,
> +		.num_syncs = 2,
> +		.syncs = to_user_pointer(&sync),
> +	};
> +	uint32_t value[NCACHELINES], delta;
> +	uint32_t bo[exec.num_batch_buffer];
> +	uint64_t dst_offset[exec.num_batch_buffer];
> +	struct drm_xe_engine_class_instance eci[exec.num_batch_buffer];
> +	struct drm_xe_engine_class_instance *hwe;
> +	uint32_t syncobjs[exec.num_batch_buffer], exec_queues[exec.num_batch_buffer];
> +	struct data *data;
> +	int i, num_placements = 0;
> +
> +	sync[0].handle = syncobj_create(fd, 0);
> +	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
> +	ahnd = intel_allocator_open(fd, 0, INTEL_ALLOCATOR_SIMPLE);
> +
> +	xe_for_each_hw_engine(fd, hwe) {
> +		if (hwe->engine_class != class || hwe->gt_id != gt)
> +			continue;
> +		eci[num_placements++] = *hwe;
> +	}
> +
> +	for (i = 0; i < exec.num_batch_buffer ; i++) {
> +		struct drm_xe_exec_queue_create create = {
> +			.vm_id = vm,
> +			.width = 1,
> +			.num_placements = num_placements,
> +			.instances = to_user_pointer(eci),
> +		};
> +
> +		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> +					&create), 0);
> +		exec_queues[i] = create.exec_queue_id;
> +		syncobjs[i] = syncobj_create(fd, 0);
> +		bo[i] = xe_bo_create_flags(fd, vm, 4096,
> +					   visible_vram_if_possible(fd, hwe->gt_id));
> +		dst_offset[i] = intel_allocator_alloc_with_strategy(ahnd, bo[i],
> +								    4096, 0,
> +								    ALLOC_STRATEGY_LOW_TO_HIGH);
> +	}
> +	data = xe_bo_map(fd, bo[i-1], 4096);
> +
> +	for (unsigned n = 0; n < NCACHELINES; n++) {
> +		delta = 4 * (n * 16 + n % 16);
> +		value[n] = n | ~n << 16;
> +		store_dword_batch(data, dst_offset[n] + delta, value[n]);
> +		xe_vm_bind_async(fd, vm, hwe->gt_id, bo[n], 0, dst_offset[n] + delta, 4096, sync, 1);
> +		exec.address = dst_offset[n] + delta;
> +		exec.exec_queue_id = exec_queues[n];
> +		sync[0].flags &= DRM_XE_SYNC_SIGNAL;
> +		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
> +		sync[1].handle = syncobjs[i];
> +		xe_exec(fd, &exec);
> +
> +		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
> +	}
> +
> +	for (unsigned n = 0; n < NCACHELINES; n++) {
> +		igt_assert_eq(data[n].data, value[n]);
> +	}
> +
> +	for (unsigned n = 0; n < exec.num_batch_buffer; n++) {
> +		syncobj_destroy(fd, syncobjs[n]);
> +		xe_exec_queue_destroy(fd, exec_queues[n]);
> +		gem_close(fd, bo[n]);
> +	}
> +	munmap(data, 4096);
> +	put_ahnd(ahnd);
> +	xe_vm_destroy(fd, vm);
> +}
> +
>  /**
>   * SUBTEST: basic-all
>   * Description: Test to verify store dword on all available engines.
> @@ -211,6 +305,18 @@ igt_main
>  				store_all(fd, gt, class);
>  	}
>  
> +	igt_subtest("cachelines") {
---------------- ^
imho better:
	igt_subtest("cachelines-basic") {

Or some other suffix name? See below.

> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_hw_engine_class(class)
> +				store_cachelines(fd, gt, class, 0);
> +	}
> +
> +	igt_subtest("page-sized") {
---------------- ^
imho better to use prefix here:

	igt_subtest("cachelines-page-size") {

Regards,
Kamil

> +		xe_for_each_gt(fd, gt)
> +			xe_for_each_hw_engine_class(class)
> +				store_cachelines(fd, gt, class, PAGES);
> +	}
> +
>  	igt_fixture {
>  		xe_device_put(fd);
>  		close(fd);
> -- 
> 2.39.1
> 
