Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1997B6EA43
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 15:55:12 +0000 (UTC)
From: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>
Date: Mon, 4 Oct 2021 15:42:28 +0000
Message-ID: <7c206aba165a465aa14b465c72b6802c@intel.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
In-Reply-To: <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read
 output_bpc on AMD hardware
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, "Latvala, Petri" <petri.latvala@intel.com>
Cc: Stylon Wang <stylon.wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "nicholas.choi@amd.com" <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

Filed https://gitlab.freedesktop.org/drm/intel/-/issues/4262 and re-reporte=
d.
igt@kms_lease@invalid-create-leases - fail - Failed assertion: create_lease=
(data->master.fd, &mcl) =3D=3D -22

Lakshmi.

-----Original Message-----
From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>=20
Sent: Monday, October 4, 2021 7:19 AM
To: Latvala, Petri <petri.latvala@intel.com>; Vudum, Lakshminarayana <laksh=
minarayana.vudum@intel.com>
Cc: Stylon Wang <stylon.wang@amd.com>; igt-dev@lists.freedesktop.org; nicho=
las.choi@amd.com
Subject: Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc on=
 AMD hardware

On 10/04, Petri Latvala wrote:
> On Sat, Oct 02, 2021 at 11:15:11AM -0400, Rodrigo Siqueira wrote:
> > Hi Lakshminarayana and Petri,
> >=20
> > I noticed that the CI was not triggered for this patch [1]. Do you=20
> > know why? Is it possible to trigger it?
> >=20
> > 1.=20
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpa
> > tchwork.freedesktop.org%2Fseries%2F95313%2F&amp;data=3D04%7C01%7CRodri
> > go.Siqueira%40amd.com%7C43b5d7ab0731407a2f9008d987278e48%7C3dd8961fe
> > 4884e608e11a82d994e183d%7C0%7C0%7C637689426230154758%7CUnknown%7CTWF
> > pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> > 6Mn0%3D%7C1000&amp;sdata=3DNIEF78%2B74hVRdQPhcCEPVlp4To3iDjkpkkv8VjSC0
> > %2BE%3D&amp;reserved=3D0
>=20
> CI was down for a bit due to server cert issues, testing that and the=20
> other affected series happening in a bit.

Thanks Petri,

I noticed that the CI was triggered for this patch.

Lakshminarayana,

It looks like that we have a false positive	in the result:

  https://patchwork.freedesktop.org/series/95313/

Notice that this patch only changes kms_hdr, but we have a failure in the i=
gt@kms_lease.

Thanks
Siqueira
=20
>=20
> --
> Petri Latvala
>=20
>=20
> >=20
> > Thanks
> > Siqueira
> >=20
> > On 10/01, Stylon Wang wrote:
> > > The first commit with TEST_ONLY flag in bpc-switch subtests could=20
> > > in some cases cause reading of output_bpc on connectors to fail on=20
> > > AMD hardware.
> > >=20
> > > Use ALLOW_MODESET to prevent this from happening.
> > >=20
> > > Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> > > ---
> > >  tests/kms_hdr.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >=20
> > > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index=20
> > > 5b8529c8..a4983b9a 100644
> > > --- a/tests/kms_hdr.c
> > > +++ b/tests/kms_hdr.c
> > > @@ -217,7 +217,7 @@ static void test_bpc_switch_on_output(data_t *dat=
a, igt_output_t *output,
> > >  		igt_plane_set_fb(data->primary, &afb);
> > >  		igt_plane_set_size(data->primary, data->w, data->h);
> > >  		igt_output_set_prop_value(data->output, IGT_CONNECTOR_MAX_BPC, 8);
> > > -		ret =3D igt_display_try_commit_atomic(display, DRM_MODE_ATOMIC_TES=
T_ONLY, NULL);
> > > +		ret =3D igt_display_try_commit_atomic(display,=20
> > > +DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > >  		if (!ret) {
> > >  			data->w =3D afb.width;
> > >  			data->h =3D afb.height;
> > > --
> > > 2.32.0
> > >=20
> >=20
> > --
> > Rodrigo Siqueira
> > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fsi
> > queira.tech%2F&amp;data=3D04%7C01%7CRodrigo.Siqueira%40amd.com%7C43b5d
> > 7ab0731407a2f9008d987278e48%7C3dd8961fe4884e608e11a82d994e183d%7C0%7
> > C0%7C637689426230154758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAi
> > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DVvCE
> > WNlBkZnAm9M1JYeheIlVaUVMkeDiallVz0uUM8o%3D&amp;reserved=3D0

--
Rodrigo Siqueira
https://siqueira.tech
