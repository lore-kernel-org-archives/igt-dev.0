Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340410E22C
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Oct 2023 08:01:34 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40651a726acso39463545e9.1
 for <igt-dev@lists.freedesktop.org>; Mon, 02 Oct 2023 01:01:34 -0700 (PDT)
Message-ID: <c554a0df-8b91-57bc-a955-b0b5a5b63de0@gmail.com>
Date: Mon, 2 Oct 2023 11:01:25 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Hersen Wu <hersenxs.wu@amd.com>, igt-dev@lists.freedesktop.org,
 rodrigo.siqueira@amd.com, aurabindo.pillai@amd.com, alex.hung@amd.com,
 hamza.mahfooz@amd.com, sunpeng.li@amd.com
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH 1/2] [i-g-t] tests/kms_cursor_crc: Fix tests
 be skipped on AMD gpu
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

Reviewed-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

On 1.10.2023 19.28, Hersen Wu wrote:
> Remove extra line when create cursor fb for AMD gpu.
> 
> AMD gpu does not support cursor buffer crop. AMD driver
> fails validation with fb size not equal to cursor size.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>   tests/kms_cursor_crc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 76c01f557..ba29ff65d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -560,14 +560,18 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>   {
>   	cairo_t *cr;
>   	uint32_t fb_id;
> +	int cur_h_extra_line = 1;
>   
> +	/* Cropping is not supported for cursor plane by AMD */
> +	if (is_amdgpu_device(data->drm_fd))
> +		cur_h_extra_line = 0;
>   	/*
>   	 * Make the FB slightly taller and leave the extra
>   	 * line opaque white, so that we can see that the
>   	 * hardware won't scan beyond what it should (esp.
>   	 * with non-square cursors).
>   	 */
> -	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
> +	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + cur_h_extra_line,
>   				    DRM_FORMAT_ARGB8888,
>   				    DRM_FORMAT_MOD_LINEAR,
>   				    1.0, 1.0, 1.0,
