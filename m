Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66BFA89E14
 for <igt-dev@lists.freedesktop.org>; Mon, 16 Aug 2021 17:25:31 +0000 (UTC)
From: "Siddiqui, Ayaz A" <ayaz.siddiqui@intel.com>
Date: Mon, 16 Aug 2021 17:25:26 +0000
Message-ID: <BL3PR11MB5746DEF816F5DB7604497361FCFD9@BL3PR11MB5746.namprd11.prod.outlook.com>
References: <20210803110934.970874-1-ayaz.siddiqui@intel.com>
 <YRqYoyZYLCVn4K9+@intel.com>
In-Reply-To: <YRqYoyZYLCVn4K9+@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
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
To: =?iso-8859-1?Q?Ville_Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>, "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Sent: Monday, August 16, 2021 10:26 PM
> To: Siddiqui, Ayaz A <ayaz.siddiqui@intel.com>
> Cc: igt-dev@lists.freedesktop.org
> Subject: Re: [igt-dev] [PATCH i-g-t 0/1] lib/rendercopy_gen9: Program
> platform specific MOCS index
>=20
> On Tue, Aug 03, 2021 at 04:39:33PM +0530, Ayaz A Siddiqui wrote:
> > Since Gen12 onward PTE based catchability is not supported to changing
> > PTE index to UC as safest  catchability.
>=20
> That doesn't make any sense to me. Without a PTE MOCS setting all buffers
> that have the potential of becoming scanout buffers will have to be UC,
> which doesn't sound particularly great.
Well  there is no PTE MOCS in gen12 so if PTE MOCS index is being selected
then It may be come L3_WB for one platform and UC for another platform.
These tests are not doing cache flush to WB_L3 leads to data corruption.
So if  WB_L3 is needed some test  then proper flush need to be added.
>=20
> Also we do have the PTE MOCS index still programmed on gen12 AFAICS.
Yes it may be the case, all those tests need to be corrected to use correct
MOCS index.

Regards
-Ayaz

>=20
> >
> > Based on further need, we may move intel_get_uc_mocs() in some
> common
> > file, so that it can be useed for providing uc index for other modules =
also.
> >
> >
> > Ayaz A Siddiqui (1):
> >   lib/rendercopy_gen9: Program MOCS value based on platform
> >
> >  lib/rendercopy_gen9.c | 33 ++++++++++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> >
> > --
> > 2.26.2
>=20
> --
> Ville Syrj=E4l=E4
> Intel
