Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Fri, 4 Mar 2022 15:46:07 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Message-ID: <20220304144607.3pwfwhxf4zsckan7@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="tyvx4fbzag6vl4aq"
Content-Disposition: inline
Subject: [igt-dev] Writeback Assumptions for XRGB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Dom Cobley <dom@raspberrypi.com>, Tim Gover <tim.gover@raspberrypi.com>,
 Phil Elwell <phil@raspberrypi.com>, Brian Starkey <brian.starkey@arm.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--tyvx4fbzag6vl4aq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

The writeback-check-output is currently broken on vc4.

It's in part due to a bug in the kernel driver that results in a page
flip timeout, but once that's fixed the test is still broken, and I'm
not sure how to solve this one.

Indeed, the frame comparison is done between the (XRGB8888) buffer we
assign to a plane, and then the buffer we get from the writeback
connector. We then run a hashing function on both buffers, and compare
the hash, and those hashes won't match.

Indeed, while the input buffer uses 0xff for the X component, we'll get
back 0x00 from the hardware, and thus the hashes are not identical. We
can force the hardware to always set it to 0xff, but that doesn't seem
right. It would make more sense to ignore the X component entirely in
that case.

What do you think?

--tyvx4fbzag6vl4aq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYiImLwAKCRDj7w1vZxhR
xfqDAQCHe/LJ6cysCJ/xhHmCFWNFAFn2x7dku1A4EmRNN4fznwD9FhqUWIBaCQe1
oCSOZfWhdamXjAen8Iafi2fqn8a0cgQ=
=oKRg
-----END PGP SIGNATURE-----

--tyvx4fbzag6vl4aq--
