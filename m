Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE8CA10E23C
 for <igt-dev@lists.freedesktop.org>; Tue,  3 Oct 2023 07:38:17 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-9b29186e20aso90962566b.2
 for <igt-dev@lists.freedesktop.org>; Tue, 03 Oct 2023 00:38:17 -0700 (PDT)
Message-ID: <ab37761a-f846-8185-1a9b-ce4a32f90bdf@gmail.com>
Date: Tue, 3 Oct 2023 10:38:07 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com,
 hamza.mahfooz@amd.com, sunpeng.li@amd.com
References: <20231002142023.713415-1-hersenxs.wu@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231002142023.713415-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH] [i-g-t] tests/kms_cursor_crc: Fix test
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

On 2.10.2023 17.20, Hersen Wu wrote:
> Wait for two more vblanks before reading crc on AMD gpu.
> 
> Without waiting for two vblanks, AMD cursor updates may not
> synchronized to the same frame of pipe, crc generated may
> not be reliable.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/kms_cursor_crc.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index ba29ff65d..e3259e147 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -276,6 +276,15 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
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

I did mention earlier this has nothing to do with cursor. Here cursor 
plane is not in use, here is just being generated reference crcs and the 
below igt_assert_crc_equal check against earlier hw cursor generated 
crcs. Ie. you are here adding extra wait for normal flip where there is 
no cursor changes, if this is problem then other flip tests should also 
fail.

>   		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>   		igt_assert_crc_equal(&crc, hwcrc);
>   	}
> @@ -1079,7 +1088,11 @@ igt_main_args("e", NULL, help_str, opt_handler, NULL)
>   
>   		igt_require_pipe_crc(data.drm_fd);
>   
> -		data.vblank_wait_count = is_msm_device(data.drm_fd) ? 2 : 1;
> +		/* Wait for two more vblanks since cursor updates may not
> +		 * synchronized to the same frame on AMD HW
> +		 */
> +		data.vblank_wait_count =
> +			(is_msm_device(data.drm_fd) || is_amdgpu_device(data.drm_fd)) ? 2 : 1;
>   	}
>   
>   	data.cursor_max_w = cursor_width;
