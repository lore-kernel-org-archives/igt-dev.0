Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45210E21F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Oct 2023 08:01:17 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4064876e8b8so61403345e9.0
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Oct 2023 01:01:17 -0700 (PDT)
Message-ID: <cd6896b0-287f-461f-5e93-cdbc69bf2ecd@gmail.com>
Date: Mon, 2 Oct 2023 11:01:07 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com,
 hamza.mahfooz@amd.com, sunpeng.li@amd.com
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
 <20231001162828.74566-2-hersenxs.wu@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231001162828.74566-2-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 2/2] [i-g-t] tests/kms_cursor_crc: Fix test
 intermittent failures on AMD gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Hersen,

On 1.10.2023 19.28, Hersen Wu wrote:
> Wait for two more vblanks before reading crc on AMD gpu.
> 
> Without waiting for two vblanks, AMD cursor updates may not
> synchronized to the same frame of pipe, crc generated may
> not be reliable.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/kms_cursor_crc.c | 24 +++++++++++++++++++++++-
>   1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index ba29ff65d..7450ded9d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -260,6 +260,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>   							      SUSPEND_TEST_NONE);
>   
>   			igt_pipe_crc_start(pipe_crc);
> +
> +			/* Wait for two more vblanks since cursor updates may not
> +			 * synchronized to the same frame on AMD HW
> +			 */
> +			if (is_amdgpu_device(data->drm_fd))
> +				igt_wait_for_vblank_count(data->drm_fd,
> +					display->pipes[data->pipe].crtc_offset,
> +					data->vblank_wait_count);
> +

Here was not done cursor modifications, test is just coming back from 
suspend or done dpms off/on. If this failed here it would mean there 
probably really was something to look into on driver side. From what 
your commit message says maybe you'll need to look few lines above where 
the crc is taken before suspend/dpms.

>   			igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc_after);
>   			igt_assert_crc_equal(hwcrc, &crc_after);
>   		}
> @@ -276,6 +285,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>   		restore_image(data, swbufidx, &((cursorarea){x, y, data->curw, data->curh}));
>   		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>   		igt_display_commit(display);
> +
> +		/* Wait for two more vblanks since cursor updates may not
> +		 * synchronized to the same frame on AMD HW
> +		 */
> +		if (is_amdgpu_device(data->drm_fd))
> +			igt_wait_for_vblank_count(data->drm_fd,
> +				display->pipes[data->pipe].crtc_offset,
> +				data->vblank_wait_count);
> +

Here is normal flip for getting sw generated reference crc, nothing 
about cursor here.

>   		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>   		igt_assert_crc_equal(&crc, hwcrc);
>   	}
> @@ -1079,7 +1097,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   
>   		igt_require_pipe_crc(data.drm_fd);
>   
> -		data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
> +		/* Wait for two more vblanks since cursor updates may not
> +		 * synchronized to the same frame on AMD HW
> +		 */
> +		data.vblank_wait_count =
> +			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;

Reflecting your commit message this change should be all that is needed.

>   	}
>   
>   	data.cursor_max_w = cursor_width;
