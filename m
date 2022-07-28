Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54797112CD5
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Jul 2022 16:56:43 +0000 (UTC)
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Jul 2022 18:56:36 +0200
Message-ID: <7409610.EvYhyI6sBW@jkrzyszt-mobl1.ger.corp.intel.com>
In-Reply-To: <b484160b6b2e4bc7c708c92177ccfa8ce0c648b9.1658826356.git.karolina.drobnik@intel.com>
References: <cover.1658826356.git.karolina.drobnik@intel.com>
 <b484160b6b2e4bc7c708c92177ccfa8ce0c648b9.1658826356.git.karolina.drobnik@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Subject: Re: [igt-dev] [PATCH i-g-t v2 1/2] tests/gem_exec_fence: Check
 stored values only for valid workloads
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris@chris-wilson.co.uk>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Tuesday, 26 July 2022 12:13:11 CEST Karolina Drobnik wrote:
> From: Chris Wilson <chris@chris-wilson.co.uk>
> 
> test_fence_await verifies if a fence used to pipeline work signals
> correctly. await-hang and nb-await-hang test cases inject GPU hang,
> which causes an erroneous state, meaning the fence will be signaled
> without execution. The error causes an instant reset of the command
> streamer for the hanging workload. This revealed a problem with how
> we verify the fence state and results. The test assumes that the
> error notification happens after a hang is declared, which takes
> longer than submitting the next set of fences, making the test pass
> every time. With the immediate reset, this might not happen, so the
> assertion fails, as there are no active fences in the GPU hang case.
> 
> Move the check for active fence to the path for non-hanging workload,
> and verify results only in this scenario.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Karolina Drobnik <karolina.drobnik@intel.com>
> ---
>  tests/i915/gem_exec_fence.c | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_fence.c b/tests/i915/gem_exec_fence.c
> index d46914c2..260aa82c 100644
> --- a/tests/i915/gem_exec_fence.c
> +++ b/tests/i915/gem_exec_fence.c
> @@ -350,18 +350,20 @@ static void test_fence_await(int fd, const intel_ctx_t 
*ctx,
>  	/* Long, but not too long to anger preemption disable checks */
>  	usleep(50 * 1000); /* 50 ms, typical preempt reset is 150+ms */
>  
> -	/* Check for invalidly completing the task early */
> -	igt_assert(fence_busy(spin->out_fence));
> -	for (int n = 0; n < i; n++)
> -		igt_assert_eq_u32(out[n], 0);
> +	if ((flags & HANG) == 0) {
> +		/* Check for invalidly completing the task early */
> +		igt_assert(fence_busy(spin->out_fence));
> +		for (int n = 0; n < i; n++)
> +			igt_assert_eq_u32(out[n], 0);

AFAICU, in the 'hang' variant of the scenario we skip the above asserts 
because the spin batch could have already hanged, then its out fence already 
signalled and store batches waiting for that signal already executed.  If 
that's the case, how do this variant of gem_exec_fence test asserts that the 
fence actually worked as expected?

>  
> -	if ((flags & HANG) == 0)
>  		igt_spin_end(spin);
> +	}
>  
>  	igt_waitchildren();
>  
>  	gem_set_domain(fd, scratch, I915_GEM_DOMAIN_GTT, 0);
> -	while (i--)
> +	igt_assert(!fence_busy(spin->out_fence));

We only check that the out fence of the presumably hanged spin batch no longer 
blocks execution of store batches.

> +	while ((flags & HANG) == 0 && i--)

Besides, why don't we at least assert successful results of store batches?  Do 
we expect them not having their job done correctly when completed after the 
hang of the spin batch have occurred?

Am I missing something?

Thanks,
Janusz


>  		igt_assert_eq_u32(out[i], i);
>  	munmap(out, 4096);
>  
> 



