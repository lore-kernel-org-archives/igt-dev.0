Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0E38946E
 for <igt-dev@lists.freedesktop.org>; Tue,  6 Jul 2021 07:24:08 +0000 (UTC)
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Tue, 6 Jul 2021 07:23:58 +0000
Message-ID: <BY5PR11MB4372107D7A06EB5AE0A03790891B9@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1624898838-23193-1-git-send-email-vidya.srinivas@intel.com>
 <1625327579-28710-1-git-send-email-vidya.srinivas@intel.com>
 <BY5PR11MB43724083986443507595F916891C9@BY5PR11MB4372.namprd11.prod.outlook.com>
 <d5e9373203704351986527154155006c@intel.com>
In-Reply-To: <d5e9373203704351986527154155006c@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_alpha_blend: Dont
 commit primary for 6bpc display in coverage-vs-premult-vs-none
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
To: "Shankar, Uma" <uma.shankar@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>, "Heikkila,
 Juha-pekka" <juha-pekka.heikkila@intel.com>, "Latvala,
 Petri" <petri.latvala@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Thank you so much Uma. This was very helpful. I shall do the same.

Regards
Vidya

-----Original Message-----
From: Shankar, Uma <uma.shankar@intel.com> 
Sent: Tuesday, July 6, 2021 12:37 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; igt-dev@lists.freedesktop.org
Cc: Heikkila, Juha-pekka <juha-pekka.heikkila@intel.com>; markyacoub@chromium.org; Latvala, Petri <petri.latvala@intel.com>; Almahallawy, Khaled <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>
Subject: RE: [PATCH i-g-t] tests/kms_plane_alpha_blend: Dont commit primary for 6bpc display in coverage-vs-premult-vs-none



> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Monday, July 5, 2021 8:08 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Shankar, Uma <uma.shankar@intel.com>; Heikkila, Juha-pekka <juha- 
> pekka.heikkila@intel.com>; markyacoub@chromium.org; Latvala, Petri 
> <petri.latvala@intel.com>; Almahallawy, Khaled 
> <khaled.almahallawy@intel.com>; Lin, Charlton <charlton.lin@intel.com>
> Subject: RE: [PATCH i-g-t] tests/kms_plane_alpha_blend: Dont commit 
> primary for 6bpc display in coverage-vs-premult-vs-none
> 
> Hello,
> 
> We checked that the same test works on a different Jasperlake system 
> which has 8bpc. Our device has 6bpc panel and dithering is ON.
> Can we use this patch as solution? If any one has a 6bpc panel, can 
> you kindly let us know if its working for you? Thank you so much.
> 
> The same test works on HDMI connected to the system, just fails on the 
> eDP which is 6bpc.

Hi Vidya,
Doing a crc based test with dithering is not a great idea as pixels will change due to the 8bit to 6bits truncation with dithering. So let's have this test skip on 6bpc panels instead of relying on this empirical result.

Just have a test condition igt_require in the beginning (see reference usage of that in IGT).

Regards,
Uma Shankar

> https://patchwork.freedesktop.org/patch/442435/?series=90828&rev=8
> 
> Regards
> Vidya
> 
> -----Original Message-----
> From: Srinivas, Vidya <vidya.srinivas@intel.com>
> Sent: Saturday, July 3, 2021 9:23 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Srinivas, Vidya <vidya.srinivas@intel.com>
> Subject: [PATCH i-g-t] tests/kms_plane_alpha_blend: Dont commit 
> primary for 6bpc display in coverage-vs-premult-vs-none
> 
> Intel Gen11 6bpc panels are giving CRC mismatch in 
> coverage-vs-premult-vs-none if primary gray fb is commited before 
> starting alpha tests. Patch removes primar plane commit if device is intel and 6bpc.
> 
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>  tests/kms_plane_alpha_blend.c | 36 
> ++++++++++++++++++++++++++++++++++--
>  1 file changed, 34 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_plane_alpha_blend.c 
> b/tests/kms_plane_alpha_blend.c index a37cb27c7d62..5f0a8cb070dd 
> 100644
> --- a/tests/kms_plane_alpha_blend.c
> +++ b/tests/kms_plane_alpha_blend.c
> @@ -25,6 +25,7 @@
>   */
> 
>  #include "igt.h"
> +#include <string.h>
> 
>  IGT_TEST_DESCRIPTION("Test plane alpha and blending mode 
> properties");
> 
> @@ -442,14 +443,45 @@ static void coverage_7efc(data_t *data, enum 
> pipe pipe, igt_plane_t *plane)  igt_pipe_crc_stop(data->pipe_crc);
>  }
> 
> +static bool is_6bpc(igt_display_t *display) { char buf[4096]; char 
> +*str; bool ret; int debugfs_fd;
> +
> +if (!is_i915_device(display->drm_fd))
> +return false;
> +
> +debugfs_fd = igt_debugfs_dir(display->drm_fd);
> +
> +if (debugfs_fd < 0)
> +return false;
> +
> +igt_debugfs_simple_read(debugfs_fd, "i915_display_info", buf, 
> +sizeof(buf));
> +
> +str = strstr(buf, "bpp=");
> +if (strncmp(str, "bpp=18", 6) == 0)
> +ret = true;
> +else
> +ret = false;
> +
> +close(debugfs_fd);
> +return ret;
> +}
> +
>  static void coverage_premult_constant(data_t *data, enum pipe pipe, 
> igt_plane_t
> *plane)  {
>  igt_display_t *display = &data->display;  igt_crc_t ref_crc = {}, crc 
> = {};
> 
> +
>  /* Set a background color on the primary fb for testing */ -if 
> (plane->type != DRM_PLANE_TYPE_PRIMARY) 
> -igt_plane_set_fb(igt_pipe_get_plane_type(&display->pipes[pipe],
> DRM_PLANE_TYPE_PRIMARY), &data->gray_fb);
> +if (plane->type != DRM_PLANE_TYPE_PRIMARY) { if (!is_6bpc(display))
> +igt_plane_set_fb(igt_pipe_get_plane_type(&display-
> >pipes[pipe],
> +DRM_PLANE_TYPE_PRIMARY),
> &data->gray_fb);
> +}
> 
>  igt_plane_set_prop_enum(plane, IGT_PLANE_PIXEL_BLEND_MODE, 
> "Coverage");  igt_plane_set_fb(plane, &data->argb_fb_cov_7e);
> --
> 2.7.4
> 


_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
