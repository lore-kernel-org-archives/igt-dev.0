Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BF6C10E270
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 15:37:39 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so1752355wmb.0
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 08:37:39 -0700 (PDT)
Message-ID: <bc063817-7541-4ff7-3ac4-085f57f34a2d@gmail.com>
Date: Thu, 13 Oct 2022 18:37:31 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20221012200133.3161321-1-aurabindo.pillai@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221012200133.3161321-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v2] test/kms_plane_cursor: Honour max
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

Hi Aurabindo,

On 12.10.2022 23.01, Aurabindo Pillai wrote:
> Skip the tests for cursor sizes that are not supported by the hardware
> 
> Changes in v2
> =============
> 
> * Remove the duplicate definitions for DRM cursor width capability
> * Check for both cursor width and height when verifying the test cursor size
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/kms_plane_cursor.c | 12 ++++++++++++
>   1 file changed, 12 insertions(+)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index 43bcaaa4..37fc026c 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -30,6 +30,8 @@
>    * - DRM index indicates z-ordering, higher index = higher z-order
>    */
>   
> +static uint64_t max_curw = 64, max_curh = 64;
I think these would look better as part of data_t structure since all 
other 'globals' are there.

> +
>   enum {
>   	TEST_PRIMARY = 0,
>   	TEST_OVERLAY = 1 << 0,
> @@ -222,6 +224,8 @@ static void test_cursor(data_t *data, int size, unsigned int flags)
>   	int sw, sh;
>   	int pad = 128;
>   
> +	igt_skip_on((size > max_curw) || (size > max_curh));
> +
>   	sw = data->mode->hdisplay;
>   	sh = data->mode->vdisplay;
>   
> @@ -270,8 +274,16 @@ igt_main
>   	};
>   
>   	igt_fixture {
> +		int ret;
> +
>   		data.drm_fd = drm_open_driver_master(DRIVER_ANY);
>   
> +		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_WIDTH, &max_curw);
> +		igt_assert(ret == 0 || errno == EINVAL);
> +		/* Not making use of cursor_height since it is same as width, still reading */
What does this comment mean? I see you using cursor height in 
test_cursor function.

/Juha-Pekka

> +		ret = drmGetCap(data.drm_fd, DRM_CAP_CURSOR_HEIGHT, &max_curh);
> +		igt_assert(ret == 0 || errno == EINVAL);
> +
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);
