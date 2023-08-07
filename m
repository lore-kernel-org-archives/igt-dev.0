Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AF9C10E379
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Aug 2023 18:57:27 +0000 (UTC)
Message-ID: <f0aee465-3e20-dac2-a16c-5bcff746e0d6@intel.com>
Date: Tue, 8 Aug 2023 00:26:49 +0530
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, <igt-dev@lists.freedesktop.org>
References: <20230807163634.205167-1-robdclark@gmail.com>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20230807163634.205167-1-robdclark@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2] tests/kms_plane: Handle hw without legacy
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



On Mon-07-08-2023 10:06 pm, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Skip the tests which require legacy gamma, instead of failing, if the hw
> does not support legacy gamma.
> 
> v2: igt_require(lut_size > 0) instead
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>   tests/kms_plane.c | 9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 67cff61d6cd1..2df1d2f0aeee 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -463,19 +463,22 @@ static void set_legacy_lut(data_t *data, enum pipe pipe,
>   	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
>   	drmModeCrtc *crtc;
>   	uint16_t *lut;
> -	int i, lut_size;
> +	int i, lut_size, ret;
>   
>   	crtc = drmModeGetCrtc(data->drm_fd, pipe_obj->crtc_id);
>   	lut_size = crtc->gamma_size;
>   	drmModeFreeCrtc(crtc);
>   
> +	igt_require(lut_size > 0);
> +
>   	lut = malloc(sizeof(uint16_t) * lut_size);
>   
>   	for (i = 0; i < lut_size; i++)
>   		lut[i] = (i * 0xffff / (lut_size - 1)) & mask;
>   
> -	igt_assert_eq(drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
> -					  lut_size, lut, lut, lut), 0);
> +	ret = drmModeCrtcSetGamma(data->drm_fd, pipe_obj->crtc_id,
> +				  lut_size, lut, lut, lut);
> +	igt_assert_eq(ret, 0);

Unrelated change. What is wrong with this check?

- Bhanu

>   
>   	free(lut);
>   }
