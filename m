Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C06B310E2A5
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 12:55:20 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id bu29so13956726lfb.0
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 05:55:20 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:55:15 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20220429155515.3ea51998@eldfell>
In-Reply-To: <20220328145509.2331195-7-maxime@cerno.tech>
References: <20220328145509.2331195-1-maxime@cerno.tech>
 <20220328145509.2331195-7-maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/tIKM=KreY3E8Rr2.ek4zrEZ";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [PATCH i-g-t v2 6/8] tests/kms_writeback: Dump the
 frames if the don't match
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, Petri Latvala <petri.latvala@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/tIKM=KreY3E8Rr2.ek4zrEZ
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 28 Mar 2022 16:55:07 +0200
Maxime Ripard <maxime@cerno.tech> wrote:

> The writeback tests will make sure the reference and captured frames
> match. If they don't however, we don't get anything but their hash which
> isn't really helpful.
>=20
> Add a function similar to chamelium_assert_crc_eq_or_dump() to dump the
> PNG and raw buffers of those two frames if they don't match and frame
> dumping has been enabled.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Hi,

FWIW, in Weston we write out also the error visualization image with the
mismatching areas highlighted:
https://gitlab.freedesktop.org/wayland/weston/-/blob/69a59359fa8590074717e2=
11d332c1077d8f277f/tests/weston-test-client-helper.c#L1405-1433


Thanks,
pq

> ---
>  tests/kms_writeback.c | 36 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 35 insertions(+), 1 deletion(-)
>=20
> diff --git a/tests/kms_writeback.c b/tests/kms_writeback.c
> index faa790cc0f72..2366692865b7 100644
> --- a/tests/kms_writeback.c
> +++ b/tests/kms_writeback.c
> @@ -256,6 +256,39 @@ static void get_and_wait_out_fence(igt_output_t *out=
put)
>  	output->writeback_out_fence_fd =3D -1;
>  }
> =20
> +static void writeback_assert_crtc_eq_or_dump(igt_crc_t *reference_crc,
> +					     igt_fb_t *reference_fb,
> +					     igt_crc_t *capture_crc,
> +					     igt_fb_t *capture_fb)
> +{
> +	bool eq;
> +
> +	eq =3D igt_check_crc_equal(reference_crc, capture_crc);
> +	if (!eq) {
> +		cairo_surface_t *reference, *capture;
> +		char *reference_suffix, *capture_suffix;
> +
> +		reference =3D igt_get_cairo_surface(reference_fb->fd, reference_fb);
> +		igt_assert(reference);
> +
> +		capture =3D igt_get_cairo_surface(capture_fb->fd, capture_fb);
> +		igt_assert(capture);
> +
> +		reference_suffix =3D igt_crc_to_string_extended(reference_crc, '-', 2);
> +		capture_suffix =3D igt_crc_to_string_extended(capture_crc, '-', 2);
> +
> +		/* Write reference and capture frames to png. */
> +		igt_write_compared_frames(reference, capture,
> +					  reference_suffix,
> +					  capture_suffix);
> +
> +		free(reference_suffix);
> +		free(capture_suffix);
> +	}
> +
> +	igt_assert(eq);
> +}
> +
>  static void writeback_sequence(igt_output_t *output, igt_plane_t *plane,
>  				igt_fb_t *in_fb, igt_fb_t *out_fbs[], int n_commits)
>  {
> @@ -303,7 +336,8 @@ static void writeback_sequence(igt_output_t *output, =
igt_plane_t *plane,
>  		if (out_fbs[i]) {
>  			igt_crc_t out_after;
>  			igt_fb_get_fnv1a_crc(out_fbs[i], &out_after);
> -			igt_assert_crc_equal(&out_expected, &out_after);
> +			writeback_assert_crtc_eq_or_dump(&out_expected, in_fb,
> +							 &out_after, out_fbs[i]);
> =20
>  			/* And clear it, for the next time */
>  			fill_fb(out_fbs[i], clear_color);


--Sig_/tIKM=KreY3E8Rr2.ek4zrEZ
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr4DMACgkQI1/ltBGq
qqeNow//ezqZTg/wpYIkieEzy82EmhUU0hyz1ZDC2TsnS30fS9IuIKW1Ylec3gRi
sVicEKmk33T1CNc+7o9s1FS1y/Fkvw5VgfqmDzmGNV0YQHd/tsWxRKi+TcEQBKPp
Jaa7uoIGXg2+z37sWZx+/IBDI6SZedCbFFwF0f9KMyI9hPBnOmuecoepTGXZKtGq
moZZpdMbZZAEZRnwtKX/STJcIsVlCx1hUf4ydwXgY6kImW+tK6cYAwicjlnuG+JZ
CTFyGPkwgPL5jUI/QZrz1gA80/0LXZGNdx5MpWxl8OUu+cQ0syjt16UPFgdrhOGu
jCzCvkfK0kgpDigPglifMWSNkALVCOmcqgJRQ4yo2KeJxodiJwy44E/H9PYPkPki
Zbb4143zph0m1ueQLZN1H2Z8XGvCCZ068DREicp0lMt1fsEJ1NTADkrZ3QFBYIH4
5w33BAZtwlJvsFNrHJhwebsPNHKmER9sN8Qtb3ARTdiFbQPBC8eM/daYJq2Wy0id
lZsh45etEk+UHtFKuZGONm7ddUOl52hPI6Pr0DgEoEhJL5PSCQOnZ2RLKoXDK3jD
dBjWOGy3Hz0+hKXlMFiwZAKV3aySrefp236U1gaPNiqy9yf1+fhdP5RlbZXyNFTE
DE9I6UyYNEfi8aWGlI85GRJ47xCim//MJh+1tgkQuuiERMlt7iU=
=1XC5
-----END PGP SIGNATURE-----

--Sig_/tIKM=KreY3E8Rr2.ek4zrEZ--
