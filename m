Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DDA10E939
 for <igt-dev@lists.freedesktop.org>; Wed,  5 Apr 2023 12:53:14 +0000 (UTC)
Message-ID: <fde359c6-4fff-20f9-3512-cf7cf8e3c1de@intel.com>
Date: Wed, 5 Apr 2023 15:53:02 +0300
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, <igt-dev@lists.freedesktop.org>
References: <20230329115642.244296-1-matthew.auld@intel.com>
 <20230329115642.244296-4-matthew.auld@intel.com>
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
In-Reply-To: <20230329115642.244296-4-matthew.auld@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/5] tests/xe: handle small-bar systems
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



On 3/29/23 2:56 PM, Matthew Auld wrote:
> Convert all the existing tests that require CPU access.
> 
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> ---
>   lib/xe/xe_spin.c                |  3 ++-
>   tests/xe/xe_dma_buf_sync.c      |  3 ++-
>   tests/xe/xe_evict.c             | 32 +++++++++++++++++++-------------
>   tests/xe/xe_exec_balancer.c     |  6 +++---
>   tests/xe/xe_exec_basic.c        | 19 ++++++++++---------
>   tests/xe/xe_exec_compute_mode.c |  4 ++--
>   tests/xe/xe_exec_fault_mode.c   | 12 ++++++++----
>   tests/xe/xe_exec_reset.c        | 13 ++++++++-----
>   tests/xe/xe_exec_threads.c      |  9 ++++++---
>   tests/xe/xe_guc_pc.c            |  3 ++-
>   tests/xe/xe_mmap.c              |  4 ++--
>   tests/xe/xe_pm.c                |  3 ++-
>   tests/xe/xe_prime_self_import.c |  8 ++++----
>   tests/xe/xe_vm.c                | 21 ++++++++++++++-------
>   14 files changed, 84 insertions(+), 56 deletions(-)
> 
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> index 856d0ba2..3266905c 100644
> --- a/lib/xe/xe_spin.c
> +++ b/lib/xe/xe_spin.c
> @@ -100,7 +100,8 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>   
>   	vm = xe_vm_create(fd, 0, 0);
>   
> -	bo = xe_bo_create(fd, hwe->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, hwe->gt_id));
>   	spin = xe_bo_map(fd, bo, 0x1000);
>   
>   	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> diff --git a/tests/xe/xe_dma_buf_sync.c b/tests/xe/xe_dma_buf_sync.c
> index 8b97480a..3b4ee6bb 100644
> --- a/tests/xe/xe_dma_buf_sync.c
> +++ b/tests/xe/xe_dma_buf_sync.c
> @@ -122,7 +122,8 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd[0]),
>   			xe_get_default_alignment(fd[0]));
>   	for (i = 0; i < n_bo; ++i) {
> -		bo[i] = xe_bo_create(fd[0], hwe0->gt_id, 0, bo_size);
> +		bo[i] = xe_bo_create_flags(fd[0], 0, bo_size,
> +					   visible_vram_if_possible(fd[0], hwe0->gt_id));
>   		dma_buf_fd[i] = prime_handle_to_fd(fd[0], bo[i]);
>   		import_bo[i] = prime_fd_to_handle(fd[1], dma_buf_fd[i]);
>   
> diff --git a/tests/xe/xe_evict.c b/tests/xe/xe_evict.c
> index eddbbd6f..26ed63de 100644
> --- a/tests/xe/xe_evict.c
> +++ b/tests/xe/xe_evict.c
> @@ -98,15 +98,17 @@ test_evict(int fd, struct drm_xe_engine_class_instance *eci,
>                                   i < n_execs / 8 ? 0 : vm;
>   
>   			if (flags & MULTI_VM) {
> -				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, 0,
> -							    bo_size);
> +				__bo = bo[i] = xe_bo_create_flags(fd, 0,
> +								  bo_size,
> +								  visible_vram_memory(fd, eci->gt_id));
>   			} else if (flags & THREADED) {
> -				__bo = bo[i] = xe_bo_create(fd, eci->gt_id, vm,
> -							    bo_size);
> +				__bo = bo[i] = xe_bo_create_flags(fd, vm,
> +								  bo_size,
> +								  visible_vram_memory(fd, eci->gt_id));
>   			} else {
>   				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
>   								  bo_size,
> -								  vram_memory(fd, eci->gt_id) |
> +								  visible_vram_memory(fd, eci->gt_id) |
>   								  system_memory(fd));
>   			}
>   		} else {
> @@ -281,16 +283,17 @@ test_evict_cm(int fd, struct drm_xe_engine_class_instance *eci,
>                                   i < n_execs / 8 ? 0 : vm;
>   
>   			if (flags & MULTI_VM) {
> -				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
> -							    0, bo_size);
> +				__bo = bo[i] = xe_bo_create_flags(fd, 0,
> +								  bo_size,
> +								  visible_vram_memory(fd, eci->gt_id));
>   			} else if (flags & THREADED) {
> -				__bo = bo[i] = xe_bo_create(fd, eci->gt_id,
> -							    vm, bo_size);
> +				__bo = bo[i] = xe_bo_create_flags(fd, vm,
> +								  bo_size,
> +								  visible_vram_memory(fd, eci->gt_id));
>   			} else {
>   				__bo = bo[i] = xe_bo_create_flags(fd, _vm,
>   								  bo_size,
> -								  vram_memory(fd, eci->gt_id) |
> -								  system_memory(fd));
> +								  visible_vram_memory(fd, eci->gt_id));
>   			}
>   		} else {
>   			__bo = bo[i % (n_execs / 2)];
> @@ -455,7 +458,10 @@ threads(int fd, struct drm_xe_engine_class_instance *eci,
>   
>   static uint64_t calc_bo_size(uint64_t vram_size, int mul, int div)
>   {
> -	return (ALIGN(vram_size, 0x40000000)  * mul) / div;
> +	if (vram_size >= 0x40000000)
> +		return (ALIGN(vram_size, 0x40000000)  * mul) / div;
> +	else
> +		return (ALIGN(vram_size, 0x10000000)  * mul) / div; /* small-bar */
>   }
It's not directly related to this patch, although I'm just curious 
because I don't know exactly how this test case was added in the first 
place, since the part that comes in as an argument seems to be used to 
calculate the size of the buffer to allocate, and since the mul and div 
variables are not used except to determine the size of the buffer, why 
not just put the value to be multiplied by the buffer directly into the 
section?

rest of changes looks good to me.

Reviewed-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>


>   
>   /**
> @@ -670,7 +676,7 @@ igt_main
>   		fd = drm_open_driver(DRIVER_XE);
>   		xe_device_get(fd);
>   		igt_require(xe_has_vram(fd));
> -		vram_size = xe_vram_size(fd, 0);
> +		vram_size = xe_visible_vram_size(fd, 0);
>   		igt_assert(vram_size);
>   
>   		xe_for_each_hw_engine(fd, hwe)
> diff --git a/tests/xe/xe_exec_balancer.c b/tests/xe/xe_exec_balancer.c
> index f3341a99..766e834c 100644
> --- a/tests/xe/xe_exec_balancer.c
> +++ b/tests/xe/xe_exec_balancer.c
> @@ -70,7 +70,7 @@ static void test_all_active(int fd, int gt, int class)
>   	bo_size = sizeof(*data) * num_placements;
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd), xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, gt, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < num_placements; i++) {
> @@ -229,7 +229,7 @@ test_exec(int fd, int gt, int class, int n_engines, int n_execs,
>   		}
>   		memset(data, 0, bo_size);
>   	} else {
> -		bo = xe_bo_create(fd, gt, vm, bo_size);
> +		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   
> @@ -454,7 +454,7 @@ test_cm(int fd, int gt, int class, int n_engines, int n_execs,
>   			igt_assert(data);
>   		}
>   	} else {
> -		bo = xe_bo_create(fd, gt, vm, bo_size);
> +		bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> diff --git a/tests/xe/xe_exec_basic.c b/tests/xe/xe_exec_basic.c
> index 2a3cebd3..5e09e4a0 100644
> --- a/tests/xe/xe_exec_basic.c
> +++ b/tests/xe/xe_exec_basic.c
> @@ -129,15 +129,16 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   		}
>   		memset(data, 0, bo_size);
>   	} else {
> -		if (flags & DEFER_ALLOC) {
> -			bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
> -						bo_size,
> -						vram_if_possible(fd, eci->gt_id) |
> -						XE_GEM_CREATE_FLAG_DEFER_BACKING);
> -		} else {
> -			bo = xe_bo_create(fd, eci->gt_id, n_vm == 1 ? vm[0] : 0,
> -					  bo_size);
> -		}
> +		uint32_t bo_flags;
> +
> +		bo_flags = 0;
> +		if (bo_flags & DEFER_ALLOC)
> +			bo_flags |= XE_GEM_CREATE_FLAG_DEFER_BACKING;
> +
> +		bo = xe_bo_create_flags(fd, n_vm == 1 ? vm[0] : 0,
> +					bo_size,
> +					visible_vram_if_possible(fd, eci->gt_id) |
> +					bo_flags);
>   		if (!(flags & DEFER_BIND))
>   			data = xe_bo_map(fd, bo, bo_size);
>   	}
> diff --git a/tests/xe/xe_exec_compute_mode.c b/tests/xe/xe_exec_compute_mode.c
> index 60713a95..b06acd9b 100644
> --- a/tests/xe/xe_exec_compute_mode.c
> +++ b/tests/xe/xe_exec_compute_mode.c
> @@ -152,8 +152,8 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   			igt_assert(data);
>   		}
>   	} else {
> -		bo = xe_bo_create(fd, eci->gt_id, flags & VM_FOR_BO ? vm : 0,
> -				  bo_size);
> +		bo = xe_bo_create_flags(fd, flags & VM_FOR_BO ? vm : 0,
> +					bo_size, visible_vram_if_possible(fd, eci->gt_id));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> diff --git a/tests/xe/xe_exec_fault_mode.c b/tests/xe/xe_exec_fault_mode.c
> index b5d924a3..95eacfd5 100644
> --- a/tests/xe/xe_exec_fault_mode.c
> +++ b/tests/xe/xe_exec_fault_mode.c
> @@ -157,9 +157,11 @@ test_exec(int fd, struct drm_xe_engine_class_instance *eci,
>   	} else {
>   		if (flags & PREFETCH)
>   			bo = xe_bo_create_flags(fd, 0, bo_size,
> -						all_memory_regions(fd));
> +						all_memory_regions(fd) |
> +						visible_vram_if_possible(fd, 0));
>   		else
> -			bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
> +			bo = xe_bo_create_flags(fd, 0, bo_size,
> +						visible_vram_if_possible(fd, eci->gt_id));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> @@ -390,8 +392,10 @@ test_atomic(int fd, struct drm_xe_engine_class_instance *eci,
>   	addr_wait = addr + bo_size;
>   
>   	bo = xe_bo_create_flags(fd, vm, bo_size,
> -				all_memory_regions(fd));
> -	bo_wait = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +				all_memory_regions(fd) |
> +				visible_vram_if_possible(fd, 0));
> +	bo_wait = xe_bo_create_flags(fd, vm, bo_size,
> +				     visible_vram_if_possible(fd, eci->gt_id));
>   	data = xe_bo_map(fd, bo, bo_size);
>   	wait = xe_bo_map(fd, bo_wait, bo_size);
>   	ptr = &data[0].data;
> diff --git a/tests/xe/xe_exec_reset.c b/tests/xe/xe_exec_reset.c
> index 57dc90dd..d171b3b3 100644
> --- a/tests/xe/xe_exec_reset.c
> +++ b/tests/xe/xe_exec_reset.c
> @@ -51,7 +51,8 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, eci->gt_id));
>   	spin = xe_bo_map(fd, bo, bo_size);
>   
>   	engine = xe_engine_create(fd, vm, eci, 0);
> @@ -197,7 +198,7 @@ test_balancer(int fd, int gt, int class, int n_engines, int n_execs,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, gt, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, gt));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < n_engines; i++) {
> @@ -398,7 +399,8 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, eci->gt_id));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < n_engines; i++) {
> @@ -577,7 +579,8 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, eci->gt_id));
>   	data = xe_bo_map(fd, bo, bo_size);
>   	memset(data, 0, bo_size);
>   
> @@ -710,7 +713,7 @@ static void submit_jobs(struct gt_thread_data *t)
>   	uint32_t bo;
>   	uint32_t *data;
>   
> -	bo = xe_bo_create(fd, 0, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
>   	data = xe_bo_map(fd, bo, bo_size);
>   	data[0] = MI_BATCH_BUFFER_END;
>   
> diff --git a/tests/xe/xe_exec_threads.c b/tests/xe/xe_exec_threads.c
> index c34d8aec..1d7534e5 100644
> --- a/tests/xe/xe_exec_threads.c
> +++ b/tests/xe/xe_exec_threads.c
> @@ -107,7 +107,8 @@ test_balancer(int fd, int gt, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			igt_assert(data);
>   		}
>   	} else {
> -		bo = xe_bo_create(fd, gt, vm, bo_size);
> +		bo = xe_bo_create_flags(fd, vm, bo_size,
> +					visible_vram_if_possible(fd, gt));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> @@ -309,7 +310,8 @@ test_compute_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			igt_assert(data);
>   		}
>   	} else {
> -		bo = xe_bo_create(fd, eci->gt_id, 0, bo_size);
> +		bo = xe_bo_create_flags(fd, 0, bo_size,
> +					visible_vram_if_possible(fd, eci->gt_id));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> @@ -517,7 +519,8 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>   			igt_assert(data);
>   		}
>   	} else {
> -		bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +		bo = xe_bo_create_flags(fd, vm, bo_size,
> +					visible_vram_if_possible(fd, eci->gt_id));
>   		data = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(data, 0, bo_size);
> diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c
> index 60c93288..bf304bd7 100644
> --- a/tests/xe/xe_guc_pc.c
> +++ b/tests/xe/xe_guc_pc.c
> @@ -64,7 +64,8 @@ static void exec_basic(int fd, struct drm_xe_engine_class_instance *eci,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, eci->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size,
> +				visible_vram_if_possible(fd, eci->gt_id));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < n_engines; i++) {
> diff --git a/tests/xe/xe_mmap.c b/tests/xe/xe_mmap.c
> index 6b313a18..b23ce10c 100644
> --- a/tests/xe/xe_mmap.c
> +++ b/tests/xe/xe_mmap.c
> @@ -70,10 +70,10 @@ igt_main
>   		test_mmap(fd, system_memory(fd));
>   
>   	igt_subtest("vram")
> -		test_mmap(fd, vram_memory(fd, 0));
> +		test_mmap(fd, visible_vram_memory(fd, 0));
>   
>   	igt_subtest("vram-system")
> -		test_mmap(fd, vram_memory(fd, 0) | system_memory(fd));
> +		test_mmap(fd, visible_vram_memory(fd, 0) | system_memory(fd));
>   
>   	igt_fixture {
>   		xe_device_put(fd);
> diff --git a/tests/xe/xe_pm.c b/tests/xe/xe_pm.c
> index 23b8246e..b3f47355 100644
> --- a/tests/xe/xe_pm.c
> +++ b/tests/xe/xe_pm.c
> @@ -250,7 +250,8 @@ test_exec(device_t device, struct drm_xe_engine_class_instance *eci,
>   	if (check_rpm && runtime_usage_available(device.pci_xe))
>   		rpm_usage = igt_pm_get_runtime_usage(device.pci_xe);
>   
> -	bo = xe_bo_create(device.fd_xe, eci->gt_id, vm, bo_size);
> +	bo = xe_bo_create_flags(device.fd_xe, vm, bo_size,
> +				visible_vram_if_possible(device.fd_xe, eci->gt_id));
>   	data = xe_bo_map(device.fd_xe, bo, bo_size);
>   
>   	for (i = 0; i < n_engines; i++) {
> diff --git a/tests/xe/xe_prime_self_import.c b/tests/xe/xe_prime_self_import.c
> index 5710cff9..97e330db 100644
> --- a/tests/xe/xe_prime_self_import.c
> +++ b/tests/xe/xe_prime_self_import.c
> @@ -107,7 +107,7 @@ static void test_with_fd_dup(void)
>   	fd2 = drm_open_driver(DRIVER_XE);
>   	xe_device_get(fd2);
>   
> -	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
> +	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
>   
>   	dma_buf_fd1 = prime_handle_to_fd(fd1, handle);
>   	gem_close(fd1, handle);
> @@ -146,8 +146,8 @@ static void test_with_two_bos(void)
>   	fd2 = drm_open_driver(DRIVER_XE);
>   	xe_device_get(fd2);
>   
> -	handle1 = xe_bo_create(fd1, 0, 0, BO_SIZE);
> -	handle2 = xe_bo_create(fd1, 0, 0, BO_SIZE);
> +	handle1 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
> +	handle2 = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
>   
>   	dma_buf_fd = prime_handle_to_fd(fd1, handle1);
>   	handle_import = prime_fd_to_handle(fd2, dma_buf_fd);
> @@ -225,7 +225,7 @@ static void test_with_one_bo(void)
>   	fd2 = drm_open_driver(DRIVER_XE);
>   	xe_device_get(fd2);
>   
> -	handle = xe_bo_create(fd1, 0, 0, BO_SIZE);
> +	handle = xe_bo_create_flags(fd1, 0, BO_SIZE, visible_vram_if_possible(fd1, 0));
>   
>   	dma_buf_fd = prime_handle_to_fd(fd1, handle);
>   	handle_import1 = prime_fd_to_handle(fd2, dma_buf_fd);
> diff --git a/tests/xe/xe_vm.c b/tests/xe/xe_vm.c
> index 15356c70..96b12f60 100644
> --- a/tests/xe/xe_vm.c
> +++ b/tests/xe/xe_vm.c
> @@ -52,7 +52,8 @@ write_dwords(int fd, uint32_t vm, int n_dwords, uint64_t *addrs)
>   	batch_size = (n_dwords * 4 + 1) * sizeof(uint32_t);
>   	batch_size = ALIGN(batch_size + xe_cs_prefetch_size(fd),
>   			   xe_get_default_alignment(fd));
> -	batch_bo = xe_bo_create(fd, 0, vm, batch_size);
> +	batch_bo = xe_bo_create_flags(fd, vm, batch_size,
> +				      visible_vram_if_possible(fd, 0));
>   	batch_map = xe_bo_map(fd, batch_bo, batch_size);
>   
>   	for (i = 0; i < n_dwords; i++) {
> @@ -116,7 +117,7 @@ __test_bind_one_bo(int fd, uint32_t vm, int n_addrs, uint64_t *addrs)
>   		vms = malloc(sizeof(*vms) * n_addrs);
>   		igt_assert(vms);
>   	}
> -	bo = xe_bo_create(fd, 0, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
>   	map = xe_bo_map(fd, bo, bo_size);
>   	memset(map, 0, bo_size);
>   
> @@ -549,7 +550,8 @@ shared_pte_page(int fd, struct drm_xe_engine_class_instance *eci, int n_bo,
>   			xe_get_default_alignment(fd));
>   
>   	for (i = 0; i < n_bo; ++i) {
> -		bo[i] = xe_bo_create(fd, 0, vm, bo_size);
> +		bo[i] = xe_bo_create_flags(fd, vm, bo_size,
> +					   visible_vram_if_possible(fd, 0));
>   		data[i] = xe_bo_map(fd, bo[i], bo_size);
>   	}
>   
> @@ -717,7 +719,7 @@ test_bind_engines_independent(int fd, struct drm_xe_engine_class_instance *eci)
>   	bo_size = sizeof(*data) * N_ENGINES;
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
> -	bo = xe_bo_create(fd, 0, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	for (i = 0; i < N_ENGINES; i++) {
> @@ -874,7 +876,7 @@ test_bind_array(int fd, struct drm_xe_engine_class_instance *eci, int n_execs,
>   	bo_size = ALIGN(bo_size + xe_cs_prefetch_size(fd),
>   			xe_get_default_alignment(fd));
>   
> -	bo = xe_bo_create(fd, 0, vm, bo_size);
> +	bo = xe_bo_create_flags(fd, vm, bo_size, visible_vram_if_possible(fd, 0));
>   	data = xe_bo_map(fd, bo, bo_size);
>   
>   	if (flags & BIND_ARRAY_BIND_ENGINE_FLAG)
> @@ -1052,7 +1054,11 @@ test_large_binds(int fd, struct drm_xe_engine_class_instance *eci,
>   		map = aligned_alloc(xe_get_default_alignment(fd), bo_size);
>   		igt_assert(map);
>   	} else {
> -		bo = xe_bo_create(fd, 0, vm, bo_size);
> +		igt_skip_on(xe_visible_vram_size(fd, 0) && bo_size >
> +			    xe_visible_vram_size(fd, 0));
> +
> +		bo = xe_bo_create_flags(fd, vm, bo_size,
> +					visible_vram_if_possible(fd, 0));
>   		map = xe_bo_map(fd, bo, bo_size);
>   	}
>   
> @@ -1329,7 +1335,8 @@ test_munmap_style_unbind(int fd, struct drm_xe_engine_class_instance *eci,
>   			    MAP_ANONYMOUS, -1, 0);
>   		igt_assert(data != MAP_FAILED);
>   	} else {
> -		bo = xe_bo_create(fd, 0, vm, bo_size);
> +		bo = xe_bo_create_flags(fd, vm, bo_size,
> +					visible_vram_if_possible(fd, 0));
>   		map = xe_bo_map(fd, bo, bo_size);
>   	}
>   	memset(map, 0, bo_size);
