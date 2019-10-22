Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 21 Oct 2019 21:54:48 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20191022005427.mwwgswmt6r6a45tk@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [PATCH v7 i-g-t 0/4] Add support for testing writeback
 connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0329720141=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Simon Ser <simon.ser@intel.com>, Brian Starkey <Brian.Starkey@arm.com>, Liviu Dudau <Liviu.Dudau@arm.com>, Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0329720141==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pdeuk25hsgc26r56"
Content-Disposition: inline


--pdeuk25hsgc26r56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

A couple of months ago, I updated and re-submitted a patchset made by
Brian Starkey and Liviu Dudau for adding a writeback connectors test to
IGT. It is important to highlight that DRM already have writeback
connectors support, which is a way to expose in DRM the hardware
functionality from display engines that allows writing back into memory
the result of the DE's composition of supported planes.

After I resubmitted the patchset, Simon Ser provides a long and detailed
review for all of the patches (thanks Simon). As a result, I finally had
time to go through all the details and prepare this new version. Follows
some notes:

1. Patchset author

Brian Starkey is the original author of this patchset, and I'm just
trying to upstream his changes. Note that during this patch submission,
the mail server from google going to overwrite Brian's mail by mine;
this happens on the mail server side for avoiding malicious users to
send emails as someone else. Note that I could spend time figuring out
how to fix it, but I think this is not worth since I can fix it during
the merge process (if it got accepted).

2. Drop the clone commits from the series

After Simon's review, we decided to drop the last two patches of the
original series since it was related to cloning output, and VKMS does
not support it yet. However, after we finish with this series, I can try
to take a look at this feature or maybe propose it as a GSoC/Outreachy
project.

3. Changes

Most of the changes happened in the second patch.

Thanks

Brian Starkey (4):
  lib/igt_kms: Add writeback support
  kms_writeback: Add initial writeback tests
  lib: Add function to hash a framebuffer
  kms_writeback: Add writeback-check-output

 lib/igt_fb.c           |  68 +++++++
 lib/igt_fb.h           |   2 +
 lib/igt_kms.c          |  59 ++++++
 lib/igt_kms.h          |   6 +
 tests/Makefile.sources |   1 +
 tests/kms_writeback.c  | 413 +++++++++++++++++++++++++++++++++++++++++
 tests/meson.build      |   1 +
 7 files changed, 550 insertions(+)
 create mode 100644 tests/kms_writeback.c

--=20
2.23.0

--pdeuk25hsgc26r56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAl2uU0MACgkQWJzP/com
vP+PrA//X5t91nrKJ3V8a6wje1UvsSeh7EYV6DCI6GLtVj4xhYJJV1vB7arduVEZ
hbY9BjFUQs9OKwUJA2TErFayHf4zBaUbcmmGBADqBsrq+bkQXKJ0qXFLcwIiTHB7
QgmFEIuuyEIychRW9bqYftqFNSwzqZavIZMPRxNJ7Lu3AgIeY6Tys4FXxsvYP/92
4orZrevHLLO57qIrPK5DKz0GjHViYI/NPvDcNEIar+8xhULm8aGFn3ascA/cYS2b
1GKULgDvDTCjc2dAGAcQRp0FC2sDYjxye00ek53lDeF7SwHpzT41qDkaRLK15cbv
X4VkIPuQ13tYRlQeVQnLan04OPyp+Hrwlg4TEqcYPyT4kmuOWAVnV7qAaqucIl0y
Og7RiWUvxqytU/8w80q35OCLvAKIHf/XqXtlBEvY3bNZGCTvCcvYRliptj5pG4tU
BW05+iBlniDOHUB/kzGjhIlTeD1xs20MzJfASOwhCxEEeE1fo1FJTSfl4UaRcX8r
0RjOJbt153P/DGiOmV4f1KJwy9dHdC6O8Zz5XAgDNEBR2t+um8XpJ+4nneH0qe9Q
Eceen44/m62S9ORN9k/kLvJbJ1gMb7ZBAazKkkh+yH8BGDyuwxQ2wzy8q07QvQAu
3EBBCObFlGMGbSnpnmnC1ydEVE8v43hMCPsimQpSaSlsRKHysg8=
=MYTK
-----END PGP SIGNATURE-----

--pdeuk25hsgc26r56--

--===============0329720141==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0329720141==--
