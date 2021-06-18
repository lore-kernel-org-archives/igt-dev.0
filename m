Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 173376E998
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 08:53:08 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id c5so9856781wrq.9
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 01:53:08 -0700 (PDT)
References: <1622547939-8157-1-git-send-email-vidya.srinivas@intel.com>
 <1623415451-776-1-git-send-email-vidya.srinivas@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <32c63e75-2a7c-69fa-c92f-5b54180a02ad@gmail.com>
Date: Fri, 18 Jun 2021 11:52:59 +0300
MIME-Version: 1.0
In-Reply-To: <1623415451-776-1-git-send-email-vidya.srinivas@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Fix alpha
 in coverage-vs-premult-vs-constant
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
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com, petri.latvala@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 11.6.2021 15.44, Vidya Srinivas wrote:
> Patch sets alpha to 0x7e for coverage, Pre-multiplied and constant as
> per the buffer being created initially in prepare_crtc. Patch also
> add commit after setting fb on primary plane. Without this change
> CRC mismatch is seen on few Gen11 systems.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_plane_alpha_blend.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a37cb27c7d62..d3a73cf43fcd 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -448,29 +448,34 @@ static void coverage_premult_constant(data_t *data, enum pipe pipe, igt_plane_t
>   	igt_crc_t ref_crc = {}, crc = {};
>   
>   	/* Set a background color on the primary fb for testing */
> -	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> +	if (plane->type != DRM_PLANE_TYPE_PRIMARY) {
>   		igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe], DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
> +		igt_display_commit2(display, COMMIT_ATOMIC);

Why this extra commit needed? There's just below commit before crc is 
started

> +	}
>   
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
> +	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e);

On this test there's already per pixel alpha, setting plane alpha values 
so low will probably in this case in final rounding make these planes 
completely invisible. I'd suspect you can get any image pass crc doing 
it like this. Likely what you see on screen with these values is just 
pure grey instead of intended test image.


>   	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_start(data->pipe_crc);
>   	igt_pipe_crc_get_single(data->pipe_crc, &ref_crc);
>   
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Pre-multiplied");
> +	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e);
>   	igt_plane_set_fb(plane, &data->argb_fb_7e);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&ref_crc, &crc);
>   
>   	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
> -	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
> +	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e);
>   	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>   	igt_display_commit2(display, COMMIT_ATOMIC);
>   	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
>   	igt_assert_crc_equal(&ref_crc, &crc);
>   
>   	igt_pipe_crc_stop(data->pipe_crc);
> +

stray new line

>   }
>   
>   static void run_test_on_pipe_planes(data_t *data, enum pipe pipe, bool blend,
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
