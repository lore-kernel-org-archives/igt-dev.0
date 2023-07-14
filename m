Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D081410E7C8
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Jul 2023 06:43:50 +0000 (UTC)
Date: Fri, 14 Jul 2023 08:43:46 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20230714064346.etq5au6ooiz7cn6m@kamilkon-desk1>
References: <20230713220319.3315155-1-gustavo.sousa@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230713220319.3315155-1-gustavo.sousa@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_async_flips: Use define for
 number of framebuffers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Gustavo,
On 2023-07-13 at 19:03:19 -0300, Gustavo Sousa wrote:
> Remove hard-coded usage of "4" for the number of frame buffers to make
> the code safer for future changes. While using ARRAY_SIZE() is
> legitimate, prefer to use NUM_FBS for a shorter way of expressing the
> same thing.
> 
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>

Reviewed-by: Kamil Konieczny <kamil.konieczny@linux.intel.com>

> ---
>  tests/kms_async_flips.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/tests/kms_async_flips.c b/tests/kms_async_flips.c
> index 0a1199158b55..ebdc4c0b6fa4 100644
> --- a/tests/kms_async_flips.c
> +++ b/tests/kms_async_flips.c
> @@ -41,6 +41,7 @@
>  
>  #define RUN_TIME 2
>  #define MIN_FLIPS_PER_FRAME 5
> +#define NUM_FBS 4
>  
>  IGT_TEST_DESCRIPTION("Test asynchronous page flips.");
>  
> @@ -48,7 +49,7 @@ typedef struct {
>  	int drm_fd;
>  	uint32_t crtc_id;
>  	uint32_t refresh_rate;
> -	struct igt_fb bufs[4];
> +	struct igt_fb bufs[NUM_FBS];
>  	igt_display_t display;
>  	igt_output_t *output;
>  	unsigned long flip_timestamp_us;
> @@ -132,7 +133,7 @@ static void make_fb(data_t *data, struct igt_fb *fb,
>  	int rec_width;
>  	cairo_t *cr;
>  
> -	rec_width = width / (ARRAY_SIZE(data->bufs) * 2);
> +	rec_width = width / (NUM_FBS * 2);
>  
>  	igt_create_color_fb(data->drm_fd, width, height, DRM_FORMAT_XRGB8888,
>  			    data->modifier, 0.0, 0.0, 0.5, fb);
> @@ -183,11 +184,11 @@ static void test_init_fbs(data_t *data)
>  		prev_modifier = data->modifier;
>  
>  		if (data->bufs[0].fb_id) {
> -			for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> +			for (i = 0; i < NUM_FBS; i++)
>  				igt_remove_fb(data->drm_fd, &data->bufs[i]);
>  		}
>  
> -		for (i = 0; i < ARRAY_SIZE(data->bufs); i++)
> +		for (i = 0; i < NUM_FBS; i++)
>  			make_fb(data, &data->bufs[i], width, height, i);
>  	}
>  
> @@ -212,7 +213,7 @@ static void test_async_flip(data_t *data)
>  			flags &= ~DRM_MODE_PAGE_FLIP_ASYNC;
>  
>  			ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -					      data->bufs[frame % 4].fb_id,
> +					      data->bufs[frame % NUM_FBS].fb_id,
>  					      flags, data);
>  
>  			igt_assert(ret == 0);
> @@ -234,7 +235,7 @@ static void test_async_flip(data_t *data)
>  
>  				if (IS_GEN9(devid) || IS_GEN10(devid) || AT_LEAST_GEN(devid, 12)) {
>  					ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -							      data->bufs[frame % 4].fb_id,
> +							      data->bufs[frame % NUM_FBS].fb_id,
>  							      flags, data);
>  
>  					igt_assert(ret == 0);
> @@ -245,7 +246,7 @@ static void test_async_flip(data_t *data)
>  		}
>  
>  		ret = drmModePageFlip(data->drm_fd, data->crtc_id,
> -				      data->bufs[frame % 4].fb_id,
> +				      data->bufs[frame % NUM_FBS].fb_id,
>  				      flags, data);
>  		if (frame == 1 && data->allow_fail)
>  			igt_skip_on(ret == -EINVAL);
> @@ -670,7 +671,7 @@ igt_main
>  	}
>  
>  	igt_fixture {
> -		for (i = 0; i < ARRAY_SIZE(data.bufs); i++)
> +		for (i = 0; i < NUM_FBS; i++)
>  			igt_remove_fb(data.drm_fd, &data.bufs[i]);
>  
>  		igt_display_reset(&data.display);
> -- 
> 2.41.0
> 
