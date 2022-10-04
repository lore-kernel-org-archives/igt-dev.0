Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 4 Oct 2022 12:57:45 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Message-ID: <YzwRqZbmTarI3D9e@kamilkon-desk1>
References: <20220923160137.1991101-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220923160137.1991101-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] gem_ctx_persistence: adjust reset
 timeout
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

On 2022-09-23 at 18:01:37 +0200, Andrzej Hajda wrote:
> Tests on DG2 show that context cancel can take even 350ms,
> due to error state capturing in guc_handle_context_reset.
> Since it happens only in debug mode and tests runs in debug mode
> it should be fine to adjust the timeout.
> Let's double this value, to be on safe side.
> It should fix multiple test timeout failures.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/1551
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/5891
> Closes: https://gitlab.freedesktop.org/drm/intel/-/issues/3952
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/i915/gem_ctx_persistence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 50196edb19f..a844439de19 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -1214,7 +1214,7 @@ static void do_test(void (*test)(int i915, const intel_ctx_cfg_t *cfg,
>  	if (timeout != -1) {
>  		igt_require(gem_engine_property_printf(i915, name,
>  						       ATTR, "%d", 50) > 0);
> -		reset_timeout_ms = 200;
> +		reset_timeout_ms = 700;
>  	}
>  
>  	test(i915, cfg, engine);
> -- 
> 2.34.1
> 
