Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:29:00 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH i-g-t 0/7] kms_flip: cleanups
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1464334975=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1464334975==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="fudpyjm4vmwhmuax"
Content-Disposition: inline


--fudpyjm4vmwhmuax
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

The last few weeks, I have been dive into the page flip and vblank with
the goal to learn how the user space interact with DRM; because of this,
I am studying the kms_flip code. As a result, I noticed a bunch of
cleanups that could be useful for improving the overall quality of
kms_flip. This patchset can be seen in two parts:

 1. Eliminates unreachable tests
 2. Basic cleanups with the goal to improve the code readability

In particular, the patch number three enables kms_flip to work without
any issue in any non-intel drivers.

Rodrigo Siqueira (7):
  kms_flip: Removes unreachable code related to TEST_RPM
  kms_flip: Removes unreachable code related to TEST_TS_CONT
  kms_flip: Fix warning related to i915 gem dependence
  kms_flip: Remove unreachable condition in wait_for_events
  kms_flip: remove magic constant in run_test_on_crtc_set()
  kms_flip: Rework set_mode()
  kms_flip: Standardize return value for fb_is_bound

 tests/kms_flip.c | 88 +++++++++++++++++-------------------------------
 1 file changed, 31 insertions(+), 57 deletions(-)

--=20
2.21.0

--fudpyjm4vmwhmuax
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RDsACgkQWJzP/com
vP+LvQ//Yiz+xEFhsho5BpopFACnKla2O7PfCuFSOBNPfbWMmxDK6B0kngCxrERA
hsQvp18HsHASkZWxwEPCg72z4v9LNAHGI93yMwND5gImrZm6R42K/6/49LQxmUnQ
l1WCPHRTl/+1tbQcNkuLY7YxniO/U2bRcbY00lxHkBn6RwEfNeTZ15iKUbZjvaql
auN1OPerWu3CxAG9bz3H/+9rtd1xMaQ0XQThU8Ai+vwhicTpQx5KhyISmi4NXvPh
EO6JNptNvjCvfa+jJA9tZl8L1fATyDTUXwLwCm/mvFRb4IxKqpxmHjJ4g3DqKnSL
AWeJixNu5nYUynw0NZF9mo3ZuNevJcPa16D8FaJZz7AvXoGWvOrOqjSv774Bj8zi
fZzjn7+mOW22MFxycu8qWrS/tsY5NuyBPbesjYQ25JuO6u0maZ1kpEEACQKKag78
b2EyaINzyG0aZQiR4WAc/aPO5SWr/y1B/WeWlbuHOehRRjizWp/15GdZ98kEjjC/
aEEOulszKaquXJsk3pNiAF+vFOifD4Ofz4O6adby8yjHO6ixWUACq0Rzki/MqRLf
FNablJ2l89UNQscjW6c3Bd3A0c+6xSN6NOTQij8TvZcRTEs78qOc4QBEfuFzVqiW
nMwLFGfZnflzJzsJ6fn1MPU+sGjrNMsEzES/Bg/uxZmbTFfsG9k=
=JO8g
-----END PGP SIGNATURE-----

--fudpyjm4vmwhmuax--

--===============1464334975==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1464334975==--
