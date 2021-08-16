Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDC7589890
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 17:44:46 +0000 (UTC)
Date: Mon, 16 Aug 2021 20:44:43 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Message-ID: <YRqkCz4FiTazjzvp@intel.com>
References: <20210803110934.970874-1-ayaz.siddiqui@intel.com>
 <YRqYoyZYLCVn4K9+@intel.com>
 <BL3PR11MB5746DEF816F5DB7604497361FCFD9@BL3PR11MB5746.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <BL3PR11MB5746DEF816F5DB7604497361FCFD9@BL3PR11MB5746.namprd11.prod.outlook.com>
Subject: Re: [igt-dev] [PATCH i-g-t 0/1] lib/rendercopy_gen9: Program
 platform specific MOCS index
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
To: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Mon, Aug 16, 2021 at 05:25:26PM +0000, Siddiqui, Ayaz A wrote:
>=20
>=20
> > -----Original Message-----
> > From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> > Sent: Monday, August 16, 2021 10:26 PM
> > To: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> > Cc: igt-dev@lists.freedesktop.org
> > Subject: Re: [igt-dev] [PATCH i-g-t 0/1] lib/rendercopy_gen9: Program
> > platform specific MOCS index
> >=20
> > On Tue, Aug 03, 2021 at 04:39:33PM +0530, Ayaz A Siddiqui wrote:
> > > Since Gen12 onward PTE based catchability is not supported to changing
> > > PTE index to UC as safest  catchability.
> >=20
> > That doesn't make any sense to me. Without a PTE MOCS setting all buffe=
rs
> > that have the potential of becoming scanout buffers will have to be UC,
> > which doesn't sound particularly great.
> Well  there is no PTE MOCS in gen12

Hmm. I don't see any statement to that effect in bspec.

> so if PTE MOCS index is being selected
> then It may be come L3_WB for one platform and UC for another platform.
> These tests are not doing cache flush to WB_L3 leads to data corruption.
> So if  WB_L3 is needed some test  then proper flush need to be added.

Why are we talking about L3 here? L3 has always been a bit of mess.
I think currently we're still setting L3=3D=3DWB on some platforms the the
MOCS=3D=3DPTE case, but we should probably change all those to say L3=3D=3D=
UC
to avoid L3 evictions going to LLC despite having LLC=3D=3DUC in the PTE.

IIRC last I looked at this BDW was the main problem child since it doesn't
seem to have a way to to say L3=3D=3DUC+LLC=3D=3DPTE. But SKL+ have the MOCS
table which can say that and thus should have no problems.

> >=20
> > Also we do have the PTE MOCS index still programmed on gen12 AFAICS.
> Yes it may be the case, all those tests need to be corrected to use corre=
ct
> MOCS index.

Tests are the least of our worries. The real problem is actual
userspace: Mesa/media/etc.

>=20
> Regards
> -Ayaz
>=20
> >=20
> > >
> > > Based on further need, we may move intel_get_uc_mocs() in some
> > common
> > > file, so that it can be useed for providing uc index for other module=
s also.
> > >
> > >
> > > Ayaz A Siddiqui (1):
> > >   lib/rendercopy_gen9: Program MOCS value based on platform
> > >
> > >  lib/rendercopy_gen9.c | 33 ++++++++++++++++++++++++++++++++-
> > >  1 file changed, 32 insertions(+), 1 deletion(-)
> > >
> > > --
> > > 2.26.2
> >=20
> > --
> > Ville Syrj=E4l=E4
> > Intel

--=20
Ville Syrj=E4l=E4
Intel
