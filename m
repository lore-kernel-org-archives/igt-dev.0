Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991166E8D1
 for <igt-dev@lists.freedesktop.org>; Mon,  8 Feb 2021 13:21:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id m13so17027772wro.12
 for <igt-dev@lists.freedesktop.org>; Mon, 08 Feb 2021 05:21:11 -0800 (PST)
References: <20210205074515.286343-1-mika.kahola@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <4f06ccdf-a489-612a-0c2a-c7ad5815a0f7@gmail.com>
Date: Mon, 8 Feb 2021 15:21:03 +0200
MIME-Version: 1.0
In-Reply-To: <20210205074515.286343-1-mika.kahola@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t v2] tests/kms_plane_lowres: Use highest
 and lowest resolution for testing
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

On 5.2.2021 9.45, Mika Kahola wrote:
> Sometimes the delta between the highest (the selected default mode) and
> lowest resolution is not big enough to carry out tests succesfully. Hence,
> let's change the test procedure so that we select the highest available mode
> for high resolution case and the lowest possible mode for low resolution case.
> 
> v2: Try default 1024x768 mode if we can't find suitable low resolution mode (CI)
> 
> Signed-off-by: Mika Kahola <mika.kahola@intel.com>
> ---
>   tests/kms_plane_lowres.c | 55 ++++++++++++++++++++--------------------
>   1 file changed, 27 insertions(+), 28 deletions(-)
> 
> diff --git a/tests/kms_plane_lowres.c b/tests/kms_plane_lowres.c
> index a5af1f8a..12c90abb 100644
> --- a/tests/kms_plane_lowres.c
> +++ b/tests/kms_plane_lowres.c
> @@ -54,31 +54,25 @@ typedef struct {
>   	int x, y;
>   } data_t;
>   
> -static drmModeModeInfo
> -get_lowres_mode(int drmfd, igt_output_t *output,
> -		const drmModeModeInfo *mode_default)
> +static drmModeModeInfo *
> +get_mode(int drmfd, igt_output_t *output, bool lowres)

I see this is called twice with just flip flopping lowres switch.
How about making it like this instead:

get_mode(int drmfd, igt_output_t *output, drmModeModeInfoPtr himode, 
drmModeModeInfoPtr lomode)

This way you can avoid playing with tmp also do all comparisons on 
pointers on parameter.

>   {
> -	const drmModeModeInfo *mode;
> -	bool found = false;
> -	int limit = mode_default->vdisplay - SIZE;
> +	drmModeModeInfo *mode, *tmp;
>   	int j;
>   
> -	for (j = 0; j < output->config.connector->count_modes; j++) {
> -		mode = &output->config.connector->modes[j];
> -		if (mode->vdisplay < limit) {
> -			found = true;
> -			break;
> +	mode = &output->config.connector->modes[0];
> +	for (j = 1; j < output->config.connector->count_modes; j++) {
> +		tmp = &output->config.connector->modes[j];
> +		if (lowres) {
> +			if (tmp->vdisplay < mode->vdisplay)
> +				mode = tmp;
> +		} else {
> +			if (tmp->vdisplay > mode->vdisplay)
> +				mode = tmp;
>   		}
>   	}
>   
> -	if (!found) {
> -		igt_require_f(mode_default->vdisplay - SIZE > 768,
> -			      "Current mode not tall enough; plane would still be onscreen after switch to 10x7.\n");
> -
> -		return *igt_std_1024_mode_get();
> -	}
> -
> -	return *mode;
> +	return mode;
>   }
>   
>   static igt_plane_t *first_sdr_plane(igt_output_t *output, uint32_t devid)
> @@ -164,8 +158,7 @@ static void create_ref_fb(data_t *data, uint64_t modifier,
>   static unsigned
>   test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modifier)
>   {
> -	const drmModeModeInfo *mode;
> -	drmModeModeInfo mode_lowres;
> +	drmModeModeInfo *mode, *mode_lowres;
>   	igt_pipe_crc_t *pipe_crc;
>   	unsigned tested = 0;
>   	igt_plane_t *primary;
> @@ -174,8 +167,14 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
>   	igt_output_set_pipe(data->output, data->pipe);
>   
>   	primary = compatible_main_plane(plane, data->output, data->devid);
> -	mode = igt_output_get_mode(data->output);
> -	mode_lowres = get_lowres_mode(data->drm_fd, data->output, mode);
> +	mode = get_mode(data->drm_fd, data->output, false);
> +	mode_lowres = get_mode(data->drm_fd, data->output, true);
> +
> +        if (mode->vdisplay - mode_lowres->vdisplay < SIZE)
> +                mode_lowres = (drmModeModeInfo*)igt_std_1024_mode_get();
> +
> +	igt_require_f(mode->vdisplay - mode_lowres->vdisplay > SIZE,
> +		      "Current mode not tall enough; plane would still be onscreen after switch to the lowest resolution.\n");
>   
>   	igt_create_color_pattern_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>   				    DRM_FORMAT_XRGB8888, modifier, 0.0, 0.0, 1.0,
> @@ -194,17 +193,17 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
>   				    1.0, 1.0, 0.0, &data->fb_plane[1]);
>   
>   	create_ref_fb(data, modifier, mode, &data->ref_hires.fb);
> -	create_ref_fb(data, modifier, &mode_lowres, &data->ref_lowres.fb);
> +	create_ref_fb(data, modifier, mode_lowres, &data->ref_lowres.fb);
>   
>   	pipe_crc = igt_pipe_crc_new(data->drm_fd, data->pipe,
>   				    INTEL_PIPE_CRC_SOURCE_AUTO);
>   
> -	igt_output_override_mode(data->output, &mode_lowres);
> +	igt_output_override_mode(data->output, mode_lowres);
>   	igt_plane_set_fb(primary, &data->ref_lowres.fb);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   	igt_pipe_crc_collect_crc(pipe_crc, &data->ref_lowres.crc);
>   
> -	igt_output_override_mode(data->output, NULL);
> +	igt_output_override_mode(data->output, mode);
>   	igt_plane_set_fb(primary, &data->ref_hires.fb);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   	igt_pipe_crc_collect_crc(pipe_crc, &data->ref_hires.crc);
> @@ -221,13 +220,13 @@ test_planes_on_pipe_with_output(data_t *data, igt_plane_t *plane, uint64_t modif
>   	igt_pipe_crc_collect_crc(pipe_crc, &crc_hires1);
>   
>   	/* switch to lower resolution */
> -	igt_output_override_mode(data->output, &mode_lowres);
> +	igt_output_override_mode(data->output, mode_lowres);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, &crc_lowres);
>   
>   	/* switch back to higher resolution */
> -	igt_output_override_mode(data->output, NULL);
> +	igt_output_override_mode(data->output, mode);
>   	igt_display_commit2(&data->display, COMMIT_ATOMIC);
>   
>   	igt_pipe_crc_collect_crc(pipe_crc, &crc_hires2);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
