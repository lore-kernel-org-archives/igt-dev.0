Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Date: Tue, 8 Mar 2022 16:57:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Stone <daniel@fooishbar.org>
Message-ID: <20220308155723.jpgpkbavay5ama2u@houat>
References: <20220303090507.grenwdro7u4fzmoe@houat>
 <YiCeCeNobS2FCiQB@intel.com>
 <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="lmjlpxwdpy5jli4o"
Content-Disposition: inline
In-Reply-To: <CAPj87rOjof_WMT32G3-mb-ukVmOxVWJfXEVB4hYbUj0_VCV6ng@mail.gmail.com>
Subject: Re: [igt-dev] Mandatory Test Suite for KMS Drivers?
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>


--lmjlpxwdpy5jli4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

On Fri, Mar 04, 2022 at 08:45:07AM +0000, Daniel Stone wrote:
> On Thu, 3 Mar 2022 at 10:53, Rodrigo Vivi <rodrigo.vivi@intel.com> wrote:
> > On Thu, Mar 03, 2022 at 10:05:07AM +0100, Maxime Ripard wrote:
> > > Back at XDC we floated the idea of creating a test suite for IGT that=
 we
> > > expect any KMS driver to pass, similar to what v4l2-compliance and
> > > cec-compliance provide for v4l2 and CEC respectively.
> > >
> > > I was looking at the list of tests, and it's fairly massive, so it's =
not
> > > clear to me what tests we could start this suite with. I can only ass=
ume
> > > all the KMS (but the chamelium ones) and fbdev related ones would be a
> > > good start?
> > >
> > > What do you think?
> >
> > I believe we should start with the group of the tests that we know that
> > are reliably passing today on most of the platforms and then increase
> > the list as the tests and drivers become more reliable.
> >
> > For instance, many of these would be candidate to be filtered out for n=
ow
> > https://intel-gfx-ci.01.org/tree/drm-next/index.html?testfilter=3Dkms
> >
> > compared to the whole view of kms tests:
> > https://intel-gfx-ci.01.org/tree/drm-next/shards-all.html?testfilter=3D=
kms
>=20
> We are running some of IGT on Panfrost + amdgpu + i915 as part of
> KernelCI as well: go to https://linux.kernelci.org/test/ and search
> for 'igt-gpu'. This gets run for mainline, next, and whatever other
> kernel trees push into i915.

I was mainly interested in KMS, but I saw that there's an igt-kms test
as well, thanks!

> There is a Grafana-based dashboard that the KernelCI team have been
> working on to visualise test runs, but it's currently having some
> backend issues so I can't show you a link for that. I did raise a
> suggestion in their design discussion for a proper testing dashboard
> for making it easier to see the status, so feel free to pile in there:
> https://github.com/kernelci/kernelci-project/discussions/28#discussioncom=
ment-2293696

I'll have a look, thanks
Maxime

--lmjlpxwdpy5jli4o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYid84wAKCRDj7w1vZxhR
xYbLAP9THsui2KO5jnwGsFJhap62n8Zlg1aPGtNv/mMmV4dxDgEA8YSp5DIAaXa7
RhH4OR3ZN7AcXx8wvCYAx4uqV7Uoowk=
=y1yh
-----END PGP SIGNATURE-----

--lmjlpxwdpy5jli4o--
