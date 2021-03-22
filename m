Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D1116E591
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:14:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 t5-20020a1c77050000b029010e62cea9deso9599050wmi.0
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 12:14:20 -0700 (PDT)
Date: Mon, 22 Mar 2021 20:14:16 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFjsiBROPqcT0Fpm@phenom.ffwll.local>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210319223233.2982842-4-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319223233.2982842-4-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 3/8] tests/i915/gem_exec_endless: Stop
 setting the ring size
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

On Fri, Mar 19, 2021 at 05:32:28PM -0500, Jason Ekstrand wrote:
> I915_CONTEXT_PARAM_RINGSIZE is being removed from upstream i915 because
> it's never been used by any userspace other than IGT.

Lots of MI_SEMAPHORE in this tests, looks a bit like something that is
probably not a valid usecase for legacy dma_fence execbuf with
end-of-batch dma_fence semantics. But didn't look too closely.

Up to this patch, with sob added:

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>

> ---
>  tests/i915/gem_exec_endless.c | 12 +-----------
>  1 file changed, 1 insertion(+), 11 deletions(-)
> 
> diff --git a/tests/i915/gem_exec_endless.c b/tests/i915/gem_exec_endless.c
> index 1b320d4c..a3e2fa49 100644
> --- a/tests/i915/gem_exec_endless.c
> +++ b/tests/i915/gem_exec_endless.c
> @@ -67,16 +67,6 @@ static unsigned int offset_in_page(void *addr)
>  static uint32_t __supervisor_create_context(int i915,
>  					    const struct intel_execution_engine2 *e)
>  {
> -	struct drm_i915_gem_context_create_ext_setparam p_ring = {
> -		{
> -			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> -			.next_extension = 0
> -		},
> -		{
> -			.param = I915_CONTEXT_PARAM_RINGSIZE,
> -			.value = 4096,
> -		},
> -	};
>  	I915_DEFINE_CONTEXT_PARAM_ENGINES(engines, 2) = {
>  		.engines = {
>  			{ e->class, e->instance },
> @@ -86,7 +76,7 @@ static uint32_t __supervisor_create_context(int i915,
>  	struct drm_i915_gem_context_create_ext_setparam p_engines = {
>  		{
>  			.name = I915_CONTEXT_CREATE_EXT_SETPARAM,
> -			.next_extension = to_user_pointer(&p_ring)
> +			.next_extension = 0,
>  		},
>  		{
>  			.param = I915_CONTEXT_PARAM_ENGINES,
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
