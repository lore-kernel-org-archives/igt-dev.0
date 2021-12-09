Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2895410E116
 for <igt-dev@lists.freedesktop.org>; Thu,  9 Dec 2021 06:12:24 +0000 (UTC)
Date: Thu, 9 Dec 2021 07:12:18 +0100
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
Message-ID: <20211209061218.GA3904@zkempczy-mobl2>
References: <20211208120738.21790-1-arjun.melkaveri@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211208120738.21790-1-arjun.melkaveri@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/i915/gem_ctx_engines: Added out
 fence for execute-one subtest
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Arjun Melkaveri <arjun.melkaveri@intel.com>
Cc: igt-dev@lists.freedesktop.org, chris.p.wilson@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Dec 08, 2021 at 05:37:38PM +0530, Arjun Melkaveri wrote:
> To make spinner to be on same context for following execbuf,
> spin out_fence is passed to execbuf.rsvd2.
> 
> Used IGT_SPIN_FENCE_OUT flag in spinner, we can stop
> using no-preemption.
> 
> Added I915_EXEC_FENCE_IN to the execbuf.flags so that it
> is executed after the spinner.
> (Suggested by Chris Wilson).
> 
> Cc: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_engines.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index 003dd171..0b8d5c78 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -298,7 +298,7 @@ static void execute_one(int i915)
>  			spin = igt_spin_new(i915,
>  					    .ahnd = ahnd,
>  					    .ctx = ctx,
> -					    .flags = (IGT_SPIN_NO_PREEMPTION |
> +					    .flags = (IGT_SPIN_FENCE_OUT |
>  						      IGT_SPIN_POLL_RUN));
>  
>  			do_ioctl(i915, DRM_IOCTL_I915_GEM_BUSY, &busy);
> @@ -314,13 +314,13 @@ static void execute_one(int i915)
>  			}
>  			cfg.num_engines = GEM_MAX_ENGINES;
>  			ctx = intel_ctx_create(i915, &cfg);
> +			execbuf.rsvd2 = spin->execbuf.rsvd2 >> 32;

Check spin->fence_out. In this case doesn't matter but for merging 
fences it can.

>  
> -			igt_spin_busywait_until_started(spin);
>  			for (int j = 0; j <= I915_EXEC_RING_MASK; j++) {
>  				int expected = j == i ? 0 : -EINVAL;
>  
>  				execbuf.rsvd1 = ctx->id;
> -				execbuf.flags = j;
> +				execbuf.flags = j | I915_EXEC_FENCE_IN;
>  				igt_assert_f(__gem_execbuf(i915, &execbuf) == expected,
>  					     "Failed to report the %s engine for slot %d (valid at %d)\n",
>  					     j == i ? "valid" : "invalid", j, i);
> @@ -331,6 +331,7 @@ static void execute_one(int i915)
>  				      i != -1 ? 1 << e->class : 0);
>  
>  			igt_spin_free(i915, spin);
> +			close(spin->execbuf.rsvd2 >> 32);

And look at igt_spin_free() function what it does with fence_out.

--
Zbigniew

>  			put_ahnd(ahnd);
>  
>  			gem_sync(i915, obj.handle);
> -- 
> 2.25.1
> 
