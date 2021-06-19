Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EBE96EA90
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jun 2021 09:21:10 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id r9so13527821wrz.10
 for <igt-dev@lists.freedesktop.org>; Sat, 19 Jun 2021 02:21:10 -0700 (PDT)
References: <1623415451-776-1-git-send-email-vidya.srinivas@intel.com>
 <1624090135-437-1-git-send-email-vidya.srinivas@intel.com>
From: =?UTF-8?Q?Juha-Pekka_Heikkil=c3=a4?= <juhapekka.heikkila@gmail.com>
Message-ID: <4ceeab52-7037-ceab-7677-552db3751674@gmail.com>
Date: Sat, 19 Jun 2021 12:21:07 +0300
MIME-Version: 1.0
In-Reply-To: <1624090135-437-1-git-send-email-vidya.srinivas@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Limit pipe
 output to 8bpc for coverage-vs-premult-vs-constant
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

Hi Vidya

Vidya Srinivas kirjoitti 19.6.2021 klo 11.08:
> Few Gen11 systems report CRC mismatch with higher alpha values if
> primary plane is enabled. So in order to get the coverage vs. premult vs. constant
> crc to match use legacy LUT to limit pipe output to 8bpc for subtest
> coverage-vs-premult-vs-constant. Similar thing is done in kms_flip_scaled_crc.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 39 ++++++++++++++++++++++++++++++++++++---
>   1 file changed, 36 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a37cb27c7d62..1e20d9b0778c 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -442,20 +442,52 @@ static void coverage_7efc(data_t *data, enum pipe pipe, igt_plane_t *plane)
>   	igt_pipe_crc_stop(data->pipe_crc);
>   }
>   
> +static void set_lut(data_t *data, enum pipe pipe)
> +{
> +	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
> +	struct drm_color_lut *lut;
> +	drmModeCrtc *crtc;
> +	int i, lut_size;
> +
> +	crtc = drmModeGetCrtc(data->gfx_fd, pipe_obj->crtc_id);
> +	lut_size = crtc->gamma_size;
> +	drmModeFreeCrtc(crtc);
> +	lut = malloc(sizeof(lut[0]) * lut_size);
> +	for (i = 0; i < lut_size; i++) {
> +		uint16_t v  = (i * 0xffff / (lut_size - 1)) & 0xff00;
> +		lut[i].red = v;
> +		lut[i].green = v;
> +		lut[i].blue = v;
> +	}
> +	igt_pipe_obj_replace_prop_blob(pipe_obj, IGT_CRTC_GAMMA_LUT,
> +				       lut, sizeof(lut[0]) * lut_size);
> +	free(lut);
> +}
> +
> +static void clear_lut(data_t *data, enum pipe pipe)
> +{
> +	igt_pipe_t *pipe_obj = &data->display.pipes[pipe];
> +
> +	igt_pipe_obj_set_prop_value(pipe_obj, IGT_CRTC_GAMMA_LUT, 0);
> +}
> +
>   static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t *plane)
>   {
>   	igt_display_t *display = &data->display;
>   	igt_crc_t ref_crc = {}, crc = {};
> +	int i;

I didn't notice i variable being used

>   
>   	/* Set a background color on the primary fb for testing */
> -	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> -		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
^^
now gray fb background is missing from the test.

> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
> +		set_lut(data, pipe); > +		igt_display_commit_atomic(&data->display, 
DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> +	}
>   
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
>   	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_start(data->pipe_crc);
> -	igt_pipe_crc_get_single(data->pipe_crc, &ref_crc);
> +	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &ref_crc);
>   
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
>   	igt_plane_set_fb(plane, &data->argb_fb_7e);
> @@ -470,6 +502,7 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
>   	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&ref_crc, &crc);
>   
> +	clear_lut(data, pipe);

You'll need to do commit clearing gamma lut.

>   	igt_pipe_crc_stop(data->pipe_crc);
>   }
>   
> 
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
