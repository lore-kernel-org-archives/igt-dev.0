Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296310E3F6
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 12:20:14 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id 4so10255153ljw.11
 for <igt-dev@lists.freedesktop.org>; Fri, 29 Apr 2022 05:20:14 -0700 (PDT)
Date: Fri, 29 Apr 2022 15:19:55 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: "Modem, Bhanuprakash" <bhanuprakash.modem@intel.com>
Message-ID: <20220429151955.7a78faae@eldfell>
In-Reply-To: <fe397719-6b35-8e26-2a17-84d70b514355@intel.com>
References: <20220107053238.1760508-1-bhanuprakash.modem@intel.com>
 <fe397719-6b35-8e26-2a17-84d70b514355@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/c8bixXY15CpcPALUKyHL7Bd";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [v3 i-g-t 00/15] Add IGT support for plane color
 management
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/c8bixXY15CpcPALUKyHL7Bd
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 4 Feb 2022 12:00:23 +0530
"Modem, Bhanuprakash" <bhanuprakash.modem@intel.com> wrote:

> Hi Pekka/Harry,
>=20
> Did you get a chance to review the latest patches of Plane color manageme=
nt?

Hi,

no, I didn't, sorry.

I'm also not following dri-devel@ or igt-dev@ unless explicitly Cc'd.


Thanks,
pq

> On Fri-07-01-2022 11:02 am, Bhanuprakash Modem wrote:
> >  From the Plane Color Management feature design, userspace can
> > take the smart blending decisions based on hardware supported
> > plane color features to obtain an accurate color profile.
> >=20
> > These IGT patches extend the existing pipe color management
> > tests to the plane level.
> >=20
> > Kernel implementation:
> > https://patchwork.freedesktop.org/series/90825/
> >=20
> > Bhanuprakash Modem (12):
> >    HAX: Get uapi headers to compile the IGT
> >    lib/igt_kms: Add plane color mgmt properties
> >    kms_color_helper: Add helper functions for plane color mgmt
> >    tests/kms_color: New subtests for Plane gamma
> >    tests/kms_color: New subtests for Plane degamma
> >    tests/kms_color: New subtests for Plane CTM
> >    tests/kms_color: New negative tests for plane level color mgmt
> >    tests/kms_color_chamelium: New subtests for Plane gamma
> >    tests/kms_color_chamelium: New subtests for Plane degamma
> >    tests/kms_color_chamelium: New subtests for Plane CTM
> >    tests/kms_color_chamelium: Extended IGT tests to support logarithmic
> >      gamma mode
> >    HAX: Add color mgmt tests to BAT
> >=20
> > Mukunda Pramodh Kumar (3):
> >    lib/igt_kms: Add pipe color mgmt properties
> >    kms_color_helper: Add helper functions to support logarithmic gamma
> >      mode
> >    tests/kms_color: Extended IGT tests to support logarithmic gamma mode
> >=20
> >   include/drm-uapi/drm.h                |  10 +
> >   include/drm-uapi/drm_mode.h           |  28 ++
> >   lib/igt_kms.c                         |   6 +
> >   lib/igt_kms.h                         |   6 +
> >   tests/intel-ci/fast-feedback.testlist | 112 +++++
> >   tests/kms_color.c                     | 672 +++++++++++++++++++++++++-
> >   tests/kms_color_chamelium.c           | 597 ++++++++++++++++++++++-
> >   tests/kms_color_helper.c              | 303 +++++++++++-
> >   tests/kms_color_helper.h              |  44 ++
> >   9 files changed, 1761 insertions(+), 17 deletions(-)
> >=20
> > --
> > 2.32.0
> >  =20
>=20


--Sig_/c8bixXY15CpcPALUKyHL7Bd
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmJr1+sACgkQI1/ltBGq
qqdg6Q/5AQj1b/tLf4XSnMXfEyEGM+IY42pFR4OUEDGZwUQv2pX87PzfW4yM+gNc
F15Sfi4cnsKroDVPAh2qeGpaXYKlUH9ygXmgZkV7dquJoZRfwmjNC/8JXpN4y7yQ
e1VoQwSYB3Vow3N3kteWAFJK92fzWO9/QFuCD6ekXgiQVXoAf529JohShroM5Twm
XjEC3xx/Kk78NEPElFR5LGlRzaPAofPLCoaOKKK+9bNTrhETaxiboP5pqckQFsHu
GSCQ7YAw+vb6zGUwFa56b71R5e4DH4DcXiP1iPAyQNmgKrkO7T8JOt2aN5w0E/YL
LAWbaPjkXOV8SKcB9+Id4McI0iIRPIuAqiqfwu4KtWqnm0ZlQ250mMx5WN8VK7x8
w4/2qn15mYZAJkY9tKyCAfZHI3yoGDzpTNzKTjqqA/PSHp+1rfSXJdUEAkJpc/2Q
CiCowg7Rz0+BPVbVv+sfG1SmtnIJbMg6vFbsbA8lTW8TqAwRix4tNTb+AR4wzRQH
zcM6dp7YSP2RblrHlcz84nqeMKiDqeDlKLD6YwE36WWjhVmJQsEJd/KaWHC34FhV
Pc/NZx9l4pAqIC+OmJKQtAYOcTiy1XTd/d/Pv95K6xiLbPkczZZhq7bLdnu2z1ci
HTQg6c7t2peEnaKrl7ZJHX3vvx0BV0Xr/80+AormIITVwfVxCt8=
=5DQz
-----END PGP SIGNATURE-----

--Sig_/c8bixXY15CpcPALUKyHL7Bd--
