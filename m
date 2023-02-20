Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 20 Feb 2023 21:49:46 +0100
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230220204946.7uy5krqzfb5qc4oz@kamilkon-desk1>
References: <20230220132445.32129-1-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230220132445.32129-1-janusz.krzysztofik@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_barrier_race: Extend support
 over compute engines
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: intel-gfx@lists.freedesktop.org, Chris Wilson <chris.p.wilson@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On 2023-02-20 at 14:24:45 +0100, Janusz Krzysztofik wrote:
> This test can work not only on render engines, as its current code
> suggests, but also on compute class engines.  Add them to the set of
> engine classes supported by the test, in case a future platform has only
> those and no RCS available.

Lgtm,
Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

--
Kamil

> 
> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  tests/i915/gem_barrier_race.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_barrier_race.c b/tests/i915/gem_barrier_race.c
> index 484fef85ac..053fa2069e 100644
> --- a/tests/i915/gem_barrier_race.c
> +++ b/tests/i915/gem_barrier_race.c
> @@ -142,7 +142,8 @@ igt_main
>  		struct intel_execution_engine2 *e;
>  
>  		for_each_physical_engine(fd, e) {
> -			if (e->class != I915_ENGINE_CLASS_RENDER)
> +			if (e->class != I915_ENGINE_CLASS_RENDER &&
> +			    e->class != I915_ENGINE_CLASS_COMPUTE)
>  				continue;
>  
>  			igt_dynamic(e->name)
> -- 
> 2.25.1
> 
