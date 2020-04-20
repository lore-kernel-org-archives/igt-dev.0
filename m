Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE3F6E82C
 for <igt-dev@lists.freedesktop.org>; Mon, 20 Apr 2020 17:17:36 +0000 (UTC)
Date: Mon, 20 Apr 2020 20:17:32 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <20200420171732.GY6112@intel.com>
References: <20200420064656.6787-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200420064656.6787-1-juhapekka.heikkila@gmail.com>
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

On Mon, Apr 20, 2020 at 09:46:56AM +0300, Juha-Pekka Heikkila wrote:
> When testing 64bpp formats there will come modeset to change cdclk.
> Allow modesets on atomic commits so commits will not produce error.
> =

> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>

Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

> ---
>  tests/kms_big_fb.c | 1 +
>  1 file changed, 1 insertion(+)
> =

> diff --git a/tests/kms_big_fb.c b/tests/kms_big_fb.c
> index eb144da9..a754b299 100644
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
