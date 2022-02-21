Return-path: <SRS0=ONlT=TE=lists.freedesktop.org=igt-dev-bounces@kernel.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5526310E2A0
 for <igt-dev@lists.freedesktop.org>; Mon, 21 Feb 2022 11:54:52 +0000 (UTC)
Message-ID: <f2324dc7-4d4e-1e75-a980-9d65276b6d5d@linux.intel.com>
Date: Mon, 21 Feb 2022 11:54:48 +0000
MIME-Version: 1.0
Content-Language: en-US
To: Jasmine Newsome <jasmine.newsome@intel.com>, igt-dev@lists.freedesktop.org
References: <20220219013215.3531766-1-jasmine.newsome@intel.com>
 <20220219013215.3531766-3-jasmine.newsome@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20220219013215.3531766-3-jasmine.newsome@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/2] tests/i915/gem_spin_batch: Removing
 context persistence
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


On 19/02/2022 01:32, Jasmine Newsome wrote:
> The spin all test relied on context persistence unecessarily by trying
> to destroy contexts while keeping spinners active.
> The current implementation of context persistence in i915 can cause
> failures, and persistence is not needed for this test.

Could you please expand a bit on "current implementation" and "can cause 
failures"?

Also from the subject of "Removing context persistence" I was expecting 
to see usage of I915_CONTEXT_PARAM_PERSISTENCE to actually change the mode.

My concern is that the pattern of destroying contexts while keeping 
things active on the GPU is very wide spread in IGT and possibly exists 
in userspace as well.

Has the wider story been analysed by the architects here and what is the 
plan? Do we actually know no userspace actually depends on it?

[Comes back later, after spotting the cover letter.]

So it's only GuC, not i915, so please say that in this commit message 
since cover letters are not saved in git history.

Regards,

Tvrtko

> 
> Moving intel_ctx_destroy after igt_spin_end.
> 
> Signed-off-by: Jasmine Newsome <jasmine.newsome@intel.com>
> ---
>   tests/i915/gem_spin_batch.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_spin_batch.c b/tests/i915/gem_spin_batch.c
> index 653812c7..707d69b6 100644
> --- a/tests/i915/gem_spin_batch.c
> +++ b/tests/i915/gem_spin_batch.c
> @@ -161,8 +161,6 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   				    .engine = e->flags,
>   				    .flags = (IGT_SPIN_POLL_RUN |
>   					      IGT_SPIN_NO_PREEMPTION));
> -		if (flags & PARALLEL_SPIN_NEW_CTX)
> -			intel_ctx_destroy(i915, ctx);
>   
>   		igt_spin_busywait_until_started(spin);
>   		igt_list_move(&spin->link, &list);
> @@ -172,6 +170,8 @@ static void spin_all(int i915, const intel_ctx_t *ctx, unsigned int flags)
>   		igt_assert(gem_bo_busy(i915, spin->handle));
>   		ahnd = spin->ahnd;
>   		igt_spin_end(spin);
> +		if (flags & PARALLEL_SPIN_NEW_CTX)
> +			intel_ctx_destroy(i915, spin->opts.ctx);
>   		gem_sync(i915, spin->handle);
>   		igt_spin_free(i915, spin);
>   		put_ahnd(ahnd);
