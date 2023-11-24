Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A880810E7E7
 for <igt-dev@lists.freedesktop.org>; Fri, 24 Nov 2023 13:21:19 +0000 (UTC)
Message-ID: <9af3b655-ed68-4356-85d9-78c8a2de6237@linux.intel.com>
Date: Fri, 24 Nov 2023 14:21:08 +0100
MIME-Version: 1.0
Content-Language: en-US
To: igt-dev@lists.freedesktop.org,
 Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
References: <20231030110918.8347-1-marcin.bernatowicz@intel.com>
 <f76a741c-6e47-1d39-c649-c7c23fe8a9ef@intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <f76a741c-6e47-1d39-c649-c7c23fe8a9ef@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] benchmarks/gem_wsim: introduce bb_size
 field
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

On 11/21/2023 10:31 AM, Laguna, Lukasz wrote:
> On 10/30/2023 12:09, Marcin Bernatowicz wrote:
>> In certain scenarios (ATS-M when using LMEM), PAGE_SIZE=4096
>> is insufficient for Xe, necessitating alignment considerations.
>> This change ensures that 'bb_size' aligns properly,
>> preventing VM BIND failures in cases where the size is not aligned
>> to the minimum page size of the region.
>>
>> Additionally, 'alloc_bo' for i915 has been updated to
>> accommodate page-aligned allocated size.
>>
>> v2: Reverted to intel_allocator_alloc_with_strategy as not related
>>      to the change and for clarity due to its origin in a library
>>      rather than local definition. (Tvrtko)
>>
>> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 39 +++++++++++++++++++++++++--------------
>>   1 file changed, 25 insertions(+), 14 deletions(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index 28b809520..58e0ff6e8 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -201,6 +201,7 @@ struct w_step {
>>   			struct drm_xe_sync *syncs;
>>   		} xe;
>>   	};
>> +	unsigned long bb_size;
>>   	uint32_t bb_handle;
>>   };
>>   
>> @@ -1503,7 +1504,7 @@ static unsigned int create_bb(struct w_step *w, int self)
>>   	gem_set_domain(fd, w->bb_handle,
>>   		       I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>>   
>> -	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, 4096, PROT_WRITE);
>> +	cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, PROT_WRITE);
>>   
>>   	/* Store initial 64b timestamp: start */
>>   	*cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
>> @@ -1653,9 +1654,16 @@ xe_get_vm(struct workload *wrk, const struct w_step *w)
>>   	return wrk->xe.vm_list;
>>   }
>>   
>> -static uint32_t alloc_bo(int i915, unsigned long size)
>> +static uint32_t alloc_bo(int i915, unsigned long *size)
>>   {
>> -	return gem_create(i915, size);
>> +	uint32_t handle;
>> +	uint64_t sz = *size;
>> +
>> +	igt_assert_eq(__gem_create(i915, &sz, &handle), 0);
>> +	igt_assert(sz <= ULONG_MAX);
>> +	*size = sz;
>> +
>> +	return handle;
>>   }
>>   
>>   static void
>> @@ -1669,7 +1677,8 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>>   	w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
>>   	igt_assert(w->i915.obj);
>>   
>> -	w->i915.obj[j].handle = alloc_bo(fd, 4096);
>> +	w->bb_size = PAGE_SIZE;
>> +	w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>>   	w->i915.obj[j].flags = EXEC_OBJECT_WRITE;
>>   	j++;
>>   	igt_assert(j < nr_obj);
>> @@ -1706,7 +1715,7 @@ alloc_step_batch(struct workload *wrk, struct w_step *w)
>>   		igt_assert(j < nr_obj);
>>   	}
>>   
>> -	w->bb_handle = w->i915.obj[j].handle = gem_create(fd, 4096);
>> +	w->bb_handle = w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>>   	w->i915.obj[j].relocation_count = create_bb(w, j);
>>   	igt_assert(w->i915.obj[j].relocation_count <= ARRAY_SIZE(w->i915.reloc));
>>   	w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
>> @@ -1734,13 +1743,15 @@ xe_alloc_step_batch(struct workload *wrk, struct w_step *w)
>>   	struct dep_entry *dep;
>>   	int i;
>>   
>> -	w->bb_handle = xe_bo_create_flags(fd, vm->id, PAGE_SIZE,
>> +	w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
>> +			   xe_get_default_alignment(fd));
>> +	w->bb_handle = xe_bo_create_flags(fd, vm->id, w->bb_size,
>>   				visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
>> -	w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
>> +	w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
>>   	w->xe.exec.address =
>> -		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, PAGE_SIZE,
>> +		intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, w->bb_size,
>>   						    0, ALLOC_STRATEGY_LOW_TO_HIGH);
>> -	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, PAGE_SIZE);
>> +	xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, w->bb_size);
>>   	xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
>>   				   .preempt = (w->preempt_us > 0),
>>   				   .ctx_ticks = duration_to_ctx_ticks(fd, eq->hwe_list[0].gt_id,
>> @@ -1936,7 +1947,7 @@ allocate_working_set(struct workload *wrk, struct working_set *set)
>>   
>>   	for (i = 0; i < set->nr; i++) {
>>   		set->sizes[i].size = get_buffer_size(wrk, &set->sizes[i]);
>> -		set->handles[i] = alloc_bo(fd, set->sizes[i].size);
>> +		set->handles[i] = alloc_bo(fd, &set->sizes[i].size);
>>   		total += set->sizes[i].size;
>>   	}
>>   
>> @@ -1971,7 +1982,7 @@ static void measure_active_set(struct workload *wrk)
>>   		if (w->type != BATCH)
>>   			continue;
>>   
>> -		batch_sizes += 4096;
>> +		batch_sizes += w->bb_size;
>>   
>>   		if (is_xe)
>>   			continue;
>> @@ -1990,7 +2001,7 @@ static void measure_active_set(struct workload *wrk)
>>   
>>   			if (!find_dep(deps, nr, _dep)) {
>>   				if (dep->working_set == -1) {
>> -					total += 4096;
>> +					total += w->bb_size;
>>   				} else {
>>   					struct working_set *set;
>>   
>> @@ -2834,8 +2845,8 @@ static void *run_workload(void *data)
>>   				syncobj_destroy(fd, w->xe.syncs[0].handle);
>>   				free(w->xe.syncs);
>>   				xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, w->xe.exec.address,
>> -						  PAGE_SIZE);
>> -				gem_munmap(w->xe.data, PAGE_SIZE);
>> +						  w->bb_size);
>> +				gem_munmap(w->xe.data, w->bb_size);
>>   				gem_close(fd, w->bb_handle);
>>   			} else if (w->type == SW_FENCE) {
>>   				syncobj_destroy(fd, w->xe.syncs[0].handle);
> 
> LGTM,
> Reviewed-by: Lukasz Laguna <lukasz.laguna@intel.com 
> <mailto:lukasz.laguna@intel.com>>
> 
Are we ok to have it merged ?

Regards,
marcin
