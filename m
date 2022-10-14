Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4292010E070
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 08:54:53 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id t4so2669752wmj.5
 for <igt-dev@lists.freedesktop.org>; Fri, 14 Oct 2022 01:54:53 -0700 (PDT)
Message-ID: <15a1f181-f6ab-4013-60c8-4ecfb3e673b8@gmail.com>
Date: Fri, 14 Oct 2022 11:54:47 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20221013181610.3703163-1-aurabindo.pillai@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221013181610.3703163-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v4] test/kms_plane_cursor: Honour max
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

look ok to me. That fail in ci doesn't relate to this patch.

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 13.10.2022 21.16, Aurabindo Pillai wrote:
> Skip the tests for cursor sizes that are not supported by the hardware
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> Reviewed-by: Alex Hung <alex.hung@amd.com>
> 
> --
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
> Changes in v4
> =============
> 
> * Initialize max cursor parameters with default values
> * Remove extra newline and unnecessary brackets
> ---
>   tests/kms_plane_cursor.c | 13 ++++++++++++-
>   1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 43bcaaa4..e9abfd78 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -64,6 +64,8 @@ typedef struct data {
>   	enum pipe pipe_id;
>   	int drm_fd;
>   	rect_t or;
> +	uint64_t max_curw;
> +	uint64_t max_curh;
>   } data_t;
>   
>   /* Common test setup. */
> @@ -222,6 +224,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>   	int sw, sh;
>   	int pad = 128;
>   
> +	igt_skip_on(size > data->max_curw || size > data->max_curh);
> +
>   	sw = data->mode->hdisplay;
>   	sh = data->mode->vdisplay;
>   
> @@ -251,7 +255,7 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>   igt_main
>   {
>   	static const int cursor_sizes[] = { 64, 128, 256 };
> -	data_t data = {};
> +	data_t data = { .max_curw = 64, .max_curh = 64 };
>   	enum pipe pipe;
>   	igt_output_t *output;
>   	int i, j;
> @@ -270,8 +274,15 @@ igt_main
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
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
