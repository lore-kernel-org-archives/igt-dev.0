Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B3CD11AFE3
 for <igt-dev@lists.freedesktop.org>; Fri, 15 Jul 2022 09:00:26 +0000 (UTC)
Message-ID: <ec8611a3-9c20-e016-7c37-2708c693a523@intel.com>
Date: Fri, 15 Jul 2022 11:00:22 +0200
MIME-Version: 1.0
Content-Language: en-US
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>,
 igt-dev@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
References: <20220712071722.212920-1-andrzej.hajda@intel.com>
 <Ys7dbVbkqgJHQj2x@kamilkon-desk1>
 <837d68e5-aa86-a0fb-bf93-6ce584fc29ed@intel.com>
 <YtA4X2DLl8BydqHd@kamilkon-desk1>
From: Andrzej Hajda <andrzej.hajda@intel.com>
In-Reply-To: <YtA4X2DLl8BydqHd@kamilkon-desk1>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] i915/gem_ctx_persistence: adjust hostile test
 timeout
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



On 14.07.2022 17:38, Kamil Konieczny wrote:
> On 2022-07-14 at 12:01:25 +0200, Andrzej Hajda wrote:
>>
>> On 13.07.2022 16:57, Kamil Konieczny wrote:
>>> Hi Andrzej,
>>>
>>> On 2022-07-12 at 09:17:22 +0200, Andrzej Hajda wrote:
>>>> GPU occasionally can hang during hostile test. Detection of such case and
>>>> then reset can take up to 5 seconds.
>>>>
>>>> Closes: https://gitlab.freedesktop.org/drm/intel/issues/2410
>>>> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
>>>> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
>>>> ---
>>>>    tests/i915/gem_ctx_persistence.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
>>>> index 00dda3a8b52..50196edb19f 100644
>>>> --- a/tests/i915/gem_ctx_persistence.c
>>>> +++ b/tests/i915/gem_ctx_persistence.c
>>>> @@ -370,7 +370,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
>>>>    	igt_require(__enable_hangcheck(dir, false));
>>>>    	for_each_ctx_cfg_engine(i915, cfg, e) {
>>>> -		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
>>>> +		int64_t timeout = 10000 * NSEC_PER_MSEC;
>>> May we extend this to other hostile reset timeouts ?
>> Thanks for review.
>>
>> You are right, that similar problem exists also for other persistence tests,
>> but I guess we need to check them carefully as they differ from this one,
>> for example by preemption.
>>
>>> Btw I think about limiting this to only new gens (like >= 11)
>>> where GuC dumps can take some time, but maybe I am overthinking.
>>> Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
>>>
>>> One more question: should we restore preemption timeout at exit
>>> after test fails ?
>> No, it is assigned to local var, so no global change.
> I should stated this differently, when test dies inside do_test
> we do not restore preemtion timeout (which was set with sysfs).

This test (test_nohangcheck_hostile) is run directly, not via do_test.

>
> Maybe this should go in seperate patch.

Yes, fixing do_test is a different story.

Regards
Andrzej

>
> Regards,
> Kamil
>
>>>>    		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
>>>>    		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
>>>>    		igt_spin_t *spin;
>>>> -- 
>>>> 2.25.1
>>>>
