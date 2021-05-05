Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D96A6EC7F
 for <igt-dev@lists.freedesktop.org>; Wed,  5 May 2021 23:07:50 +0000 (UTC)
Date: Wed, 5 May 2021 19:07:44 -0400
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Message-ID: <20210505230744.z6hgbbx2hsvsvsxb@outlook.office365.com>
References: <20210429192628.4056795-1-imre.deak@intel.com>
 <20210429192628.4056795-2-imre.deak@intel.com>
 <20210505002305.7bagmdtisnu6hsiw@outlook.office365.com>
 <20210505102737.GA126925@ideak-desk.fi.intel.com>
In-Reply-To: <20210505102737.GA126925@ideak-desk.fi.intel.com>
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t 1/3] tests/kms_ccs: Skip CCS color clear
 value check for randomizing subtests
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1662959969=="
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Imre Deak <imre.deak@intel.com>
Cc: igt-dev@lists.freedesktop.org
List-ID: <igt-dev@lists.freedesktop.org>

--===============1662959969==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="w5je3bujjwcawly7"
Content-Disposition: inline

--w5je3bujjwcawly7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 05/05, Imre Deak wrote:
> Hi,
>=20
> On Tue, May 04, 2021 at 08:23:05PM -0400, Rodrigo Siqueira wrote:
> > Hi,
> >=20
> > I looked at kms_ccs and tried to find a reference for "color control
> > surfaces" in DRM, and I found multiple references for this format in
> > i915.
>=20
> CCS means here Compression Control Surface. Yes, the render and media
> GPU engines use their own compression format, hence multiple CCS
> modifiers are needed. There are also format differences between
> platforms, which further increases the number of modifiers.
>=20
> > Is it an Intel-specific format? Is kms_ccs a test that can be
> > executed in different ASICs?
>=20
> Yes, the CCS FB modifiers are Intel specific and kms_ccs will not run on
> other platforms.

Thanks for the explanation.
=20
> --Imre
>=20
> > Thanks
> > Siqueira
> >=20
> > On 04/29, Imre Deak wrote:
> > > When filling the color planes with randomized content, the color clear
> > > values won't match what the HW actually wrote there, so skip the clear
> > > value check in this case.
> > >=20
> > > Cc: Juha-Pekka Heikkila <juhapekka.heikkila@gmail.com>
> > > Cc: Mika Kahola <mika.kahola@intel.com>
> > > Cc: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > > Signed-off-by: Imre Deak <imre.deak@intel.com>
> > > ---
> > >  tests/kms_ccs.c | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >=20
> > > diff --git a/tests/kms_ccs.c b/tests/kms_ccs.c
> > > index 30e0fdb54..61c9b2277 100644
> > > --- a/tests/kms_ccs.c
> > > +++ b/tests/kms_ccs.c
> > > @@ -195,7 +195,7 @@ static void check_ccs_cc_plane(int drm_fd, igt_fb=
_t *fb, int plane, const float
> > >  	munmap(map, fb->size);
> > >  };
> > > =20
> > > -static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const flo=
at *cc_color)
> > > +static void check_all_ccs_planes(int drm_fd, igt_fb_t *fb, const flo=
at *cc_color, bool check_cc_plane)
> > >  {
> > >  	int i;
> > > =20
> > > @@ -203,7 +203,7 @@ static void check_all_ccs_planes(int drm_fd, igt_=
fb_t *fb, const float *cc_color
> > >  		if (igt_fb_is_ccs_plane(fb, i) &&
> > >  		    !igt_fb_is_gen12_ccs_cc_plane(fb, i))
> > >  			check_ccs_plane(drm_fd, fb, i);
> > > -		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i))
> > > +		else if (igt_fb_is_gen12_ccs_cc_plane(fb, i) && check_cc_plane)
> > >  			check_ccs_cc_plane(drm_fd, fb, i, cc_color);
> > >  	}
> > >  }
> > > @@ -348,7 +348,7 @@ static void generate_fb(data_t *data, struct igt_=
fb *fb,
> > >  		igt_assert_eq(ret, 0);
> > > =20
> > >  	if (check_ccs_planes)
> > > -		check_all_ccs_planes(data->drm_fd, fb, cc_color);
> > > +		check_all_ccs_planes(data->drm_fd, fb, cc_color, !(data->flags & T=
EST_RANDOM));
> > > =20
> > >  	fb->fb_id =3D f.fb_id;
> > >  }
> > > --=20
> > > 2.27.0
> > >=20
> > > _______________________________________________
> > > igt-dev mailing list
> > > igt-dev@lists.freedesktop.org
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fl=
ists.freedesktop.org%2Fmailman%2Flistinfo%2Figt-dev&amp;data=3D04%7C01%7CRo=
drigo.Siqueira%40amd.com%7Cedb4aea1c4e249252dfb08d90fb06aef%7C3dd8961fe4884=
e608e11a82d994e183d%7C0%7C0%7C637558072643709539%7CUnknown%7CTWFpbGZsb3d8ey=
JWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp=
;sdata=3D%2FwF620WrokFKD77Athnep%2FYb%2BY6AFOl%2FPj%2B%2F1PdCfL0%3D&amp;res=
erved=3D0
> >=20
> > --=20
> > Rodrigo Siqueira
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsiq=
ueira.tech%2F&amp;data=3D04%7C01%7CRodrigo.Siqueira%40amd.com%7Cedb4aea1c4e=
249252dfb08d90fb06aef%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C63755807=
2643719534%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJB=
TiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DoKsprNNETtsy012m2FFAtNiX71Nfs=
Txjapl1FW2dEcw%3D&amp;reserved=3D0
>=20
>=20

--=20
Rodrigo Siqueira
https://siqueira.tech

--w5je3bujjwcawly7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE4tZ+ii1mjMCMQbfkWJzP/comvP8FAmCTJTsACgkQWJzP/com
vP/w5hAAyD0QCMqaBVIeHzAhCW/AvO3hYl+cGfglCh4bP+CezOfTM0zijMf3lvvU
xJlR4gK/2r1OJP5AgVsmzidS2y+5OA4m63dn1VCyNCJI06H7Lpeed3IAfG08W6mI
kBn4WbV3QTvz/yMs1N/6NuPpaSMD+DAN8zXY1/2udfx4I24zyYble8dGsOeOTe3T
tz2E5Hs5gCrxtYYwLAGXNd1jHfpomiTta8zUu5sXynMnKtsKG0hStX07aaMVKkfg
mD3elFxdW4IZVeLVMnPc9ekJ/BLOF9uvYdmrBZCFtW1f5NKALxMYdlBcjqkwHLh7
CGjS4owKYnHg4IGMQvxqguyZV+4HFmplnW4JaA3gA2Tb0BD67Y7/LWhoyDAJAN/l
UqSuRDoXjnztfv+bzwiXjN16TEs+UjTPjDtekeYZkdJwib2LGs/4jix72W4oDq2k
tpm7McC8icmEgY2OuQWVhZhfrImNc4LQ6eKEIuN0VqTbWLH5H2qe2IfN865Y6HeF
+WD8HNN7PkuCyvql1xEK1s6xMNKuFYC9Gx5roQSzEcudiy1UQVJpiHlAYUNSfqQO
+qcJikvHr5faxUCwWj09y5OSlH1ki7JQkobFee6yhBVvCNrs8OAFy64w5buKkW9l
U0GjdhlSBD/BVLFUYzp562fx6Pv+NA6Yp2el4B3afv/woW0z31w=
=qhz8
-----END PGP SIGNATURE-----

--w5je3bujjwcawly7--

--===============1662959969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
igt-dev mailing list
igt-dev@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/igt-dev

--===============1662959969==--
