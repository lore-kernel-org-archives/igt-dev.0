Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail.bootlin.com (mail.bootlin.com [62.4.15.54])
 by gabe.freedesktop.org (Postfix) with ESMTP id EE5876F763
 for <igt-dev@lists.freedesktop.org>; Fri, 11 Jan 2019 15:19:29 +0000 (UTC)
Date: Fri, 11 Jan 2019 16:19:28 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20190111151928.4tym2fgfk4osc4rb@flea>
References: <20190111090532.19235-1-paul.kocialkowski@bootlin.com>
 <20190111090532.19235-19-paul.kocialkowski@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20190111090532.19235-19-paul.kocialkowski@bootlin.com>
Subject: Re: [igt-dev] [PATCH i-g-t v3 18/21] lib/igt_frame: Add a
 checkerboard frame comparison method
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2067518697=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Cc: Petri Latvala <petri.latvala@intel.com>, Eben Upton <eben@raspberrypi.org>, igt-dev@lists.freedesktop.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============2067518697==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="itqrm7d2nm4humcz"
Content-Disposition: inline


--itqrm7d2nm4humcz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 10:05:29AM +0100, Paul Kocialkowski wrote:
> This introduces a new frame comparison method that was designed for
> patterns that follow a checkerboard style. These patterns are made of
> consecutive rectangular shapes with alternating solid colors. They are
> currently used for some Chamelium-based tests.
>=20
> The method is particularly adapted for cases where the edges of the
> shapes might be blurred (e.g. due to scaling), which makes it impossible
> to use pixel-perfect or CRC-based comparisons to decide whether the
> captured frame matches the reference.
>=20
> Overall, this test will first detect the edges of the pattern and later
> exclude them from comparison. Colors are compared between the reference
> and capture with a low threshold for error. A percentage of the faulty
> pixels is calculated and the captured frame is considered invalid if
> more than one percent of the pixels are erroneous.
>=20
> Signed-off-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
> ---
>  lib/igt_frame.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++++
>  lib/igt_frame.h |   2 +
>  2 files changed, 123 insertions(+)
>=20
> diff --git a/lib/igt_frame.c b/lib/igt_frame.c
> index 6984c02e9912..e0215660ea6e 100644
> --- a/lib/igt_frame.c
> +++ b/lib/igt_frame.c
> @@ -267,3 +267,124 @@ complete:
> =20
>  	return match;
>  }
> +
> +#define XR24_COLOR_VALUE(data, stride, x, y, c) \
> +	*((uint8_t *)(data) + (y) * (stride) + 4 * (x) + (c))
> +
> +/**
> + * igt_check_checkerboard_frame_match:
> + * @reference: The reference cairo surface
> + * @capture: The captured cairo surface
> + *
> + * Checks that the reference frame matches the captured frame using a
> + * method designed for checkerboard patterns. These patterns are made of
> + * consecutive rectangular shapes with alternating solid colors.
> + *
> + * The intent of this method is to cover cases where the captured result=
 is
> + * pixel-perfect due to features such as scaling or YUV conversion and

is *not* pixel perfect?

> + * subsampling. Such effects are mostly noticeable on the edges of the
> + * patterns, so they are detected and excluded from the comparison.
> + *
> + * Returns: a boolean indicating whether the frames match
> + */
> +bool igt_check_checkerboard_frame_match(cairo_surface_t *reference,
> +					cairo_surface_t *capture)
> +{
> +	unsigned int width, height, ref_stride, cap_stride;
> +	void *ref_data, *cap_data;
> +	unsigned char *edges_map;
> +	unsigned int x, y, c;
> +	unsigned int errors =3D 0, pixels =3D 0;
> +	unsigned int edge_threshold =3D 100;
> +	unsigned int color_error_threshold =3D 24;
> +	double error_rate_threshold =3D 0.01;
> +	double error_rate;
> +	unsigned int span =3D 2;
> +	bool match =3D false;
> +
> +	width =3D cairo_image_surface_get_width(reference);
> +	height =3D cairo_image_surface_get_height(reference);
> +
> +	ref_stride =3D cairo_image_surface_get_stride(reference);
> +	ref_data =3D cairo_image_surface_get_data(reference);
> +	igt_assert(ref_data);
> +
> +	cap_stride =3D cairo_image_surface_get_stride(capture);
> +	cap_data =3D cairo_image_surface_get_data(capture);
> +	igt_assert(cap_data);
> +
> +	edges_map =3D calloc(1, width * height);
> +
> +	/* First pass to detect the pattern edges. */
> +	for (y =3D 0; y < height; y++) {
> +		if (y < span || y > (height - span - 1))
> +			continue;
> +
> +		for (x =3D 0; x < width; x++) {
> +			unsigned int xdiff =3D 0, ydiff =3D 0;
> +
> +			if (x < span || x > (width - span - 1))
> +				continue;
> +
> +			for (c =3D 0; c < 3; c++) {
> +				xdiff +=3D abs(XR24_COLOR_VALUE(ref_data, ref_stride, x + span, y, c=
) -
> +					     XR24_COLOR_VALUE(ref_data, ref_stride, x - span, y, c));
> +				ydiff +=3D abs(XR24_COLOR_VALUE(ref_data, ref_stride, x, y + span, c=
) -
> +					     XR24_COLOR_VALUE(ref_data, ref_stride, x, y - span, c));
> +			}
> +
> +			edges_map[y * width + x] =3D (xdiff > edge_threshold ||
> +						    ydiff > edge_threshold);
> +		}
> +	}
> +
> +	/* Second pass to detect errors. */
> +	for (y =3D 0; y < height; y++) {
> +		for (x =3D 0; x < width; x++) {
> +			bool error =3D false;
> +
> +			if (edges_map[y * width + x])
> +				continue;
> +
> +			for (c =3D 0; c < 3; c++) {
> +				unsigned int diff;
> +
> +				/* Compare the reference and capture values. */
> +				diff =3D abs(XR24_COLOR_VALUE(ref_data, ref_stride, x, y, c) -
> +					   XR24_COLOR_VALUE(cap_data, cap_stride, x, y, c));
> +
> +				if (diff > color_error_threshold)
> +					error =3D true;
> +			}
> +
> +			/* Allow error if coming on or off an edge (on x). */
> +			if (error && x >=3D span && x <=3D (width - span - 1) &&
> +			    edges_map[y * width + (x - span)] !=3D
> +			    edges_map[y * width + (x + span)])
> +				continue;
> +
> +			/* Allow error if coming on or off an edge (on y). */
> +			if (error && y >=3D span && y <=3D (height - span - 1) &&
> +			    edges_map[(y - span) * width + x] !=3D
> +			    edges_map[(y + span) * width + x] && error)
> +				continue;
> +
> +			if (error)
> +				errors++;
> +
> +			pixels++;
> +		}
> +	}
> +
> +	free(edges_map);
> +
> +	error_rate =3D (double) errors / pixels;
> +
> +	if (error_rate < error_rate_threshold)
> +		match =3D true;
> +
> +	igt_debug("Checkerboard pattern %s with error rate %f %%\n",
> +		  match ? "matched" : "not matched", error_rate * 100);
> +
> +	return match;
> +}
> diff --git a/lib/igt_frame.h b/lib/igt_frame.h
> index 11f96cbea203..f44f57d7ce73 100644
> --- a/lib/igt_frame.h
> +++ b/lib/igt_frame.h
> @@ -38,5 +38,7 @@ void igt_write_compared_frames_to_png(cairo_surface_t *=
reference,
>  				      const char *capture_suffix);
>  bool igt_check_analog_frame_match(cairo_surface_t *reference,
>  				  cairo_surface_t *capture);
> +bool igt_check_checkerboard_frame_match(cairo_surface_t *reference,
> +					cairo_surface_t *capture);

Looks good otherwise. I guess it's missing some comments about the
algorithm being used though.

Maxmie

--=20
Maxime Ripard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

--itqrm7d2nm4humcz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXDi0AAAKCRDj7w1vZxhR
xWV4AP9uM3viNkdqrIn1W/AXPvvG8GrRJRv52yF9mcCHn+fSvAEAixV+jTj6evo+
lkRKTvIWO4f4nLZy7K2U8vFPkb08tgU=
=JpvA
-----END PGP SIGNATURE-----

--itqrm7d2nm4humcz--

--===============2067518697==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============2067518697==--
