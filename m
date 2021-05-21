Return-Path: <igt-dev-bounces@lists.freedesktop.org>
From: "Srinivas, Vidya" <vidya.srinivas@intel.com>
Date: Fri, 21 May 2021 14:22:33 +0000
Message-ID: <BY5PR11MB4372274545478F2FE1C1451A89299@BY5PR11MB4372.namprd11.prod.outlook.com>
References: <1621570131-23943-1-git-send-email-vidya.srinivas@intel.com>
 <f0926681-ea44-b2d2-fe8d-a443728d01c2@gmail.com>
In-Reply-To: <f0926681-ea44-b2d2-fe8d-a443728d01c2@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Wait for vblank
 before collecting CRC
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
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Cc: "Lin, Charlton" <charlton.lin@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

Hello Juha-Pekka

We are seeing the CRC failures on Jasperlake systems. Sometimes the test passes and sometimes it fails throwing CRC error.

Regards
Vidya

-----Original Message-----
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com> 
Sent: Friday, May 21, 2021 5:00 PM
To: Srinivas, Vidya <vidya.srinivas@intel.com>; intel-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org; igt-dev@lists.freedesktop.org
Cc: Lin, Charlton <charlton.lin@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Wait for vblank before collecting CRC

Hi Vidya,

on which machines this would help? I see there's many vblanks already being waited. There's igt_display_commit2 which probably will block and even if it didn't there's igt_pipe_crc_collect_crc(..) where crc calculation is started after flip and then get one crc before disabling crc counting again.

/Juha-Pekka

On 21.5.2021 7.08, Vidya Srinivas wrote:
> Without wait for vblank, CRC mismatch is seen between big and small 
> CRC on few systems
> 
> Change-Id: I3bec931aa901130997e693ac1cacf389e2a8100f
> Signed-off-by: Vidya Srinivas <vidya.srinivas@intel.com>
> ---
>   tests/kms_big_fb.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c index 
> b2027b6b9d1b..7d78ff829d41 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -254,6 +254,7 @@ static void unset_lut(data_t *data)
>   static bool test_plane(data_t *data)
>   {
>   	igt_plane_t *plane = data->plane;
> +	igt_display_t *display = &data->display;
>   	struct igt_fb *small_fb = &data->small_fb;
>   	struct igt_fb *big_fb = &data->big_fb;
>   	int w = data->big_fb_width - small_fb->width; @@ -337,16 +338,17 @@ 
> static bool test_plane(data_t *data)
>   		igt_display_commit2(&data->display, data->display.is_atomic ?
>   				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>   
> -
> +		igt_wait_for_vblank(data->drm_fd, 
> +display->pipes[data->pipe].crtc_offset);
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
> +		igt_wait_for_vblank(data->drm_fd, 
> +display->pipes[data->pipe].crtc_offset);
>   		igt_pipe_crc_collect_crc(data->pipe_crc, &big_crc);
>   
>   		igt_plane_set_fb(plane, NULL);
> 

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
