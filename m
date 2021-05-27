Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E6CA6E03B
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 12:20:51 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id z17so4535422wrq.7
 for <igt-dev@lists.freedesktop.org>; Thu, 27 May 2021 05:20:51 -0700 (PDT)
References: <20210526101844.1033711-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <022a72f2-39e7-6dbc-ff27-d95753f7c51f@gmail.com>
Date: Thu, 27 May 2021 15:20:44 +0300
MIME-Version: 1.0
In-Reply-To: <20210526101844.1033711-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_lowres: Use lowest mode
 for testing
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mika Kahola <mika.kahola@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 26.5.2021 13.18, Mika Kahola wrote:
> Search and use the lowest possible mode, when switching resolutions
> from the default to the lowest mode and back.
> 
> While at it, reset display after each subtest run.
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/kms_plane_lowres.c | 23 ++++++++++-------------
>   1 file changed, 10 insertions(+), 13 deletions(-)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index 43cc4250d..b876162b3 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -59,26 +59,21 @@ get_lowres_mode(int drmfd, igt_output_t *output,
>   		const drmModeModeInfo *mode_default)
>   {
>   	const drmModeModeInfo *mode;
> -	bool found = false;
> -	int limit = mode_default->vdisplay - SIZE;
> +	const drmModeModeInfo *min;
>   	int j;
>   
> +        /* search for lowest mode */
> +        min = mode_default;
>   	for (j = 0; j < output->config.connector->count_modes; j++) {
>   		mode = &output->config.connector->modes[j];
> -		if (mode->vdisplay < limit) {
> -			found = true;
> -			break;
> -		}
> +		if (mode->vdisplay < min->vdisplay)
> +			min = mode;
>   	}
>   
> -	if (!found) {
> -		igt_require_f(mode_default->vdisplay - SIZE > 768,
> -			      "Current mode not tall enough; plane would still be onscreen after switch to 10x7.\n");
> +	igt_require_f(mode_default->vdisplay - min->vdisplay > 2 * SIZE,
> +		      "Current mode not tall enough; plane would still be onscreen after switching to lowest mode.\n");
>   
> -		return *igt_std_1024_mode_get();
> -	}
> -
> -	return *mode;
> +	return *min;
>   }
>   
>   static igt_plane_t *first_sdr_plane(igt_output_t *output, uint32_t devid)
> @@ -250,6 +245,8 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
>   	igt_remove_fb(data->drm_fd, &data->ref_hires.fb);
>   	igt_remove_fb(data->drm_fd, &data->ref_lowres.fb);
>   
> +	igt_display_reset(&data->display);
> +
>   	return tested;
>   }
>   
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
