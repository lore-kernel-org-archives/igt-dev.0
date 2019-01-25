Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D787A6E41A
 for <igt-dev@lists.freedesktop.org>; Fri, 25 Jan 2019 00:09:37 +0000 (UTC)
From: "Souza, Jose" <jose.souza@intel.com>
Date: Fri, 25 Jan 2019 00:09:35 +0000
Message-ID: <de983ad1947c1394912f37e8f6d4d011a0073790.camel@intel.com>
References: <20190123235636.8720-1-jose.souza@intel.com>
 <f19eff1547f6f8571bee6d60440a8dcf2f9f687b.camel@intel.com>
 <20190124063953.GA2011@intel.com>
 <d41009c1bc2e4a1754202b7551a5c4e33ccd73c4.camel@intel.com>
 <3580f621177077a72863b4ad1df35ea4d6dbbde3.camel@intel.com>
 <20190124220656.GC6671@intel.com>
In-Reply-To: <20190124220656.GC6671@intel.com>
Content-Language: en-US
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v4 1/4] test/psr: Skip PSR2 tests when
 panel resolution is bigger than PSR2 HW supports
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0504079329=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "Pandiyan, Dhinakaran" <dhinakaran.pandiyan@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

--===============0504079329==
Content-Language: en-US
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="=-wjPqA5+VQQouyEQv4mSP"

--=-wjPqA5+VQQouyEQv4mSP
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2019-01-24 at 14:06 -0800, Rodrigo Vivi wrote:
> On Thu, Jan 24, 2019 at 11:02:51AM -0800, Dhinakaran Pandiyan wrote:
> > On Thu, 2019-01-24 at 10:20 -0800, Souza, Jose wrote:
> > > On Wed, 2019-01-23 at 22:39 -0800, Rodrigo Vivi wrote:
> > > > On Wed, Jan 23, 2019 at 06:25:07PM -0800, Dhinakaran Pandiyan
> > > > wrote:
> > > > > On Wed, 2019-01-23 at 15:56 -0800, Jos=C3=A9 Roberto de Souza
> > > > > wrote:
> > > > > > If resolution that will be used in PSR tests is bigger than
> > > > > > the
> > > > > > resolution that PSR2 HW supports, PSR2 will not be enabled
> > > > > > so
> > > > > > those
> > > > > > tests should be skiped. Most of eDP panels only supports
> > > > > > one
> > > > > > resolution that is why we don't even try to use other
> > > > > > resolution.
> > > > > >=20
> > > > > > BSpec: 7713
> > > > >=20
> > > > > I don't like the fact that we are re-implementing driver code
> > > > > in
> > > > > the
> > > > > test to avoid false-positives. We should really replace the
> > > > > panel
> > > > > on
> > > > > the WHL machine with a panel that is expected to work.=20
> > > > >=20
> > > >=20
> > > > I fully agree. The debugfs should be auto-suficient.
> > > >=20
> > > > In the past it was the idea of Source OK. if sink support yes
> > > > and
> > > > source ok
> > That had a problem too, "Source OK" was set after driver completed
> > all
> > the checks and just before enabling PSR2. In effect, it started
> > becoming a duplicate of the "Enabled" field and we weren't able to
> > catch if the driver checks before psr_enable() were wrong.
>=20
> yeap, this is true indeed...
>=20
> But we need to find a way where the debugfs tells us if
> conditions are not match and enable is not expected to
> avoid having to reimplement all the conditions twice.

I could add a reason field to debugfs and like we have for FBC(fbc-
>no_fbc_reason)

What do you think?

>=20
> >=20
> > > > and we tried to enabled but it is not getting active,
> > > > than we have a bug somewhere.
> > > >=20
> > > > I don't know the current status of the psr debugfs anymore, but
> > > > I believe the test case should infer this information from
> > > > there
> > > > somehow instead of re-implement the driver code here.
> > > >=20
> > > > > But, as a temporary measure to make CI happy and enable PSR2.
> > > >=20
> > > > why is this only affecting PSR2 case?
> > >=20
> > > PSR2 has a maximum resolution suported and the only resolution
> > > that
> > > CI
> > > eDP panel supports is bigger than that.
> > >=20
> > > > > Reviewed-by: Dhinakaran Pandiyan <
> > > > > dhinakaran.pandiyan@intel.com>
> > > > >=20
> > > > > Rodrigo, what's your opinion on this?
> > > > >=20
> > > > > -DK
> > > > > > Cc: Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Signed-off-by: Jos=C3=A9 Roberto de Souza <jose.souza@intel.com=
>
> > > > > > ---
> > > > > >  tests/kms_psr.c | 21 +++++++++++++++++++--
> > > > > >  1 file changed, 19 insertions(+), 2 deletions(-)
> > > > > >=20
> > > > > > diff --git a/tests/kms_psr.c b/tests/kms_psr.c
> > > > > > index 3e16a6bf..4792e158 100644
> > > > > > --- a/tests/kms_psr.c
> > > > > > +++ b/tests/kms_psr.c
> > > > > > @@ -445,13 +445,30 @@ int main(int argc, char *argv[])
> > > > > >  		igt_require_f(sink_support(&data, PSR_MODE_1),
> > > > > >  			      "Sink does not support PSR\n");
> > > > > > =20
> > > > > > -		data.supports_psr2 =3D sink_support(&data,
> > > > > > PSR_MODE_2);
> > > > > > -
> > > > > >  		data.bufmgr =3D
> > > > > > drm_intel_bufmgr_gem_init(data.drm_fd,
> > > > > > 4096);
> > > > > >  		igt_assert(data.bufmgr);
> > > > > >  		drm_intel_bufmgr_gem_enable_reuse(data.bufmgr);
> > > > > > =20
> > > > > >  		display_init(&data);
> > > > > > +
> > > > > > +		data.supports_psr2 =3D sink_support(&data,
> > > > > > PSR_MODE_2);
> > > > > > +		if (data.supports_psr2) {
> > > > > > +			uint32_t devid =3D
> > > > > > intel_get_drm_devid(data.drm_fd);
> > > > > > +			uint16_t max_h =3D 0, max_v =3D 0;
> > > > > > +			int gen =3D intel_gen(devid);
> > > > > > +
> > > > > > +			if (gen >=3D 10 || IS_GEMINILAKE(devid))
> > > > > > {
> > > > > > +				max_h =3D 4096;
> > > > > > +				max_v =3D 2304;
> > > > > > +			} else if (gen =3D=3D 9) {
> > > > > > +				max_h =3D 3640;
> > > > > > +				max_v =3D 2304;
> > > > > > +			}
> > > > > > +
> > > > > > +			if (data.mode->hdisplay > max_h ||
> > > > > > +			    data.mode->vdisplay > max_v)
> > > > > > +				data.supports_psr2 =3D false;
> > > > > > +		}
> > > > > >  	}
> > > > > > =20
> > > > > >  	for (data.op_psr_mode =3D PSR_MODE_1; data.op_psr_mode <=3D
> > > > > > PSR_MODE_2;
> >=20
> > _______________________________________________
> > igt-dev mailing list
> > igt-dev@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/igt-dev

--=-wjPqA5+VQQouyEQv4mSP
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEVNG051EijGa0MiaQVenbO/mOWkkFAlxKU70ACgkQVenbO/mO
WklnUggAov2ds6tYWLK/wuzyCxJIv96mw2tC+tx9bRVIPXmnpQ2l/YdTgTz6eY74
xEbY2LI5doiUU3j9h3uP2ecG5CwEnQccGhXZEbrqAYyaq6G2612xI+QYInBc7Pnf
7MK+fps+NlsIZ1luawpVTZnEgWE4tU3b9G+MvMem5Le82yMJk0mpU5rew+qh+6nT
JKNKrFvZbvzDj0mUZWHV6wDLhNqSFaa0qwO7yQ9uBHrmAarfOd6BkGhMM0Cq12PP
qhrFj8SRLAyk67W+z7YtB1gOnb/5KaHWIQHf/5h0D3d3fR3NXVp626WFfBkDbgZa
Xe6R28ym1kvzOuAyJ/4k14FfWcQZyQ==
=QJFW
-----END PGP SIGNATURE-----

--=-wjPqA5+VQQouyEQv4mSP--

--===============0504079329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KaWd0LWRldiBt
YWlsaW5nIGxpc3QKaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9pZ3QtZGV2Cg==

--===============0504079329==--
