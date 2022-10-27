Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Thu, 27 Oct 2022 16:48:16 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <20221027144816.55nfbdigv6sdtzte@houat>
References: <20221024124323.tfyxcadyd4nz56jz@houat>
 <CAF6AEGuokyL+_ZsWeeMeyCcyErapka0ALZQ60bdWKvja3gcN9Q@mail.gmail.com>
 <Y1a2Eb1rwMyk35v+@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="hryfgyrshov2vr2z"
Content-Disposition: inline
In-Reply-To: <Y1a2Eb1rwMyk35v+@intel.com>
Subject: Re: [igt-dev] Must-Pass Test Suite for KMS drivers
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Petri Latvala <petri.latvala@intel.com>,
 Tim Gover <tim.gover@raspberrypi.com>, David Airlie <airlied@linux.ie>,
 Martin Roukala <martin.roukala@mupuf.org>, dri-devel@lists.freedesktop.org,
 igt-dev@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Phil Elwell <phil@raspberrypi.com>,
 Dom Cobley <dom@raspberrypi.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--hryfgyrshov2vr2z
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 24, 2022 at 06:58:09PM +0300, Ville Syrj=E4l=E4 wrote:
> On Mon, Oct 24, 2022 at 08:48:15AM -0700, Rob Clark wrote:
> > On Mon, Oct 24, 2022 at 5:43 AM <maxime@cerno.tech> wrote:
> > >
> > > Hi,
> > >
> > > I've discussing the idea for the past year to add an IGT test suite t=
hat
> > > all well-behaved KMS drivers must pass.
> > >
> > > The main idea behind it comes from v4l2-compliance and cec-compliance,
> > > that are being used to validate that the drivers are sane.
> > >
> > > We should probably start building up the test list, and eventually
> > > mandate that all tests pass for all the new KMS drivers we would merge
> > > in the kernel, and be run by KCi or similar.
> >=20
> > Let's get https://patchwork.freedesktop.org/patch/502641/ merged
> > first, that already gives us a mechanism similar to what we use in
> > mesa to track pass/fail/flake
> >=20
> > Beyond that, I think some of the igt tests need to get more stable
> > before we could consider a "mustpass" list.  The kms_lease tests seem
> > to fail on msm due to bad assumptions in the test about which CRTCs
> > primary planes can attach to.  The legacy-cursor crc tests seem a bit
> > racy (there was a patch posted for that, not sure if it landed yet),
> > etc.
>=20
> I think the safest set to start with would be pure uapi validation
> stuff. Anything that interactics with real world hardware is a much
> tougher cookie.

So I guess we would remove kms_cursor_legacy, kms_lease and
kms_tv_load_detect. Anything else?

Thanks!
Maxime

--hryfgyrshov2vr2z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1qaMAAKCRDj7w1vZxhR
xdbNAQDGvgGpaGi63FdPVXHQVx7tjRK8xRj050ueihu9seFNNwD/etyKgSasZzS3
jth4BRXcplPHLioNVqAJFfF+4iZ1EwU=
=UgYb
-----END PGP SIGNATURE-----

--hryfgyrshov2vr2z--
