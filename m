Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 854806E3AE
 for <igt-dev@lists.freedesktop.org>; Tue,  5 Oct 2021 10:22:56 +0000 (UTC)
Message-ID: <3ac02b05-d50d-8f0b-e393-29c50d307305@intel.com>
Date: Tue, 5 Oct 2021 15:52:41 +0530
Content-Language: en-US
References: <20210916153515.21369-1-ville.syrjala@linux.intel.com>
 <20210916153515.21369-4-ville.syrjala@linux.intel.com>
From: Karthik B S <karthik.b.s@intel.com>
In-Reply-To: <20210916153515.21369-4-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 4/6] tests/kms_invalid_mode: Test
 various bogus timings
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Ville Syrjala <ville.syrjala@linux.intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 9/16/2021 9:05 PM, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
>
> Make sure the mode gets rejected when some part of the timings
> is bogus.
>
> v2: Add even more tests
>
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Karthik B S <karthik.b.s@intel.com>
> ---
>   tests/i915/kms_invalid_mode.c | 93 ++++++++++++++++++++++++++++++++++-
>   1 file changed, 92 insertions(+), 1 deletion(-)
>
> diff --git a/tests/i915/kms_invalid_mode.c b/tests/i915/kms_invalid_mode.c
> index a1899bd52214..6d56a378d141 100644
> --- a/tests/i915/kms_invalid_mode.c
> +++ b/tests/i915/kms_invalid_mode.c
> @@ -100,6 +100,69 @@ adjust_mode_clock_too_high(data_t *data, drmModeModeInfoPtr mode)
>   	return true;
>   }
>   
> +static bool
> +adjust_mode_zero_clock(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->clock = 0;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_zero_hdisplay(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->hdisplay = 0;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_zero_vdisplay(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->vdisplay = 0;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_hsync_start(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->hsync_start = mode->hdisplay - 1;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_vsync_start(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->vsync_start = mode->vdisplay - 1;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_hsync_end(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->hsync_end = mode->hsync_start - 1;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_vsync_end(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->vsync_end = mode->vsync_start - 1;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_htotal(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->htotal = mode->hsync_end - 1;
> +	return true;
> +}
> +
> +static bool
> +adjust_mode_bad_vtotal(data_t *data, drmModeModeInfoPtr mode)
> +{
> +	mode->vtotal = mode->vsync_end - 1;
> +	return true;
> +}
> +
>   static int
>   test_output(data_t *data)
>   {
> @@ -117,7 +180,8 @@ test_output(data_t *data)
>   		return 0;
>   
>   	igt_create_fb(data->drm_fd,
> -		      mode.hdisplay, mode.vdisplay,
> +		      max(mode.hdisplay, 64),
> +		      max(mode.vdisplay, 64),
>   		      DRM_FORMAT_XRGB8888,
>   		      DRM_FORMAT_MOD_NONE,
>   		      &fb);
> @@ -177,6 +241,33 @@ static const struct {
>   	{ .name = "clock-too-high",
>   	  .adjust_mode = adjust_mode_clock_too_high,
>   	},
> +	{ .name = "zero-clock",
> +	  .adjust_mode = adjust_mode_zero_clock,
> +	},
> +	{ .name = "zero-hdisplay",
> +	  .adjust_mode = adjust_mode_zero_hdisplay,
> +	},
> +	{ .name = "zero-vdisplay",
> +	  .adjust_mode = adjust_mode_zero_vdisplay,
> +	},
> +	{ .name = "bad-hsync-start",
> +	  .adjust_mode = adjust_mode_bad_hsync_start,
> +	},
> +	{ .name = "bad-vsync-start",
> +	  .adjust_mode = adjust_mode_bad_vsync_start,
> +	},
> +	{ .name = "bad-hsync-end",
> +	  .adjust_mode = adjust_mode_bad_hsync_end,
> +	},
> +	{ .name = "bad-vsync-end",
> +	  .adjust_mode = adjust_mode_bad_vsync_end,
> +	},
> +	{ .name = "bad-htotal",
> +	  .adjust_mode = adjust_mode_bad_htotal,
> +	},
> +	{ .name = "bad-vtotal",
> +	  .adjust_mode = adjust_mode_bad_vtotal,
> +	},
>   };
>   
>   static data_t data;

