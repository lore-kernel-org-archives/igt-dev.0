Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09C8610E1E9
 for <igt-dev@lists.freedesktop.org>; Tue, 26 Sep 2023 11:58:44 +0000 (UTC)
Message-ID: <d908e6f8-3c51-dde0-3a93-f4a0267c0c76@linux.intel.com>
Date: Tue, 26 Sep 2023 13:58:37 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 igt-dev@lists.freedesktop.org
References: <20230926084451.1732748-1-marcin.bernatowicz@linux.intel.com>
 <20230926084451.1732748-13-marcin.bernatowicz@linux.intel.com>
 <b969c855-77b0-7e26-d869-163450d5f621@linux.intel.com>
From: "Bernatowicz, Marcin" <marcin.bernatowicz@linux.intel.com>
In-Reply-To: <b969c855-77b0-7e26-d869-163450d5f621@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Subject: Re: [igt-dev] [PATCH i-g-t 12/14] benchmarks/gem_wsim: extract
 prepare contexts code to new function
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

Hi,

On 9/26/2023 1:43 PM, Tvrtko Ursulin wrote:
> 
> On 26/09/2023 09:44, Marcin Bernatowicz wrote:
>> No functional changes.
>> Extracted prepare_contexts function from prepare_workload.
>> Small code cleanup for "No need for 'else' after continue/break". (Kamil)
>>
>> Signed-off-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
>> ---
>>   benchmarks/gem_wsim.c | 30 ++++++++++++++++++++----------
>>   1 file changed, 20 insertions(+), 10 deletions(-)
>>
>> diff --git a/benchmarks/gem_wsim.c b/benchmarks/gem_wsim.c
>> index 2c6ccd3a9..55f8d9b1b 100644
>> --- a/benchmarks/gem_wsim.c
>> +++ b/benchmarks/gem_wsim.c
>> @@ -1766,20 +1766,13 @@ static void measure_active_set(struct workload 
>> *wrk)
>>   #define alloca0(sz) ({ size_t sz__ = (sz); memset(alloca(sz__), 0, 
>> sz__); })
>> -static int prepare_workload(unsigned int id, struct workload *wrk)
>> +static int prepare_contexts(unsigned int id, struct workload *wrk)
>>   {
>> -    struct working_set **sets;
>> -    unsigned long total = 0;
>>       uint32_t share_vm = 0;
>>       int max_ctx = -1;
>>       struct w_step *w;
>>       int i, j;
>> -    wrk->id = id;
>> -    wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
>> -    wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
>> -    wrk->run = true;
>> -
>>       /*
>>        * Pre-scan workload steps to allocate context list storage.
>>        */
>> @@ -1968,6 +1961,23 @@ static int prepare_workload(unsigned int id, 
>> struct workload *wrk)
>>       if (share_vm)
>>           vm_destroy(fd, share_vm);
>> +    return 0;
>> +}
>> +
>> +static int prepare_workload(unsigned int id, struct workload *wrk)
>> +{
>> +    struct working_set **sets;
>> +    unsigned long total = 0;
>> +    struct w_step *w;
>> +    int i, j;
>> +
>> +    wrk->id = id;
>> +    wrk->bb_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
>> +    wrk->bo_prng = (wrk->flags & SYNCEDCLIENTS) ? master_prng : rand();
>> +    wrk->run = true;
>> +
>> +    prepare_contexts(id, wrk);
>> +
>>       /* Record default preemption. */
>>       for (i = 0, w = wrk->steps; i < wrk->nr_steps; i++, w++) {
>>           if (w->type == BATCH)
>> @@ -1990,9 +2000,9 @@ static int prepare_workload(unsigned int id, 
>> struct workload *wrk)
>>               if (w2->context != w->context)
>>                   continue;
>> -            else if (w2->type == PREEMPTION)
>> +            if (w2->type == PREEMPTION)
>>                   break;
>> -            else if (w2->type != BATCH)
>> +            if (w2->type != BATCH)
> 
> To me it is more readable like it was. Is this some general rule that 
> else if should not be used in such cases?

I'm ok with both, Kamil raised the hand on this, so I modified,
but I don't recall any warnings/errors with this.

Kamil can we live with original version ?

> 
> Either case I'd be happiest if extracting code into functions wash't 
> mixed with unrelated changes.
> 
> Otherwise code extraction looks fine.
> 
> Regards,
> 
> Tvrtko
> 
>>                   continue;
>>               w2->preempt_us = w->period;
