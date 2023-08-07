Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 643C610E1F1
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 15:03:44 +0000 (UTC)
Date: Mon, 7 Aug 2023 17:02:39 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230807150239.am74xi46vdkg3tey@kamilkon-desk1>
References: <20230728201723.130308-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230728201723.130308-1-robdclark@gmail.com>
Subject: Re: [igt-dev] [PATCH] tests/kms_plane: Handle hw without legacy
 gamma support
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Rob,

On 2023-07-28 at 13:17:23 -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Skip the tests which require legacy gamma, instead of failing, if the hw
> does not support legacy gamma.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  tests/kms_plane.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6cd1..9f72a5bceae9 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -463,7 +463,7 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>  	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
>  	drmModeCrtc *crtc;
>  	uint16_t *lut;
> -	int i, lut_size;
> +	int i, lut_size, ret;
>  
>  	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
>  	lut_size = crtc->gamma_size;

If HW do not support it then lut_size should be zero
so igt_require could happen here instead of below?

Regards,
Kamil

> @@ -474,8 +474,10 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>  	for (i = 0; i < lut_size; i++)
>  		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
>  
> -	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
> -					  lut_size, lut, lut, lut), 0);
> +	ret = drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
> +				  lut_size, lut, lut, lut);
> +	igt_require(ret != -ENOSYS);
> +	igt_assert_eq(ret, 0);
>  
>  	free(lut);
>  }
> -- 
> 2.41.0
> 
