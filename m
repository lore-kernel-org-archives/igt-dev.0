Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C03B10E0CF
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:14:57 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Mon, 10 Jul 2023 04:14:53 +0000
Message-ID: <MW4PR11MB70560D2B3178DF10C96AD423B330A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
 <20230707113055.648662-3-himal.prasad.ghimiray@intel.com>
 <87351yi4l3.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87351yi4l3.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v8 2/4] lib/igt_sysfs: Handling gt
 related sysfs uapi changes
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



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 09 July 2023 01:00
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH i-g-t v8 2/4] lib/igt_sysfs: Handling gt related sysf=
s uapi
> changes
>=20
> On Fri, 07 Jul 2023 04:30:53 -0700, Himal Prasad Ghimiray wrote:
> >
> > +char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int
> > +pathlen) {
> > +	struct stat st;
> > +
> > +	if (xe_device < 0)
> > +		return NULL;
> > +
> > +	if (igt_debug_on(fstat(xe_device, &st)) ||
> igt_debug_on(!S_ISCHR(st.st_mode)))
> > +		return NULL;
> > +
> > +	if (IS_METEORLAKE(xe_device))
>=20
> This is wrong, it should be:
>=20
> 	if (IS_METEORLAKE(intel_get_drm_devid(xe_device)))

Thanks for pointing this.

>=20
> Also why not use the IS_PONTEVECCHIO() check as I suggested? Several
> upcoming platforms will have the MTL tile/gt configuration so we'll need =
to
> keep fixing this, if we use PVC we can leave this code alone for a while.
> Anyway I am ok as is too.

Will change to IS_PONTEVECCHIO()

>=20
> Also maybe move these 2 functions above igt_sysfs_gt_path() in the file. =
I
> have a reason for that, will explain later.
Ok.
>=20
> Apart from this, almost there I think. I can suggest a couple more change=
s
> but will hold off so that we can get this merged first.
>=20
> But the build seems to have failed so let's fix that and also make sure
> xe_guc_pc IGT's are passing in pre-merge CI (just in case we've missed
> anything). I'll take a look and then R-b the patches.

New changes merged on Friday causing conflict. Will address the conflicts a=
nd push new patch.

>=20
> Thanks.
> --
> Ashutosh
>=20
>=20
> > +		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile0/gt%d",
> > +			 major(st.st_rdev), minor(st.st_rdev), gt);
> > +	else
> > +		snprintf(path, pathlen,
> "/sys/dev/char/%d:%d/device/tile%d/gt%d",
> > +			 major(st.st_rdev), minor(st.st_rdev), gt, gt);
> > +
> > +	if (!access(path, F_OK))
> > +		return path;
> > +
> > +	return NULL;
> > +}
> > +
> > +/**
> > + * xe_sysfs_gt_open:
> > + * @xe_device: fd of the device
> > + * @gt: gt number
> > + *
> > + * This opens the sysfs gt directory corresponding to device and tile
> > +for use
> > + *
> > + * Returns:
> > + * The directory fd, or -1 on failure.
> > + */
> > +int xe_sysfs_gt_open(int xe_device, int gt) {
> > +	char path[96];
> > +
> > +	if (!xe_sysfs_gt_path(xe_device, gt, path, sizeof(path)))
> > +		return -1;
> > +
> > +	return open(path, O_RDONLY);
> > +}
> > +
> >  /**
> >   * xe_sysfs_tile_path:
> >   * @xe_device: fd of the device
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > 5d584b1c7..afcafb07c 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -157,6 +157,8 @@ void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t
> >*rw);
> >  void igt_sysfs_engines(int xe, int engines, const char **property,
> >		       void (*test)(int, int, const char **));
> >
> > +char *xe_sysfs_gt_path(int xe_device, int gt, char *path, int
> > +pathlen); int xe_sysfs_gt_open(int xe_device, int gt);
> >  char *xe_sysfs_tile_path(int xe_device, int tile, char *path, int
> > pathlen);  int xe_sysfs_tile_open(int xe_device, int tile);  int
> > xe_sysfs_get_num_tiles(int xe_device);
> > --
> > 2.25.1
> >
