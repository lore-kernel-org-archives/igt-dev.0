Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4380F6EF5D
 for <igt-dev@lists.freedesktop.org>; Tue,  8 Jan 2019 14:01:28 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Tue, 8 Jan 2019 14:01:26 +0000
Message-ID: <90c1a2af15d5eeaf5f052eca439e600df27fdffb.camel@intel.com>
References: <20190107191056.22759-1-jose.souza@intel.com>
 <20190107191056.22759-7-jose.souza@intel.com>
 <154689371427.27300.17200738894983499973@skylake-alporthouse-com>
In-Reply-To: <154689371427.27300.17200738894983499973@skylake-alporthouse-com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 7/8] tests/fbcon_fbt: Add and use
 psr_long_wait_exit() to test updates in PSR
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0132756235=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "chris@chris-wilson.co.uk" <chris@chris-wilson.co.uk>, "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Cc: "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>, "Vivi,
 Rodrigo" <rodrigo.vivi@intel.com>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0132756235==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-bHUKTXTmdA5Gj2q9aa7M"

--=-bHUKTXTmdA5Gj2q9aa7M
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2019-01-07 at 20:41 +0000, Chris Wilson wrote:
> Quoting Jos=C3=A9 Roberto de Souza (2019-01-07 19:10:55)
> > After getting back to fbcon it tests if PSR had a update but since
> > fbcon can take a while it have some big sleep in place, so what it
> > is actualy testing is if fbcon is updating the screen.
> > In this test the update of the screen comes from the fbcon cursor
> > blinking, the problem is that 40ms is a small interval to detect
> > cursor blinking and the test can fail some times, so a bigger
> > timeout
> > to wait for exit is need.
>=20
> So what happens if you disable the cursor blink?

It would fail, I can add a patch on top saving the previous state of
/sys/class/graphics/fbcon/cursor_blink enabling it and then restoring.

> Do you actually need to
> open the fbdev and draw something to ensure the path you want
> exercised
> is?

Paulo was the one that wrote the test he can answer better but I guess
he wanted to test if fbcon would show up after draw to fbdev and
teardown.

> -Chris

--=-bHUKTXTmdA5Gj2q9aa7M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlw0rTEACgkQVenbO/mO
WknqlQf8CshIKynSdlTkBij6brwDzGTV6VZFcLPdV/3hiwktZkyQkfmJFuZ7cRkc
XJsWrmJZoVWwGQ5YLrzUv+zH2ZOVslFGPCKSdkItQzKGCMJ5AG2PWo0JMTa2CO7j
u3gv1kPkfsletxF0pXqis9IZJrowi5/Fqd7zV45ow3adJlGHFfrvRY4zfEIGu1ol
Vg/jiMrcUjl3CAa9J/uQqihA5b6/Hofpo0tYaMNrTuV7c/cEuAFd2itjaoqJw9nO
eF5YFQljtZFZq+1woLnoLubLb7Pob3CmHbbsAwJ4h6ljTKXQv0bm6oCCZMlBonSk
SA5bGj7Djr805qPz2jJwFP43YTDOMw==
=FSXE
-----END PGP SIGNATURE-----

--=-bHUKTXTmdA5Gj2q9aa7M--

--===============0132756235==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0132756235==--
