Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64B466EE33
 for <igt-dev@lists.freedesktop.org>; Mon, 29 Nov 2021 11:15:27 +0000 (UTC)
Message-ID: <5c09cc84-7f44-969c-9a7f-8c925f077ec5@linux.intel.com>
Date: Mon, 29 Nov 2021 11:15:22 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211126015735.908681-1-mastanx.katragadda@intel.com>
 <b4f66160-c947-1c47-5788-8a0d69f9bc48@linux.intel.com>
 <BN9PR11MB52905C33F740FAB54340B43C97669@BN9PR11MB5290.namprd11.prod.outlook.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <BN9PR11MB52905C33F740FAB54340B43C97669@BN9PR11MB5290.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc
 Submission
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Katragadda, MastanX" <mastanx.katragadda@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Surendrakumar Upadhyay, TejaskumarX" <tejaskumarx.surendrakumar.upadhyay@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 29/11/2021 10:58, Katragadda, MastanX wrote:
> Hi   Tvrtko Ursulin,
>               Based on following backend information added skip on guc enabled platforms.
> 
> basically there is a quirk in GuC scheduling where if a context reaches the head of the queue and can't be scheduled it blocks the rest of the queue. A queue is an engine class. So in this case if the user submits to VCS0, VCS0, then VCS1 and the first submission to VCS0 is spinner the VCS1 submission is blocked. This more or less is exactly what this test is doing, thus it hangs. We have a request with the GuC firmware team to be able to tweak this head of queue blocking behaviour but don't expect to land anytime soon. Also in the real world this isn't an issue as the user should always be using VEs which should never block the head of the queue unless all the engines within the class are busy.
> 
> Test is expected to fail with GuC submission, skip it in CI.

Does "blocks the rest of the queue" mean unrelated contexts submitted 
against the same engine class?

If so then it would be a DoS vector and the "user _should_ always" would 
not be sufficient.

Or if the blockage is localised to a single context then it might be 
fine (but unfortunate) if on top we chose to disallow submission to 
non-virtual indices in the engine map (in case of GuC)? If the firmware 
bug is not getting fixed that is. I may be on the wrong track here since 
I am not 100% certain I figured out why it exactly gets stuck.

Because, looking at the bonded-pair to start with, if the test is 
emitting a pair of request on the same context, spinner first, then a 
another one with a semaphore dependency I am not sure why it hangs. When 
the spinner switches out after time slice expires the second request 
should run, cancel the spinner and exit. At which point they are both 
complete.

Regards,

Tvrtko

> Regards,
> Mastan
> 
> -----Original Message-----
> From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Sent: 29 November 2021 16:01
> To: Katragadda, MastanX <mastanx.katragadda@intel.com>; igt-dev@lists.freedesktop.org; Surendrakumar Upadhyay, TejaskumarX <tejaskumarx.surendrakumar.upadhyay@intel.com>
> Subject: Re: [igt-dev] [i-g-t] tests/i915/exec_balancer: Added Skip Guc Submission
> 
> 
> On 26/11/2021 01:57, Mastan Katragadda wrote:
>> This a known failure when running
>> igt@gem_exec_balancer@bonded-(dual|pair|sync)
>> tests with GuC submission.The hang is expected with GuC submission
>> since the test was written to expect execlist scheduling hence added
>> skip if Guc submission enabled.
> 
> Looking at the test I don't see anything backend specific. Can you provide an explanation of how and why it hangs?
> 
> Regards,
> 
> Tvrtko
> 
>> Signed-off-by: Mastan Katragadda <mastanx.katragadda@intel.com>
>> ---
>>    tests/i915/gem_exec_balancer.c | 1 +
>>    1 file changed, 1 insertion(+)
>>
>> diff --git a/tests/i915/gem_exec_balancer.c
>> b/tests/i915/gem_exec_balancer.c index cc07a5a9..d58734ab 100644
>> --- a/tests/i915/gem_exec_balancer.c
>> +++ b/tests/i915/gem_exec_balancer.c
>> @@ -3320,6 +3320,7 @@ igt_main
>>    
>>    	igt_subtest_group {
>>    		igt_fixture {
>> +			igt_require(!gem_using_guc_submission(i915));
>>    			intel_allocator_multiprocess_start();
>>    		}
>>    
>>
