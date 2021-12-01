Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 306D16ED1E
 for <igt-dev@lists.freedesktop.org>; Wed,  1 Dec 2021 15:36:11 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id u3so63974744lfl.2
 for <igt-dev@lists.freedesktop.org>; Wed, 01 Dec 2021 07:36:11 -0800 (PST)
MIME-Version: 1.0
References: <1638219625-19543-1-git-send-email-quic_abhinavk@quicinc.com>
In-Reply-To: <1638219625-19543-1-git-send-email-quic_abhinavk@quicinc.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Wed, 1 Dec 2021 10:35:58 -0500
Message-ID: <CAJUqKUoPaXFjuS-niZ0ZE1JHyNffAy-yQexDDXH1kpnGLuPAnA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [igt-dev] [PATCH i-g-t] lib/igt_fb: fix the plane_size array
 for yuv formats
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: petri.latvala@intel.com, quic_khsieh@quicinc.com, swboyd@chromium.org, igt-dev@lists.freedesktop.org, nganji@codeaurora.org, seanpaul@chromium.org, aravindh@codeaurora.org
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Nov 29, 2021 at 4:00 PM Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> clear_yuv_buffer() checks the size of the plane_size[] to
> make sure its greater than the number of planes to avoid
> overflows.
>
> The plane_size[] is fixed to two currently.
>
> However some of the formats like YV12 indeed have more than
> 2 planes in the format_desc[] hence this incorrectly failing
> this check.
>
> Increase the size of the plane_size[] to match the correct
> max number of planes.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  lib/igt_fb.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 92a0170..e42302d 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -1007,7 +1007,7 @@ static void memset64(uint64_t *s, uint64_t c, size_t n)
>  static void clear_yuv_buffer(struct igt_fb *fb)
>  {
>         bool full_range = fb->color_range == IGT_COLOR_YCBCR_FULL_RANGE;
> -       size_t plane_size[2];
> +       size_t plane_size[3];
I haven't looked closely at this code before but i took a look now and
2 things come to mind:

1. can we use lookup_drm_format(fb->drm_format)->num_planes for the
size of the plane_size array, this way it's expandable as needed (we
would need to add asserts to check for size at each switch-case.
2. Starting Line 1029, we clear up the memory up to 2 planes. if we
would use 3 planes, where are we using the 3rd one to clear up the
memory as well?

>         void *ptr;
>
>         igt_assert(igt_format_is_yuv(fb->drm_format));
> --
> 2.7.4
>
