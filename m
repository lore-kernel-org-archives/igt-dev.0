Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A1BB10E220
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 18:02:48 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id go34so43926288ejc.2
 for <igt-dev@lists.freedesktop.org>; Thu, 15 Sep 2022 11:02:48 -0700 (PDT)
Message-ID: <f3ffbe22-8054-e51b-5aef-c2d30bd4f767@gmail.com>
Date: Thu, 15 Sep 2022 21:02:37 +0300
MIME-Version: 1.0
To: Jessica Zhang <quic_jesszhan@quicinc.com>, igt-dev@lists.freedesktop.org
References: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
Content-Language: en-US
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20220914225800.3850-1-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t v1] tests/kms_cursor_crc: Wait extra
 vblank
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Reply-To: juhapekka.heikkila@gmail.com
Cc: robdclark@chromium.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Jessica,

On 15.9.2022 1.58, Jessica Zhang wrote:
> Wait an extra vblank for legacy cursor ioctl to finish.
> 
> Extra vblank wait is needed for both HW and SW test as the legacy cursor
> ioctl is called in both cases.
> 
> Based on Rob's patch [1] and, similarly, fixes flaky results on MSM.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> 
> [1] https://patchwork.freedesktop.org/series/105999/
> ---
>   tests/kms_cursor_crc.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 53f18f4f1add..272dcb7fa0a4 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -202,8 +202,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>   		igt_display_commit(display);
>   
>   		/* Extra vblank wait is because nonblocking cursor ioctl */
> -		igt_wait_for_vblank(data->drm_fd,
> -				display->pipes[data->pipe].crtc_offset);
> +		igt_wait_for_vblank_count(data->drm_fd,
> +				display->pipes[data->pipe].crtc_offset, 2);

It will take more than one frame on your target device for non blocking 
cursor commit to settle? This cannot be right, even if this somehow was 
the case you are breaking this test for everyone else.

>   
>   		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, hwcrc);
>   
> @@ -243,8 +243,8 @@ static void do_single_test(data_t *data, int x, int y, bool hw_test,
>   		igt_plane_set_fb(data->primary, &data->primary_fb[swbufidx]);
>   
>   		igt_display_commit(display);
> -		igt_wait_for_vblank(data->drm_fd,
> -				display->pipes[data->pipe].crtc_offset);
> +		igt_wait_for_vblank_count(data->drm_fd,
> +				display->pipes[data->pipe].crtc_offset, 2);

This change make even less sense to me than above. There's nothing 
cursor plane related on this part of test. You are saying flipping 
normal framebuffers on non cursor plane take also more than one frame on 
your target device? It sound like vblank counting is somehow broken on 
your target device if these changes together fix something.

/Juha-Pekka

>   
>   		igt_pipe_crc_get_current(data->drm_fd, pipe_crc, &crc);
>   		igt_assert_crc_equal(&crc, hwcrc);
