Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E356E48C
 for <igt-dev@lists.freedesktop.org>; Fri,  9 Apr 2021 10:05:26 +0000 (UTC)
From: "Gupta, Nidhi1" <nidhi1.gupta@intel.com>
Date: Fri, 9 Apr 2021 10:05:23 +0000
Message-ID: <cc1a7800dab641578930d9dd604e6861@intel.com>
References: <20210408073748.26234-1-nidhi1.gupta@intel.com>
 <YG9kaiIzM4Nsujvl@phenom.ffwll.local>
In-Reply-To: <YG9kaiIzM4Nsujvl@phenom.ffwll.local>
Content-Language: en-US
MIME-Version: 1.0
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
To: Daniel Vetter <daniel@ffwll.ch>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



-----Original Message-----
From: Daniel Vetter <daniel@ffwll.ch> 
Sent: Friday, April 9, 2021 1:46 AM
To: Gupta, Nidhi1 <nidhi1.gupta@intel.com>
Cc: igt-dev@lists.freedesktop.org
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres : Added test description

On Thu, Apr 08, 2021 at 01:07:48PM +0530, Nidhi Gupta wrote:
> Added test description.
> 
> Signed-off-by: Nidhi Gupta <nidhi1.gupta@intel.com>

I don't think it makes sense to have an individual series for each of these, that just needlessly blows through CI bandwidth for no real gain.
Also, it means they're all very spread around and harder to find for a motivated reviewer.

Please group them up, ideally so that you do all the annotation for a set of tests that are all related.
-Daniel

Thanks Daniel for the comment, I will group all kms tests description together.
-Nidhi

> ---
>  tests/kms_plane_lowres.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c index 
> a5af1f8a..5cfe53c8 100644
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
