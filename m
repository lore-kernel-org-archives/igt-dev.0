Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC43D10E293
 for <igt-dev@lists.freedesktop.org>; Wed, 21 Sep 2022 10:36:47 +0000 (UTC)
Date: Wed, 21 Sep 2022 09:36:13 -0100
From: Melissa Wen <mwen@igalia.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20220921103613.jizg5rumtcrgvhy5@mail.igalia.com>
References: <20220831101100.1242315-1-mwen@igalia.com>
 <c97e81d2-3aaa-db11-ebb1-b6df5bf0b1ce@intel.com>
 <20220919155421.nauj7e4dp2dwmqza@mail.igalia.com>
 <9c8f18bc-a815-84a0-93eb-698a4083bbe0@intel.com>
 <YyrBrDSeogdOq4zs@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="g2rb35otyynmp2mh"
Content-Disposition: inline
In-Reply-To: <YyrBrDSeogdOq4zs@intel.com>
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


--g2rb35otyynmp2mh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09/21, Ville Syrj=E4l=E4 wrote:
> On Tue, Sep 20, 2022 at 03:32:39PM +0530, Modem, Bhanuprakash wrote:
> > On Mon-19-09-2022 09:24 pm, Melissa Wen wrote:
> > > On 09/01, Modem, Bhanuprakash wrote:
> > >> On Wed-31-08-2022 03:41 pm, Melissa Wen wrote:
> > >>> In test_pipe_degamma/gamma/ctm, igt_assert_crc_equal() was replaced=
 by
> > >>>
> > >>> ret =3D !igt_skip_crc_compare || igt_check_crc_equal()
> > >>> and then igt_assert(ret)
> > >>>
> > >>> where igt_check_crc_equal returns !mismatch, and therefore we can
> > >>> translate as:
> > >>>
> > >>> ret =3D !igt_skip_crc_compare || !mismatch
> > >>>
> > >>> However, the original igt_assert_crc_equal() assertion does:
> > >>>
> > >>> igt_assert(!mismatch || igt_skip_crc_compare)
> > >>>
> > >>> That means, the replacement changes the original assertion. Moreove=
r,
> > >>> negating `igt_skip_crc_compare` makes the test assertion to be alwa=
ys
> > >>> true (sucessful) by default and reverses the logic of
> > >>> --skip-crc-compare.
> > >>>
> > >>> Fixes: d61e4598142 ("tests/kms_color: Convert tests to dynamic")
> > >>> Signed-off-by: Melissa Wen <mwen@igalia.com>
> > >>
> > >> LGTM
> > >> Reviewed-by: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
> > >>
> > >> - Bhanu
> > >=20
> > > Thanks for reviewing, Bhanu.
> > >=20
> > > Siqueira,
> > >=20
> > > Is it okay from AMD side? If so, can you apply it?
> >=20
> > Applied.
>=20
> It did _not_ pass CI and so should not have been pushed!

Hi Ville,

So, this change "not passed" because the test was not actually assessing
the CRC results (i.e. !igt_skip_crc_compare makes the assertion always
successful - a false PASS). In this context, I think CI testlist should be
updated, instead of not applying this change, right?

BR,

Melissa

>=20
> --=20
> Ville Syrj=E4l=E4
> Intel

--g2rb35otyynmp2mh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmMq6RUACgkQwqF3j0dL
ehw5hxAApaWqFzzE9bSl10wGwTt6Z+bR3VRMreNpFN65BkdoYA/GnRh/HEIKuzbZ
/BoJ+IEueQswPPgoqM0X/AYRZuK7s03pjhRKe32bWWC2irg7iwpyUlgtpvQH7CFr
k5TxxASRfgHMhe25aWiceYruH+M/+I0H1luToPVW9bFVWDKkzNrzL674tM6IXUYZ
D0WgKcSY2IOWbIAyxawUDNClqc2IWUauuYEorXv1V3jdWprpboJAY9GiOLQzolyj
agNqM4YJ8U7MH7xN3BYIpYbh7D4HP3S/WosAcNlUvA7R/0pThO0hLxA6PjhbIIfx
YTDZd5KOVmcdUM4/cPMILQ8ry3O9/LsxpEPuYyAnjOBRtQdoqgbau4b7FrzX2GO5
gTkiGi6vTg/RYlSXWG+hEXyL2nP1STOei2spDlhgqB7Sjv2mA56DMN2BG7/a8RZO
y0IdtoVL7kLuTe4tUzZnc4gdjLbZU7DmW4DsYK51QK4oU/tQziSEcp3st5UaNxG4
CcShlKECvqjkLrI2YUcegLtTZPcaLZtgEIzpr6i/+lQo3qrUKflaDdNg6PCLdEWN
DQvN1fwG55SpzQMe/YJaqZ8xTp3yFDLQP6lsSzNV1ubQF2VMA6nDf3OuQTS0r+DM
71JDyyPX9u+KiEkcGtIL0v7AHhog359TLEe9zeJQkaK62ddUx0Q=
=6GWB
-----END PGP SIGNATURE-----

--g2rb35otyynmp2mh--
