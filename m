Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3237D6E225
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 13:18:20 +0000 (UTC)
Date: Fri, 17 Apr 2020 16:18:16 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200417131816.GN6112@intel.com>
References: <20200417101855.7759-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417101855.7759-1-juhapekka.heikkila@gmail.com>
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

On Fri, Apr 17, 2020 at 01:18:54PM +0300, Juha-Pekka Heikkila wrote:
> In mid test starting to use higher bpp pixel format (say 64bpp)
> can cause modeset. Allow that modeset to happen.
> =

> v2 Ville Syrj=E4l=E4: use DRM_MODE_ATOMIC_ALLOW_MODESET instead
> of blocking.
> =

> Fixes: https://gitlab.freedesktop.org/drm/intel/issues/1214
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  tests/kms_plane.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/tests/kms_plane.c b/tests/kms_plane.c
> index 805795cd..c6ead813 100644
> --- a/tests/kms_plane.c
> +++ b/tests/kms_plane.c
> @@ -574,6 +574,7 @@ static void capture_format_crcs(data_t *data, enum pi=
pe pipe,
>  			 * awaits to be latched.
>  			 */
>  			igt_display_commit_atomic(&data->display,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET |
>  						  DRM_MODE_ATOMIC_NONBLOCK |
>  						  DRM_MODE_PAGE_FLIP_EVENT, NULL);
>  		} else {
> -- =

> 2.26.0
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
