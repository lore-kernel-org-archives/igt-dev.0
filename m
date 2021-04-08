Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB0C06E1E0
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Apr 2021 20:15:42 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id x15so3437937wrq.3
 for <igt-dev@lists.freedesktop.org>; Thu, 08 Apr 2021 13:15:42 -0700 (PDT)
Date: Thu, 8 Apr 2021 22:15:38 +0200
From: Daniel Vetter <daniel@ffwll.ch>
Message-ID: <YG9kaiIzM4Nsujvl@phenom.ffwll.local>
References: <20210408073748.26234-1-nidhi1.gupta@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210408073748.26234-1-nidhi1.gupta@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres : Added test
 description
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
To: Nidhi Gupta <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Apr 08, 2021 at 01:07:48PM +0530, Nidhi Gupta wrote:
> Added test description.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

I don't think it makes sense to have an individual series for each of
these, that just needlessly blows through CI bandwidth for no real gain.
Also, it means they're all very spread around and harder to find for a
motivated reviewer.

Please group them up, ideally so that you do all the annotation for a set
of tests that are all related.
-Daniel

> ---
>  tests/kms_plane_lowres.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index a5af1f8a..5cfe53c8 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -301,15 +301,23 @@ igt_main
>  
>  	for_each_pipe_static(pipe) {
>  		data.pipe = pipe;
> +		igt_describe("Tests the visibility of the planes when switching between "
> +			     "high and low resolution with tiling as none.");
>  		igt_subtest_f("pipe-%s-tiling-none", kmstest_pipe_name(pipe))
>  			test_planes_on_pipe(&data, LOCAL_DRM_FORMAT_MOD_NONE);
>  
> +		igt_describe("Tests the visibility of the planes when switching between "
> +			     "high and low resolution with x-tiling.");
>  		igt_subtest_f("pipe-%s-tiling-x", kmstest_pipe_name(pipe))
>  			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_X_TILED);
>  
> +		igt_describe("Tests the visibility of the planes when switching between "
> +			     "high and low resolution with y-tiling.");
>  		igt_subtest_f("pipe-%s-tiling-y", kmstest_pipe_name(pipe))
>  			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Y_TILED);
>  
> +		igt_describe("Tests the visibility of the planes when switching between "
> +			     "high and low resolution with yf-tiling.");
>  		igt_subtest_f("pipe-%s-tiling-yf", kmstest_pipe_name(pipe))
>  			test_planes_on_pipe(&data, LOCAL_I915_FORMAT_MOD_Yf_TILED);
>  	}
> -- 
> 2.26.2
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
