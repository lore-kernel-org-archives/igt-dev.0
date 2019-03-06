Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Wed, 6 Mar 2019 19:49:38 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <20190306224938.opisj72oa2kxxrwi@smtp.gmail.com>
MIME-Version: 1.0
Subject: [igt-dev] [RFC i-g-t] lib/igt_kms: Set capabilities before get
 resource
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1565132424=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1565132424==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gd2nccwecgjnhuaa"
Content-Disposition: inline


--gd2nccwecgjnhuaa
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, I was working on adding the writeback support to VKMS; as a result,
I was using the Liviu=E2=80=99s patchset to validate my implementation [1].
However, I consistently failed to pass the requirements in
igt_display_require(); more specifically, I couldn't pass this test:

 igt_skip("No KMS driver or no outputs, pipes: %d, outputs: %d\n",
               display->n_pipes, display->n_outputs);

Next, I made a simple code that does the following three steps:

 1. Open the device
 2. Collect the resource information with drmModeGetResources()
 3. Set writeback capability via drmSetClientCap()
 4. Print the total of connectors

I noticed that I could not get any connector as well; after some time
debugging the issue and thanks to Anholt=E2=80=99s help in the dri-channel I
learned that I had to use drmSetClientCap() before
drmModeGetResources(). After move all drmSetClientCap() above
drmModeGetResources(), my simple coded displayed the connector
information. I did the same thing within igt_display_require(), and this
test started to pass for me (I did it, in the Liviu=E2=80=99s patch).

In this sense, I checked the igt_display_require() code in the master
branch; and again, I noticed that capabilities are set after getting the
resource information. Is that correct? Is it ok to call
drmModeGetResources() before drmSetClientCap() in this case?

P.s.: I sent it as a RFC because I=E2=80=99m not 100% sure about the change=
 and
the impacts on the tests. If it make sense, I can make a real patch.

1. https://patchwork.freedesktop.org/series/39229/

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 lib/igt_kms.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/igt_kms.c b/lib/igt_kms.c
index 7ebab4ca..2de9ac41 100644
--- a/lib/igt_kms.c
+++ b/lib/igt_kms.c
@@ -1886,6 +1886,10 @@ void igt_display_require(igt_display_t *display, int=
 drm_fd)
=20
 	display->drm_fd =3D drm_fd;
=20
+	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
+	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
+		display->is_atomic =3D 1;
+
 	resources =3D drmModeGetResources(display->drm_fd);
 	if (!resources)
 		goto out;
@@ -1898,10 +1902,6 @@ void igt_display_require(igt_display_t *display, int=
 drm_fd)
 	display->pipes =3D calloc(sizeof(igt_pipe_t), display->n_pipes);
 	igt_assert_f(display->pipes, "Failed to allocate memory for %d pipes\n", =
display->n_pipes);
=20
-	drmSetClientCap(drm_fd, DRM_CLIENT_CAP_UNIVERSAL_PLANES, 1);
-	if (drmSetClientCap(drm_fd, DRM_CLIENT_CAP_ATOMIC, 1) =3D=3D 0)
-		display->is_atomic =3D 1;
-
 	plane_resources =3D drmModeGetPlaneResources(display->drm_fd);
 	igt_assert(plane_resources);
=20
--=20
2.21.0


--=20
Rodrigo Siqueira
https://siqueira.tech
Graduate Student
Department of Computer Science
University of S=C3=A3o Paulo

--gd2nccwecgjnhuaa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlyAToIACgkQWJzP/com
vP9chQ//dcwQQbESyoeS+P4NYseFnEPDTw9NYAqkDPtPERX3QlCN2FCfXieiq4fj
1BiEh3bWoQDyssUfSstHMT9fOX4a19qJtcws0O4YPuUkYiXgNr3ffjFFEV819BaG
UUKUYgI56W5zaJWURNH/GB1YQkn962fJ+8378avf5IOLmhaI8lLMr20DO+BtkUWi
6x6n+sOlQPKUFuU70dfj90Rom6N30/ldc/XcwREGBop7yxUIaxp6R/OjB+852+AD
lBDAmHm/c9exBRJgjr6CeoUkIEwwI6YKyeZ2FFK7qIqS/Y6NFOCGRAsm1uEQkg2c
FXQ4t+COoCfUiVM1PgayAEZZ5VmaeTmyzsklBdfk0nr8i5ZTFpgH2cXVwomZwSCD
oyPE9tk8nMZ6shG4K174LMPLWp3QLleBfbRbLA6EPDOfJ45mOIcTzSK/QO43ggKE
1dE20b840n3gTja7MpnaZsuRYXNFD1xPiMcGVnPTg3C+z8jdb4iF/7XZ14Egz3Q3
YOEQt6c3QwKszeb60SBgfucLyHBbOdLXzTcEiLJHd1v3TrlMv6JlbDi+6/NCpH/t
46HYlUjF2PsyPfXzAgkl3pRCXn27Vu89ZR4gJv1f9RuVE3Zlv/L9PwN/TId96fIP
rM0LvbU9D27rSC9FdRnxt819wR+XGpaR12J/G7HvRofQWxpMtDA=
=KPgO
-----END PGP SIGNATURE-----

--gd2nccwecgjnhuaa--

--===============1565132424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============1565132424==--
