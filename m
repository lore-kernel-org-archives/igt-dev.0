Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 948446E897
 for <igt-dev@lists.freedesktop.org>; Thu,  8 Jul 2021 09:26:04 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Thu, 8 Jul 2021 09:26:01 +0000
Message-ID: <BY5PR11MB43723ECAACA4FB2BAE17C09489199@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1625585312-8797-1-git-send-email-vidya.srinivas@intel.com>
 <20210707162245.12672-1-vidya.srinivas@intel.com>
 <CO6PR11MB556989721A46C474E32019568D199@CO6PR11MB5569.namprd11.prod.outlook.com>
In-Reply-To: <CO6PR11MB556989721A46C474E32019568D199@CO6PR11MB5569.namprd11.prod.outlook.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc
 in coverage-vs-premult-vs-none for 6bpc panels
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
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Bhanu,

Thank you so much.
I have added a check for eDP only.

As you said, only one pipe at a time which belongs to eDP needs to be enabled. And that is happening.
I have tested with only eDP connected and eDP + DP connected.

Regards
Vidya

-----Original Message-----
From: Modem, Bhanuprakash <bhanuprakash.modem@intel.com> 
Sent: Thursday, July 8, 2021 2:45 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
Subject: RE: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc in coverage-vs-premult-vs-none for 6bpc panels

> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of 
> Vidya Srinivas
> Sent: Wednesday, July 7, 2021 9:53 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Skip crc 
> in coverage-vs-premult-vs-none for 6bpc panels
> 
> Intel Gen11 6bpc panels are giving CRC mismatch in 
> coverage-vs-premult-vs-none 6bpc panel has dithering ON and CRC test 
> with dithering ON might result in mismatch. Hence, skipping CRC assertion for 6bpc panels.
> 
> Credits-to: Uma Shankar <uma.shankar@intel.com>
> Credits-to: Juha-pekka Heikkila <juha-pekka.heikkila@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 39 
> +++++++++++++++++++++++++++++++++--
>  1 file changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c 
> b/tests/kms_plane_alpha_blend.c index a37cb27c7d62..536d96546608 
> 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -25,6 +25,7 @@
>   */
> 
>  #include "igt.h"
> +#include <string.h>

No need to include string.h

> 
>  IGT_TEST_DESCRIPTION("Test plane alpha and blending mode 
> properties");
> 
> @@ -442,10 +443,41 @@ static void coverage_7efc(data_t *data, enum 
> pipe pipe, igt_plane_t *plane)
>  	igt_pipe_crc_stop(data->pipe_crc);
>  }
> 
> +static bool is_6bpc(igt_display_t *display, enum pipe pipe) {
> +	char buf[4096];
> +	char *str;
> +	bool ret;
> +	int debugfs_fd;
> +	igt_output_t *output = igt_get_single_output_for_pipe(display, 
> +pipe);
> +
> +	if (!is_i915_device(display->drm_fd))
> +		return false;
> +
> +	drmModeConnector *c = output->config.connector;

This will throw the warning Mixed declarations
 
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

I think, this approach won't work for all pipes except pipe-A, i915_display_info looks like below:

[CRTC:80:pipe A]:
	pipe src size=1920x1080, dither=no, bpp=18 [CRTC:131:pipe B]:
	pipe src size=1920x1080, dither=no, bpp=24 [CRTC:182:pipe C]:
	pipe src size=1920x1080, dither=no, bpp=30 [CRTC:233:pipe D]:

We might end-up by reading the pipe-A bpp everytime, even though we are running test on pipe-B.

And yeah, bpp won't present if pipe is not enabled. I would suggest to run the test in interactive mode & check the i915_display_info to make sure at an instance only one pipe is enabled (means only one bpp available in entire debugfs), otherwise we need to modify the logic to read the bpp of particular pipe.

./kms_plane_alpha_blend --r coverage-vs-premult-vs-none --interactive

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
> igt_plane_t *plane)  {
>  	igt_display_t *display = &data->display;
>  	igt_crc_t ref_crc = {}, crc = {};
> +	bool is6bpc;

Unused variable,

> 
>  	/* Set a background color on the primary fb for testing */
>  	if (plane->type != DRM_PLANE_TYPE_PRIMARY)
> @@ -461,14 +493,17 @@ static void coverage_premult_constant(data_t *data, enum
> pipe pipe, igt_plane_t
>  	igt_plane_set_fb(plane, &data->argb_fb_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -	igt_assert_crc_equal(&ref_crc, &crc);
> +
> +	if (is_6bpc(display, pipe) == false)
> +		igt_assert_crc_equal(&ref_crc, &crc);
> 
>  	igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, "None");
>  	igt_plane_set_prop_value(plane, IGT_PLANE_ALPHA, 0x7e7e);
>  	igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
>  	igt_display_commit2(display, COMMIT_ATOMIC);
>  	igt_pipe_crc_get_current(display->drm_fd, data->pipe_crc, &crc);
> -	igt_assert_crc_equal(&ref_crc, &crc);
> +	if (is_6bpc(display, pipe) == false)
> +		igt_assert_crc_equal(&ref_crc, &crc);

Still, do we need to execute all above stuff? Instead, how about checking
at the beginning of this function & skip?

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
