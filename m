Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F86E8C9
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 13:15:24 +0000 (UTC)
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Date: Thu, 8 Jul 2021 13:15:21 +0000
Message-ID: <CO6PR11MB55693637FC68922C7D10760B8D199@CO6PR11MB5569.namprd11.prod.outlook.com>
References: <20210708093057.31324-1-vidya.srinivas@intel.com>
 <20210708124548.19968-1-vidya.srinivas@intel.com>
In-Reply-To: <20210708124548.19968-1-vidya.srinivas@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip
 coverage-vs-premult-vs-none for 6bpc panels
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
To: "Srinivas, Vidya" <vidya.srinivas@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vidya
> Srinivas
> Sent: Thursday, July 8, 2021 6:16 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip coverage-
> vs-premult-vs-none for 6bpc panels
> 
> Intel platforms using 6bpc panels have dithering ON
> and show CRC mismatch in coverage-vs-premult-vs-none
> Doing a crc based test with dithering is not a great idea as pixels
> will change due to the 8bit to 6bits truncation with dithering.
> 
> This patch skips the subtest for 6bpc panels. Currently, there is no better
> way of fetching the bpc info other than EDID or display_info. Currently using
> i915_display_info for the same. Hence restricting the check to i915 devices
> only.
> 
> Credits-to: Uma Shankar <uma.shankar@intel.com>
> Credits-to: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Credits-to: Modem Bhanuprakash <Bhanuprakash.Modem@intel.com>
> Reviewed-by: Uma Shankar <uma.shankar@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 39 +++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c b/tests/kms_plane_alpha_blend.c
> index a37cb27c7d62..6560b37981b6 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -442,10 +442,42 @@ static void coverage_7efc(data_t *data, enum pipe pipe,
> igt_plane_t *plane)
>  	igt_pipe_crc_stop(data->pipe_crc);
>  }
> 
> +static bool is_6bpc(igt_display_t *display, enum pipe pipe) {
> +	char buf[4096];

Is this size enough? There is a lot of data available in i915_display_info
and consider the worst case pipe-D

> +	char *str;
> +	bool ret;
> +	int debugfs_fd;
> +	drmModeConnector *c;
> +	igt_output_t *output = igt_get_single_output_for_pipe(display, pipe);
> +
> +	if (!is_i915_device(display->drm_fd))
> +		return false;
> +
> +	c = output->config.connector;
> +	if (c->connector_type != DRM_MODE_CONNECTOR_eDP)
> +		return false;
> +
> +	debugfs_fd = igt_debugfs_dir(display->drm_fd);
> +	if (debugfs_fd < 0)
> +		return false;
> +
> +	igt_debugfs_simple_read(debugfs_fd, "i915_display_info", buf,
> sizeof(buf));
> +
> +	str = strstr(buf, "bpp=");
> +	if (str && (strncmp(str, "bpp=18", 6) == 0))
> +		ret = true;
> +	else
> +		ret = false;
> +
> +	close(debugfs_fd);
> +	return ret;
> +}
> +
>  static void coverage_premult_constant(data_t *data, enum pipe pipe,
> igt_plane_t *plane)
>  {
>  	igt_display_t *display = &data->display;
>  	igt_crc_t ref_crc = {}, crc = {};
> +	bool is6bpc = false;

This local variable is not required

> 
>  	/* Set a background color on the primary fb for testing */
>  	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> @@ -454,6 +486,11 @@ static void coverage_premult_constant(data_t *data, enum
> pipe pipe, igt_plane_t
>  	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "Coverage");
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
> +
> +	/* 6bpc panels have dithering ON and CRC might fail, hence skip test */
> +	is6bpc = is_6bpc(display, pipe);
> +	igt_require(is6bpc == false);
 
Local variable is not required, you can directly use as below:

igt_require_f(!is_6bpc(display, pipe), "<Some useful message on skip>\n");

> +
>  	igt_pipe_crc_start(data->pipe_crc);
>  	igt_pipe_crc_get_single(data->pipe_crc, &ref_crc);
> 
> @@ -461,14 +498,12 @@ static void coverage_premult_constant(data_t *data, enum
> pipe pipe, igt_plane_t
>  	igt_plane_set_fb(plane, &data->argb_fb_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -	igt_assert_crc_equal(&ref_crc, &crc);

Don't remove crc checks, these are needed for > 6-bpc panels.
For panels with 6-bpc, control will ever reach here.

> 
>  	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
>  	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -	igt_assert_crc_equal(&ref_crc, &crc);
 
Same here

> 
>  	igt_pipe_crc_stop(data->pipe_crc);
>  }
> --
> 2.32.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
