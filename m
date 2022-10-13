Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2066.outbound.protection.outlook.com [40.107.94.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E9310E8FF
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Oct 2022 16:16:15 +0000 (UTC)
Message-ID: <50e5c6d7-18b5-ddde-04e8-6918a28863a8@amd.com>
Date: Thu, 13 Oct 2022 10:16:11 -0600
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20221013155620.3640321-1-aurabindo.pillai@amd.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <20221013155620.3640321-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v3] test/kms_plane_cursor: Honour max
 cursor size
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



On 2022-10-13 09:56, Aurabindo Pillai wrote:
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
>   		kmstest_set_vt_graphics_mode();
>   
>   		igt_display_require(&data.display, data.drm_fd);

Reviewed-by: Alex Hung <alex.hung@amd.com>
