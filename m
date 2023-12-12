Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7E6A10E56A
 for <igt-dev@lists.freedesktop.org>; Tue, 12 Dec 2023 08:22:49 +0000 (UTC)
Date: Tue, 12 Dec 2023 09:22:29 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: Re: [PATCH i-g-t] intel/xe_exec_store.c: Fix the execution of
 basic-all test.
Message-ID: <20231212082229.khvj4se57f6bnjqy@kamilkon-desk.igk.intel.com>
References: <20231211130735.10497-1-sai.gowtham.ch@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231211130735.10497-1-sai.gowtham.ch@intel.com>
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

Hi Sai,
On 2023-12-11 at 18:37:35 +0530, sai.gowtham.ch@intel.com wrote:
> From: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> 

One small nit about subject:

[PATCH i-g-t] intel/xe_exec_store.c: Fix the execution of basic-all test.

Add 'tests/', remove '.c', remove final dot '.', also imho it could be
somewhat shorter:

[PATCH i-g-t] tests/intel/xe_exec_store: Fix basic-all subtest

I will merge it with this correction.

Regards,
Kamil

> implement xe_for_each_engine in basic-all test so that,
> it queries all the supported classes and instances for a gt
> and submits workload to it. which fixes the num_placements issue.
> 
> Signed-off-by: Sai Gowtham Ch <sai.gowtham.ch@intel.com>
> ---
>  tests/intel/xe_exec_store.c | 131 ++++++++----------------------------
>  1 file changed, 27 insertions(+), 104 deletions(-)
> 
> diff --git a/tests/intel/xe_exec_store.c b/tests/intel/xe_exec_store.c
> index 6d5a1bbac..7a66d744c 100644
> --- a/tests/intel/xe_exec_store.c
> +++ b/tests/intel/xe_exec_store.c
> @@ -79,8 +79,10 @@ static void cond_batch(struct data *data, uint64_t addr, int value)
>   * Description: Basic test to verify store dword.
>   * SUBTEST: basic-cond-batch
>   * Description: Basic test to verify cond batch end instruction.
> + * SUBTEST: basic-all
> + * Description: Test to verify store dword on all available engines.
>   */
> -static void basic_inst(int fd, int inst_type)
> +static void basic_inst(int fd, int inst_type, struct drm_xe_engine_class_instance *eci)
>  {
>  	struct drm_xe_sync sync = {
>  		.type = DRM_XE_SYNC_TYPE_SYNCOBJ,
> @@ -92,9 +94,9 @@ static void basic_inst(int fd, int inst_type)
>  		.syncs = to_user_pointer(&sync),
>  	};
>  	struct data *data;
> -	struct drm_xe_engine *engine;
>  	uint32_t vm;
>  	uint32_t exec_queue;
> +	uint32_t bind_engine;
>  	uint32_t syncobj;
>  	size_t bo_size;
>  	int value = 0x123456;
> @@ -109,12 +111,13 @@ static void basic_inst(int fd, int inst_type)
>  	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>  			xe_get_default_alignment(fd));
>  
> -	engine = xe_engine(fd, 1);
>  	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, engine->instance.gt_id),
> +			  vram_if_possible(fd, eci->gt_id),
>  			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
>  
> -	xe_vm_bind_async(fd, vm, engine->instance.gt_id, bo, 0, addr, bo_size, &sync, 1);
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
> +	bind_engine = xe_bind_exec_queue_create(fd, vm, 0, true);
> +	xe_vm_bind_async(fd, vm, bind_engine, bo, 0, addr, bo_size, &sync, 1);
>  	data = xe_bo_map(fd, bo, bo_size);
>  
>  	if (inst_type == STORE)
> @@ -127,7 +130,7 @@ static void basic_inst(int fd, int inst_type)
>  	else
>  		igt_assert_f(inst_type < 2, "Entered wrong inst_type.\n");
>  
> -	exec_queue = xe_exec_queue_create(fd, vm, &engine->instance, 0);
> +	exec_queue = xe_exec_queue_create(fd, vm, eci, 0);
>  	exec.exec_queue_id = exec_queue;
>  	exec.address = data->addr;
>  	sync.flags &= DRM_XE_SYNC_FLAG_SIGNAL;
> @@ -243,115 +246,35 @@ static void store_cachelines(int fd, struct drm_xe_engine_class_instance *eci,
>  	xe_vm_destroy(fd, vm);
>  }
>  
> -/**
> - * SUBTEST: basic-all
> - * Description: Test to verify store dword on all available engines.
> - */
> -static void store_all(int fd, int gt, int class)
> -{
> -	struct drm_xe_sync sync[2] = {
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, },
> -		{ .type = DRM_XE_SYNC_TYPE_SYNCOBJ, .flags = DRM_XE_SYNC_FLAG_SIGNAL, }
> -	};
> -	struct drm_xe_exec exec = {
> -		.num_batch_buffer = 1,
> -		.num_syncs = 2,
> -		.syncs = to_user_pointer(&sync),
> -	};
> -
> -	struct data *data;
> -	uint32_t syncobjs[MAX_INSTANCE];
> -	uint32_t exec_queues[MAX_INSTANCE];
> -	uint32_t vm;
> -	size_t bo_size;
> -	uint64_t addr = 0x100000;
> -	uint32_t bo = 0;
> -	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
> -	struct drm_xe_engine_class_instance *hwe;
> -	int i, num_placements = 0;
> -
> -	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_FLAG_ASYNC_DEFAULT, 0);
> -	bo_size = sizeof(*data);
> -	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
> -			xe_get_default_alignment(fd));
> -
> -	bo = xe_bo_create(fd, vm, bo_size,
> -			  vram_if_possible(fd, 0),
> -			  DRM_XE_GEM_CREATE_FLAG_NEEDS_VISIBLE_VRAM);
> -	data = xe_bo_map(fd, bo, bo_size);
> -
> -	xe_for_each_engine(fd, hwe) {
> -		if (hwe->engine_class != class || hwe->gt_id != gt)
> -			continue;
> -		eci[num_placements++] = *hwe;
> -	}
> -
> -	igt_require(num_placements);
> -
> -	for (i = 0; i < num_placements; i++) {
> -		struct drm_xe_exec_queue_create create = {
> -			.vm_id = vm,
> -			.width = 1,
> -			.num_placements = num_placements,
> -			.instances = to_user_pointer(eci),
> -		};
> -
> -		igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC_QUEUE_CREATE,
> -					&create), 0);
> -		exec_queues[i] = create.exec_queue_id;
> -		syncobjs[i] = syncobj_create(fd, 0);
> -	};
> -
> -	sync[0].handle = syncobj_create(fd, 0);
> -	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
> -
> -	for (i = 0; i < num_placements; i++) {
> -
> -		store_dword_batch(data, addr, i);
> -		sync[0].flags &= ~DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].flags |= DRM_XE_SYNC_FLAG_SIGNAL;
> -		sync[1].handle = syncobjs[i];
> -
> -		exec.exec_queue_id = exec_queues[i];
> -		exec.address = data->addr;
> -		xe_exec(fd, &exec);
> -
> -		igt_assert(syncobj_wait(fd, &syncobjs[i], 1, INT64_MAX, 0, NULL));
> -		igt_assert_eq(data->data, i);
> -	}
> -
> -	xe_vm_unbind_async(fd, vm, 0, 0, addr, bo_size, sync, 1);
> -	syncobj_destroy(fd, sync[0].handle);
> -	munmap(data, bo_size);
> -	gem_close(fd, bo);
> -
> -	for (i = 0; i < num_placements; i++) {
> -		syncobj_destroy(fd, syncobjs[i]);
> -		xe_exec_queue_destroy(fd, exec_queues[i]);
> -	}
> -	xe_vm_destroy(fd, vm);
> -}
> -
>  igt_main
>  {
>  	struct drm_xe_engine_class_instance *hwe;
> -	int fd, class, gt;
> +	int fd;
> +	struct drm_xe_engine *engine;
>  
>  	igt_fixture {
>  		fd = drm_open_driver(DRIVER_XE);
>  		xe_device_get(fd);
>  	}
>  
> -	igt_subtest("basic-store")
> -		basic_inst(fd, STORE);
> +	igt_subtest("basic-store") {
> +		engine = xe_engine(fd, 1);
> +		basic_inst(fd, STORE, &engine->instance);
> +	}
>  
> -	igt_subtest("basic-cond-batch")
> -		basic_inst(fd, COND_BATCH);
> +	igt_subtest("basic-cond-batch") {
> +		engine = xe_engine(fd, 1);
> +		basic_inst(fd, COND_BATCH, &engine->instance);
> +	}
>  
> -	igt_subtest("basic-all") {
> -		xe_for_each_gt(fd, gt)
> -			xe_for_each_engine_class(class)
> -				store_all(fd, gt, class);
> +	igt_subtest_with_dynamic("basic-all") {
> +		xe_for_each_engine(fd, hwe) {
> +			igt_dynamic_f("Engine-%s-Instance-%d-Tile-%d",
> +				      xe_engine_class_string(hwe->engine_class),
> +				      hwe->engine_instance,
> +				      hwe->gt_id);
> +			basic_inst(fd, STORE, hwe);
> +		}
>  	}
>  
>  	igt_subtest("cachelines")
> -- 
> 2.39.1
> 
