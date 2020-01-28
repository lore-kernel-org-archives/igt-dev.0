Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200128122143.3765164-1-chris@chris-wilson.co.uk>
References: <20200128122143.3765164-1-chris@chris-wilson.co.uk>
Date: Tue, 28 Jan 2020 14:45:34 +0200
Message-ID: <874kwfn40h.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_exec_balancer:
 Convert to use gem_mmap__device_coherent()
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
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Chris Wilson <chris@chris-wilson.co.uk> writes:

> Replace gem_mmap_gtt and write-once mmaps with
> gem_mmap__device_coherent.
>
> For use as an invalid pointer, we need only worry about having an
> mmap_offset (gtt or wc) as they work alike inside the kernel with
> respect to locking. (GTT has the extra vm->mutex, but if there's no
> aperture, there's never going to be such a mutex to worry about!)
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> ---
>  tests/i915/gem_exec_balancer.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/tests/i915/gem_exec_balancer.c b/tests/i915/gem_exec_balancer.c
> index 6b0c47f09..150eba0db 100644
> --- a/tests/i915/gem_exec_balancer.c
> +++ b/tests/i915/gem_exec_balancer.c
> @@ -278,7 +278,8 @@ static void invalid_balancer(int i915)
>  		igt_assert_eq(__gem_context_set_param(i915, &p), -EFAULT);
>  
>  		handle = gem_create(i915, 4096 * 3);
> -		ptr = gem_mmap__gtt(i915, handle, 4096 * 3, PROT_WRITE);
> +		ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3,
> +						PROT_WRITE);
>  		gem_close(i915, handle);
>  
>  		memset(&engines, 0, sizeof(engines));
> @@ -369,7 +370,7 @@ static void invalid_bonds(int i915)
>  	gem_context_set_param(i915, &p);
>  
>  	handle = gem_create(i915, 4096 * 3);
> -	ptr = gem_mmap__gtt(i915, handle, 4096 * 3, PROT_WRITE);
> +	ptr = gem_mmap__device_coherent(i915, handle, 0, 4096 * 3, PROT_WRITE);
>  	gem_close(i915, handle);
>  
>  	memcpy(ptr + 4096, &bonds[0], sizeof(bonds[0]));
> @@ -720,7 +721,7 @@ static uint32_t create_semaphore_to_spinner(int i915, igt_spin_t *spin)
>  	uint64_t addr;
>  
>  	handle = gem_create(i915, 4096);
> -	cs = map = gem_mmap__cpu(i915, handle, 0, 4096, PROT_WRITE);
> +	cs = map = gem_mmap__device_coherent(i915, handle, 0, 4096, PROT_WRITE);
>  
>  	/* Wait until the spinner is running */
>  	addr = spin->obj[0].offset + 4 * SPIN_POLL_START_IDX;
> -- 
> 2.25.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
