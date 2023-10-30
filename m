Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6987710E292
 for <igt-dev@lists.freedesktop.org>; Mon, 30 Oct 2023 11:01:17 +0000 (UTC)
Message-ID: <3293cf8e-63fc-4602-9cea-843195f44253@linux.intel.com>
Date: Mon, 30 Oct 2023 12:01:12 +0100
MIME-Version: 1.0
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Marcin Bernatowicz <marcin.bernatowicz@intel.com>,
 igt-dev@lists.freedesktop.org
References: <20231027122824.11401-1-marcin.bernatowicz@intel.com>
 <151e48f7-b41f-4c89-a93a-f9f9b0dcaaf7@linux.intel.com>
Content-Language: en-US
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <151e48f7-b41f-4c89-a93a-f9f9b0dcaaf7@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t] benchmarks/gem_wsim: introduce bb_size
 field
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: chris.p.wilson@linux.intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



On 10/27/2023 2:56 PM, Tvrtko Ursulin wrote:
> 
> On 27/10/2023 13:28, Marcin Bernatowicz wrote:
>> In certain scenarios (ATS-M when using LMEM), PAGE_SIZE=4096
>> is insufficient for Xe, necessitating alignment considerations.
>> This change ensures that 'bb_size' aligns properly,
>> preventing VM BIND failures in cases where the size is not aligned
>> to the minimum page size of the region.
>>
>> Additionally, 'alloc_bo' for i915 has been updated to
>> accommodate page-aligned allocated size.
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 41 +++++++++++++++++++++++++----------------
>>   1 file changed, 25 insertions(+), 16 deletions(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index 28b809520..01973ade6 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -201,6 +201,7 @@ struct w_step {
>>               struct drm_xe_sync *syncs;
>>           } xe;
>>       };
>> +    unsigned long bb_size;
>>       uint32_t bb_handle;
>>   };
>> @@ -1503,7 +1504,7 @@ static unsigned int create_bb(struct w_step *w, 
>> int self)
>>       gem_set_domain(fd, w->bb_handle,
>>                  I915_GEM_DOMAIN_WC, I915_GEM_DOMAIN_WC);
>> -    cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, 4096, PROT_WRITE);
>> +    cs = ptr = gem_mmap__wc(fd, w->bb_handle, 0, w->bb_size, 
>> PROT_WRITE);
>>       /* Store initial 64b timestamp: start */
>>       *cs++ = MI_LOAD_REGISTER_IMM(1) | MI_CS_MMIO_DST;
>> @@ -1653,9 +1654,16 @@ xe_get_vm(struct workload *wrk, const struct 
>> w_step *w)
>>       return wrk->xe.vm_list;
>>   }
>> -static uint32_t alloc_bo(int i915, unsigned long size)
>> +static uint32_t alloc_bo(int i915, unsigned long *size)
>>   {
>> -    return gem_create(i915, size);
>> +    uint32_t handle;
>> +    uint64_t sz = *size;
>> +
>> +    igt_assert_eq(__gem_create(i915, &sz, &handle), 0);
>> +    igt_assert(sz <= ULONG_MAX);
>> +    *size = sz;
>> +
>> +    return handle;
>>   }
>>   static void
>> @@ -1669,7 +1677,8 @@ alloc_step_batch(struct workload *wrk, struct 
>> w_step *w)
>>       w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
>>       igt_assert(w->i915.obj);
>> -    w->i915.obj[j].handle = alloc_bo(fd, 4096);
>> +    w->bb_size = PAGE_SIZE;
>> +    w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>>       w->i915.obj[j].flags = EXEC_OBJECT_WRITE;
>>       j++;
>>       igt_assert(j < nr_obj);
>> @@ -1706,7 +1715,7 @@ alloc_step_batch(struct workload *wrk, struct 
>> w_step *w)
>>           igt_assert(j < nr_obj);
>>       }
>> -    w->bb_handle = w->i915.obj[j].handle = gem_create(fd, 4096);
>> +    w->bb_handle = w->i915.obj[j].handle = alloc_bo(fd, &w->bb_size);
>>       w->i915.obj[j].relocation_count = create_bb(w, j);
>>       igt_assert(w->i915.obj[j].relocation_count <= 
>> ARRAY_SIZE(w->i915.reloc));
>>       w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
>> @@ -1734,13 +1743,13 @@ xe_alloc_step_batch(struct workload *wrk, 
>> struct w_step *w)
>>       struct dep_entry *dep;
>>       int i;
>> -    w->bb_handle = xe_bo_create_flags(fd, vm->id, PAGE_SIZE,
>> +    w->bb_size = ALIGN(PAGE_SIZE + xe_cs_prefetch_size(fd),
>> +               xe_get_default_alignment(fd));
>> +    w->bb_handle = xe_bo_create_flags(fd, vm->id, w->bb_size,
>>                   visible_vram_if_possible(fd, eq->hwe_list[0].gt_id));
>> -    w->xe.data = xe_bo_map(fd, w->bb_handle, PAGE_SIZE);
>> -    w->xe.exec.address =
>> -        intel_allocator_alloc_with_strategy(vm->ahnd, w->bb_handle, 
>> PAGE_SIZE,
>> -                            0, ALLOC_STRATEGY_LOW_TO_HIGH);
>> -    xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, 
>> PAGE_SIZE);
>> +    w->xe.data = xe_bo_map(fd, w->bb_handle, w->bb_size);
>> +    w->xe.exec.address = get_offset(vm->ahnd, w->bb_handle, 
>> w->bb_size, 0);
> 
> Apart from replacing intel_allocator_alloc_with_strategy with 
> get_offset, which I don't see is a local, although get_offset suggests 
> it should be, the rest looks fine to me.

I will revert to intel_allocator_alloc_with_strategy to avoid any 
confusion it's sourced from a library and not related to the
change.

Thanks for review,
marcin
> 
> Regards,
> 
> Tvrtko
> 
>> +    xe_vm_bind_sync(fd, vm->id, w->bb_handle, 0, w->xe.exec.address, 
>> w->bb_size);
>>       xe_spin_init_opts(&w->xe.data->spin, .addr = w->xe.exec.address,
>>                      .preempt = (w->preempt_us > 0),
>>                      .ctx_ticks = duration_to_ctx_ticks(fd, 
>> eq->hwe_list[0].gt_id,
>> @@ -1936,7 +1945,7 @@ allocate_working_set(struct workload *wrk, 
>> struct working_set *set)
>>       for (i = 0; i < set->nr; i++) {
>>           set->sizes[i].size = get_buffer_size(wrk, &set->sizes[i]);
>> -        set->handles[i] = alloc_bo(fd, set->sizes[i].size);
>> +        set->handles[i] = alloc_bo(fd, &set->sizes[i].size);
>>           total += set->sizes[i].size;
>>       }
>> @@ -1971,7 +1980,7 @@ static void measure_active_set(struct workload 
>> *wrk)
>>           if (w->type != BATCH)
>>               continue;
>> -        batch_sizes += 4096;
>> +        batch_sizes += w->bb_size;
>>           if (is_xe)
>>               continue;
>> @@ -1990,7 +1999,7 @@ static void measure_active_set(struct workload 
>> *wrk)
>>               if (!find_dep(deps, nr, _dep)) {
>>                   if (dep->working_set == -1) {
>> -                    total += 4096;
>> +                    total += w->bb_size;
>>                   } else {
>>                       struct working_set *set;
>> @@ -2834,8 +2843,8 @@ static void *run_workload(void *data)
>>                   syncobj_destroy(fd, w->xe.syncs[0].handle);
>>                   free(w->xe.syncs);
>>                   xe_vm_unbind_sync(fd, xe_get_vm(wrk, w)->id, 0, 
>> w->xe.exec.address,
>> -                          PAGE_SIZE);
>> -                gem_munmap(w->xe.data, PAGE_SIZE);
>> +                          w->bb_size);
>> +                gem_munmap(w->xe.data, w->bb_size);
>>                   gem_close(fd, w->bb_handle);
>>               } else if (w->type == SW_FENCE) {
>>                   syncobj_destroy(fd, w->xe.syncs[0].handle);
