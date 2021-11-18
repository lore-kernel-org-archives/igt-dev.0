Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 18 Nov 2021 11:50:02 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20211118115002.14003184@eldfell>
In-Reply-To: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
References: <20211115094759.520955-1-bhanuprakash.modem@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/7pYQw2hfzjuE2r=j._k=rHe";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Subject: Re: [igt-dev] [i-g-t 00/14] Add IGT support for plane color
 management
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Bhanuprakash Modem <bhanuprakash.modem@intel.com>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--Sig_/7pYQw2hfzjuE2r=j._k=rHe
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Mon, 15 Nov 2021 15:17:45 +0530
Bhanuprakash Modem <bhanuprakash.modem@intel.com> wrote:

> From the Plane Color Management feature design, userspace can
> take the smart blending decisions based on hardware supported
> plane color features to obtain an accurate color profile.
>=20
> These IGT patches extend the existing pipe color management
> tests to the plane level.
>=20
> Kernel implementation:
> https://patchwork.freedesktop.org/series/90825/

Hi,

it's really good to get these, but I am worried that the tests here may
be too easy to pass when trying to ensure the KMS features work
correctly and in the way real userspace is going to be using them.

I also found some things that looked hardware-specific in this code
that to my understanding is supposed to be generic, and some concerns
about UAPI as well.


Thanks,
pq

> Bhanuprakash Modem (11):
>   HAX: Get uapi headers to compile the IGT
>   lib/igt_kms: Add plane color mgmt properties
>   kms_color_helper: Add helper functions for plane color mgmt
>   tests/kms_color: New subtests for Plane gamma
>   tests/kms_color: New subtests for Plane degamma
>   tests/kms_color: New subtests for Plane CTM
>   tests/kms_color: New negative tests for plane level color mgmt
>   tests/kms_color_chamelium: New subtests for Plane gamma
>   tests/kms_color_chamelium: New subtests for Plane degamma
>   tests/kms_color_chamelium: New subtests for Plane CTM
>   tests/kms_color_chamelium: Extended IGT tests to support logarithmic
>     gamma mode
>=20
> Mukunda Pramodh Kumar (3):
>   lib/igt_kms: Add pipe color mgmt properties
>   kms_color_helper: Add helper functions to support logarithmic gamma
>     mode
>   tests/kms_color: Extended IGT tests to support logarithmic gamma mode
>=20
>  include/drm-uapi/drm.h      |  10 +
>  include/drm-uapi/drm_mode.h |  28 ++
>  lib/igt_kms.c               |   6 +
>  lib/igt_kms.h               |   6 +
>  tests/kms_color.c           | 674 +++++++++++++++++++++++++++++++++++-
>  tests/kms_color_chamelium.c | 588 ++++++++++++++++++++++++++++++-
>  tests/kms_color_helper.c    | 300 ++++++++++++++++
>  tests/kms_color_helper.h    |  45 +++
>  8 files changed, 1648 insertions(+), 9 deletions(-)
>=20
> --
> 2.32.0
>=20


--Sig_/7pYQw2hfzjuE2r=j._k=rHe
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmGWIcoACgkQI1/ltBGq
qqcjkw//QMxPvkyLCrL3oCmAXL5QHBnQlWuyikpXjYjaD8EF63rvspR+9kk0LG9p
xmuCZw1CRbA9Z45Duqvea1i2wkwPVGeQFg5HFJ5eKDUdT0r3Khy1OHvwyLW5ucEG
hgsJPyMM8THW7Gu6PKCK2yN4+mIbfHcL5TlCjgetpENPuNHch0wsURl1OY255Ywx
k0i68l+Gmkc0pg8KdaR3pHFZOYxoN58rKtlUJHiSF18fZr3smqw9sEZz4Eak1soK
zjIj0Bi2iW/cEsnDcXVof4F/uPwlvWWIc5hbEVJfVlcDGhyslsyqbAnlhx+c00v8
HMJecg9CdowT7+/puPJOEdeWUub7E8Fg3Y3UmuLYJmBy/mR1RfoM8joBt7U3h/at
U9l5Ord6uVN1iv/Ik5FdlezlDygmsojQdXCa/Xd1T6jm4JCkzRi7ugkfsvkV8117
NmEWLQG8Tt4FPLVbwfBpbqc9Os7ydgbyYqRFusCuicZCZBSUzIK1aZSykkJ7D78p
UwZXotCI2GZv58oPkTBi3HBQUSHixpITJtI2ChoREQr0WvhShqCma1QatuuVL3NU
j1pnwzl/QM8vsWOX8w30iMcGxRn8UEizMZyOkAgnB1cw5Hid0wW+bDAauN2L/fkg
xrIeknFzt5NrU5iZH0HvCLys5MvxrGxpVscfUpHCLk3ixgTuuv0=
=PYbO
-----END PGP SIGNATURE-----

--Sig_/7pYQw2hfzjuE2r=j._k=rHe--
