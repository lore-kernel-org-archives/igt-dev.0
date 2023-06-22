Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68C2810E13C
 for <igt-dev@lists.freedesktop.org>; Thu, 22 Jun 2023 05:15:50 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dandamudi, Priyanka" <priyanka.dandamudi@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Thu, 22 Jun 2023 05:15:39 +0000
Message-ID: <MW4PR11MB705615B6E99963311A6A3329B322A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230613134156.3315199-1-himal.prasad.ghimiray@intel.com>
 <20230613134156.3315199-3-himal.prasad.ghimiray@intel.com>
 <DM6PR11MB449202248F2842F4AA2F78D18D5CA@DM6PR11MB4492.namprd11.prod.outlook.com>
In-Reply-To: <DM6PR11MB449202248F2842F4AA2F78D18D5CA@DM6PR11MB4492.namprd11.prod.outlook.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related sysfs
 uapi changes.
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Priyanka,

> -----Original Message-----
> From: Dandamudi, Priyanka <priyanka.dandamudi@intel.com>
> Sent: 20 June 2023 17:49
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; igt-
> dev@lists.freedesktop.org
> Subject: RE: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related sys=
fs uapi
> changes.
>=20
>=20
>=20
> > -----Original Message-----
> > From: igt-dev <igt-dev-bounces@lists.freedesktop.org> On Behalf Of
> > Himal Prasad Ghimiray
> > Sent: 13 June 2023 07:12 PM
> > To: igt-dev@lists.freedesktop.org
> > Subject: [igt-dev] [PATCH 2/4] lib/igt_sysfs: Handling gt related
> > sysfs uapi changes.
> >
> > Patch https://patchwork.freedesktop.org/series/118927/
> > is moving gt sysfs parent under tile folder.
> >
> > With the above patch path for sysfs changes:
> > from: /sys/class/drm/cardX/device/gtN/ to :
> > /sys/class/drm/cardX/device/tileN/gtN
> >
> > Adding xe_for_each_gt_under_each_tile macro to access new path.
> >
> > Cc: Francois Dugast <francois.dugast@intel.com>
> > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  lib/igt_sysfs.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > 2fb2303c..6c0ab617 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -78,6 +78,11 @@
> >
> >  #define xe_for_each_tile for_each_sysfs_tile_dirfd
> >
> > +/* FIXME: Need to revisit if GT indexing under TILE changes from KMD
> > +*/ #define xe_for_each_gt_under_each_tile(xe__, gt__, tile__) \
> > +	for (gt__ =3D 0, tile__ =3D 0 ; gt__ < xe_number_gt(xe__); \
> > +	     (xe_number_gt(xe__) =3D=3D igt_sysfs_get_num_tiles(xe__)) ? ++gt=
__,
> > +++tile__ : ++gt__)
> > +
> It looks like for PVC, MTL and system memory(without device memory) the
> above logic works.
> If we have both system memory and device memory, will the above logic
> work?
I don't see any correlation between types of memory and this logic.
Current patch is applicable for platforms with support of multitile with on=
e gt per tile and single tile with multiple gt.=20
The logic needs to be revisited once we have platforms with multigt and mul=
titile support.
> >  enum i915_attr_id {
> >  	RPS_ACT_FREQ_MHZ,
> >  	RPS_CUR_FREQ_MHZ,
> > --
> > 2.25.1
