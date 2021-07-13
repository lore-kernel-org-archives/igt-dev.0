Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDD4F6E12C
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 20:34:44 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l4-20020a05600c4f04b0290220f8455631so19167wmq.1
 for <igt-dev@lists.freedesktop.org>; Tue, 13 Jul 2021 13:34:44 -0700 (PDT)
Date: Tue, 13 Jul 2021 22:34:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YO344V8Pa3wfUcEc@phenom.ffwll.local>
References: <20210712074936.3541-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210712074936.3541-1-ville.syrjala@linux.intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/gem_fenced_exec_thrash:
 s/EDEADLK/ENOBUFS/
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Jul 12, 2021 at 10:49:36AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> =

> Adjust the expected errno for running out of fences to
> ENOBUFS from EDEADLK as per kernel commit 78d2ad7eb4e1
> ("drm/i915/gt: Fix -EDEADLK handling regression").
> =

> Signed-off-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

I'm disappoint in the errno, but um I guess it's as good as it gets.

Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
-Daniel

> ---
>  tests/i915/gem_fenced_exec_thrash.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/tests/i915/gem_fenced_exec_thrash.c b/tests/i915/gem_fenced_=
exec_thrash.c
> index 13812bb7e429..6497ff57647a 100644
> --- a/tests/i915/gem_fenced_exec_thrash.c
> +++ b/tests/i915/gem_fenced_exec_thrash.c
> @@ -182,7 +182,7 @@ igt_main
>  			run_test(fd, num_fences, 0, flags);
>  	}
>  	igt_subtest("too-many-fences")
> -		run_test(fd, num_fences + 1, intel_gen(devid) >=3D 4 ? 0 : EDEADLK, 0);
> +		run_test(fd, num_fences + 1, intel_gen(devid) >=3D 4 ? 0 : ENOBUFS, 0);
>  =

>  	igt_fixture
>  		close(fd);
> -- =

> 2.31.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
