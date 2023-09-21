Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A0810E012
 for <igt-dev@lists.freedesktop.org>; Thu, 21 Sep 2023 15:10:52 +0000 (UTC)
Message-ID: <1e52bda5-d00f-04ce-f24d-9dec08bf8aaf@linux.intel.com>
Date: Thu, 21 Sep 2023 17:08:54 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230906155108.2175876-1-marcin.bernatowicz@linux.intel.com>
 <20230906155108.2175876-2-marcin.bernatowicz@linux.intel.com>
 <20230920164321.bxd4q6y43t5aagei@kamilkon-desk.igk.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <20230920164321.bxd4q6y43t5aagei@kamilkon-desk.igk.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/8] lib/xe_spin: xe_spin_opts for
 xe_spin initialization
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

Hi,

On 9/20/2023 6:43 PM, Kamil Konieczny wrote:
> Hi Marcin,
> 
> could you drop already merged patches and resent?

Yes, will send a new series shortly.

Regards,
Marcin
> 
> Regards,
> Kamil
> 
> On 2023-09-06 at 15:51:01 +0000, Marcin Bernatowicz wrote:
>> Introduced struct xe_spin_opts for xe_spin initialization,
>> adjusted tests to new xe_spin_init signature.
>> Added xe_spin_init_opts macro (Zbyszek).
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   lib/xe/xe_spin.c               | 28 ++++++++++------------------
>>   lib/xe/xe_spin.h               | 19 ++++++++++++++++++-
>>   tests/intel/xe_dma_buf_sync.c  |  6 +++---
>>   tests/intel/xe_exec_balancer.c |  9 ++++-----
>>   tests/intel/xe_exec_reset.c    | 24 ++++++++++++++----------
>>   tests/intel/xe_exec_threads.c  |  7 ++++---
>>   tests/intel/xe_vm.c            |  7 ++++---
>>   7 files changed, 57 insertions(+), 43 deletions(-)
>>
>> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
>> index 7113972ee..27f837ef9 100644
>> --- a/lib/xe/xe_spin.c
>> +++ b/lib/xe/xe_spin.c
>> @@ -19,17 +19,13 @@
>>   /**
>>    * xe_spin_init:
>>    * @spin: pointer to mapped bo in which spinner code will be written
>> - * @addr: offset of spinner within vm
>> - * @preempt: allow spinner to be preempted or not
>> + * @opts: pointer to spinner initialization options
>>    */
>> -void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
>> +void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts)
>>   {
>> -	uint64_t batch_offset = (char *)&spin->batch - (char *)spin;
>> -	uint64_t batch_addr = addr + batch_offset;
>> -	uint64_t start_offset = (char *)&spin->start - (char *)spin;
>> -	uint64_t start_addr = addr + start_offset;
>> -	uint64_t end_offset = (char *)&spin->end - (char *)spin;
>> -	uint64_t end_addr = addr + end_offset;
>> +	uint64_t loop_addr = opts->addr + offsetof(struct xe_spin, batch);
>> +	uint64_t start_addr = opts->addr + offsetof(struct xe_spin, start);
>> +	uint64_t end_addr = opts->addr + offsetof(struct xe_spin, end);
>>   	int b = 0;
>>   
>>   	spin->start = 0;
>> @@ -40,7 +36,7 @@ void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
>>   	spin->batch[b++] = start_addr >> 32;
>>   	spin->batch[b++] = 0xc0ffee;
>>   
>> -	if (preempt)
>> +	if (opts->preempt)
>>   		spin->batch[b++] = (0x5 << 23);
>>   
>>   	spin->batch[b++] = MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
>> @@ -49,8 +45,8 @@ void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
>>   	spin->batch[b++] = end_addr >> 32;
>>   
>>   	spin->batch[b++] = MI_BATCH_BUFFER_START | 1 << 8 | 1;
>> -	spin->batch[b++] = batch_addr;
>> -	spin->batch[b++] = batch_addr >> 32;
>> +	spin->batch[b++] = loop_addr;
>> +	spin->batch[b++] = loop_addr >> 32;
>>   
>>   	igt_assert(b <= ARRAY_SIZE(spin->batch));
>>   }
>> @@ -133,11 +129,7 @@ xe_spin_create(int fd, const struct igt_spin_factory *opt)
>>   	addr = intel_allocator_alloc_with_strategy(ahnd, spin->handle, bo_size, 0, ALLOC_STRATEGY_LOW_TO_HIGH);
>>   	xe_vm_bind_sync(fd, spin->vm, spin->handle, 0, addr, bo_size);
>>   
>> -	if (!(opt->flags & IGT_SPIN_NO_PREEMPTION))
>> -		xe_spin_init(xe_spin, addr, true);
>> -	else
>> -		xe_spin_init(xe_spin, addr, false);
>> -
>> +	xe_spin_init_opts(xe_spin, .addr = addr, .preempt = !(opt->flags & IGT_SPIN_NO_PREEMPTION));
>>   	exec.exec_queue_id = spin->engine;
>>   	exec.address = addr;
>>   	sync.handle = spin->syncobj;
>> @@ -219,7 +211,7 @@ void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
>>   	exec_queue = xe_exec_queue_create(fd, vm, hwe, 0);
>>   	syncobj = syncobj_create(fd, 0);
>>   
>> -	xe_spin_init(spin, addr, true);
>> +	xe_spin_init_opts(spin, .addr = addr, .preempt = true);
>>   	exec.exec_queue_id = exec_queue;
>>   	exec.address = addr;
>>   	sync.handle = syncobj;
>> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
>> index c84db175d..9f1d33294 100644
>> --- a/lib/xe/xe_spin.h
>> +++ b/lib/xe/xe_spin.h
>> @@ -15,6 +15,18 @@
>>   #include "xe_query.h"
>>   #include "lib/igt_dummyload.h"
>>   
>> +/** struct xe_spin_opts
>> + *
>> + * @addr: offset of spinner within vm
>> + * @preempt: allow spinner to be preempted or not
>> + *
>> + * Used to initialize struct xe_spin spinner behavior.
>> + */
>> +struct xe_spin_opts {
>> +	uint64_t addr;
>> +	bool preempt;
>> +};
>> +
>>   /* Mapped GPU object */
>>   struct xe_spin {
>>   	uint32_t batch[16];
>> @@ -22,8 +34,13 @@ struct xe_spin {
>>   	uint32_t start;
>>   	uint32_t end;
>>   };
>> +
>>   igt_spin_t *xe_spin_create(int fd, const struct igt_spin_factory *opt);
>> -void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
>> +void xe_spin_init(struct xe_spin *spin, struct xe_spin_opts *opts);
>> +
>> +#define xe_spin_init_opts(fd, ...) \
>> +	xe_spin_init(fd, &((struct xe_spin_opts){__VA_ARGS__}))
>> +
>>   bool xe_spin_started(struct xe_spin *spin);
>>   void xe_spin_sync_wait(int fd, struct igt_spin *spin);
>>   void xe_spin_wait_started(struct xe_spin *spin);
>> diff --git a/tests/intel/xe_dma_buf_sync.c b/tests/intel/xe_dma_buf_sync.c
>> index 29d675154..627f4c1e5 100644
>> --- a/tests/intel/xe_dma_buf_sync.c
>> +++ b/tests/intel/xe_dma_buf_sync.c
>> @@ -144,7 +144,6 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>>   		uint64_t sdi_offset = (char *)&data[i]->data - (char *)data[i];
>>   		uint64_t sdi_addr = addr + sdi_offset;
>>   		uint64_t spin_offset = (char *)&data[i]->spin - (char *)data[i];
>> -		uint64_t spin_addr = addr + spin_offset;
>>   		struct drm_xe_sync sync[2] = {
>>   			{ .flags = DRM_XE_SYNC_SYNCOBJ, },
>>   			{ .flags = DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL, },
>> @@ -153,14 +152,15 @@ test_export_dma_buf(struct drm_xe_engine_class_instance *hwe0,
>>   			.num_batch_buffer = 1,
>>   			.syncs = to_user_pointer(sync),
>>   		};
>> +		struct xe_spin_opts spin_opts = { .addr = addr + spin_offset, .preempt = true };
>>   		uint32_t syncobj;
>>   		int b = 0;
>>   		int sync_fd;
>>   
>>   		/* Write spinner on FD[0] */
>> -		xe_spin_init(&data[i]->spin, spin_addr, true);
>> +		xe_spin_init(&data[i]->spin, &spin_opts);
>>   		exec.exec_queue_id = exec_queue[0];
>> -		exec.address = spin_addr;
>> +		exec.address = spin_opts.addr;
>>   		xe_exec(fd[0], &exec);
>>   
>>   		/* Export prime BO as sync file and veify business */
>> diff --git a/tests/intel/xe_exec_balancer.c b/tests/intel/xe_exec_balancer.c
>> index f364a4b7a..d7d8dd8fb 100644
>> --- a/tests/intel/xe_exec_balancer.c
>> +++ b/tests/intel/xe_exec_balancer.c
>> @@ -52,6 +52,7 @@ static void test_all_active(int fd, int gt, int class)
>>   	struct {
>>   		struct xe_spin spin;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>   	int i, num_placements = 0;
>> @@ -90,16 +91,14 @@ static void test_all_active(int fd, int gt, int class)
>>   	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>>   
>>   	for (i = 0; i < num_placements; i++) {
>> -		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = addr + spin_offset;
>> -
>> -		xe_spin_init(&data[i].spin, spin_addr, false);
>> +		spin_opts.addr = addr + (char *)&data[i].spin - (char *)data;
>> +		xe_spin_init(&data[i].spin, &spin_opts);
>>   		sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
>>   		sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>>   		sync[1].handle = syncobjs[i];
>>   
>>   		exec.exec_queue_id = exec_queues[i];
>> -		exec.address = spin_addr;
>> +		exec.address = spin_opts.addr;
>>   		xe_exec(fd, &exec);
>>   		xe_spin_wait_started(&data[i].spin);
>>   	}
>> diff --git a/tests/intel/xe_exec_reset.c b/tests/intel/xe_exec_reset.c
>> index a2d33baf1..be6bbada6 100644
>> --- a/tests/intel/xe_exec_reset.c
>> +++ b/tests/intel/xe_exec_reset.c
>> @@ -44,6 +44,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>>   	size_t bo_size;
>>   	uint32_t bo = 0;
>>   	struct xe_spin *spin;
>> +	struct xe_spin_opts spin_opts = { .addr = addr, .preempt = false };
>>   
>>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>>   	bo_size = sizeof(*spin);
>> @@ -60,7 +61,7 @@ static void test_spin(int fd, struct drm_xe_engine_class_instance *eci)
>>   	sync[0].handle = syncobj_create(fd, 0);
>>   	xe_vm_bind_async(fd, vm, 0, bo, 0, addr, bo_size, sync, 1);
>>   
>> -	xe_spin_init(spin, addr, false);
>> +	xe_spin_init(spin, &spin_opts);
>>   
>>   	sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
>>   	sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>> @@ -165,6 +166,7 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>>   		uint64_t pad;
>>   		uint32_t data;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>>   	struct drm_xe_engine_class_instance *hwe;
>>   	struct drm_xe_engine_class_instance eci[MAX_INSTANCE];
>>   	int i, j, b, num_placements = 0, bad_batches = 1;
>> @@ -236,7 +238,6 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>>   		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>   		uint64_t batch_addr = base_addr + batch_offset;
>>   		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = base_addr + spin_offset;
>>   		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>   		uint64_t sdi_addr = base_addr + sdi_offset;
>>   		uint64_t exec_addr;
>> @@ -247,8 +248,9 @@ test_balancer(int fd, int gt, int class, int n_exec_queues, int n_execs,
>>   			batches[j] = batch_addr;
>>   
>>   		if (i < bad_batches) {
>> -			xe_spin_init(&data[i].spin, spin_addr, false);
>> -			exec_addr = spin_addr;
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>>   		} else {
>>   			b = 0;
>>   			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> @@ -368,6 +370,7 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>   		uint64_t pad;
>>   		uint32_t data;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>>   	int i, b;
>>   
>>   	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> @@ -417,15 +420,15 @@ test_legacy_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>   		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>   		uint64_t batch_addr = base_addr + batch_offset;
>>   		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = base_addr + spin_offset;
>>   		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>   		uint64_t sdi_addr = base_addr + sdi_offset;
>>   		uint64_t exec_addr;
>>   		int e = i % n_exec_queues;
>>   
>>   		if (!i) {
>> -			xe_spin_init(&data[i].spin, spin_addr, false);
>> -			exec_addr = spin_addr;
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>>   		} else {
>>   			b = 0;
>>   			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> @@ -539,6 +542,7 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>   		uint64_t exec_sync;
>>   		uint32_t data;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>>   	int i, b;
>>   
>>   	igt_assert(n_exec_queues <= MAX_N_EXECQUEUES);
>> @@ -593,15 +597,15 @@ test_compute_mode(int fd, struct drm_xe_engine_class_instance *eci,
>>   		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>   		uint64_t batch_addr = base_addr + batch_offset;
>>   		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = base_addr + spin_offset;
>>   		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>   		uint64_t sdi_addr = base_addr + sdi_offset;
>>   		uint64_t exec_addr;
>>   		int e = i % n_exec_queues;
>>   
>>   		if (!i) {
>> -			xe_spin_init(&data[i].spin, spin_addr, false);
>> -			exec_addr = spin_addr;
>> +			spin_opts.addr = base_addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>>   		} else {
>>   			b = 0;
>>   			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> diff --git a/tests/intel/xe_exec_threads.c b/tests/intel/xe_exec_threads.c
>> index e64c1639a..ff4ebc280 100644
>> --- a/tests/intel/xe_exec_threads.c
>> +++ b/tests/intel/xe_exec_threads.c
>> @@ -486,6 +486,7 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>   		uint64_t pad;
>>   		uint32_t data;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = false };
>>   	int i, j, b, hang_exec_queue = n_exec_queues / 2;
>>   	bool owns_vm = false, owns_fd = false;
>>   
>> @@ -562,15 +563,15 @@ test_legacy_mode(int fd, uint32_t vm, uint64_t addr, uint64_t userptr,
>>   		uint64_t batch_offset = (char *)&data[i].batch - (char *)data;
>>   		uint64_t batch_addr = addr + batch_offset;
>>   		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = addr + spin_offset;
>>   		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>   		uint64_t sdi_addr = addr + sdi_offset;
>>   		uint64_t exec_addr;
>>   		int e = i % n_exec_queues;
>>   
>>   		if (flags & HANG && e == hang_exec_queue && i == e) {
>> -			xe_spin_init(&data[i].spin, spin_addr, false);
>> -			exec_addr = spin_addr;
>> +			spin_opts.addr = addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>> +			exec_addr = spin_opts.addr;
>>   		} else {
>>   			b = 0;
>>   			data[i].batch[b++] = MI_STORE_DWORD_IMM_GEN4;
>> diff --git a/tests/intel/xe_vm.c b/tests/intel/xe_vm.c
>> index e42c04e33..dc1850338 100644
>> --- a/tests/intel/xe_vm.c
>> +++ b/tests/intel/xe_vm.c
>> @@ -727,6 +727,7 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>>   		uint64_t pad;
>>   		uint32_t data;
>>   	} *data;
>> +	struct xe_spin_opts spin_opts = { .preempt = true };
>>   	int i, b;
>>   
>>   	vm = xe_vm_create(fd, DRM_XE_VM_CREATE_ASYNC_BIND_OPS, 0);
>> @@ -755,14 +756,14 @@ test_bind_execqueues_independent(int fd, struct drm_xe_engine_class_instance *ec
>>   		uint64_t sdi_offset = (char *)&data[i].data - (char *)data;
>>   		uint64_t sdi_addr = addr + sdi_offset;
>>   		uint64_t spin_offset = (char *)&data[i].spin - (char *)data;
>> -		uint64_t spin_addr = addr + spin_offset;
>>   		int e = i;
>>   
>>   		if (i == 0) {
>>   			/* Cork 1st exec_queue with a spinner */
>> -			xe_spin_init(&data[i].spin, spin_addr, true);
>> +			spin_opts.addr = addr + spin_offset;
>> +			xe_spin_init(&data[i].spin, &spin_opts);
>>   			exec.exec_queue_id = exec_queues[e];
>> -			exec.address = spin_addr;
>> +			exec.address = spin_opts.addr;
>>   			sync[0].flags &= ~DRM_XE_SYNC_SIGNAL;
>>   			sync[1].flags |= DRM_XE_SYNC_SIGNAL;
>>   			sync[1].handle = syncobjs[e];
>> -- 
>> 2.30.2
>>
