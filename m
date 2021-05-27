Return-Path: <igt-dev-bounces@lists.freedesktop.org>
References: <1621570131-23943-1-git-send-email-vidya.srinivas@intel.com>
 <20210527143128.25366-1-vidya.srinivas@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <2960bd68-52c5-9129-5acb-4473007b84a6@gmail.com>
Date: Thu, 27 May 2021 18:09:53 +0300
MIME-Version: 1.0
In-Reply-To: <20210527143128.25366-1-vidya.srinivas@intel.com>
Content-Language: en-US
Subject: Re: [igt-dev] [PATCH 4/4] [RFC] tests/kms_big_fb: Wait for vblank
 before collecting CRC
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
To: Vidya Srinivas <vidya.srinivas@intel.com>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org
Cc: charlton.lin@intel.com
List-ID: <igt-dev@lists.freedesktop.org>

On 27.5.2021 17.31, Vidya Srinivas wrote:
> Without wait for vblank, CRC mismatch is seen
> between big and small CRC on some intel Gen11 platforms.
> 
> Change-Id: I3bec931aa901130997e693ac1cacf389e2a8100f
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_big_fb.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index b2027b6b9d1b..da682593429b 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)
>   static bool test_plane(data_t *data)
>   {
>   	igt_plane_t *plane = data->plane;
> +	igt_display_t *display = &data->display;
>   	struct igt_fb *small_fb = &data->small_fb;
>   	struct igt_fb *big_fb = &data->big_fb;
>   	int w = data->big_fb_width - small_fb->width;
> @@ -269,6 +270,7 @@ static bool test_plane(data_t *data)
>   		{ w / 3, h * 3 / 4, },
>   		{ w, h, },
>   	};
> +	bool check_platform_intel = is_i915_device(data->drm_fd);

You will not need to do this. This test start with

drm_open_driver_master(DRIVER_INTEL)

hence will always be only on intel device.

>   
>   	if (!igt_plane_has_format_mod(plane, data->format, data->modifier))
>   		return false;
> @@ -336,17 +338,19 @@ static bool test_plane(data_t *data)
>   
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> -
> +		if (check_platform_intel)
> +			igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);

Above this line there's flip to different framebuffer and below this 
line there's restart of crc collection before get any crc. If there's 
need to wait a vblank at this place to get matching crcs the actual bug 
is somewhere else.

>   		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
>   
>   		igt_plane_set_fb(plane, big_fb);
>   		igt_fb_set_position(big_fb, plane, x, y);
>   		igt_fb_set_size(big_fb, plane, small_fb->width, small_fb->height);
> +
>   		igt_plane_set_size(plane, data->width, data->height);
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> -
> +		if (check_platform_intel)
> +			igt_wait_for_vblank(data->drm_fd, display->pipes[data->pipe].crtc_offset);

Here it's the same story as above.

>   		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>   
>   		igt_plane_set_fb(plane, NULL);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
