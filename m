Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FCC10E5CA
 for <igt-dev@lists.freedesktop.org>; Wed, 19 Jan 2022 19:41:58 +0000 (UTC)
Message-ID: <a2acc671-018d-eebf-3544-05cfe36e94a5@intel.com>
Date: Wed, 19 Jan 2022 11:25:34 -0800
Content-Language: en-GB
References: <20220117085700.1723228-1-priyanka.dandamudi@intel.com>
 <20220117085700.1723228-3-priyanka.dandamudi@intel.com>
 <87fspln70d.wl-ashutosh.dixit@intel.com>
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <87fspln70d.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3 2/2] tests/i915/gem_ctx_exec: Skip
 test for shared reset domain
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>, priyanka.dandamudi@intel.com
Cc: igt-dev@lists.freedesktop.org, saurabhg.gupta@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 1/17/2022 17:54, Dixit, Ashutosh wrote:
> On Mon, 17 Jan 2022 00:57:00 -0800, <priyanka.dandamudi@intel.com> wrote:
>> @@ -292,11 +293,15 @@ static void nohangcheck_hostile(int i915)
>> 	ahnd = get_reloc_ahnd(i915, ctx->id);
>>
>> 	igt_require(__enable_hangcheck(dir, false));
>> +	has_sh_do = has_shared_reset_domain(i915, ctx);
>>
>> 	for_each_ctx_engine(i915, ctx, e) {
>> 		igt_spin_t *spin;
>> 		int new;
>>
>> +		if (has_sh_do && (e->class == I915_ENGINE_CLASS_RENDER ||
>> +			    e->class == I915_ENGINE_CLASS_COMPUTE))
>> +			continue;
> If we need to do this, let's not try to overly optimize things (which will
> clutter up the code since has_shared_reset_domain() may get called from
> multiple places) and just pass the engine into the function, something
> like:
>
> bool has_shared_reset_domain(int fd, struct intel_execution_engine2 *e2,
> 			     const intel_ctx_t *ctx)
> {
> 	const struct intel_execution_engine2 *e;
> 	int count = 0;
>
> 	if (!(e2->class == I915_ENGINE_CLASS_RENDER ||
> 		e2->class == I915_ENGINE_CLASS_COMPUTE))
> 		return false;
>
> 	for_each_ctx_engine(fd, ctx, e)
> 		if (e->class == I915_ENGINE_CLASS_RENDER ||
> 			e->class == I915_ENGINE_CLASS_COMPUTE)
> 		count++;
>
> 	return count >= 2;
> }
>
> And then in the loop above just have:
>
> 	if (has_shared_reset_domain(fd, e, ctx))
> 		continue;
>
> Also, I may be wrong, but it looks to me that this test should pass even if
> we have shared resets, the test is not even using engine resets. What
> failure are we seeing and on which platforms and with how many gt's? Does
> the test fail only on DG2 or also on other products with RCS + CCS? Can you
> paste the output after running the failing test?
>
> Any idea anyone why this test would fail with a shared reset domain? Could
> it be failing due to a different reason than a shared reset domain as
> people pointed out on previous versions of the patch? In that case this
> patch is incorrect.

Presumably the test is actually testing context persistence? If so, I 
would say the best option right now is to add an 
'is_persistance_fixed()' helper which currently returns false on modern 
platforms and causes any persistence related test to skip. The KMD 
implementation of persistence is broken. It vaguely hangs together for 
execlist mode with no dependent engines but it is totally broken for GuC 
submission (because part of the implementation is buried deep within the 
execlist backend) and the current design can never work for engines with 
dependent resets.

Once persistence has been completely re-written (and greatly simplified) 
in the KMD, we can then review the persistence related IGTs and decide 
whether each is still valid or is now pointless. I suspect this one 
would count as pointless. It is called 'nohangcheck' and seems to be 
testing persistence behaviour when the heartbeat is explicitly disabled. 
Part of the persistence re-write is to remove any dependence on the 
state of the heartbeat.

Without looking at this specific test in detail, I can't say exactly 
what might be happening here, but it seems likely that it is 
specifically a DG2 issue (and thus should only skip on DG2). The 
persistence implementation involves sending super high priority pings to 
engines. Assuming the workload on the target engine is pre-emptible, the 
ping should make it through. But if this is a DG2 and the target engine 
is CCS# then that pre-emption requires a pre-emption on RCS as well. If 
the test has put a non-pre-emtible background workload on RCS, then RCS 
is never going to switch, thus CCS can't switch either. Hence 
pre-emption timeouts, engine resets and test failures. In this case, the 
failure is not even specifically related to dependent engine resets.

One option is to make all the workloads pre-emptible but there is an 
argument that the point of the test is to ensure no interference at all 
including unwanted pre-emptions. Thus, the test is correctly failing 
because the hardware cannot provide context isolation.

John.
