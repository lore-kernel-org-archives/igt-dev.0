Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Mon, 5 Mar 2018 15:37:30 +0100
From: Maxime Ripard <maxime.ripard@bootlin.com>
Message-ID: <20180305143730.jjb6futkd4jq4vcj@flea.lan>
References: <20171012115435.18880-1-maarten.lankhorst@linux.intel.com>
 <20171012115435.18880-4-maarten.lankhorst@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <20171012115435.18880-4-maarten.lankhorst@linux.intel.com>
Subject: Re: [igt-dev] [Intel-gfx] [PATCH i-g-t v2 03/14] lib/igt_kms:
 Rework pipe properties to be more atomic, v7.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1842394781=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, igt-dev@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>


--===============1842394781==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="uf6l7xbfwiwgvjtl"
Content-Disposition: inline


--uf6l7xbfwiwgvjtl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Oct 12, 2017 at 01:54:24PM +0200, Maarten Lankhorst wrote:
> In the future I want to allow tests to commit more properties,
> but for this to work I have to fix all properties to work better
> with atomic commit. Instead of special casing each
> property make a bitmask for all property changed flags, and try to
> commit all properties.
>=20
> This has been the most involved one, since legacy pipe commit still
> handles a lot of the properties differently from the rest.
>=20
> Changes since v1:
> - Dump all changed properties on commit.
> - Fix bug in igt_pipe_refresh().
> Changes since v2:
> - Set pipe ACTIVE property changed flag on init.
> Changes since v3:
> - Add a missing igt_pipe_refresh() to kms_atomic_interruptible.
> Changes since v4:
> - Perform error handling when setting custom crtc properties.
> Changes since v5:
> - Only attempt to commit changes properties.
> Changes since v6:
> - Clear OUT_FENCE_PTR on succesful commit.
>=20
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

I'm a bit late to the party on this one, but this commit broke the
chamelium tests on vc4, with every kernel since at least 4.12.

This is the error message:
http://code.bulix.org/32fw1l-293842

=46rom the stack trace, it looks like the atomic commit was failing, and
indeed it fails here:
https://elixir.bootlin.com/linux/v4.16-rc4/source/drivers/gpu/drm/drm_atomi=
c.c#L2319

with prop_id being 0 for some reason.

I had a look at that patch, but I can't see anything wrong with it. Do
you have any ideas?

Thanks!
Maxime

--=20
Maxime Ripard, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com

--uf6l7xbfwiwgvjtl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE0VqZU19dR2zEVaqr0rTAlCFNr3QFAlqdVioACgkQ0rTAlCFN
r3RdAA/9EpwfF24QYruxZx56bFPVYxs2ClPpzZ0mcvd30PXLaoulznyeVeuNQ5vk
AturPS37xMUZ0NDWe9C5Cf3BRLtOTse3dB4Nw5mCiYr5YW3lzllpNn0CxBOa1IWk
8zHDzLmH8p3KALXXZsN7WngMEE37YLO0RM7EXPXhDpz8XNSznv7S8r/2p/BByIJK
eBuPeUfz+XS7wC+A+hGTrimCE8esh0o2EQ/BUK0QtB9trUrI+AM00/1SP9YlybMw
13ddPrP1moZtBYLDrJM8fKtq5yFqOsqIg2kaN3M0YQwFmhkihFyXbj5kgykrufGS
ig+7vxWrU0YXLlQoSKcys4LTk5AHB63EdM/bHXLZrYBOhXdxUeJR3LQ1TyofAm7E
LZRnzgdaKw/x1VRgifMhA334pmexaK7DV2tz7Ajkt19ojjQNqqZBxV1K2FdV2dAb
iBeQFyJE8xg0PaQYiBs48aP7cpfVhSqLNckdbbGISO22+QU11q/j7cDwblyLgw9F
RTBMbyK9dXnvuh2AmQpH9jFeLOSJEtJ1o4VUQQVyHGannFbKomkA9X2RictL5uVU
oAxzRwqI85bybiKnrFLVPNz2F6ootSEB6e9d4pvX1jsj2z9ei8G4SUmwmyLVEgs9
ZFKqf3VGfYP17DLy0TTzvoatyFaWu9ZOkir7TYHH0yAUNoeUb/8=
=NLHv
-----END PGP SIGNATURE-----

--uf6l7xbfwiwgvjtl--

--===============1842394781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============1842394781==--
