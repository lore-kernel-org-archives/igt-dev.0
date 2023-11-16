Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29CDF10E099
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Nov 2023 08:25:13 +0000 (UTC)
Message-ID: <f7139162-51d6-7829-1ffe-5deb9515e923@intel.com>
Date: Thu, 16 Nov 2023 13:54:46 +0530
Content-Language: en-US
To: Sean Paul <sean@poorly.run>, <igt-dev@lists.freedesktop.org>
References: <20231023205910.3556533-1-sean@poorly.run>
 <20231023205910.3556533-7-sean@poorly.run>
From: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
In-Reply-To: <20231023205910.3556533-7-sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 6/8] tests/kms_vrr: Add ability to flip
 static image for flicker profiling
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


On Tue-24-10-2023 02:26 am, Sean Paul wrote:
> From: Sean Paul <seanpaul@chromium.org>
> 
> Add a --static-image argument which will paint both framebuffers
> identically. This allows us to profile VRR flicker on the panel.
> 
> Cc: Mark Yacoub <markyacoub@chromium.org>
> Signed-off-by: Sean Paul <seanpaul@chromium.org>
> 
> Changes in v2:
> - Add short opt to the main callsite (Bhanu)
> ---
>   tests/kms_vrr.c | 53 ++++++++++++++++++++++++++++++-------------------
>   1 file changed, 33 insertions(+), 20 deletions(-)
> 
> diff --git a/tests/kms_vrr.c b/tests/kms_vrr.c
> index 34d75d648..57bd87ddf 100644
> --- a/tests/kms_vrr.c
> +++ b/tests/kms_vrr.c
> @@ -110,6 +110,7 @@ typedef struct data {
>   	range_t range;
>   	vtest_ns_t vtest_ns;
>   	uint64_t duration_ns;
> +	bool static_image;
>   } data_t;
>   
>   typedef void (*test_t)(data_t*, enum pipe, igt_output_t*, uint32_t);
> @@ -257,6 +258,7 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   	drmModeModeInfo mode;
>   	cairo_t *cr;
>   	int bar_width, bar_height, bar_remaining, horizontal_bar_height;
> +	int num_painted_fbs;
>   
>   	/* Reset output */
>   	igt_display_reset(&data->display);
> @@ -303,25 +305,31 @@ static void prepare_test(data_t *data, igt_output_t *output, enum pipe pipe)
>   	horizontal_bar_height = mode.vdisplay / 8;
>   	bar_height = mode.vdisplay - horizontal_bar_height * 2;
>   	bar_remaining = mode.hdisplay % bar_width;
> -	cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[0]);
> -	for (int j = 0; j < num_bars; ++j) {
> -		unsigned int width = bar_width;
> -		if (j == num_bars - 1)
> -			width += bar_remaining;
> -
> -		/* Red->Green->Blue gradient */
> -		if (j < num_bars / 2)
> -			paint_bar(cr, j * bar_width, 0, width, bar_height,
> -				  j, num_bars / 2,
> -				  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
> -		else
> -			paint_bar(cr, j * bar_width, 0, width, bar_height,
> -				  j - num_bars / 2, num_bars / 2,
> -				  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
> +	num_painted_fbs = data->static_image ? 2 : 1;
> +	for (int i = 0; i < num_painted_fbs; ++i) {
> +		cr = igt_get_cairo_ctx(data->drm_fd, &data->fb[i]);
> +		for (int j = 0; j < num_bars; ++j) {
> +			unsigned int width = bar_width;
> +			if (j == num_bars - 1)
> +				width += bar_remaining;
> +
> +			/* Red->Green->Blue gradient */
> +			if (j < num_bars / 2)
> +				paint_bar(cr, j * bar_width, 0, width,
> +					  bar_height,
> +					  j, num_bars / 2,
> +					  1.0, 0.0, 0.0, 0.0, 1.0, 0.0);
> +			else
> +				paint_bar(cr, j * bar_width, 0, width,
> +					  bar_height,
> +					  j - num_bars / 2, num_bars / 2,
> +					  0.0, 1.0, 0.0, 0.0, 0.0, 1.0);
> +		}
> +		igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
> +				mode.hdisplay, horizontal_bar_height,
> +				1.00, 1.00, 1.00);
> +		igt_put_cairo_ctx(cr);
>   	}
> -	igt_paint_color(cr, 0, mode.vdisplay - horizontal_bar_height,
> -			mode.hdisplay, horizontal_bar_height, 1.00, 1.00, 1.00);
> -	igt_put_cairo_ctx(cr);
>   
>   	/* Take care of any required modesetting before the test begins. */
>   	data->primary = igt_output_get_plane_type(output, DRM_PLANE_TYPE_PRIMARY);
> @@ -585,6 +593,9 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   	case 'r':
>   		data->vtest_ns.rate_ns = rate_from_refresh(atoi(optarg));
>   		break;
> +	case 's':
> +		data->static_image = true;
> +		break;
>   	}
>   	return IGT_OPT_HANDLER_SUCCESS;
>   }
> @@ -592,16 +603,18 @@ static int opt_handler(int opt, int opt_index, void *_data)
>   static const struct option long_opts[] = {
>   	{ .name = "duration", .has_arg = true, .val = 'd', },
>   	{ .name = "refresh-rate", .has_arg = true, .val = 'r', },
> +	{ .name = "static-image", .has_arg = false, .val = 's', },
>   	{}
>   };
>   
>   static const char help_str[] =
>   	"  --duration <duration-seconds>\t\tHow long to run the test for\n"
> -	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n";
> +	"  --refresh-rate <refresh-hz>\t\tThe refresh rate to flip at\n"
> +	"  --static-image\t\tFlip a static image for flicker profiling\n";
>   
>   static data_t data;
>   
> -igt_main_args("d:r:", long_opts, help_str, opt_handler, &data)
> +igt_main_args("d:r:s", long_opts, help_str, opt_handler, &data)
------------------^
Nit: s/"d:r:s"/"drs:"/

With this change, please add my
Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>

- Bhanu

>   {
>   	igt_fixture {
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
