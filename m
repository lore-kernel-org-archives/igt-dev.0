Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 214406E591
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 19:16:26 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id j7so18363497wrd.1
 for <igt-dev@lists.freedesktop.org>; Mon, 22 Mar 2021 12:16:26 -0700 (PDT)
Date: Mon, 22 Mar 2021 20:16:22 +0100
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YFjtBmTX6KNxfq8Y@phenom.ffwll.local>
References: <20210319223233.2982842-1-jason@jlekstrand.net>
 <20210319223233.2982842-5-jason@jlekstrand.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319223233.2982842-5-jason@jlekstrand.net>
Subject: Re: [igt-dev] [PATCH i-g-t 4/8] tests/i915/gem_ctx_param: Drop the
 zeromap subtests
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

On Fri, Mar 19, 2021 at 05:32:29PM -0500, Jason Ekstrand wrote:
> We're going to be deleting this param from i915 since it's never been
> used by any actual userspace beyond this test.

I think a bit more history here would be nice: Userspace did exist once in
the form of patches for beignet, but never landed. This is probably one of
the features that originally have been driven by the geod stack, and as
soon as the kernel side landed, no one cared.

With sob: Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> ---
>  tests/i915/gem_ctx_param.c | 33 ---------------------------------
>  1 file changed, 33 deletions(-)
> 
> diff --git a/tests/i915/gem_ctx_param.c b/tests/i915/gem_ctx_param.c
> index ab0e3007..47fea06d 100644
> --- a/tests/i915/gem_ctx_param.c
> +++ b/tests/i915/gem_ctx_param.c
> @@ -335,39 +335,6 @@ igt_main
>  		gem_context_set_param(fd, &arg);
>  	}
>  
> -	arg.param = I915_CONTEXT_PARAM_NO_ZEROMAP;
> -
> -	igt_describe("Validates context set param ioctl in non root mode with param "
> -	       "set to no zeromap");
> -	igt_subtest("non-root-set-no-zeromap") {
> -		igt_fork(child, 1) {
> -			igt_drop_root();
> -
> -			arg.ctx_id = ctx;
> -			gem_context_get_param(fd, &arg);
> -			arg.value--;
> -			gem_context_set_param(fd, &arg);
> -		}
> -
> -		igt_waitchildren();
> -	}
> -
> -	igt_describe("Tests the context set param ioctl with no zeromap enabled in root mode");
> -	igt_subtest("root-set-no-zeromap-enabled") {
> -		arg.ctx_id = ctx;
> -		gem_context_get_param(fd, &arg);
> -		arg.value = 1;
> -		gem_context_set_param(fd, &arg);
> -	}
> -
> -	igt_describe("Tests the context set param ioctl with no zeromap disabled in root mode");
> -	igt_subtest("root-set-no-zeromap-disabled") {
> -		arg.ctx_id = ctx;
> -		gem_context_get_param(fd, &arg);
> -		arg.value = 0;
> -		gem_context_set_param(fd, &arg);
> -	}
> -
>  	igt_describe("Tests that multiple contexts can share the same VMA");
>  	igt_subtest("vm")
>  		test_vm(fd);
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
