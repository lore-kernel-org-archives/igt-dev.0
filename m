Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 4 Mar 2019 12:30:55 -0300
From: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Message-ID: <55bbf175b5fc0bee6927cb8de2853be2b4a9cd18.1551712108.git.rodrigosiqueiramelo@gmail.com>
References: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <cover.1551712108.git.rodrigosiqueiramelo@gmail.com>
Subject: [igt-dev] [PATCH i-g-t 4/7] kms_flip: Remove unreachable condition
 in wait_for_events
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0297490564=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Petri Latvala <petri.latvala@intel.com>, Arkadiusz Hiler <arkadiusz.hiler@intel.com>
Cc: igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============0297490564==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wr5unmgg7tpgsye4"
Content-Disposition: inline


--wr5unmgg7tpgsye4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

In the function wait_for_events() has a double check in the select()
function return as described below:

  igt_assert_f(ret >=3D 0,
        "select error (errno %i)\n", errno);
  igt_assert_f(ret > 0,
        "select timed out or error (ret %d)\n", ret);

Note that the second assert condition will not be reached because of the
first assertion. This commit removes the code duplication and update the
error message.

Signed-off-by: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
---
 tests/kms_flip.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/tests/kms_flip.c b/tests/kms_flip.c
index 57138ec1..9ef77de9 100755
--- a/tests/kms_flip.c
+++ b/tests/kms_flip.c
@@ -1014,9 +1014,7 @@ static unsigned int wait_for_events(struct test_outpu=
t *o)
 		} while (ret < 0 && errno =3D=3D EINTR);
=20
 		igt_assert_f(ret >=3D 0,
-			     "select error (errno %i)\n", errno);
-		igt_assert_f(ret > 0,
-			     "select timed out or error (ret %d)\n", ret);
+			     "select error: %s (%d))\n", strerror(errno), ret);
 		igt_assert_f(!FD_ISSET(0, &fds),
 			     "no fds active, breaking\n");
=20
--=20
2.21.0

--wr5unmgg7tpgsye4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAlx9RK8ACgkQWJzP/com
vP8afg/8DKGFYmptj09rBTXGibe0K+DgGMLZx3I74+h0PcTp1gdKvMgH+shMVgp7
Wv8XkjCcrLPurMkR/yodAqolIQbOZcOR4mnDsELZQr2PQa0rBN11cMFQ38v519fu
qXNsq0huDBKxMOLaDnTPinMI56myiHj3VoIyU9Snhr7LT7FEbPq4bKtwOKvqPRva
Mx84Ng+NW1obYE3OJnBtvRO7Kc4qziRzhelstUZPKMpzaH50k7XFt7GMoyjNNCK+
eSy7MouQf65+xdeT3pK8LV/Je0DvYzKLmFc/Rkuq0PeeJsN1DgD+Ixz5/LcSSWGK
qS53uAeHbFk/BGQUfjKWCHlFzgLUiyI4VVBr9cTkqFhRjBX08seijd83VUy4/Nu9
feiYC11dDZHHCkqwrBtUj7qmuI18WtGTn75aKqAX72apgu7ejqg1wvULi8QIDg3X
W2V1IP4fUNZrcK9O9034rg4UbyAYFJqcGyluP2QBjZpBSMmjB8L9FwGbF+gIx6xM
vdjBMvSaF+r6rjYk9NizT2tDtmuxG+li+a3u1IxfayAZMZbSi5fRkOJzFECvnjK2
fGXUvY/t20zNB6dtupFCSLr8AYQ3VkUAe+OpcNH2NqTyodo5IrK4XrPlwSqAtGIo
YoMz4IJ655OC1zz3sJOJVWHu/GWm82RC39bcjBVvAkbnnKDzU6Y=
=ARxQ
-----END PGP SIGNATURE-----

--wr5unmgg7tpgsye4--

--===============0297490564==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2

--===============0297490564==--
