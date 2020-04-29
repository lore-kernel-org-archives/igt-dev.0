Return-Path: <intel-gfx-bounces@lists.freedesktop.org>
Date: Wed, 29 Apr 2020 17:37:18 +0200
From: Maxime Ripard <maxime@cerno.tech>
Message-ID: <20200429153718.khgg72qutk7uacwv@gilmour.lan>
References: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20200424012605.2279679-1-rodrigosiqueiramelo@gmail.com>
Subject: Re: [Intel-gfx] [PATCH i-g-t v8 0/4] Add support for testing
 writeback connectors
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-gfx>
List-Post: <mailto:intel-gfx@lists.freedesktop.org>
List-Help: <mailto:intel-gfx-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-gfx>,
 <mailto:intel-gfx-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0708948774=="
Errors-To: intel-gfx-bounces@lists.freedesktop.org
Sender: "Intel-gfx" <intel-gfx-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Simon Ser <contact@emersion.fr>, intel-gfx@lists.freedesktop.org, igt-dev@lists.freedesktop.org, nd <nd@arm.com>
List-ID: <igt-dev@lists.freedesktop.org>


--===============0708948774==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cxfgrpsggtxchfcc"
Content-Disposition: inline


--cxfgrpsggtxchfcc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 23, 2020 at 09:26:01PM -0400, Rodrigo Siqueira wrote:
> A couple of months ago, I updated and re-submitted a patchset made by
> Brian Starkey and Liviu Dudau for adding a writeback connectors test to
> IGT. It is important to highlight that DRM already have writeback
> connectors support, which is a way to expose in DRM the hardware
> functionality from display engines that allows writing back into memory
> the result of the DE's composition of supported planes.
>=20
> After I resubmitted the patchset, Simon Ser provides a long and detailed
> review for all of the patches (thanks Simon). Additionally, Maxime
> Ripard tested the previous series in an ARM32 architecture and provided
> his feedback for making this patchset portable (thanks Maxime). I
> finally had time to go through all the details and prepare this new
> version. Follows some notes:
>=20
> 1. Patchset author
>=20
> Brian Starkey is the original author of this patchset, and I'm just
> trying to upstream his changes. Note that during this patch submission,
> the mail server from google going to overwrite Brian's mail by mine;
> this happens on the mail server side for avoiding malicious users to
> send emails as someone else. Note that I could spend time figuring out
> how to fix it, but I think this is not worth since I can fix it during
> the merge process (if it got accepted).
>=20
> 2. Drop the clone commits from the series
>=20
> After Simon's review, we decided to drop the last two patches of the
> original series since it was related to cloning output, and VKMS does
> not support it yet. However, after we finish with this series, I can try
> to take a look at this feature or maybe propose it as a GSoC/Outreachy
> project.
>=20
> Most of the changes happened in the second patch.
>=20
> 3. Cross-platform improvements

I just tested it on top of current master (d095827a) on an RPi running in
32bits, it works like a charm.

Tested-by: Maxime Ripard <mripard@kernel.org>

Thanks!
Maxime

--cxfgrpsggtxchfcc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXqmfLgAKCRDj7w1vZxhR
xdm5AP0cPgNsO9C3BQPUiujFpvYANCvMz6gwBVo/u7gjLJq9YwEA06IGtq6G4jea
N0TyptdIkMnG4vy41pZbnY3g653i6QU=
=3oCg
-----END PGP SIGNATURE-----

--cxfgrpsggtxchfcc--

--===============0708948774==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Intel-gfx mailing list
Intel-gfx@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/intel-gfx

--===============0708948774==--
