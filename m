Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4773D89165
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Apr 2020 17:42:29 +0000 (UTC)
Date: Thu, 16 Apr 2020 20:42:25 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200416174225.GL6112@intel.com>
References: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200416172933.30533-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to
 survive change of cdclk
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

On Thu, Apr 16, 2020 at 08:29:33PM +0300, Juha-Pekka Heikkila wrote:
> When testing 64bpp formats there will come modeset to change cdclk.
> Allow modesets on commits so commits will not produce error.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_big_fb.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> =

> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index eb144da9..dabd16f3 100644
> --- a/tests/kms_big_fb.c
> +++ b/tests/kms_big_fb.c
> @@ -294,6 +294,7 @@ static bool test_plane(data_t *data)
>  		 */
>  		if (i =3D=3D 0 && data->display.is_atomic &&
>  		    igt_display_try_commit_atomic(&data->display,
> +						  DRM_MODE_ATOMIC_ALLOW_MODESET |
>  						  DRM_MODE_ATOMIC_TEST_ONLY,
>  						  NULL) !=3D 0) {
>  			if (igt_plane_has_prop(plane, IGT_PLANE_ROTATION))
> @@ -318,8 +319,8 @@ static bool test_plane(data_t *data)
>  		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
>  			     small_fb->width, small_fb->height);
>  =

> -		igt_display_commit2(&data->display, data->display.is_atomic ?
> -				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> +		igt_display_commit2(&data->display, DRM_MODE_ATOMIC_ALLOW_MODESET |

That's not how you use igt_display_commit2(). And it also
passes DRM_MODE_ATOMIC_ALLOW_MODESET to igt_atomic_commit().

> +				    data->display.is_atomic ? COMMIT_ATOMIC : COMMIT_UNIVERSAL);
>  =

>  =

>  		igt_pipe_crc_collect_crc(data->pipe_crc, &small_crc);
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
