Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8466E054
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Aug 2021 12:45:17 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id b13so10474600wrs.3
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Aug 2021 05:45:17 -0700 (PDT)
References: <20210730091706.5942-1-vidya.srinivas@intel.com>
 <20210730124436.25249-1-vidya.srinivas@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <549b45c8-323b-1256-a702-d324ecf93dcc@gmail.com>
Date: Mon, 2 Aug 2021 15:45:09 +0300
MIME-Version: 1.0
In-Reply-To: <20210730124436.25249-1-vidya.srinivas@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Fix hw stride/async
 subtests for 5.4 kernel
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Vidya Srinivas <vidya.srinivas@intel.com>, igt-dev@lists.freedesktop.org
Cc: charlton.Lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 30.7.2021 15.44, Vidya Srinivas wrote:
> On 5.4 kernel, hw stride and async flip tests are giving
> CRASH on JSL (Gen11) and FAIL on TGL (Gen12).
> Patch fixes the missing data.ibb creation
> before the test_scanout.
> 
> Patch also fixes a missing crc stop
> in max_hw_stride_async_flip_test.
> 
> As per kernel i9xx_plane_max_stride, if I915_FORMAT_MOD_X_TILED

You'd be better off looking into skl_plane_max_stride instead of 
i9xx_plane_max_stride. Admittedly as these tests now are upstream they 
should be blocked from trying to run on some gen4 or such devices.

> stride should be 16*1024 and for other modifiers 32*1024.
> So changing 32K to 16K set_max_hw_stride for Gen < 12.
> Changing Gen12 stride to 128K to avoid failures on 5.4 kernel.

You cannot change _hardware_ limits by just defining something else. If 
this test fails by using maximum hw allowed limits then there probably 
is some bug on kernel side which shows on 5.4 kernel.

/Juha-Pekka

> 
> Signed-off-by: Charlton Lin <charlton.Lin@intel.com>
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_big_fb.c | 25 +++++++++++++++++--------
>   1 file changed, 17 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index c6f374bdd073..23deeaacd575 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -563,6 +563,7 @@ max_hw_stride_async_flip_test(data_t *data)
>   			     i?"should":"shouldn't");
>   	}
>   	igt_reset_timeout();
> +	igt_pipe_crc_stop(data->pipe_crc);
Stopping is ok for clarity but just line below there anyway is freeing 
of crc which equally closed crc fd.

>   
>   	igt_pipe_crc_free(data->pipe_crc);
>   	igt_output_set_pipe(data->output, PIPE_NONE);
> @@ -754,16 +755,15 @@ test_addfb(data_t *data)
>   static void
>   set_max_hw_stride(data_t *data)
>   {
> -	if (intel_display_ver(data->devid) >= 13) {
> +	if (intel_display_ver(data->devid) >= 12) {

display ver 12 max hw stride is 32k, not 128k. Changing this will cause 
gtt remapping hence test will start to test completely different things.

>   		/*
>   		 * The stride in bytes must not exceed of the size
>   		 * of 128K bytes. For pixel formats of 64bpp will allow
>   		 * for a 16K pixel surface.
>   		 */
>   		data->hw_stride = 131072;
> -	} else {
> -		data->hw_stride = 32768;
> -	}
> +	} else
> +		data->hw_stride = 16384;

These are wrong numbers

>   }
>   
>   static data_t data = {};
> @@ -852,7 +852,6 @@ igt_main
>   			data.render_copy = igt_get_render_copyfunc(data.devid);
>   
>   		data.bops = buf_ops_create(data.drm_fd);
> -		data.ibb = intel_bb_create(data.drm_fd, 4096);
>   
>   		data.planeclearrgb[0] = 0.0;
>   		data.planeclearrgb[1] = 0.0;
> @@ -939,13 +938,19 @@ igt_main
>   
>   		for (int l = 0; l < ARRAY_SIZE(fliptab); l++) {
>   			for (int j = 0; j < ARRAY_SIZE(formats); j++) {
> +				int min;
>   				/*
>   				* try only those formats which can show full length.
> -				* Here 32K is used to have CI test results consistent
> -				* for all platforms, 32K is smallest number possbily
> +				* Here 16K is used to have CI test results consistent
> +				* for all platforms, 16K is smallest number possbily
>   				* coming to data.hw_stride from above set_max_hw_stride()
>   				*/
> -				if (32768 / (formats[j].bpp >> 3) > 8192)
> +				if (intel_display_ver(data.devid) >= 12)
> +					min = 32768;
> +				else
> +					min = 16384;
> +
> +				if (min / (formats[j].bpp >> 3) > 8192)
>   					continue;
>   
>   				data.format = formats[j].format;
> @@ -978,7 +983,9 @@ igt_main
>   						igt_require(data.format == DRM_FORMAT_C8 ||
>   							igt_fb_supported_format(data.format));
>   						igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
> +						data.ibb = intel_bb_create(data.drm_fd, 4096);
>   						test_scanout(&data);
> +						intel_bb_destroy(data.ibb);
>   					}
>   
>   					// async flip doesn't support linear fbs.
> @@ -994,7 +1001,9 @@ igt_main
>   							igt_require(igt_display_has_format_mod(&data.display, data.format, data.modifier));
>   							igt_require_f(data.async_flip_support, "Async Flip is not supported\n");
>   							data.max_hw_fb_width = min(data.hw_stride / (formats[j].bpp >> 3), data.max_fb_width);
> +							data.ibb = intel_bb_create(data.drm_fd, 4096);
>   							test_scanout(&data);
> +							intel_bb_destroy(data.ibb);
>   					}
>   					data.async_flip_test = false;
>   				}
> 
