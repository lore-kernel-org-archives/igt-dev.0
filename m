Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B4A66E1D5
 for <igt-dev@lists.freedesktop.org>; Mon,  4 Oct 2021 17:26:10 +0000 (UTC)
From: "Saarinen, Jani" <jani.saarinen@intel.com>
Date: Mon, 4 Oct 2021 17:07:44 +0000
Message-ID: <DM8PR11MB5655AF5FCCDDD8EAB30C92B0E0AE9@DM8PR11MB5655.namprd11.prod.outlook.com>
References: <20211001085319.789392-1-stylon.wang@amd.com>
 <20211002151511.vjblbkuoymw4jtyi@outlook.office365.com>
 <YVrh5zBX9mLq4Zg2@platvala-desk.ger.corp.intel.com>
 <20211004141835.uzqrsamqgdstee2q@outlook.office365.com>
 <7c206aba165a465aa14b465c72b6802c@intel.com>
In-Reply-To: <7c206aba165a465aa14b465c72b6802c@intel.com>
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
To: "Vudum, Lakshminarayana" <lakshminarayana.vudum@intel.com>, Rodrigo
 Siqueira <Rodrigo.Siqueira@amd.com>, "Latvala, Petri" <petri.latvala@intel.com>, Simon Ser <contact@emersion.fr>
Cc: Stylon Wang <stylon.wang@amd.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "nicholas.choi@amd.com" <nicholas.choi@amd.com>
List-ID: <igt-dev@lists.freedesktop.org>

+Simon.=20

> -----Original Message-----
> From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of Vudum,
> Lakshminarayana
> Sent: maanantai 4. lokakuuta 2021 18.42
> To: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>; Latvala, Petri
> <petri.latvala@intel.com>
> Cc: Stylon Wang <stylon.wang@amd.com>; igt-dev@lists.freedesktop.org;
> nicholas.choi@amd.com
> Subject: Re: [igt-dev] [PATCH i-g-t] tests/kms_hdr: Fix failure to read o=
utput_bpc on
> AMD hardware
>=20
> Filed https://gitlab.freedesktop.org/drm/intel/-/issues/4262 and re-repor=
ted.
> igt@kms_lease@invalid-create-leases - fail - Failed assertion: create_lea=
se(data-
> >master.fd, &mcl) =3D=3D -22
>=20
> Lakshmi.
>=20
> -----Original Message-----
> From: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> Sent: Monday, October 4, 2021 7:19 AM
> To: Latvala, Petri <petri.latvala@intel.com>; Vudum, Lakshminarayana
> <lakshminarayana.vudum@intel.com>
> Cc: Stylon Wang <stylon.wang@amd.com>; igt-dev@lists.freedesktop.org;
> nicholas.choi@amd.com
> Subject: Re: [PATCH i-g-t] tests/kms_hdr: Fix failure to read output_bpc =
on AMD
> hardware
>=20
> On 10/04, Petri Latvala wrote:
> > On Sat, Oct 02, 2021 at 11:15:11AM -0400, Rodrigo Siqueira wrote:
> > > Hi Lakshminarayana and Petri,
> > >
> > > I noticed that the CI was not triggered for this patch [1]. Do you
> > > know why? Is it possible to trigger it?
> > >
> > > 1.
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fp=
a
> > > tchwork.freedesktop.org%2Fseries%2F95313%2F&amp;data=3D04%7C01%7CRodr=
i
> > >
> go.Siqueira%40amd.com%7C43b5d7ab0731407a2f9008d987278e48%7C3dd8961fe
> > >
> 4884e608e11a82d994e183d%7C0%7C0%7C637689426230154758%7CUnknown%7C
> TWF
> > > pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI
> > >
> 6Mn0%3D%7C1000&amp;sdata=3DNIEF78%2B74hVRdQPhcCEPVlp4To3iDjkpkkv8VjSC0
> > > %2BE%3D&amp;reserved=3D0
> >
> > CI was down for a bit due to server cert issues, testing that and the
> > other affected series happening in a bit.
>=20
> Thanks Petri,
>=20
> I noticed that the CI was triggered for this patch.
>=20
> Lakshminarayana,
>=20
> It looks like that we have a false positive	in the result:
>=20
>   https://patchwork.freedesktop.org/series/95313/
>=20
> Notice that this patch only changes kms_hdr, but we have a failure in the
> igt@kms_lease.
>=20
> Thanks
> Siqueira
>=20
> >
> > --
> > Petri Latvala
> >
> >
> > >
> > > Thanks
> > > Siqueira
> > >
> > > On 10/01, Stylon Wang wrote:
> > > > The first commit with TEST_ONLY flag in bpc-switch subtests could
> > > > in some cases cause reading of output_bpc on connectors to fail on
> > > > AMD hardware.
> > > >
> > > > Use ALLOW_MODESET to prevent this from happening.
> > > >
> > > > Signed-off-by: Stylon Wang <stylon.wang@amd.com>
> > > > ---
> > > >  tests/kms_hdr.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/tests/kms_hdr.c b/tests/kms_hdr.c index
> > > > 5b8529c8..a4983b9a 100644
> > > > --- a/tests/kms_hdr.c
> > > > +++ b/tests/kms_hdr.c
> > > > @@ -217,7 +217,7 @@ static void test_bpc_switch_on_output(data_t *d=
ata,
> igt_output_t *output,
> > > >  		igt_plane_set_fb(data->primary, &afb);
> > > >  		igt_plane_set_size(data->primary, data->w, data->h);
> > > >  		igt_output_set_prop_value(data->output,
> IGT_CONNECTOR_MAX_BPC, 8);
> > > > -		ret =3D igt_display_try_commit_atomic(display,
> DRM_MODE_ATOMIC_TEST_ONLY, NULL);
> > > > +		ret =3D igt_display_try_commit_atomic(display,
> > > > +DRM_MODE_ATOMIC_ALLOW_MODESET, NULL);
> > > >  		if (!ret) {
> > > >  			data->w =3D afb.width;
> > > >  			data->h =3D afb.height;
> > > > --
> > > > 2.32.0
> > > >
> > >
> > > --
> > > Rodrigo Siqueira
> > > https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fs=
i
> > >
> queira.tech%2F&amp;data=3D04%7C01%7CRodrigo.Siqueira%40amd.com%7C43b5d
> > >
> 7ab0731407a2f9008d987278e48%7C3dd8961fe4884e608e11a82d994e183d%7C0%
> 7
> > >
> C0%7C637689426230154758%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwM
> DAi
> > > LCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DVvC=
E
> > > WNlBkZnAm9M1JYeheIlVaUVMkeDiallVz0uUM8o%3D&amp;reserved=3D0
>=20
> --
> Rodrigo Siqueira
> https://siqueira.tech
