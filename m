Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 259AF10E505
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 04:29:23 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 7 Jul 2023 04:29:13 +0000
Message-ID: <MW4PR11MB7056F642EA5E135C4BDA2E69B32DA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
 <20230706104500.595707-3-himal.prasad.ghimiray@intel.com>
 <87edlkczes.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87edlkczes.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 2/4] lib/igt_sysfs: Handling gt
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
> Sent: 07 July 2023 06:26
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>; Dugast, Francois
> <francois.dugast@intel.com>; Roper, Matthew D
> <matthew.d.roper@intel.com>
> Subject: Re: [PATCH i-g-t v7 2/4] lib/igt_sysfs: Handling gt related sysf=
s uapi
> changes
>=20
> On Thu, 06 Jul 2023 03:44:58 -0700, Himal Prasad Ghimiray wrote:
> >
> > +/*
> > + * xe_gt_sysfs_path::
> > + * @sysfs: fd of sysfs
> > + * @gt_id: gt id
> > + *
> > + * This function returns the path for gtX directory  */ char
> > +*xe_gt_sysfs_path(int sysfs, int gt_id) {
> > +	char tiledir[24];
> > +	char gtdir[32];
> > +	char *gt_path;
> > +	int i =3D 0;
> > +
> > +	snprintf(tiledir, sizeof(tiledir), "device/tile0/");
> > +	snprintf(gtdir, sizeof(gtdir), "%s/gt%d", tiledir, gt_id);
> > +
> > +	while (dir_exists_in_sysfd(sysfs, tiledir)) {
> > +		if (dir_exists_in_sysfd(sysfs, gtdir)) {
> > +			gt_path =3D malloc(sizeof(gtdir));
> > +			strcpy(gt_path, gtdir);
> > +			return gt_path;
> > +		} else {
> > +			snprintf(tiledir, sizeof(tiledir), "device/tile%d/", i++);
> > +			snprintf(gtdir, sizeof(gtdir), "%s/gt%d", tiledir, gt_id);
> > +		}
> > +	}
> > +	igt_assert_f(false, "No gt%d dir found in sysfs\n", gt_id); }
>=20
> Now that you I see the code (sorry for changing again but we are adding t=
his
> to the igt lib so functions should have some uniformity), this function s=
hould
> have the same prototype and arguments as igt_sysfs_gt_path(). Also call i=
t
> xe_sysfs_gt_path.
>=20
> Also because now we have drm_fd available we can find the device
> (PVC/MTL) so we can use the simpler implementation I mentioned before:
>=20
> 	switch (devid) {
> 	case PVC:
> 		return tile0/gt0 or tile1/gt1
> 	default:
> 		return tile0/gtN
> }
>=20
> This function can be extended for future platforms as they arise. Or some=
one
> can write a better function to go over the dir tree. I think it should be=
 done
> similar to going over the directory as is done in hwmon_read/hwmon_write.
> I don't like the implementation above but for now the approach mentioned
> above is fine.
>=20
> The above means we will change set_freq()/get_freq() in xe_guc_pc.c to ta=
ke
> the drm_fd as the first argument rather than the sysfs fd. So there will =
be
> changes throught the file but better do that once so that all future IGT'=
s can
> follow the same pattern.
>=20
> Also write another function xe_sysfs_gt_open() similar to
> igt_sysfs_gt_open() or xe_sysfs_tile_open().
>=20
> I want Kamil to take a look at this series too after he is back.
>=20
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > 5d584b1c7..0792c644e 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -153,6 +153,7 @@ typedef struct igt_sysfs_rw_attr {  }
> > igt_sysfs_rw_attr_t;
> >
> >  void igt_sysfs_rw_attr_verify(igt_sysfs_rw_attr_t *rw);
> > +char *xe_gt_sysfs_path(int sysfs, int gt_id);
> >
> >  void igt_sysfs_engines(int xe, int engines, const char **property,
> >		       void (*test)(int, int, const char **));
> > --
> > 2.25.1
> >
