Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BE7D10E50D
 for <igt-dev@lists.freedesktop.org>; Thu, 12 Oct 2023 16:51:41 +0000 (UTC)
Date: Thu, 12 Oct 2023 18:51:21 +0200
From: Kamil Konieczny <kamil.konieczny@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Message-ID: <20231012165121.shruvfbmqixg3uin@kamilkon-desk.igk.intel.com>
References: <20231001162828.74566-1-hersenxs.wu@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20231001162828.74566-1-hersenxs.wu@amd.com>
Subject: Re: [igt-dev] [PATCH 1/2] [i-g-t] tests/kms_cursor_crc: Fix tests
 be skipped on AMD gpu
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Hersen Wu <hersenxs.wu@amd.com>, hamza.mahfooz@amd.com,
 markyacoub@google.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Hersen,

On 2023-10-01 at 12:28:27 -0400, Hersen Wu wrote:

please improve your patch description, instead of:

tests/kms_cursor_crc: Fix tests be skipped on AMD gpu

it is better to write why or what you fixed, for example:

tests/kms_cursor_crc: Fix cursor crop on AMD gpu

Please resend with this fix and added r-b from Juha-Pekka.

Also no need to retest your test on our CI, just reply to
igt mailing list that failures are not related to AMD gpu
(sometimes they could be when you change library function
or you touch common logic). After that our bug filing team
will mask and/or retest it.

I assume that you dropped 2/2 from this series?

Regards,
Kamil

> Remove extra line when create cursor fb for AMD gpu.
> 
> AMD gpu does not support cursor buffer crop. AMD driver
> fails validation with fb size not equal to cursor size.
> 
> Signed-off-by: Hersen Wu <hersenxs.wu@amd.com>
> ---
>  tests/kms_cursor_crc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_cursor_crc.c b/tests/kms_cursor_crc.c
> index 76c01f557..ba29ff65d 100644
> --- a/tests/kms_cursor_crc.c
> +++ b/tests/kms_cursor_crc.c
> @@ -560,14 +560,18 @@ static void create_cursor_fb(data_t *data, int cur_w, int cur_h)
>  {
>  	cairo_t *cr;
>  	uint32_t fb_id;
> +	int cur_h_extra_line = 1;
>  
> +	/* Cropping is not supported for cursor plane by AMD */
> +	if (is_amdgpu_device(data->drm_fd))
> +		cur_h_extra_line = 0;
>  	/*
>  	 * Make the FB slightly taller and leave the extra
>  	 * line opaque white, so that we can see that the
>  	 * hardware won't scan beyond what it should (esp.
>  	 * with non-square cursors).
>  	 */
> -	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + 1,
> +	fb_id = igt_create_color_fb(data->drm_fd, cur_w, cur_h + cur_h_extra_line,
>  				    DRM_FORMAT_ARGB8888,
>  				    DRM_FORMAT_MOD_LINEAR,
>  				    1.0, 1.0, 1.0,
> -- 
> 2.25.1
> 
