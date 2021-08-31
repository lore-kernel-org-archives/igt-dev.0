Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1860F898BF
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 17:48:28 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id n27so532914eja.5
 for <igt-dev@lists.freedesktop.org>; Tue, 31 Aug 2021 10:48:28 -0700 (PDT)
References: <20210827145756.3342904-1-imre.deak@intel.com>
 <20210827145756.3342904-3-imre.deak@intel.com>
From: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Message-ID: <368fc246-9373-4c9f-8c74-f652843b4af9@gmail.com>
Date: Tue, 31 Aug 2021 20:48:21 +0300
MIME-Version: 1.0
In-Reply-To: <20210827145756.3342904-3-imre.deak@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Subject: Re: [igt-dev] [PATCH i-g-t 2/6] tests/kms_ccs: Use test pattern
 when possible
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
To: Imre Deak <imre.deak@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On 27.8.2021 17.57, Imre Deak wrote:
> A CRC match against a test pattern reference image gives a better
> guarantee than against a solid filled image, so use a test pattern
> instead.
> 
> The sprite tests compare a single solid filled reference plane against
> two overlapped solid filled planes for some reason, so for these subtests
> and the fast clear subtest still keep the solid filled pattern.
> 
> Signed-off-by: Imre Deak <imre.deak@intel.com>
> ---
>   tests/kms_ccs.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> index f376f1c80..5bc50b4bb 100644
> --- a/tests/kms_ccs.c
> +++ b/tests/kms_ccs.c
> @@ -329,15 +329,21 @@ static void generate_fb(data_t *data, struct igt_fb *fb,
>   		srand(data->seed);
>   		fill_fb_random(data->drm_fd, fb);
>   	} else if (!(data->flags & TEST_BAD_PIXEL_FORMAT)) {
> +		bool do_fast_clear = is_ccs_cc_modifier(data->ccs_modifier);
> +		bool do_solid_fill = do_fast_clear || data->plane;

data->plane will be set when doing crc tests, why crc tests needed solid 
color?

>   		int c = !!data->plane;
>   
> -		if (is_ccs_cc_modifier(modifier)) {
> +		if (do_fast_clear && (fb_flags & FB_COMPRESSED)) {
>   			fast_clear_fb(data->drm_fd, fb, cc_color);
>   		} else {
>   			cr = igt_get_cairo_ctx(data->drm_fd, fb);
> -			igt_paint_color(cr, 0, 0, width, height,
> -					colors[c].r, colors[c].g, colors[c].b);
> -					igt_put_cairo_ctx(cr);
> +
> +			if (do_solid_fill)
> +				igt_paint_color(cr, 0, 0, width, height,
> +						colors[c].r, colors[c].g, colors[c].b);
> +			else
> +				igt_paint_test_pattern(cr, width, height);
> +			igt_put_cairo_ctx(cr);
>   		}
>   	}
>   
> 
