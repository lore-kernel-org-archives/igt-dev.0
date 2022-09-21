Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D27610E1CA
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 17:31:48 +0000 (UTC)
Date: Wed, 21 Sep 2022 16:31:22 -0100
From: Melissa Wen <mwen@igalia.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20220921173122.nfebujuj5qxcj2fm@mail.igalia.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
 <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
 <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com>
 <YyrBrDSeogdOq4zs@intel.com>
 <20220921103613.jizg5rumtcrgvhy5@mail.igalia.com>
 <Yyrsfb8V5UxDBxbm@intel.com>
 <daf8094a-a906-c115-ee8a-d87babcc768d@intel.com>
 <Yys/TUJxVEx77Wp6@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="yuparhc6atwabfkr"
Content-Disposition: inline
In-Reply-To: <Yys/TUJxVEx77Wp6@intel.com>
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


--yuparhc6atwabfkr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/21, Ville Syrj=E4l=E4 wrote:
> On Wed, Sep 21, 2022 at 09:24:25PM +0530, Modem, Bhanuprakash wrote:
> > On Wed-21-09-2022 04:20 pm, Ville Syrj=E4l=E4 wrote:
> > > On Wed, Sep 21, 2022 at 09:36:13AM -0100, Melissa Wen wrote:
> > >> On 09/21, Ville Syrj=E4l=E4 wrote:
> > >>> On Tue, Sep 20, 2022 at 03:32:39PM +0530, Modem, Bhanuprakash wrote:
> > >>>> On Mon-19-09-2022 09:24 pm, Melissa Wen wrote:
> > >>>>> On 09/01, Modem, Bhanuprakash wrote:
> > >>>>>> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
> > >>>>>>> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was repl=
aced by
> > >>>>>>>
> > >>>>>>> ret =3D !igt_skip_crc_compare || igt_check_crc_equal()
> > >>>>>>> and then igt_assert(ret)
> > >>>>>>>
> > >>>>>>> where igt_check_crc_equal returns !mismatch, and therefore we c=
an
> > >>>>>>> translate as:
> > >>>>>>>
> > >>>>>>> ret =3D !igt_skip_crc_compare || !mismatch
> > >>>>>>>
> > >>>>>>> However, the original igt_assert_crc_equal() assertion does:
> > >>>>>>>
> > >>>>>>> igt_assert(!mismatch || igt_skip_crc_compare)
> > >>>>>>>
> > >>>>>>> That means, the replacement changes the original assertion. Mor=
eover,
> > >>>>>>> negating `igt_skip_crc_compare` makes the test assertion to be =
always
> > >>>>>>> true (sucessful) by default and reverses the logic of
> > >>>>>>> --skip-crc-compare.
> > >>>>>>>
> > >>>>>>> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> > >>>>>>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> > >>>>>>
> > >>>>>> LGTM
> > >>>>>> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > >>>>>>
> > >>>>>> - Bhanu
> > >>>>>
> > >>>>> Thanks for reviewing, Bhanu.
> > >>>>>
> > >>>>> Siqueira,
> > >>>>>
> > >>>>> Is it okay from AMD side? If so, can you apply it?
> > >>>>
> > >>>> Applied.
> > >>>
> > >>> It did _not_ pass CI and so should not have been pushed!
> > >>
> > >> Hi Ville,
> > >>
> > >> So, this change "not passed" because the test was not actually asses=
sing
> > >> the CRC results (i.e. !igt_skip_crc_compare makes the assertion alwa=
ys
> > >> successful - a false PASS). In this context, I think CI testlist sho=
uld be
> > >> updated, instead of not applying this change, right?
> > >=20
> > > No. Either the test never worked correctly or there was an earlier
> > > regression hidden by the thing this is now fixing. Either way it
> > > needs to be fixed. Just reverting the whole sordid mess and starting
> > > from scratch may be the easiest option.
> >=20
> > I have floated a patch to revert this.
> > https://patchwork.freedesktop.org/series/108835/
> >=20
> > Ville/Melissa, Can I have an Ack to merge this?
>=20
> I mean we have to revert all the way back to before the
> dunamic subtest conversion. AIUI that is when we started
> to ignore real test failures, and so we don't even know
> whether it was that commit itself or something later that
> really broke the test.

It's clear to me that the regression was introduced by:
d61e4598142 ("tests/kms_color: Convert tests to dynamic")

As I explained in the commit message, we can see it in the patchwork
diff [1] (or gitlab commit diff, but the patchwork just displays it
clear enough), as here:

---
@@ -285,7 +286,7 @@  static void test_pipe_legacy_gamma(data_t *data,
 	/* Verify that the CRC of the software computed output is
 	 * equal to the CRC of the gamma LUT transformation output.
 	 */
-	igt_assert_crc_equal(&crc_fullgamma, &crc_fullcolors);
+	ret =3D !igt_skip_crc_compare || igt_check_crc_equal(&crc_fullgamma, &crc=
_fullcolors);

 	/* Reset output. */
 	for (i =3D 1; i < legacy_lut_size; i++)
---

[1] https://patchwork.freedesktop.org/patch/491540/

btw, I'm okay with the approach of reverting both. So, I understand
Bhanuprakash will submit a new patch with a dynamic test conversion that
handles the assertions correctly, right?

BR,

Melissa

>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--yuparhc6atwabfkr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMrSmAACgkQwqF3j0dL
ehwf9RAAszA8mMn+xkCOaGEMtoITVprx8UrJ933bNRMapNRICFGs2Z2xrL2r0TcF
0hOh11kojnK0EIWIYN7smT7/Ye/L1rzcDJCswf25hxSzXjkLMqvT5zN/VI0wa5ro
rw0eQPydnUlhGRc2hH6v8Pvib5Ssj3D3Euy6+ZIdBG+mHBbTHMXTiBI94oxgz6iC
6ry3wMFxTtUJFvwlF4QueK03CwyMduImSuugMEmfFLCUzWcYPkGsxlR/ooEKLhJL
1PgzAWpbfS0hEYwD9ExCbiEfeWwicZjO0xlIIETCQRidZdc2UpSmzy2rLQOWc5Rr
8yUEQ3+zt7ayeUSbrvwPuGCM0lIhMAonDQK4Izw3ZB+9YP0gfnCjs5OFYgaGNo4D
8GC3uTakVY/CxIs/LliqtF8h9le8D9X2qF1T9LRQoC426txpokHD15M2FXwklDsE
zFmxsrIGq9t2r1Hjpr6zS4tNXkQBsa6HTxQv/TgsIRE8WbY8TaGa3+S+ePL/j5zn
J49OeU5uYzAG3KGS8I8bXi9XxFo7pkfYDlI6Z2yMEgmWXC0QFkIAPiR+wSDH3KRo
V4hsTuOoh+jGDo+mV014QVZaT3fA3ZvW9kZWb5DQbdIdaCd6Syd5aWr7I58t3VSr
8Nic9Et3QzFkRW6LeG+i6jHgfiUicuTkY6Lk2oUsFJT5sg+P+7A=
=KqPV
-----END PGP SIGNATURE-----

--yuparhc6atwabfkr--
