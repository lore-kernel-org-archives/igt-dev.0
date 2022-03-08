Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 15:11:44 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Pekka Paalanen <ppaalanen@gmail.com>
Message-ID: <20220308141144.ldwxoc2ljd2wq4fb@houat>
References: <20220304144607.3pwfwhxf4zsckan7@houat>
 <20220308102624.1a757e36@eldfell>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ed6vltlmmj2365mc"
Content-Disposition: inline
In-Reply-To: <20220308102624.1a757e36@eldfell>
Subject: Re: [igt-dev] Writeback Assumptions for XRGB
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Tim Gover <tim.gover@raspberrypi.com>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--ed6vltlmmj2365mc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

On Tue, Mar 08, 2022 at 10:26:24AM +0200, Pekka Paalanen wrote:
> On Fri, 4 Mar 2022 15:46:07 +0100
> Maxime Ripard <maxime@cerno.tech> wrote:
>=20
> > Indeed, while the input buffer uses 0xff for the X component, we'll get
> > back 0x00 from the hardware, and thus the hashes are not identical. We
> > can force the hardware to always set it to 0xff, but that doesn't seem
> > right. It would make more sense to ignore the X component entirely in
> > that case.
>=20
> Hi,
>=20
> I tried hard to send a slightly longer response, but gmail refuses to
> deliver to anyone without explanation.

For reference (and archives), this was your original message:

> > if a pixel component is marked X, then its value must not have any
> > observable effect when passed over an interface to another
> > component. To me there is no doubt about that.
> >
> > OTOH, if both output and writeback FBs had ARGB instead of XRGB,
> > things would be more complicated. Quite likely the CRTC background
> > color is opaque (or maybe HDMI and DP cannot transmit alpha meaning
> > that writeback with alpha < 1.0 makes no sense), which means that no
> > matter what A values goes in, writeback A will always come out as
> > 0xff (on 8 bpc). One might be able to argue otherwise on this.
> >
> > I would actually recommend IGT to put pseudo-random garbage on X
> > channels to catch drivers and hardware that unexpectedly uses the X
> > values. I've used this trick with weston-simple-shm:
> > https://ppaalanen.blogspot.com/2012/04/improved-appearance-for-simplest=
=2Ehtml
> >
> > Pixel component values 0x00 and 0xff are weak for testing blending
> > and composition.
>
> So here's a summary of my opinion:
>=20
> - KMS must ignore X channel contents on read
> - IGT must ignore X channel contents when comparing results
> - it would be nice if IGT filled image X channels with garbage to
>   verify the first two points

That works for me :)

I'll work on a series of patches addressing this then

Thanks!
Maxime

--ed6vltlmmj2365mc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYidkIAAKCRDj7w1vZxhR
xe6pAP9foWN6/6xHwM2hnJd8GLUsrRL11wgpQ0+CnrwU+BqeBQD/UOWvuFFz3qAk
qS+/UqEFjTrmQmsHmBbwmTpbovwmxgY=
=YW6+
-----END PGP SIGNATURE-----

--ed6vltlmmj2365mc--
