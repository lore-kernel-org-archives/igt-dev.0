Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 23 Jan 2020 14:21:03 +0200
From: Petri Latvala <petri.latvala@intel.com>
Message-ID: <20200123122103.GL25209@platvala-desk.ger.corp.intel.com>
References: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200123120134.2682-1-tvrtko.ursulin@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_isolation: Use
 static iterator
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
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Jan 23, 2020 at 12:01:34PM +0000, Tvrtko Ursulin wrote:
> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> 
> Quick fixup to the test so correct way of iterating the static engine list
> is used. More comprehensive fixes to the test are in progress.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>


Reviewed-by: Petri Latvala <petri.latvala@intel.com>


> ---
>  tests/i915/gem_ctx_isolation.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_isolation.c b/tests/i915/gem_ctx_isolation.c
> index 6aa27133cbb7..8b72a16ad86f 100644
> --- a/tests/i915/gem_ctx_isolation.c
> +++ b/tests/i915/gem_ctx_isolation.c
> @@ -857,6 +857,7 @@ static unsigned int __has_context_isolation(int fd)
>  igt_main
>  {
>  	unsigned int has_context_isolation = 0;
> +	const struct intel_execution_engine2 *e;
>  	int fd = -1;
>  
>  	igt_fixture {
> @@ -876,8 +877,7 @@ igt_main
>  		igt_skip_on(gen > LAST_KNOWN_GEN);
>  	}
>  
> -	for (const struct intel_execution_engine2 *e = intel_execution_engines2;
> -	     e->name; e++) {
> +	__for_each_static_engine(e) {
>  		igt_subtest_group {
>  			igt_fixture {
>  				igt_require(has_context_isolation & (1 << e->class));
> -- 
> 2.20.1
> 
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
