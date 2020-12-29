Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 30 Dec 2020 02:05:59 +0530
From: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
Message-ID: <20201229203557.GA17099@arjun-NUC8i7BEH>
References: <20201229200647.629624-1-chris@chris-wilson.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201229200647.629624-1-chris@chris-wilson.co.uk>
Subject: Re: [igt-dev] [PATCH i-g-t] i915/gem_ctx_engine: Check idempotency
 by passing all known engines
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
To: Chris Wilson <chris@chris-wilson.co.uk>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Dec 29, 2020 at 08:06:47PM +0000, Chris Wilson wrote:
> Don't rely on just rcs0 being well defined, check that we return a list
> of each engine when asked.
> 
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: "Melkaveri, Arjun" <arjun.melkaveri@intel.com>
> ---
>  tests/i915/gem_ctx_engines.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_engines.c b/tests/i915/gem_ctx_engines.c
> index be7d5733f..12c6b84ca 100644
> --- a/tests/i915/gem_ctx_engines.c
> +++ b/tests/i915/gem_ctx_engines.c
> @@ -230,15 +230,21 @@ static void idempotent(int i915)
>  	igt_assert_eq(p.size, base + idx);
>  	igt_assert(!memcmp(&expected, &engines, idx));
>  
> -	memset(&engines, 0, sizeof(engines));
>  	p.size = sizeof(engines);
> -	gem_context_set_param(i915, &p);
> +	__for_each_physical_engine(i915, e) {
> +		memset(&engines, 0, sizeof(engines));
> +		for (int n = 0; n < I915_EXEC_RING_MASK + 1; n++) {
> +			engine_class(&engines, n) = e->class;
> +			engine_instance(&engines, n) = e->instance;
> +		}
> +		gem_context_set_param(i915, &p);
>  
> -	memcpy(&expected, &engines, sizeof(expected));
> +		memcpy(&expected, &engines, sizeof(expected));
>  
> -	gem_context_get_param(i915, &p);
> -	igt_assert_eq(p.size, sizeof(engines));
> -	igt_assert(!memcmp(&expected, &engines, idx));
> +		gem_context_get_param(i915, &p);
> +		igt_assert_eq(p.size, sizeof(engines));
> +		igt_assert(!memcmp(&expected, &engines, p.size));
> +	}
Tested the code change . 

Reviewed-by: Arjun Melkaveri <arjun.melkaveri@intel.com>
>  
>  	gem_context_destroy(i915, p.ctx_id);
>  }
> -- 
> 2.30.0.rc2
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
