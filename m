Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CD76EBDB
 for <igt-dev@lists.freedesktop.org>; Fri, 17 Apr 2020 13:17:19 +0000 (UTC)
Date: Fri, 17 Apr 2020 16:17:13 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200417131713.GM6112@intel.com>
References: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200417092424.4392-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_big_fb: Allow modeset to
 surivive change of cdclk
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

On Fri, Apr 17, 2020 at 12:24:24PM +0300, Juha-Pekka Heikkila wrote:
> When testing 64bpp formats there will come modeset to change cdclk.
> Allow modesets on atomic commits so commits will not produce error.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_big_fb.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> =

> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index eb144da9..8ea7b5d1 100644
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
> @@ -318,8 +319,11 @@ static bool test_plane(data_t *data)
>  		copy_pattern(data, small_fb, 0, 0, big_fb, x, y,
>  			     small_fb->width, small_fb->height);
>  =

> -		igt_display_commit2(&data->display, data->display.is_atomic ?
> -				    COMMIT_ATOMIC : COMMIT_UNIVERSAL);
> +		if (data->display.is_atomic) {
> +			igt_display_commit_atomic(&data->display, DRM_MODE_ATOMIC_ALLOW_MODES=
ET, NULL);

As I said, igt_display_commit2() already passes in
DRM_MODE_ATOMIC_ALLOW_MODESET so this should not be necessary.

> +		} else {
> +			igt_display_commit2(&data->display, COMMIT_UNIVERSAL);
> +		}
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
