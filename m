Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07DBA6E10F
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Apr 2020 15:36:05 +0000 (UTC)
Date: Tue, 7 Apr 2020 18:36:02 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200407153602.GD6112@intel.com>
References: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200407110904.13008-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane: survive cdclk caused
 modeset
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
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Tue, Apr 07, 2020 at 02:09:04PM +0300, Juha-Pekka Heikkila wrote:
> This change will slow this test down a bit. In mid test starting
> to use higher bpp pixel format (say 64bpp) can cause modeset.
> Use blocking commit so there's wait for modeset to happen.

We already wait for the event the next time around. So this
doesn't make sense to me.

> =

> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1214
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 805795cd..2324fb6e 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -569,12 +569,10 @@ static void capture_format_crcs(data_t *data, enum =
pipe pipe,
>  =

>  		if (data->display.is_atomic) {
>  			/*
> -			 * Use non-blocking commits to allow the next fb
> -			 * to be prepared in parallel while the current fb
> -			 * awaits to be latched.
> +			 * Use blocking commit because there maybe
> +			 * modeset when going to higher bpp pixel format.
>  			 */
>  			igt_display_commit_atomic(&data->display,
> -						  DRM_MODE_ATOMIC_NONBLOCK |
>  						  DRM_MODE_PAGE_FLIP_EVENT, NULL);
>  		} else {
>  			/*
> -- =

> 2.17.1
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
