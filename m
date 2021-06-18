Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 968E76E402
 for <igt-dev@lists.freedesktop.org>; Fri, 18 Jun 2021 08:19:43 +0000 (UTC)
From: "Kahola, Mika" <mika.kahola@intel.com>
Date: Fri, 18 Jun 2021 08:19:40 +0000
Message-ID: <608f458c5e4040b3833ac3247f2760e3@intel.com>
References: <20210615160022.31610-1-juhapekka.heikkila@gmail.com>
 <20210615160022.31610-3-juhapekka.heikkila@gmail.com>
In-Reply-To: <20210615160022.31610-3-juhapekka.heikkila@gmail.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 3/4] tests/kms_plane: fix rounding error
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Juha-
> Pekka Heikkila
> Sent: Tuesday, June 15, 2021 7:00 PM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t 3/4] tests/kms_plane: fix rounding error
> 
> On some screen sizes with legacy hw there was possible to get rounding
> error on source clamping test which would incorrectly fail clamping tests.
> 
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Looks solid.

Reviewed-by: Mika Kahola <mika.kahola@intel.com>

> ---
>  tests/kms_plane.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/kms_plane.c b/tests/kms_plane.c index
> ba419bbde..f22c045d8 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -473,12 +473,19 @@ static void draw_entire_color_array(data_t *data,
> cairo_t *cr, uint32_t format,
>  	const int color_amount = ARRAY_SIZE(colors_extended);
>  	const int x = format == DRM_FORMAT_XRGB8888 ? 0 : data->crop;
> 
> +	if (format != DRM_FORMAT_XRGB8888) {
> +		cairo_rectangle(cr, data->crop, data->crop,
> +				fb->width - data->crop * 2,
> +				fb->height - data->crop * 2);
> +	}
> +
> +
>  	for (int n = 0; n < color_amount; n++) {
>  		int y = (fb->height - x * 2) * n / color_amount + x;
> 
>  		igt_paint_color(cr, x, y,
>  				fb->width - x * 2,
> -				(fb->height - x * 2) / color_amount,
> +				(fb->height - x * 2) / color_amount + 1,
>  				colors_extended[n].red,
>  				colors_extended[n].green,
>  				colors_extended[n].blue);
> --
> 2.28.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
