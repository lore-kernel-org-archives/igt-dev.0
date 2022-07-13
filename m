Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF21C10E73E
 for <igt-dev@lists.freedesktop.org>; Wed, 13 Jul 2022 14:57:52 +0000 (UTC)
Date: Wed, 13 Jul 2022 16:57:49 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <Ys7dbVbkqgJHQj2x@kamilkon-desk1>
References: <20220712071722.212920-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220712071722.212920-1-andrzej.hajda@intel.com>
Subject: Re: [igt-dev] [PATCH] i915/gem_ctx_persistence: adjust hostile test
 timeout
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Andrzej,

On 2022-07-12 at 09:17:22 +0200, Andrzej Hajda wrote:
> GPU occasionally can hang during hostile test. Detection of such case and
> then reset can take up to 5 seconds.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/2410
> Suggested-by: Chris Wilson <chris.p.wilson@intel.com>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  tests/i915/gem_ctx_persistence.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 00dda3a8b52..50196edb19f 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -370,7 +370,7 @@ static void test_nohangcheck_hostile(int i915, const intel_ctx_cfg_t *cfg)
>  	igt_require(__enable_hangcheck(dir, false));
>  
>  	for_each_ctx_cfg_engine(i915, cfg, e) {
> -		int64_t timeout = reset_timeout_ms * NSEC_PER_MSEC;
> +		int64_t timeout = 10000 * NSEC_PER_MSEC;

May we extend this to other hostile reset timeouts ?
Btw I think about limiting this to only new gens (like >= 11)
where GuC dumps can take some time, but maybe I am overthinking.

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

One more question: should we restore preemption timeout at exit
after test fails ?

Regards,
Kamil

>  		const intel_ctx_t *ctx = intel_ctx_create(i915, cfg);
>  		uint64_t ahnd = get_reloc_ahnd(i915, ctx->id);
>  		igt_spin_t *spin;
> -- 
> 2.25.1
> 
