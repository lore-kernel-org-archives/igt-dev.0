Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E82610E0FA
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Sep 2023 10:08:49 +0000 (UTC)
Message-ID: <06324cce-f5bd-4485-7bc2-25f3339d8575@linux.intel.com>
Date: Fri, 29 Sep 2023 12:08:43 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230928174535.2074462-1-marcin.bernatowicz@linux.intel.com>
 <20230928174535.2074462-16-marcin.bernatowicz@linux.intel.com>
 <3d25cb8c-83b6-5bd4-181a-58d8066d4615@linux.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <3d25cb8c-83b6-5bd4-181a-58d8066d4615@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 15/17] benchmarks/gem_wsim: introduce
 bb_size in w_step
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



On 9/29/2023 11:35 AM, Tvrtko Ursulin wrote:
> 
> On 28/09/2023 18:45, Marcin Bernatowicz wrote:
>> Put it next to bb_handle.
>> Use it in alloc_step_batch and measure_active_set.
> 
> Could say why.
> 
> Like xe might need more than 4k? Might not be able to allocate only 4k? 
> (Guessing only.)

Xe uses following formula:

w->bb_size = ALIGN(sizeof(*w->xe.data) + xe_cs_prefetch_size(fd),
			   xe_get_default_alignment(fd));

which equaled 4096 on platform I tested.
I didn't want to put bb_size inside xe specifics as it is connected with 
bb_handle.

Regards,
marcin

> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index 4618509ab..d22d66aeb 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -183,6 +183,7 @@ struct w_step {
>>           } i915;
>>       };
>>       uint32_t bb_handle;
>> +    size_t bb_size;
>>   };
>>   struct ctx {
>> @@ -1481,6 +1482,7 @@ alloc_step_batch(struct workload *wrk, struct 
>> w_step *w)
>>       unsigned int nr_obj = 2 + w->data_deps.nr;
>>       unsigned int i;
>> +    w->bb_size = 4096;
>>       w->i915.obj = calloc(nr_obj, sizeof(*w->i915.obj));
>>       igt_assert(w->i915.obj);
>> @@ -1522,7 +1524,7 @@ alloc_step_batch(struct workload *wrk, struct 
>> w_step *w)
>>           igt_assert(j < nr_obj);
>>       }
>> -    w->bb_handle = w->i915.obj[j].handle = gem_create(fd, 4096);
>> +    w->bb_handle = w->i915.obj[j].handle = gem_create(fd, w->bb_size);
>>       w->i915.obj[j].relocation_count = create_bb(w, j);
>>       igt_assert(w->i915.obj[j].relocation_count <= 
>> ARRAY_SIZE(w->i915.reloc));
>>       w->i915.obj[j].relocs_ptr = to_user_pointer(&w->i915.reloc);
>> @@ -1722,7 +1724,7 @@ static void measure_active_set(struct workload 
>> *wrk)
>>           if (w->type != BATCH)
>>               continue;
>> -        batch_sizes += 4096;
>> +        batch_sizes += w->bb_size;
>>           for (j = 0; j < w->data_deps.nr; j++) {
>>               struct dep_entry *dep = &w->data_deps.list[j];
