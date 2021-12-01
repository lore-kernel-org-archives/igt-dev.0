Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 631CC6EE70
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 09:46:06 +0000 (UTC)
Message-ID: <400e33dd-8c5f-10ee-c5e9-631ebcf63253@linux.intel.com>
Date: Wed, 1 Dec 2021 09:46:02 +0000
MIME-Version: 1.0
Content-Language: en-US
References: <20211126015735.908681-1-mastanx.katragadda@intel.com>
 <b4f66160-c947-1c47-5788-8a0d69f9bc48@linux.intel.com>
 <BN9PR11MB52905C33F740FAB54340B43C97669@BN9PR11MB5290.namprd11.prod.outlook.com>
 <5c09cc84-7f44-969c-9a7f-8c925f077ec5@linux.intel.com>
 <20211130164818.GA12888@jons-linux-dev-box>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20211130164818.GA12888@jons-linux-dev-box>
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
To: Matthew Brost <matthew.brost@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Katragadda, MastanX" <mastanx.katragadda@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>


On 30/11/2021 16:48, Matthew Brost wrote:
> On Mon, Nov 29, 2021 at 11:15:22AM +0000, Tvrtko Ursulin wrote:
>>
>> On 29/11/2021 10:58, Katragadda, MastanX wrote:
>>> Hi   Tvrtko Ursulin,
>>>                Based on following backend information added skip on guc enabled platforms.
>>>
>>> basically there is a quirk in GuC scheduling where if a context reaches the head of the queue and can't be scheduled it blocks the rest of the queue. A queue is an engine class. So in this case if the user submits to VCS0, VCS0, then VCS1 and the first submission to VCS0 is spinner the VCS1 submission is blocked. This more or less is exactly what this test is doing, thus it hangs. We have a request with the GuC firmware team to be able to tweak this head of queue blocking behaviour but don't expect to land anytime soon. Also in the real world this isn't an issue as the user should always be using VEs which should never block the head of the queue unless all the engines within the class are busy.
>>>
>>> Test is expected to fail with GuC submission, skip it in CI.
>>
>> Does "blocks the rest of the queue" mean unrelated contexts submitted
>> against the same engine class?
>>
> 
> Yes.
> 
>> If so then it would be a DoS vector and the "user _should_ always" would not
>> be sufficient.
>>
> 
> This is a DoS vector but there are about a million others and this no
> worse than most.

Adding new ones should not be taken lightly.

>> Or if the blockage is localised to a single context then it might be fine
>> (but unfortunate) if on top we chose to disallow submission to non-virtual
>> indices in the engine map (in case of GuC)? If the firmware bug is not
> 
> We discussed this we basically land on if the UMDs want to do something
> stupid, let them as with all the other DoS in the i915. We likely can't
> disable non-virtual submission as some UMDs want to explictly place some
> contexts on certain engines (compute). In that case the UMD has to be
> smart enough to not submit contexts in a way to expose this scheduling
> quirk.

"Quirk"... :) Why it happens though? Is the firmware scheduling with GEM 
context granularity, and not intel_context, and that is the disconnect?

>> getting fixed that is. I may be on the wrong track here since I am not 100%
> 
> Just because the GuC scheduling doesn't work like execlists doesn't mean
> that it is bug. Checking for the HoQ only is done for a good reason -
> performance a uC can do everything and anything like execlists as it is
> single low power CPU controling the scheduling of an entire GT. We can't
> protect against everything a user can do that is stupid.
> 
> FWIW we do have an open task assigned to the GuC team to allow a KMD
> configurable search depth when the queue can't be scheduled. No idea
> when this is going to get implemented.

This maybe too specific. Question rather could be why is something not 
runnable put at the head of the queue by the firmware. Sounds like a 
plain bug to me.

>> certain I figured out why it exactly gets stuck.
>>
>> Because, looking at the bonded-pair to start with, if the test is emitting a
>> pair of request on the same context, spinner first, then a another one with
>> a semaphore dependency I am not sure why it hangs. When the spinner switches
>> out after time slice expires the second request should run, cancel the
>> spinner and exit. At which point they are both complete.
>>
> 
> I think only the MT version of bonded-pair hangs but it has been a while
> since I looked at this.
> 
> IMO this fix is 100% correct as this is a known, tracked issue. It was
> agreed upon (arch, i915, GuC team) that we just skip these tests with
> GuC submission.

I915 team is here on upstream as well.

Record those acks publicly would be my ask. Unless some security by 
obscurity is happening here? Until then from me it is a soft nack to 
keep disabling tests which show genuine weaknesses in GuC mode. Soft 
until we get a public record of exactly what is broken and in what 
circumstances, acked by architects publicly as you say they acked it 
somewhere. Commit message devoid of detail is not good enough.

Regards,

Tvrtko
