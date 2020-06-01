Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200531191307.180023-1-chris@chris-wilson.co.uk>
References: <20200531191307.180023-1-chris@chris-wilson.co.uk>
Date: Mon, 01 Jun 2020 17:56:55 +0300
Message-ID: <87sgfesuko.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [Intel-gfx] [igt-dev] [PATCH i-g-t] i915/gem_exec_balancer:
 Disable pre-parser for rewritten batches
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Chris Wilson <chris@chris-wilson.co.uk>, intel-gfx@lists.freedesktop.org
Cc: igt-dev@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> As we rewrite the batches on the fly to implement the non-preemptible
> lock, we need to tell Tigerlake to read the batch afresh each time.
> Amusingly, the disable is a part of an arb-check, so we have to be
> careful not to include the arbitration point inside our unpreemptible
> loop.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_exec_balancer.c | 13 +++++++++----
>  1 file changed, 9 insertions(+), 4 deletions(-)
>
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 026f8347e..0e3b52900 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -1350,6 +1350,11 @@ static void __bonded_dual(int i915,
>  	*out = cycles;
>  }
>  
> +static uint32_t preparser_disable(void)
> +{
> +	return 0x5 << 23 | 1 << 8 | 1; /* preparser masked disable */

there is MI_ARB_CHECK

> +}
> +
>  static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
>  {
>  	uint32_t handle = gem_create(i915, 4096);
> @@ -1363,14 +1368,14 @@ static uint32_t sync_from(int i915, uint32_t addr, uint32_t target)
>  	*cs++ = 0;
>  	*cs++ = 0;
>  
> -	*cs++ = MI_NOOP;
> +	*cs++ = preparser_disable();
>  	*cs++ = MI_NOOP;
>  	*cs++ = MI_NOOP;
>  	*cs++ = MI_NOOP;
>  
>  	/* wait for them to cancel us */
>  	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> -	*cs++ = addr + 16;
> +	*cs++ = addr + 24;

I must be totally confused about the layout as I can't get
the +8. You take one nop out and put one arb check in
and everything moves with 8?

-Mika

>  	*cs++ = 0;
>  
>  	/* self-heal */
> @@ -1393,14 +1398,14 @@ static uint32_t sync_to(int i915, uint32_t addr, uint32_t target)
>  
>  	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
>  
> -	*cs++ = MI_NOOP;
> +	*cs++ = preparser_disable();
>  	*cs++ = MI_NOOP;
>  	*cs++ = MI_NOOP;
>  	*cs++ = MI_NOOP;
>  
>  	/* wait to be cancelled */
>  	*cs++ = MI_BATCH_BUFFER_START | 1 << 8 | 1;
> -	*cs++ = addr;
> +	*cs++ = addr + 8;
>  	*cs++ = 0;
>  
>  	/* cancel their spin as a compliment */
> -- 
> 2.27.0.rc2
>
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx
