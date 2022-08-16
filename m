Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03372DB48B
 for <igt-dev@lists.freedesktop.org>; Tue, 16 Aug 2022 04:07:44 +0000 (UTC)
Date: Tue, 16 Aug 2022 06:07:40 +0200
From: Zbigniew =?utf-8?Q?Kempczy=C5=84ski?= <zbigniew.kempczynski@intel.com>
To: Kamil Konieczny <kamil.konieczny@linux.intel.com>
Message-ID: <YvsYDD/7XYxCddup@zkempczy-mobl2>
References: <20220805112426.19736-1-kamil.konieczny@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805112426.19736-1-kamil.konieczny@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t v2] i915/i915_hangman: fail only after
 freeing spinners
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Aug 05, 2022 at 01:24:26PM +0200, Kamil Konieczny wrote:
> Failed checks may cause following tests fail, so check for
> errors only after all spinners are released.
> 
> v2: be verbose about what failed (Chris)
> 
> Cc: Zbigniew Kempczyński <zbigniew.kempczynski@intel.com>
> Signed-off-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>
> ---
>  tests/i915/i915_hangman.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
> 
> diff --git a/tests/i915/i915_hangman.c b/tests/i915/i915_hangman.c
> index c7d69fdd..eb74c02e 100644
> --- a/tests/i915/i915_hangman.c
> +++ b/tests/i915/i915_hangman.c
> @@ -295,6 +295,11 @@ static void context_unban(int fd, unsigned ctx)
>  	gem_context_set_param(fd, &param);
>  }
>  
> +#define ERR_HANG 0
> +#define ERR_FENCE_BUSY 1
> +#define ERR_FENCE_END  2
> +#define ERR_FENCE_STAT 3
> +
>  static void
>  test_engine_hang(const intel_ctx_t *ctx,
>  		 const struct intel_execution_engine2 *e, unsigned int flags)
> @@ -305,6 +310,7 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	IGT_LIST_HEAD(list);
>  	uint64_t ahnd = get_reloc_ahnd(device, ctx->id), ahndN;
>  	int num_ctx;
> +	int err[4] = { 0, 0, 0, 0 };

= {}; is enough.

>  
>  	igt_skip_on(flags & IGT_SPIN_INVALID_CS &&
>  		    gem_engine_has_cmdparser(device, &ctx->cfg, e->flags));
> @@ -340,18 +346,21 @@ test_engine_hang(const intel_ctx_t *ctx,
>  				      flags));
>  
>  	/* Wait for the hangcheck to terminate the hanger */
> -	igt_assert(sync_fence_wait(spin->out_fence, 30000) == 0); /* 30s */
> -	igt_assert_eq(sync_fence_status(spin->out_fence), -EIO);
> +	err[ERR_HANG] = sync_fence_wait(spin->out_fence, 30000) << 8; /* 30s */
> +	err[ERR_HANG] |= sync_fence_status(spin->out_fence); /* -EIO */

sync_fence_wait() may return some error so binary-or with -EIO may produce
weird error value. I don't think below assert_f() will catch it.

--
Zbigniew 

>  	igt_spin_free(device, spin);
>  
>  	/* But no other engines/clients should be affected */
>  	igt_list_for_each_entry_safe(spin, next, &list, link) {
>  		ahndN = spin->opts.ahnd;
> -		igt_assert(sync_fence_wait(spin->out_fence, 0) == -ETIME);
> +		if (sync_fence_wait(spin->out_fence, 0) != -ETIME)
> +			err[ERR_FENCE_BUSY]++;
>  		igt_spin_end(spin);
>  
> -		igt_assert(sync_fence_wait(spin->out_fence, 500) == 0);
> -		igt_assert_eq(sync_fence_status(spin->out_fence), 1);
> +		if (sync_fence_wait(spin->out_fence, 500) != 0)
> +			err[ERR_FENCE_END]++;
> +		if (sync_fence_status(spin->out_fence) != 1)
> +			err[ERR_FENCE_STAT]++;
>  		igt_spin_free(device, spin);
>  		put_ahnd(ahndN);
>  	}
> @@ -360,6 +369,10 @@ test_engine_hang(const intel_ctx_t *ctx,
>  	while (num_ctx)
>  		intel_ctx_destroy(device, local_ctx[--num_ctx]);
>  
> +	igt_assert_f(err[ERR_HANG] == -EIO, "hanged spinner failed\n");
> +	igt_assert_f(err[ERR_FENCE_BUSY] == 0, "background spinner not busy\n");
> +	igt_assert_f(err[ERR_FENCE_END] == 0, "background spinner not terminated\n");
> +	igt_assert_f(err[ERR_FENCE_STAT] == 0, "background fence not signalled\n");
>  	check_alive();
>  }
>  
> -- 
> 2.34.1
> 
