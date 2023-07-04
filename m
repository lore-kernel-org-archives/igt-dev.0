Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0114210E078
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 05:42:55 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 4 Jul 2023 05:42:49 +0000
Message-ID: <MW4PR11MB705614CD7BB4093413A69D3EB32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230623114946.3803540-1-himal.prasad.ghimiray@intel.com>
 <20230623114946.3803540-3-himal.prasad.ghimiray@intel.com>
 <SJ1PR11MB62046E8F51197B7B60F54E2E8126A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <875y79df9o.wl-ashutosh.dixit@intel.com>
 <MW4PR11MB70561AB1FDBC1E6A4ADB26EAB327A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <87o7l15to2.wl-ashutosh.dixit@intel.com>
 <MW4PR11MB70560893A7E07B7A0F2CB277B327A@MW4PR11MB7056.namprd11.prod.outlook.com>
 <878rbzzfuc.wl-ashutosh.dixit@intel.com>
In-Reply-To: <878rbzzfuc.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v2 2/4] lib/igt_sysfs: Handling gt related
 sysfs uapi changes
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 01 July 2023 23:15
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> dev@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH v2 2/4] lib/igt_sysfs: Handling gt related sysfs uapi
> changes
>=20
> On Tue, 27 Jun 2023 00:06:01 -0700, Ghimiray, Himal Prasad wrote:
> >
>=20
> Hi Himal,
>=20
> Please send igt patches with [PATCH i-g-t] subjectPrefix. Set subjectPref=
ix in
> .git/config e.g.
>=20
> Below too.
>=20
> > > -----Original Message-----
> > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > Sent: 27 June 2023 11:33
> > > To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> > > Cc: Upadhyay, Tejas <tejas.upadhyay@intel.com>; igt-
> > > dev@lists.freedesktop.org; Iddamsetty, Aravind
> > > <aravind.iddamsetty@intel.com>; Kumar, Janga Rahul
> > > <janga.rahul.kumar@intel.com>; Dugast, Francois
> > > <francois.dugast@intel.com>; Roper, Matthew D
> > > <matthew.d.roper@intel.com>
> > > Subject: Re: [PATCH v2 2/4] lib/igt_sysfs: Handling gt related sysfs
> > > uapi changes
> > >
> > > On Mon, 26 Jun 2023 21:22:33 -0700, Ghimiray, Himal Prasad wrote:
> > > >
> > > > Hi Ashutosh,
> > >
> > > Hi Himal,
> > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> > > > > Sent: 27 June 2023 04:04
> > > > > To: Upadhyay, Tejas <tejas.upadhyay@intel.com>
> > > > > Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>;
> > > > > igt- dev@lists.freedesktop.org; Iddamsetty, Aravind
> > > > > <aravind.iddamsetty@intel.com>; Kumar, Janga Rahul
> > > > > <janga.rahul.kumar@intel.com>; Dugast, Francois
> > > > > <francois.dugast@intel.com>; Roper, Matthew D
> > > > > <matthew.d.roper@intel.com>
> > > > > Subject: Re: [PATCH v2 2/4] lib/igt_sysfs: Handling gt related
> > > > > sysfs uapi changes
> > > > >
> > > > > On Mon, 26 Jun 2023 03:48:16 -0700, Upadhyay, Tejas wrote:
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Ghimiray, Himal Prasad
> > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > Sent: Friday, June 23, 2023 5:20 PM
> > > > > > > To: igt-dev@lists.freedesktop.org
> > > > > > > Cc: Ghimiray, Himal Prasad
> > > > > > > <himal.prasad.ghimiray@intel.com>;
> > > > > > > Iddamsetty, Aravind <aravind.iddamsetty@intel.com>;
> > > > > > > Upadhyay, Tejas <tejas.upadhyay@intel.com>; Kumar, Janga
> > > > > > > Rahul <janga.rahul.kumar@intel.com>; Dugast, Francois
> > > > > > > <francois.dugast@intel.com>; Dixit, Ashutosh
> > > > > > > <ashutosh.dixit@intel.com>; Roper, Matthew D
> > > > > > > <matthew.d.roper@intel.com>
> > > > > > > Subject: [PATCH v2 2/4] lib/igt_sysfs: Handling gt related
> > > > > > > sysfs uapi changes
> > > > > > >
> > > > > > > Patch https://patchwork.freedesktop.org/series/118927/
> > > > > > > is moving gt sysfs parent under tile folder.
> > > > > > >
> > > > > > > With the above patch path for sysfs changes:
> > > > > > > from: /sys/class/drm/cardX/device/gtN/ to :
> > > > > > > /sys/class/drm/cardX/device/tileN/gtN
> > > > > > >
> > > > > > > Adding xe_for_each_gt_under_each_tile macro to access new
> path.
> > > > > > >
> > > > > > > v2:
> > > > > > > - Calculate number of tiles once within iterator. (Rahul)
> > > > > > >
> > > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > > Cc: Upadhyay <tejas.upadhyay@intel.com>
> > > > > > > Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> > > > > > > Cc: Francois Dugast <francois.dugast@intel.com>
> > > > > > > Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> > > > > > > Cc: Matt Roper <matthew.d.roper@intel.com>
> > > > > > > Signed-off-by: Himal Prasad Ghimiray
> > > > > > > <himal.prasad.ghimiray@intel.com>
> > > > > > > ---
> > > > > > >  lib/igt_sysfs.h | 6 ++++++
> > > > > > >  1 file changed, 6 insertions(+)
> > > > > > >
> > > > > > > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > > > > > > de2c9a86..42bf2741 100644
> > > > > > > --- a/lib/igt_sysfs.h
> > > > > > > +++ b/lib/igt_sysfs.h
> > > > > > > @@ -80,6 +80,12 @@
> > > > > > >
> > > > > > >  #define xe_for_each_tile for_each_sysfs_tile_dirfd
> > > > > > >
> > > > > > > +/* FIXME: Need to revisit if GT indexing under TILE changes
> > > > > > > +from KMD */ #define xe_for_each_gt_under_each_tile(xe__,
> > > > > > > +gt__, tile__,
> > > > > tile_cnt__) \
> > > > > > > +	for (gt__ =3D 0, tile__ =3D 0, tile_cnt__ =3D
> > > > > > > +igt_sysfs_get_num_tiles(xe__) ;
> > > > > \
> > > > > > > +	     gt__ < xe_number_gt(xe__); \
> > > > > > > +	     (xe_number_gt(xe__) =3D=3D tile_cnt__) ? ++gt__, ++til=
e__ :
> > > > > > > +++gt__)
> > > > > > > +
> > > > > >
> > > > > > This is with consideration of indexing and also considering
> > > > > > equal (or all GT counts are on one tile) GT counts on each tile=
.
> > > > > > Consider case when 2GTs on 1 tile and 1 GT on other tile. But
> > > > > > for all current platforms we have it should work, need to
> > > > > > revisit when any of those
> > > > > scenario comes.
> > > > >
> > > > > Yes because of this like tile info should be properly exposed
> > > > > from the xe kmd query api. Or we could do the sysfs as we did on
> i915.
> > > > Agreed.
> > > > >
> > > > > For the above how about a shorter name like
> > > "xe_for_each_tile_and_gt"?
> > > > >
> > > > > Also I would change the order of tile__ and gt__ arguments since
> > > > > that is more logical, gt's are under tiles.
> > >
> > > This is a nit but anyway what about this?
> > Sorry I missed it earlier. What you suggested is logical and more
> appropriate.
> > Will change the order of arguments.
> > >
> > > > To me  xe_for_each_gt_under_each_tile more appropriate in
> > > > comparison to xe_for_each_tile_and_gt. Purpose here is to iterate
> > > > all gt specific sysfs
> > > entries under each tile.
> > > > >
> > > > > Also I don't think tile_cnt__ should be in the macro args, we
> > > > > could just do
> > > > > this:
> > > > >
> > > > > #define xe_for_each_tile_and_gt(xe__, , tile__, gt__) \
> > > > >	for (gt__ =3D 0, tile__ =3D 0; \
> > > > >	     gt__ < xe_number_gt(xe__); \
> > > > >	     (xe_number_gt(xe__) =3D=3D igt_sysfs_get_num_tiles(xe__) ?
> > > > > ++gt__, ++tile__ : ++gt__)
> > > >
> > > > In rev1. I had used this implementation. But problem is
> > > > igt_sysfs_get_num_tiles(xe__) will be calculated for each
> > > > iteration and
> > > want to avoid it.
> > >
> > > As far as I see it, the compiler should optimize any such
> > > repetitions. We can even add num_tiles to 'struct xe_device' in
> > > xe_device_get() (as if it's obtained from the kernel), similar to
> xe_number_gt().
> > In that case, my preference would be using  (xe_number_gt(xe__) =3D=3D
> > igt_sysfs_get_num_tiles(xe__) Instead of populating num_tiles in
> > struct xe_device because other members of the structure are  being
> intitialized on the basis of ioctl call.
> > Please confirm what will be more appropriate.
>=20
> igt_sysfs_get_num_tiles is fine.
>=20
> >
> > >
> > > > >
> > > > > So that is possible, but why are we comparing num_gt with
> num_tiles?
> > > > > So no idea what's going on here. It should be num gt's per tile
> > > > > if they are all the same :/
> > > >
> > > > Patch https://patchwork.freedesktop.org/series/118927/ is moving
> > > > Gt specific sysfs entries into tile.
> > > > from: /sys/class/drm/cardX/device/gtN/sysfsX to :
> > > > /sys/class/drm/cardX/device/tileN/gtN/sysfsX
> > > >
> > > > Agreed KMD should we exposing the number of gt's per tile. But as
> > > > of now
> > > we don't have such queries.
> > > > But we are certain that none of the platform supports multitile
> > > > and multigt
> > > per tile so above check ensures.
> > > > If number of gt's are equal to number of tiles then sysfs should
> > > > be read in above order.  If number of gt is not equal to number of
> > > > tiles Which
> > > will be case in MTL , gt0 and gt1 should be under tile0 only.
> > >
> > > So the code only works for 'num_tiles =3D=3D 1' or 'num_tiles =3D=3D =
num_gt'
> > > (1 gt per tile), correct? At the minimum we should probably add this
> > > assert in the init section of the for loop.
> > Correct, as of now code only caters multitile and multigt exclusively.
> > Will need to enhance in case of future platform supporting both.
> > AFAIK adding assert/comparison in init section of for loop is not possi=
ble.
>=20
> Why is it not possible? Isn't there a compound statement (statements
> separated by commas) already in the init section of the loop?
>=20
> E.g. doesn't the following work?
>=20
> #define xe_for_each_tile_and_gt(xe__, , tile__, gt__) \
>         for (int num_tiles__ =3D igt_sysfs_get_num_tiles(xe__),
> 	     igt_assert((num_tiles__ =3D=3D 1) || num_tiles__ =3D=3D
> xe_number_gt(xe__)),
> 	     gt__ =3D 0, tile__ =3D 0; \
>              gt__ < xe_number_gt(xe__); \
>              (xe_number_gt(xe__) =3D=3D num_tiles__ ? ++gt__, ++tile__ : =
++gt__)
>=20
> Also seems to the solve igt_sysfs_get_num_tiles(xe__) being called in eac=
h
> iteration.

As I already mentioned. Above code is wrong.
Declaring num_tiles as int in initialization will lead to shadowing of gt__=
 and tile__being passed from caller.=20
second igt_assert((num_tiles__ =3D=3D 1) || num_tiles__ =3D=3D> xe_number_g=
t(xe__)) is comparison and function call in initialization statement
 which is also wrong.

The compound statement being written in initialization are all initializati=
on of same variable type.
For example:
Int a,b,c;
a=3D 0, b =3D 1 , c =3D find_c(x); is valid
but=20
int a, b, c ;
int d =3D 0, a =3D 0, b =3D 1, c =3D find_c(x), func(xyz); is invalid

BR
Himal=20
>=20
> If this is somehow not possible (I haven't tried it), please document cle=
arly
> above the macro that the macro only works for 'num_tiles =3D=3D 1' or 'nu=
m_tiles
> =3D=3D num_gt'.
>=20
> > And I can't make it multiple statement macro because that will break
> > in case of handling iterator in if-else condition.
> > >
> > > The correct way to do it is of course to traverse the tile/gt
> > > directory tree which would be able to handle general tile/gt
> combinations.
> > >
> > The issue with this approach is for multi tile the gt indexing is same =
as tile
> indexing.
> > Tile0/gt0 and tile1/gt1. Multiple loop with extra conditions will be
> > overkill and confusing to handle the scenario.
> > 1) First determine number of gt's_per_tile writing the logic as finding
> number of tiles.
> > 2) For(each_tile)
> >       for(each_gt) run loop till total numbers of gt's because
> > indexing doesn't start with 0. [ skip all other index's apart from
> > index same as tile]
> >
> >
> > > Anyway I'll let other people decide whether what we have here is ok
> > > or not to merge.
> > >
> > > Regards,
> > > Ashutosh
> > >
> > >
> > > > Usage of this iterator can be seen from
> > > >
> https://patchwork.freedesktop.org/patch/543998/?series=3D119801&rev=3D
> > > > 1
> > > >
> > > > BR
> > > > Himal
> > > >
> > > >
> > > > >
> > > > > >
> > > > > > Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
> > > > > >
> > > > > > >  enum i915_attr_id {
> > > > > > >	RPS_ACT_FREQ_MHZ,
> > > > > > >	RPS_CUR_FREQ_MHZ,
> > > > > > > --
> > > > > > > 2.25.1
> > > > > >
