Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20201009162206.1661402-3-chris@chris-wilson.co.uk>
References: <20201009162206.1661402-1-chris@chris-wilson.co.uk>
 <20201009162206.1661402-3-chris@chris-wilson.co.uk>
Date: Fri, 09 Oct 2020 19:39:13 +0300
Message-ID: <871ri7fj66.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/3] i915/gem_exec_balancer: Check
 interactions between bonds and userptr
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  tests/i915/gem_exec_balancer.c | 46 +++++++++++++++++++++++-----------
>  1 file changed, 31 insertions(+), 15 deletions(-)
>
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 35a032ccb..0ccb94ba1 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -34,6 +34,10 @@
>  
>  IGT_TEST_DESCRIPTION("Exercise in-kernel load-balancing");
>  
> +#define CORK		(1ul << 0)
> +#define VIRTUAL_ENGINE	(1ul << 1)
> +#define USERPTR		(1ul << 2)
> +
>  #define MI_SEMAPHORE_WAIT		(0x1c << 23)
>  #define   MI_SEMAPHORE_POLL             (1 << 15)
>  #define   MI_SEMAPHORE_SAD_GT_SDD       (0 << 12)
> @@ -578,7 +582,6 @@ static void individual(int i915)
>  }
>  
>  static void bonded(int i915, unsigned int flags)
> -#define CORK 0x1
>  {
>  	I915_DEFINE_CONTEXT_ENGINES_BOND(bonds[16], 1);
>  	struct i915_engine_class_instance *master_engines;
> @@ -660,13 +663,15 @@ static void bonded(int i915, unsigned int flags)
>  				plug = __igt_spin_new(i915,
>  						      .ctx = master,
>  						      .engine = bond,
> -						      .dependency = igt_cork_plug(&cork, i915));
> +						      .dependency = igt_cork_plug(&cork, i915),
> +						      .flags = (flags & USERPTR ? IGT_SPIN_USERPTR : 0));
>  			}
>  
>  			spin = __igt_spin_new(i915,
>  					      .ctx = master,
>  					      .engine = bond,
> -					      .flags = IGT_SPIN_FENCE_OUT);
> +					      .flags = IGT_SPIN_FENCE_OUT |
> +					      (flags & USERPTR ? IGT_SPIN_USERPTR : 0));
>  
>  			eb = spin->execbuf;
>  			eb.rsvd1 = ctx;
> @@ -717,8 +722,6 @@ static void bonded(int i915, unsigned int flags)
>  	gem_context_destroy(i915, master);
>  }
>  
> -#define VIRTUAL_ENGINE (1u << 0)
> -
>  static unsigned int offset_in_page(void *addr)
>  {
>  	return (uintptr_t)addr & 4095;
> @@ -1057,7 +1060,8 @@ static void bonded_chain(int i915)
>  
>  static void __bonded_sema(int i915, uint32_t ctx,
>  			  const struct i915_engine_class_instance *siblings,
> -			  unsigned int count)
> +			  unsigned int count,
> +			  unsigned long flags)
>  {
>  	const int priorities[] = { -1023, 0, 1023 };
>  	struct drm_i915_gem_exec_object2 batch = {
> @@ -1074,7 +1078,8 @@ static void __bonded_sema(int i915, uint32_t ctx,
>  		/* A: spin forever on seperate render engine */
>  		spin = igt_spin_new(i915,
>  				    .flags = (IGT_SPIN_POLL_RUN |
> -					      IGT_SPIN_FENCE_OUT));
> +					      IGT_SPIN_FENCE_OUT |
> +					      (flags & USERPTR ? IGT_SPIN_USERPTR : 0)));
>  		igt_spin_busywait_until_started(spin);
>  
>  		/*
> @@ -1128,7 +1133,7 @@ static void __bonded_sema(int i915, uint32_t ctx,
>  	gem_close(i915, batch.handle);
>  }
>  
> -static void bonded_semaphore(int i915)
> +static void bonded_semaphore(int i915, unsigned long flags)
>  {
>  	uint32_t ctx;
>  
> @@ -1149,7 +1154,7 @@ static void bonded_semaphore(int i915)
>  
>  		siblings = list_engines(i915, 1u << class, &count);
>  		if (count > 1)
> -			__bonded_sema(i915, ctx, siblings, count);
> +			__bonded_sema(i915, ctx, siblings, count, flags);
>  		free(siblings);
>  	}
>  
> @@ -1839,7 +1844,7 @@ static void __bonded_early(int i915, uint32_t ctx,
>  	spin = igt_spin_new(i915,
>  			    .ctx = ctx,
>  			    .engine = (flags & VIRTUAL_ENGINE) ? 0 : 1,
> -			    .flags = IGT_SPIN_NO_PREEMPTION);
> +			    .flags = IGT_SPIN_NO_PREEMPTION | (flags & USERPTR ? IGT_SPIN_USERPTR : 0));
>  
>  	/* B: runs after A on engine 1 */
>  	execbuf.flags = I915_EXEC_FENCE_OUT;
> @@ -1882,7 +1887,7 @@ static void __bonded_early(int i915, uint32_t ctx,
>  	igt_spin_free(i915, spin);
>  }
>  
> -static void bonded_early(int i915)
> +static void bonded_early(int i915, unsigned long flags)
>  {
>  	uint32_t ctx;
>  
> @@ -1909,8 +1914,8 @@ static void bonded_early(int i915)
>  
>  		siblings = list_engines(i915, 1u << class, &count);
>  		if (count > 1) {
> -			__bonded_early(i915, ctx, siblings, count, 0);
> -			__bonded_early(i915, ctx, siblings, count, VIRTUAL_ENGINE);
> +			__bonded_early(i915, ctx, siblings, count, flags);
> +			__bonded_early(i915, ctx, siblings, count, flags | VIRTUAL_ENGINE);
>  		}
>  		free(siblings);
>  	}
> @@ -2876,7 +2881,16 @@ igt_main
>  			bonded(i915, CORK);
>  
>  		igt_subtest("bonded-early")
> -			bonded_early(i915);
> +			bonded_early(i915, 0);
> +
> +		igt_subtest("u-bonded-imm")
> +			bonded(i915, USERPTR);
> +
> +		igt_subtest("u-bonded-cork")
> +			bonded(i915, CORK | USERPTR);
> +
> +		igt_subtest("u-bonded-early")
> +			bonded_early(i915, USERPTR);
>  	}
>  
>  	igt_subtest("bonded-slice")
> @@ -2886,7 +2900,9 @@ igt_main
>  		bonded_chain(i915);
>  
>  	igt_subtest("bonded-semaphore")
> -		bonded_semaphore(i915);
> +		bonded_semaphore(i915, 0);
> +	igt_subtest("u-bonded-semaphore")
> +		bonded_semaphore(i915, USERPTR);
>  
>  	igt_subtest("bonded-pair")
>  		bonded_runner(i915, __bonded_pair);
> -- 
> 2.28.0
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
