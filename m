Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB66314A075
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Jul 2022 07:38:43 +0000 (UTC)
Message-ID: <fb09766e-a6a9-bcb9-bb8c-ea00974500f3@intel.com>
Date: Fri, 29 Jul 2022 09:38:43 +0200
Content-Language: en-US
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
 <b484160b6b2e4bc7c708c92177ccfa8ce0c648b9.1658826356.git.karolina.drobnik@intel.com>
 <7409610.EvYhyI6sBW@jkrzyszt-mobl1.ger.corp.intel.com>
From: Karolina Drobnik <karolina.drobnik@intel.com>
In-Reply-To: <7409610.EvYhyI6sBW@jkrzyszt-mobl1.ger.corp.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/gem_exec_fence: Check
 stored values only for valid workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Janusz,

Thanks a lot for taking a look at the patch.

On 28.07.2022 18:56, Janusz Krzysztofik wrote:
> On Tuesday, 26 July 2022 12:13:11 CEST Karolina Drobnik wrote:
>> From: Chris Wilson <chris@chris-wilson.co.uk>
>>
>> test_fence_await verifies if a fence used to pipeline work signals
>> correctly. await-hang and nb-await-hang test cases inject GPU hang,
>> which causes an erroneous state, meaning the fence will be signaled
>> without execution. The error causes an instant reset of the command
>> streamer for the hanging workload. This revealed a problem with how
>> we verify the fence state and results. The test assumes that the
>> error notification happens after a hang is declared, which takes
>> longer than submitting the next set of fences, making the test pass
>> every time. With the immediate reset, this might not happen, so the
>> assertion fails, as there are no active fences in the GPU hang case.
>>
>> Move the check for active fence to the path for non-hanging workload,
>> and verify results only in this scenario.
>>
>> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
>> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
>> ---
>>   tests/i915/gem_exec_fence.c | 14 ++++++++------
>>   1 file changed, 8 insertions(+), 6 deletions(-)
>>
>> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
>> index d46914c2..260aa82c 100644
>> --- a/tests/i915/gem_exec_fence.c
>> +++ b/tests/i915/gem_exec_fence.c
>> @@ -350,18 +350,20 @@ static void test_fence_await(int fd, const intel_ctx_t
> *ctx,
>>   	/* Long, but not too long to anger preemption disable checks */
>>   	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
>>   
>> -	/* Check for invalidly completing the task early */
>> -	igt_assert(fence_busy(spin->out_fence));
>> -	for (int n = 0; n < i; n++)
>> -		igt_assert_eq_u32(out[n], 0);
>> +	if ((flags & HANG) == 0) {
>> +		/* Check for invalidly completing the task early */
>> +		igt_assert(fence_busy(spin->out_fence));
>> +		for (int n = 0; n < i; n++)
>> +			igt_assert_eq_u32(out[n], 0);
> 
> AFAICU, in the 'hang' variant of the scenario we skip the above asserts
> because the spin batch could have already hanged, then its out fence already
> signalled and store batches waiting for that signal already executed.  If
> that's the case, how do this variant of gem_exec_fence test asserts that the
> fence actually worked as expected?

With this change, yes, we would skip them. Still, the store batches
wouldn't be executed, as we reset the CS on hang as a part of the error 
handling. For valid jobs, we expect to (1) see an active fence at the 
beginning of the request, (2) get a signaled fence after the wait, (3) 
store out[i] == i. With a hang, (1) and (3) would be false.

In this particular loop, we could have garbage here with hang, not 0s 
(although, from my tests it looks like they are zeroed, but maybe I got 
lucky)

>>   
>> -	if ((flags & HANG) == 0)
>>   		igt_spin_end(spin);
>> +	}
>>   
>>   	igt_waitchildren();
>>   
>>   	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
>> -	while (i--)
>> +	igt_assert(!fence_busy(spin->out_fence));
> 
> We only check that the out fence of the presumably hanged spin batch no longer
> blocks execution of store batches.

This check applies to all workloads, all of them should be done with 
work at this point

>> +	while ((flags & HANG) == 0 && i--)
> 
> Besides, why don't we at least assert successful results of store batches?  Do
> we expect them not having their job done correctly when completed after the
> hang of the spin batch have occurred?

We don't expect them to store anything meaningful, because we get a
reset. So, this check only applies to well-behaved jobs.

All the best,
Karolina

> Am I missing something?
> 
> Thanks,
> Janusz
> 
> 
>>   		igt_assert_eq_u32(out[i], i);
>>   	munmap(out, 4096);
>>   
>>
> 
> 
> 
> 
