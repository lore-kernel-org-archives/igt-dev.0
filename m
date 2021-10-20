Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 559D16E255
 for <igt-dev@lists.freedesktop.org>; Wed, 20 Oct 2021 12:03:31 +0000 (UTC)
Date: Wed, 20 Oct 2021 15:03:27 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YXAFjysN60Y69ISY@intel.com>
References: <20211020091238.28554-1-juhapekka.heikkila@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211020091238.28554-1-juhapekka.heikkila@gmail.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_plane_multiple: Use same
 modifier for reference crc as for test crc
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

On Wed, Oct 20, 2021 at 12:12:38PM +0300, Juha-Pekka Heikkila wrote:
> Create reference crc with same modifier as is used for testing. This
> will reduce non test related anomalies.
>=20
> Signed-off-by: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> ---
>  tests/kms_plane_multiple.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_plane_multiple.c b/tests/kms_plane_multiple.c
> index ece00097e..30e4bcc0d 100644
> --- a/tests/kms_plane_multiple.c
> +++ b/tests/kms_plane_multiple.c
> @@ -111,10 +111,13 @@ get_reference_crc(data_t *data, igt_output_t *outpu=
t, enum pipe pipe,
> =20
>  	igt_create_color_fb(data->drm_fd, mode->hdisplay, mode->vdisplay,
>  			    DRM_FORMAT_XRGB8888,
> -			    DRM_FORMAT_MOD_LINEAR,
> +			    modifier,
>  			    color->red, color->green, color->blue,
>  			    &data->fb[primary->index]);
> =20
> +	igt_skip_on(!igt_plane_has_format_mod(data->plane[primary->index],
> +		    DRM_FORMAT_XRGB8888, modifier));
> +

Maybe do that before the create_fb()?

Otherwise seems fine.
Reviewed-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>

>  	igt_plane_set_fb(data->plane[primary->index], &data->fb[primary->index]=
);
> =20
>  	ret =3D igt_display_try_commit2(&data->display, COMMIT_ATOMIC);
> --=20
> 2.28.0

--=20
Ville Syrj=E4l=E4
Intel
