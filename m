Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B71CE10E68D
 for <igt-dev@lists.freedesktop.org>; Mon, 19 Sep 2022 15:54:56 +0000 (UTC)
Date: Mon, 19 Sep 2022 14:54:38 -0100
From: Melissa Wen <mwen@igalia.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="a2az7t4wmd5ihs4i"
Content-Disposition: inline
In-Reply-To: <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_color: fix crc assert
 condition
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, petri.latvala@intel.com
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--a2az7t4wmd5ihs4i
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4u2x36tsrkg2gjgc"
Content-Disposition: inline


--4u2x36tsrkg2gjgc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/01, Modem, Bhanuprakash wrote:
> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
> > In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced by
> >=20
> > ret =3D !igt_skip_crc_compare || igt_check_crc_equal()
> > and then igt_assert(ret)
> >=20
> > where igt_check_crc_equal returns !mismatch, and therefore we can
> > translate as:
> >=20
> > ret =3D !igt_skip_crc_compare || !mismatch
> >=20
> > However, the original igt_assert_crc_equal() assertion does:
> >=20
> > igt_assert(!mismatch || igt_skip_crc_compare)
> >=20
> > That means, the replacement changes the original assertion. Moreover,
> > negating `igt_skip_crc_compare` makes the test assertion to be always
> > true (sucessful) by default and reverses the logic of
> > --skip-crc-compare.
> >=20
> > Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> > Signed-off-by: Melissa Wen <mwen@igalia.com>
>=20
> LGTM
> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
>=20
> - Bhanu

Thanks for reviewing, Bhanu.

Siqueira,

Is it okay from AMD side? If so, can you apply it?

BR,

Melissa
>=20
> > ---
> >   tests/kms_color.c | 8 ++++----
> >   1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/tests/kms_color.c b/tests/kms_color.c
> > index c202547e..ab285af8 100644
> > --- a/tests/kms_color.c
> > +++ b/tests/kms_color.c
> > @@ -99,7 +99,7 @@ static bool test_pipe_degamma(data_t *data,
> >   	 * Verify that the CRC of the software computed output is
> >   	 * equal to the CRC of the degamma LUT transformation output.
> >   	 */
> > -	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, =
&crc_fullcolors);
> > +	ret =3D igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &=
crc_fullcolors);
> >   	disable_degamma(primary->pipe);
> >   	igt_plane_set_fb(primary, NULL);
> > @@ -188,7 +188,7 @@ static bool test_pipe_gamma(data_t *data,
> >   	 * Verify that the CRC of the software computed output is
> >   	 * equal to the CRC of the gamma LUT transformation output.
> >   	 */
> > -	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, =
&crc_fullcolors);
> > +	ret =3D igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &=
crc_fullcolors);
> >   	disable_gamma(primary->pipe);
> >   	igt_plane_set_fb(primary, NULL);
> > @@ -289,7 +289,7 @@ static bool test_pipe_legacy_gamma(data_t *data,
> >   	 * Verify that the CRC of the software computed output is
> >   	 * equal to the CRC of the gamma LUT transformation output.
> >   	 */
> > -	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, =
&crc_fullcolors);
> > +	ret =3D igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &=
crc_fullcolors);
> >   	/* Reset output. */
> >   	for (i =3D 1; i < legacy_lut_size; i++)
> > @@ -534,7 +534,7 @@ static bool test_pipe_ctm(data_t *data,
> >   	 * Verify that the CRC of the software computed output is
> >   	 * equal to the CRC of the CTM matrix transformation output.
> >   	 */
> > -	ret &=3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_software, =
&crc_hardware);
> > +	ret &=3D igt_skip_crc_compare || igt_check_crc_equal(&crc_software, &=
crc_hardware);
> >   	igt_plane_set_fb(primary, NULL);
> >   	igt_output_set_pipe(output, PIPE_NONE);
>=20

--4u2x36tsrkg2gjgc--

--a2az7t4wmd5ihs4i
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMokL4ACgkQwqF3j0dL
ehz7mxAAkEAxuRH2MU5nSnSKEgGA7maxMARw57k4mxcC4y/baBW0iiMcW/3L8nZv
IYmPO4X37xD88SSmA08QgGumRk7V1GMuk1G3QbCY82Ux3bQJjIAfinx+76XNwS3t
0Rve78lJzs3WEYWuiN6wOT05v59cmTY0IJaPkWIHaKPZhiTTCBFII8GFjRjabsIu
Cfa7xbn25E1RvSG3PXutj5J6vA2Ub90tna0y+wqcZc3w2mm7NnVVLsY8P48XicRz
EsGHQHXoQ9F9rlcFsYaRRDr/A/KC4BpAUA+ZcDk15Gh5qrXWlesvAP6TvfixKgSa
UMMe4V0sxf5zJQXtcPFNO3wGhCjOC0PtFuNtwLiuzHvSLihTBalSlDaWPdDTLtMe
vf8EaluFfJYm44P4Xkj/H8mxxPRx9WuVU1tfqwPLL7nAcZ4XROQyKsAYvJEHnbFG
R1cGFaHC82sSViREs7zXLOHRxLzdxxhE3nuh4XAsJreX88YgqFAcBQfCM8y7Optq
DTUFPDUz+GOaP+aU6xtUSiZhM0+Zg1rc2C52Eg3dfpWlmAfdx6nolHyzMNwo+FCZ
Frd2B4e8BNhjjZV5rTm8oRKXI4QKxKvLmifRfmpB20/YRy1zMXAgrUmi6S1UdupK
KS4le51VkgfcO4hYd9jzW41+MiYKIJ9WTeMtf+L5MEXaf4EHRdA=
=ePeN
-----END PGP SIGNATURE-----

--a2az7t4wmd5ihs4i--
