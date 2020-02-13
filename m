Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F53F6E328
 for <igt-dev@lists.freedesktop.org>; Thu, 13 Feb 2020 15:13:51 +0000 (UTC)
Date: Thu, 13 Feb 2020 17:13:47 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200213151347.GG13686@intel.com>
References: <20200213051845.31958-1-mohammed.khajapasha@intel.com>
 <20200213051845.31958-2-mohammed.khajapasha@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200213051845.31958-2-mohammed.khajapasha@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t 1/1] tests/kms_big_fb: Set plane
 position and framebuffer dimensions before commit
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Thu, Feb 13, 2020 at 10:48:45AM +0530, Mohammed Khajapasha wrote:
> Set the plane position and weight and height for small framebuffer
> before committing it in for loop.
> =

> Signed-off-by: Mohammed Khajapasha <mohammed.khajapasha@intel.com>
> ---
>  tests/kms_big_fb.c | 3 +++
>  1 file changed, 3 insertions(+)
> =

> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index eb144da9..6ba96a99 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -286,6 +286,7 @@ static bool test_plane(data_t *data)
>  		}
>  =

>  		igt_plane_set_fb(plane, small_fb);
> +		igt_plane_set_position(plane, 0, 0);
>  		igt_plane_set_size(plane, data->width, data->height);
>  =

>  		/*
> @@ -318,6 +319,8 @@ static bool test_plane(data_t *data)
>  		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
>  			     small_fb->width, small_fb->height);
>  =

> +		igt_fb_set_size(small_fb, plane, small_fb->width, small_fb->height);
> +

igt_plane_set_fb() already does these.

>  		igt_display_commit2(&data->display, data->display.is_atomic ?
>  				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>  =

> -- =

> 2.24.1
> =

> _______________________________________________
> igt-dev mailing list
> igt-dev@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/igt-dev

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev
