Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 543FC10E5CA
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 07:17:12 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id bj12so4876780ejb.13
 for <igt-dev@lists.freedesktop.org>; Fri, 21 Oct 2022 00:17:12 -0700 (PDT)
Message-ID: <6c2a3faf-6c06-4eea-8ae7-a4b98654d0c6@gmail.com>
Date: Fri, 21 Oct 2022 10:17:03 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Aurabindo Pillai <aurabindo.pillai@amd.com>, igt-dev@lists.freedesktop.org
References: <20221020210859.446086-1-aurabindo.pillai@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20221020210859.446086-1-aurabindo.pillai@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_cursor: Wait for an
 extra vblank on AMD hw
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 21.10.2022 0.08, Aurabindo Pillai wrote:
> On AMD hardware, atomic cursor updates are not synchronized with the
> same frame in the atomic code path, resulting in cursor programming
> getting deferred to the next frame. Add a device specific quirk to
> account for this delay.
> 
> Signed-off-by: Aurabindo Pillai <aurabindo.pillai@amd.com>
> ---
>   tests/kms_plane_cursor.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/tests/kms_plane_cursor.c b/tests/kms_plane_cursor.c
> index e9abfd78..5af390e0 100644
> --- a/tests/kms_plane_cursor.c
> +++ b/tests/kms_plane_cursor.c
> @@ -169,6 +169,11 @@ static void test_cursor_pos(data_t *data, int x, int y, unsigned int flags)
>   	igt_plane_set_position(data->cursor, x, y);
>   	igt_display_commit_atomic(&data->display, 0, NULL);
>   
> +	/* Wait for one more vblank since cursor updates are not
> +	 * synchronized to the same frame on AMD hw */
> +	if(is_amdgpu_device(data->drm_fd))
> +		igt_wait_for_vblank_count(data->drm_fd, data->display.pipes[data->pipe_id].crtc_offset, 1);
> +
>   	igt_pipe_crc_get_current(data->drm_fd, data->pipe_crc, &test_crc);
>   	igt_pipe_crc_stop(data->pipe_crc);
>   
