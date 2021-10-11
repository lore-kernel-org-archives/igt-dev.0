Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E7F6E935
 for <igt-dev@lists.freedesktop.org>; Mon, 11 Oct 2021 18:50:59 +0000 (UTC)
References: <20210916180301.6791-1-matthew.brost@intel.com>
 <20210916180301.6791-3-matthew.brost@intel.com>
 <4264a50f-549e-44ee-cd3e-d7221e38b21b@intel.com>
 <e481b241-c3a3-40c1-6f17-129b2144d81a@linux.intel.com>
 <20211005164412.GA13993@jons-linux-dev-box>
 <712c2aea-f998-520f-3f51-e117e05c0d54@linux.intel.com>
 <20211006164104.GA7828@jons-linux-dev-box>
 <b74b343e-513a-52cb-e66e-19b019e0afb1@linux.intel.com>
 <20211008174947.GA12060@jons-linux-dev-box>
 <1fc93656-a24d-a3b5-6a31-649478b3306d@linux.intel.com>
 <20211011171803.GA23672@jons-linux-dev-box>
From: John Harrison <john.c.harrison@intel.com>
Message-ID: <4dc41f15-df44-85a6-a6eb-7d20ad426503@intel.com>
Date: Mon, 11 Oct 2021 11:50:52 -0700
In-Reply-To: <20211011171803.GA23672@jons-linux-dev-box>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 2/3] i915/gem_ctx_shared: Make
 gem_ctx_shared understand static priority mapping
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Matthew Brost <matthew.brost@intel.com>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 10/11/2021 10:18, Matthew Brost wrote:
> On Mon, Oct 11, 2021 at 09:04:29AM +0100, Tvrtko Ursulin wrote:
>> On 08/10/2021 18:49, Matthew Brost wrote:
>>> On Wed, Oct 06, 2021 at 07:34:45PM +0100, Tvrtko Ursulin wrote:
>>>> On 06/10/2021 17:41, Matthew Brost wrote:
>>>>> On Wed, Oct 06, 2021 at 09:12:41AM +0100, Tvrtko Ursulin wrote:
>>>>>> On 05/10/2021 17:44, Matthew Brost wrote:
>>>>>>> On Tue, Oct 05, 2021 at 11:44:02AM +0100, Tvrtko Ursulin wrote:
>>>>>>>> On 05/10/2021 00:26, Daniele Ceraolo Spurio wrote:
>>>>>>>>> On 9/16/2021 11:03 AM, Matthew Brost wrote:
>>>>>>>>>> The i915 currently has 2k visible priority levels which are currently
>>>>>>>>>> unique. This is changing to statically map these 2k levels into 3
>>>>>>>>>> buckets:
>>>>>>>>>>
>>>>>>>>>> low: < 0
>>>>>>>>>> mid: 0
>>>>>>>>>> high: > 0
>>>>>>>>>>
>>>>>>>>>> Update gem_ctx_shared to understand this. This entails updating
>>>>>>>>>> promotion test to use 3 levels that will map into different buckets and
>>>>>>>>>> also add bit of delay after releasing a cork beforing completing the
>>>>>>>>>> spinners to give time to the i915 schedule to process the fence and
>>>>>>>>>> release and queue the requests.
>>>>>>>>>>
>>>>>>>>>> v2: Add a delay between starting releasing spinner and cork in
>>>>>>>>>> promotion
>>>>>>>>>> v3:
>>>>>>>>>>       (Daniele)
>>>>>>>>>>        - Always add delay, update commit message
>>>>>>>>>>
>>>>>>>>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>>>>>>>>> ---
>>>>>>>>>>       tests/i915/gem_ctx_shared.c | 5 +++--
>>>>>>>>>>       1 file changed, 3 insertions(+), 2 deletions(-)
>>>>>>>>>>
>>>>>>>>>> diff --git a/tests/i915/gem_ctx_shared.c b/tests/i915/gem_ctx_shared.c
>>>>>>>>>> index ea1b5dd1b..7f88871b8 100644
>>>>>>>>>> --- a/tests/i915/gem_ctx_shared.c
>>>>>>>>>> +++ b/tests/i915/gem_ctx_shared.c
>>>>>>>>>> @@ -622,6 +622,7 @@ static void unplug_show_queue(int i915, struct
>>>>>>>>>> igt_cork *c, uint64_t ahnd,
>>>>>>>>>>           igt_cork_unplug(c); /* batches will now be queued on the engine */
>>>>>>>>>>           igt_debugfs_dump(i915, "i915_engine_info");
>>>>>>>>>> +    usleep(250000);
>>>>>>>>> Same as previous patch, with a comment added:
>>>>>>>>>
>>>>>>>>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>>>>>>>> Come on guys, it is a bit bad and lazy for good taste no? 250ms more test
>>>>>>> Yea, this is way too long of a sleep. 25ms seems just fine.
>>>>>> Until you get 1/1000 failures in CI on some platforms due phase of the moon.
>>>>>> Adding sleeps should be avoided where possible.
>>>>>>
>>>>> Yea, that is always a risk. Looking at this test there is already 1
>>>>> other sleep in the test and in gem_exec_schedule there are 5 other
>>>>> sleeps. I'm not breaking precedent here.
>>>>>
>>>>>>> On TGL /w the updated sleep:
>>>>>>> gem_ctx_shared --r *promotion*
>>>>>>> IGT-Version: 1.26-g7e489b053 (x86_64) (Linux: 5.15.0-rc3-guc+ x86_64)
>>>>>>> Starting subtest: Q-promotion
>>>>>>> Starting dynamic subtest: rcs0
>>>>>>> Dynamic subtest rcs0: SUCCESS (0.059s)
>>>>>>> Starting dynamic subtest: bcs0
>>>>>>> Dynamic subtest bcs0: SUCCESS (0.059s)
>>>>>>> Starting dynamic subtest: vcs0
>>>>>>> Dynamic subtest vcs0: SUCCESS (0.060s)
>>>>>>> Starting dynamic subtest: vecs0
>>>>>>> Dynamic subtest vecs0: SUCCESS (0.061s)
>>>>>>> Subtest Q-promotion: SUCCESS (0.239s)
>>>>>>>
>>>>>>>> runtime, multiplied by number of tests and subtests (engines) will add up
>>>>>>>> and over shadows the current test time. For instance current state is:
>>>>>>>>
>>>>>>>> # tests/gem_ctx_shared --r *promotion*
>>>>>>>> IGT-Version: 1.26-NO-GIT (x86_64) (Linux: 5.15.0-rc4 x86_64)
>>>>>>>> Starting subtest: Q-promotion
>>>>>>>> Starting dynamic subtest: rcs0
>>>>>>>> Dynamic subtest rcs0: SUCCESS (0.174s)
>>>>>>>> Starting dynamic subtest: bcs0
>>>>>>>> Dynamic subtest bcs0: SUCCESS (0.224s)
>>>>>>>> Starting dynamic subtest: vcs0
>>>>>>>> Dynamic subtest vcs0: SUCCESS (0.153s)
>>>>>>>> Starting dynamic subtest: vecs0
>>>>>>>> Dynamic subtest vecs0: SUCCESS (0.153s)
>>>>>>>> Subtest Q-promotion: SUCCESS (0.708s)
>>>>>>>>
>>>>>>>> This patch instantly makes this 1.7 seconds instead. Add the in/out order
>>>>>>>> subtests, other tests, platforms with more engines, in a world where CI time
>>>>>>>> budget is scarce - can't we do better than this and not settle on sprinkling
>>>>>>>> of usleep all over the place?
>>>>>>>>
>>>>>>>> Like maybe add out fences to the two requests, merge them, and wait on that
>>>>>>>> (since there is no implicit write declared so set domain does not suffice)?
>>>>>>>>
>>>>>>> Not sure I follow. Anyways reposting now with a smaller timeout value.
>>>>>>> Unless we hear something we plan on merging this tomorrow.
>>>>>> The in/out-order test as example. It needs to wait until two dword writes
>>>>>> have completed, right? I am saying pass output fences out from spinners and
>>>>>> wait on them before checking content of the shared buffer.
>>>>>>
>>>>>> I also think sleep after uncorking is also conceptually misleading because
>>>>>> that's not where the problem lies. Problem is set domain does not actually
>>>>>> wait for sdw completion (existing comment even hints so "no write hazard
>>>>>> lies!"). If I am right sporadic fail can in *theory* happen with execlists
>>>>>> as well.
>>>>>>
>>>>> Still not following what you are saying. The sleep just adds period of
>>>>> time for all the uncorked requests to make it into the GuC scheduler,
>>>>> without it is possible for the lower priority request (submitted first)
>>>>> completes before the higher priority request (submitted after) makes it
>>>>> into the GuC. The sleep ensures alls the requests are in the GuC
>>>>> scheduler still stuck behind spinning requests on the hardware, then
>>>>> after the spinners complete the requests are scheduled in order of
>>>>> priority. Yes, this possible with execlists too but I think the timing
>>>>> is different enough it doesn't happen.
>>>>>
>>>>> Again adding a sleep here seems legit to me, the same problem would
>>>>> exist if we used fences as you suggest (e.g. the lower priority request
>>>>> would be submitted first + could complete before the higher priority
>>>>> request is submitted). Let's not over think this one.
>>>> I don't understand how sleep _after_ uncork can have an effect you describe.
>>>> Both HI and LO have been submitted and the following operation will just
>>>> check the writes in memory.
>>>>
>>> After the uncork but before releasing the spinning batches, anything
>>> submitted to the GuC is still be blocked behind the spinners. A sleep
>>> makes sure that all contexts submitted after the uncork are processed by
>>> the GuC, sitting in the GuC scheduler, and still blocked behind the
>>> spinners. Once the spinners are released now the GuC submits uncorked
>>> requests in the correct order. Without this sleep, there is a race where
>>> the earlier contexts (lower priority) is in the GuC scheduler but the
>>> later ones (higher priority) are not. In this case the earlier (lower
>>> priority) contexts get submitted and complete before the GuC sees the
>>> higher priority ones causing the test to fail. It only fails like this 1
>>> out of 10ish times without the sleep (i.e. it is racey). I just ran this
>>> 1000x times in the loop /w the sleep and didn't see a failure.
>>>
>>> Make sense? Can we get this merged and move on?
>> I am still skeptical I'm afraid. Let me try to ask you from a different
>> angle and please feel free to tell me I am missing something crucial.
>>
>> Is the test testing uapi contract or scheduler implementation details?
>>
> This is testing that priority inheritance works. To be honest I have no
> idea if this is concerned part of the uAPI. This could be one of those
> features nobody asked for but someone on the i915 dev team thought it
> would be a cool idea so it got implemented. AFAIK no other DRM driver
> implents PI, at least PI certainly isn't a feature implemented in the
> DRM scheduler.
>
>> If it would be the former, then it would be highlighting the contract is
>> broken. If it is the latter then why it should be fudged to run with an
>> incompatible backend?
>>
> Regardless if PI considered part of the uAPI, there is absolutely no way
> this breaking any contract. This test is racey, the sleep mitigates
> (maybe even seals) the race.
>   
>> Personally I can't see that it is uapi being tested. Two unrelated contexts,
>> no data dependencies, why would there be any guarantees who runs first? So
>> how about just skip the test with GuC? If I am correct there may even not be
>> much value to have it with execlists.
>>
> If PI is indeed a uAPI feature, then yes this test is providing value.
> Again I have no idea why we can't merge this and move on. If this test
> pops in CI we can revisit just disabling it. If we just drop PI when we
> move the DRM scheduler, we can just delete this test.
>
> Matt
I believe the point of PI is to prevent PI. That is, inheriting 
priorities prevents priority inversion where a high priority request is 
blocked waiting for a low priority request to complete. That would 
happen quite easily with the hardware compositor in Android some time 
back. I have no idea if that is still a real world concern now, but it 
certainly was back around 2015 on VLV for certain customers.

I would view this as an artificial test trying to emulate a real world 
race condition. As in, genuine applications could hit this but it takes 
multiple applications running in parallel with effectively random timing 
between them. In order to recreate that race in a synthetic test, we 
have to force certain behaviours by doing what could be considered 
unrealistic operations. For example, setting up a pointless opening 
situations using infinite loop batch buffers and sleeps. Sure, totally 
unrealistic, but this is a synthetic test emulating a situation that 
would be very difficult to recreate faithfully.

So stop worrying about how realistic the test is. It can't ever be 
realistic. Let it do what it needs to do to exercise the problem code 
path and call it good.

John.

>   
>> Regards,
>>
>> Tvrtko
>>
>>>> Unless the problem really is that the spinner does not start executing
>>>> before the unplug? Does the sleep before unplug work as well?
>>>>
>>> No see above. This doesn't help at all.
>>>
>>> Matt
>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>
>>>>> Matt
>>>>>
>>>>>> Regards,
>>>>>>
>>>>>> Tvrtko
>>>>>>
>>>>>>> Matt
>>>>>>>
>>>>>>>> Unless I am missing something it would be strictly correct for execlists
>>>>>>>> backend as well since it now works just because it is fast enough.
>>>>>>>>
>>>>>>>> Regards,
>>>>>>>>
>>>>>>>> Tvrtko
>>>>>>>>
>>>>>>>>> Daniele
>>>>>>>>>
>>>>>>>>>>           for (int n = 0; n < ARRAY_SIZE(spin); n++) {
>>>>>>>>>>               ahnd = spin[n]->ahnd;
>>>>>>>>>> @@ -831,10 +832,10 @@ static void promotion(int i915, const
>>>>>>>>>> intel_ctx_cfg_t *cfg, unsigned ring)
>>>>>>>>>>           gem_context_set_priority(i915, ctx[LO]->id, MIN_PRIO);
>>>>>>>>>>           ctx[HI] = intel_ctx_create(i915, &q_cfg);
>>>>>>>>>> -    gem_context_set_priority(i915, ctx[HI]->id, 0);
>>>>>>>>>> +    gem_context_set_priority(i915, ctx[HI]->id, MAX_PRIO);
>>>>>>>>>>           ctx[NOISE] = intel_ctx_create(i915, &q_cfg);
>>>>>>>>>> -    gem_context_set_priority(i915, ctx[NOISE]->id, MIN_PRIO/2);
>>>>>>>>>> +    gem_context_set_priority(i915, ctx[NOISE]->id, 0);
>>>>>>>>>>           result = gem_create(i915, 4096);
>>>>>>>>>>           result_offset = get_offset(ahnd, result, 4096, 0);
