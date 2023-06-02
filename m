Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1C8510E673
 for <igt-dev@lists.freedesktop.org>; Fri,  2 Jun 2023 11:57:40 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-97458c97333so151916366b.2
 for <igt-dev@lists.freedesktop.org>; Fri, 02 Jun 2023 04:57:40 -0700 (PDT)
Message-ID: <68e7d406-78df-2a22-ca4b-f1c9149dfe6e@gmail.com>
Date: Fri, 2 Jun 2023 14:57:31 +0300
MIME-Version: 1.0
Content-Language: en-US
To: Swati Sharma <swati2.sharma@intel.com>, igt-dev@lists.freedesktop.org
References: <20230531074530.367036-1-swati2.sharma@intel.com>
 <20230531074530.367036-2-swati2.sharma@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
In-Reply-To: <20230531074530.367036-2-swati2.sharma@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] lib/igt_fb: round rgb->yuv
 conversion results
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

On 31.5.2023 10.45, Swati Sharma wrote:
> Round rgb->yuv conversion results.
> 
> Signed-off-by: Ville Syrjala <ville.syrjala@linux.intel.com>
> Signed-off-by: Swati Sharma <swati2.sharma@intel.com>
> ---
>   lib/igt_fb.c | 25 +++++++++++++++----------
>   1 file changed, 15 insertions(+), 10 deletions(-)
> 
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 71a199d4..11a5d6c0 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -3064,11 +3064,16 @@ static void igt_fb_destroy_cairo_shadow_buffer(struct igt_fb *shadow,
>   	munmap(ptr, shadow->size);
>   }
>   
> -static uint8_t clamprgb(float val)
> +static uint8_t clamp8(float val)
>   {
>   	return clamp((int)(val + 0.5f), 0, 255);
>   }
>   
> +static uint8_t clamp16(float val)
> +{
> +	return clamp((int)(val + 0.5f), 0, 65535);
> +}
> +
>   static void read_rgb(struct igt_vec4 *rgb, const uint8_t *rgb24)
>   {
>   	rgb->d[0] = rgb24[2];
> @@ -3079,9 +3084,9 @@ static void read_rgb(struct igt_vec4 *rgb, const uint8_t *rgb24)
>   
>   static void write_rgb(uint8_t *rgb24, const struct igt_vec4 *rgb)
>   {
> -	rgb24[2] = clamprgb(rgb->d[0]);
> -	rgb24[1] = clamprgb(rgb->d[1]);
> -	rgb24[0] = clamprgb(rgb->d[2]);
> +	rgb24[2] = clamp8(rgb->d[0]);
> +	rgb24[1] = clamp8(rgb->d[1]);
> +	rgb24[0] = clamp8(rgb->d[2]);
>   }
>   
>   struct fb_convert_buf {
> @@ -3401,7 +3406,7 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   
>   			rgb_tmp += bpp;
>   
> -			*y_tmp = yuv.d[0];
> +			*y_tmp = clamp8(yuv.d[0]);
>   			y_tmp += params.ay_inc;
>   
>   			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
> @@ -3431,8 +3436,8 @@ static void convert_rgb24_to_yuv(struct fb_convert *cvt)
>   			read_rgb(&pair_rgb, pair_rgb24);
>   			pair_yuv = igt_matrix_transform(&m, &pair_rgb);
>   
> -			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
> -			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
> +			*u_tmp = clamp8((yuv.d[1] + pair_yuv.d[1]) / 2.0f);
> +			*v_tmp = clamp8((yuv.d[2] + pair_yuv.d[2]) / 2.0f);
>   
>   			u_tmp += params.uv_inc;
>   			v_tmp += params.uv_inc;
> @@ -3590,7 +3595,7 @@ static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
>   
>   			rgb_tmp += fpp;
>   
> -			*y_tmp = yuv.d[0];
> +			*y_tmp = clamp16(yuv.d[0]);
>   			y_tmp += params.ay_inc;
>   
>   			if ((i % dst_fmt->vsub) || (j % dst_fmt->hsub))
> @@ -3620,8 +3625,8 @@ static void convert_float_to_yuv16(struct fb_convert *cvt, bool alpha)
>   			read_rgbf(&pair_rgb, pair_float);
>   			pair_yuv = igt_matrix_transform(&m, &pair_rgb);
>   
> -			*u_tmp = (yuv.d[1] + pair_yuv.d[1]) / 2.0f;
> -			*v_tmp = (yuv.d[2] + pair_yuv.d[2]) / 2.0f;
> +			*u_tmp = clamp16((yuv.d[1] + pair_yuv.d[1]) / 2.0f);
> +			*v_tmp = clamp16((yuv.d[2] + pair_yuv.d[2]) / 2.0f);
>   
>   			u_tmp += params.uv_inc;
>   			v_tmp += params.uv_inc;
