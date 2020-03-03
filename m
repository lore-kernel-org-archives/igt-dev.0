Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: Mika Kuoppala <mika.kuoppala@linux.intel.com>
In-Reply-To: <20200303143137.1615349-1-chris@chris-wilson.co.uk>
References: <20200303143137.1615349-1-chris@chris-wilson.co.uk>
Date: Tue, 03 Mar 2020 16:39:28 +0200
Message-ID: <87lfoh5wpr.fsf@gaia.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t] i915/gem_ctx_create: Fix
 'files'
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

> The test is supposed to create a context for each execution, so do so.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> ---
>  tests/i915/gem_ctx_create.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/tests/i915/gem_ctx_create.c b/tests/i915/gem_ctx_create.c
> index 2c44a3e3e..d9192fbab 100644
> --- a/tests/i915/gem_ctx_create.c
> +++ b/tests/i915/gem_ctx_create.c
> @@ -178,7 +178,7 @@ static void active(int fd, const struct intel_execution_engine2 *e,
>  
>  			execbuf.flags = ppgtt_engines[child];
>  
> -			while (!*(volatile unsigned *)shared) {
> +			while (!READ_ONCE(*shared)) {

Pleasing.

>  				obj.handle = gem_create(fd, 4096 << 10);
>  				gem_write(fd, obj.handle, 0, &bbe, sizeof(bbe));
>  
> @@ -209,17 +209,19 @@ static void active(int fd, const struct intel_execution_engine2 *e,
>  
>  		clock_gettime(CLOCK_MONOTONIC, &start);
>  		do {
> -			do {
> -				execbuf.rsvd1 = ctx;
> -				for (unsigned n = 0; n < nengine; n++) {
> -					execbuf.flags = engines[n];
> -					gem_execbuf(fd, &execbuf);
> -				}
> -				gem_context_destroy(fd, execbuf.rsvd1);
> -			} while (++count & 1023);
> +			execbuf.rsvd1 = gem_context_clone_with_engines(fd, ctx);
> +			for (unsigned n = 0; n < nengine; n++) {
> +				execbuf.flags = engines[n];
> +				gem_execbuf(fd, &execbuf);
> +			}
> +			gem_context_destroy(fd, execbuf.rsvd1);
> +			count++;
> +
>  			clock_gettime(CLOCK_MONOTONIC, &end);
>  		} while (elapsed(&start, &end) < timeout);
>  
> +		gem_context_destroy(fd, ctx);

Tidy.

Well as the test name is terse as 'active' I can't argue that it should or
should not create a context.

But tossing the same ctx for each execbuf looks fruitless enough.

Reviewed-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>

> +
>  		gem_sync(fd, obj.handle);
>  		clock_gettime(CLOCK_MONOTONIC, &end);
>  		igt_info("[%d] Context creation + execution: %.3f us\n",
> -- 
> 2.25.1
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
