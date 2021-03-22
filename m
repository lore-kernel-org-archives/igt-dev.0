Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ACC989C59
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:18:00 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id g25so9832453wmh.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 12:18:00 -0700 (PDT)
Date: Mon, 22 Mar 2021 20:17:57 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFjtZQGDIn0HKEhD@phenom.ffwll.local>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210319223233.2982842-8-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319223233.2982842-8-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] tests/i915/gem_ctx_persistence:
 Drop the clone test
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
To: Jason Ekstrand <jason@jlekstrand.net>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Fri, Mar 19, 2021 at 05:32:32PM -0500, Jason Ekstrand wrote:
> We're going to be deleting the CONTEXT_CLONE API since IGT is the only
> userspace to ever use it.  Drop the tests for it.

Patches 5-7 with sob added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/i915/gem_ctx_persistence.c | 30 ------------------------------
>  1 file changed, 30 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_persistence.c b/tests/i915/gem_ctx_persistence.c
> index 10d057f1..91c30176 100644
> --- a/tests/i915/gem_ctx_persistence.c
> +++ b/tests/i915/gem_ctx_persistence.c
> @@ -147,33 +147,6 @@ static void test_idempotent(int i915)
>  	igt_assert_eq(p.value, expected);
>  }
>  
> -static void test_clone(int i915)
> -{
> -	struct drm_i915_gem_context_param p = {
> -		.param = I915_CONTEXT_PARAM_PERSISTENCE,
> -	};
> -	uint32_t ctx, clone;
> -
> -	/*
> -	 * Check that persistence is inherited across a clone.
> -	 */
> -	igt_require( __gem_context_create(i915, &ctx) == 0);
> -
> -	p.ctx_id = ctx;
> -	p.value = 0;
> -	gem_context_set_param(i915, &p);
> -
> -	clone = gem_context_clone(i915, ctx, I915_CONTEXT_CLONE_FLAGS, 0);
> -	gem_context_destroy(i915, ctx);
> -
> -	p.ctx_id = clone;
> -	p.value = -1;
> -	gem_context_get_param(i915, &p);
> -	igt_assert_eq(p.value, 0);
> -
> -	gem_context_destroy(i915, clone);
> -}
> -
>  static void test_persistence(int i915, unsigned int engine)
>  {
>  	igt_spin_t *spin;
> @@ -1366,9 +1339,6 @@ igt_main
>  	igt_subtest("idempotent")
>  		test_idempotent(i915);
>  
> -	igt_subtest("clone")
> -		test_clone(i915);
> -
>  	igt_subtest("file")
>  		test_nonpersistent_file(i915);
>  
> -- 
> 2.29.2
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
