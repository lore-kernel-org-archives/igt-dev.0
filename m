Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8E3889EF7
 for <igt-dev@lists.freedesktop.org>; Mon, 27 Jan 2020 15:30:18 +0000 (UTC)
From: "Shankar, Uma" <uma.shankar@intel.com>
Date: Mon, 27 Jan 2020 15:29:12 +0000
Message-ID: <E7C9878FBA1C6D42A1CA3F62AEB6945F823A4DFC@BGSMSX104.gar.corp.intel.com>
References: <20200109183338.17164-1-bob.j.paauwe@intel.com>
In-Reply-To: <20200109183338.17164-1-bob.j.paauwe@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] lib/color_encoding: Fix up support for
 XYUV format.
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
To: "Paauwe, Bob J" <bob.j.paauwe@intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Bob Paauwe
> Sent: Friday, January 10, 2020 12:04 AM
> To: igt-dev@lists.freedesktop.org
> Subject: [igt-dev] [PATCH i-g-t] lib/color_encoding: Fix up support for XYUV format.

We can drop the "." in the commit header.

The patch looks good.
Reviewed-by: Uma Shankar <uma.shankar@intel.com>

> 
> Add XYUV8888 to the list of DRM Formats to test.
> 
> Also fix the byte order for the format.
> 
> Signed-off-by: Bob Paauwe <bob.j.paauwe@intel.com>
> ---
>  lib/igt_color_encoding.c | 1 +
>  lib/igt_fb.c             | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c index
> 7de6d5ab..a7bd2b22 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -160,6 +160,7 @@ static const struct color_encoding_format {
>  	{ DRM_FORMAT_XVYU2101010, 1023.f, 64.f, 940.f, 64.f, 512.f, 960.f },
>  	{ DRM_FORMAT_XVYU12_16161616, 65520.f, 4096.f, 60160.f, 4096.f,
> 32768.f, 61440.f },
>  	{ DRM_FORMAT_XVYU16161616, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f,
> 61440.f },
> +	{ DRM_FORMAT_XYUV8888, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  };
> 
>  static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc) diff --git
> a/lib/igt_fb.c b/lib/igt_fb.c index c81b9de8..7409e6b3 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2634,9 +2634,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct
> yuv_parameters *params)
>  		break;
> 
>  	case DRM_FORMAT_XYUV8888:
> -		params->y_offset = fb->offsets[0] + 1;
> -		params->u_offset = fb->offsets[0] + 2;
> -		params->v_offset = fb->offsets[0] + 3;
> +		params->y_offset = fb->offsets[0] + 2;
> +		params->u_offset = fb->offsets[0] + 1;
> +		params->v_offset = fb->offsets[0] + 0;
>  		break;
>  	}
>  }
> --
> 2.21.0
> 
> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
