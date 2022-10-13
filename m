Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A94D10E303
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 17:44:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id q9so5630076ejd.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 10:44:16 -0700 (PDT)
Message-ID: <57b85628-4f10-2df8-0c3d-b81166265b2a@gmail.com>
Date: Thu, 13 Oct 2022 20:44:08 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20221013155620.3640321-1-aurabindo.pillai@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221013155620.3640321-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v3] test/kms_plane_cursor: Honour max
 cursor size
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
List-ID: <igt-dev@lists.freedesktop.org>

On 13.10.2022 18.56, Aurabindo Pillai wrote:
> Skip the tests for cursor sizes that are not supported by the hardware
> 
> Changes in v2
> =============
> 
> * Remove the duplicate definitions for DRM cursor width capability
> * Check for both cursor width and height when verifying the test cursor size
> 
> Changes in v3
> =============
> 
> * Add variables to hold max cursor size to the global data_t struct
> * Remove stale comment from v1
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/kms_plane_cursor.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 43bcaaa4..96036213 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -30,6 +30,7 @@
>    * - DRM index indicates z-ordering, higher index = higher z-order
>    */
>   
> +
^^
stray newline

>   enum {
>   	TEST_PRIMARY = 0,
>   	TEST_OVERLAY = 1 << 0,
> @@ -64,6 +65,8 @@ typedef struct data {
>   	enum pipe pipe_id;
>   	int drm_fd;
>   	rect_t or;
> +	uint64_t max_curw;
> +	uint64_t max_curh;
>   } data_t;
>   
>   /* Common test setup. */
> @@ -222,6 +225,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>   	int sw, sh;
>   	int pad = 128;
>   
> +	igt_skip_on((size > data->max_curw) || (size > data->max_curh));
you could also remove unnecessary brackets.

> +
>   	sw = data->mode->hdisplay;
>   	sh = data->mode->vdisplay;
>   
> @@ -270,8 +275,15 @@ igt_main
>   	};
>   
>   	igt_fixture {
> +		int ret;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &data.max_curw);
> +		igt_assert(ret == 0 || errno == EINVAL);
> +		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &data.max_curh);
> +		igt_assert(ret == 0 || errno == EINVAL);
> +

You'll still need to initialize those max_curw, max_curh to 64 like you 
were doing in previous version of your patch, now need something like 
this when setting up data

        data_t data = { .max_curw = 64, .max_curh = 64 };

otherwise maximum cursor width/height will be zero if get EINVAL when 
this is ran on driver where these cursor drm capabilities are not defined.

/Juha-Pekka

>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
