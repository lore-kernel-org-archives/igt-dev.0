Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 16:55:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <20220308155523.nhbg4i3y66pm3x55@houat>
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="az3d6kpqqzu5hmzq"
Content-Disposition: inline
In-Reply-To: <YiCeCeNobS2FCiQB@intel.com>
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--az3d6kpqqzu5hmzq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Rodrigo,

On Thu, Mar 03, 2022 at 05:52:57AM -0500, Rodrigo Vivi wrote:
> On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > Hi,
> >=20
> > Back at XDC we floated the idea of creating a test suite for IGT that we
> > expect any KMS driver to pass, similar to what v4l2-compliance and
> > cec-compliance provide for v4l2 and CEC respectively.
> >=20
> > I was looking at the list of tests, and it's fairly massive, so it's not
> > clear to me what tests we could start this suite with. I can only assume
> > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > good start?
> >=20
> > What do you think?
>=20
> I believe we should start with the group of the tests that we know that
> are reliably passing today on most of the platforms and then increase
> the list as the tests and drivers become more reliable.

I can see why that would be an objective too, but I'm not sure it would
cover mine. What I'd like this series to be is something we can ask
upfront to new drivers being submitted to make sure that they are sane.

Whether or not old drivers pass that bar is a bit irrelevant to that
objective (and this would actually create tasks for newcomers that are
looking for something to work on).

So, yeah, I don't mind having failing tests on older drivers, I kind of
even expect them to fail somehow. It would essentially be a bar to show
what any driver should strive for, not the lowest common denominator.

Does that make sense?

> For instance, many of these would be candidate to be filtered out for now
> https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=3Dkms
>=20
> compared to the whole view of kms tests:
> https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=3Dkms

So the set of tests that are always run would be the latter, right?

Maxime

--az3d6kpqqzu5hmzq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYid8awAKCRDj7w1vZxhR
xT2LAP9nq0W8cnjXaiqZWyA0fWnsNV6+F4ZuzrLPeV2ZyR232AEAyRR+VOMRVipC
lK7DS4JQxYaR03qcrJJq9eN/QrO8sAk=
=MdhL
-----END PGP SIGNATURE-----

--az3d6kpqqzu5hmzq--
