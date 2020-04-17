Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81FB26E101
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 06:30:44 +0000 (UTC)
From: Jani Nikula <jani.nikula@linux.intel.com>
In-Reply-To: <20200407215146.5331-1-bob.j.paauwe@intel.com>
References: <20200407215146.5331-1-bob.j.paauwe@intel.com>
Date: Fri, 17 Apr 2020 09:30:39 +0300
Message-ID: <87sgh239ps.fsf@intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH-i-g-t] lib/color_encoding: Fix up support for
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
To: Bob Paauwe <bob.j.paauwe@intel.com>, igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, 07 Apr 2020, Bob Paauwe <bob.j.paauwe@intel.com> wrote:
> Add XYUV8888 to the list of DRM Formats to test.
>
> Also fix the byte order for the format.
>
> Signed-off-by: Bob Paauwe <bob.j.paauwe@intel.com>

Pushed, thanks.

BR,
Jani.

> ---
>  lib/igt_color_encoding.c | 1 +
>  lib/igt_fb.c             | 6 +++---
>  2 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/lib/igt_color_encoding.c b/lib/igt_color_encoding.c
> index 7de6d5ab..a7bd2b22 100644
> --- a/lib/igt_color_encoding.c
> +++ b/lib/igt_color_encoding.c
> @@ -160,6 +160,7 @@ static const struct color_encoding_format {
>  	{ DRM_FORMAT_XVYU2101010, 1023.f, 64.f, 940.f, 64.f, 512.f, 960.f },
>  	{ DRM_FORMAT_XVYU12_16161616, 65520.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
>  	{ DRM_FORMAT_XVYU16161616, 65535.f, 4096.f, 60160.f, 4096.f, 32768.f, 61440.f },
> +	{ DRM_FORMAT_XYUV8888, 255.f, 16.f, 235.f, 16.f, 128.f, 240.f },
>  };
>  
>  static const struct color_encoding_format *lookup_fourcc(uint32_t fourcc)
> diff --git a/lib/igt_fb.c b/lib/igt_fb.c
> index 0fb8db12..5ed586e7 100644
> --- a/lib/igt_fb.c
> +++ b/lib/igt_fb.c
> @@ -2721,9 +2721,9 @@ static void get_yuv_parameters(struct igt_fb *fb, struct yuv_parameters *params)
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

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
