Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 701A810E28F
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 04:41:27 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 4 Jul 2023 04:41:23 +0000
Message-ID: <MW4PR11MB705623280945254454206CF2B32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230627180805.4189160-1-himal.prasad.ghimiray@intel.com>
 <20230627180805.4189160-2-himal.prasad.ghimiray@intel.com>
 <87lefz8spc.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87lefz8spc.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 1/4] lib/igt_sysfs: Add support to query
 number of tiles
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Upadhyay,
 Tejas" <tejas.upadhyay@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>



> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 01 July 2023 22:39
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>
> Subject: Re: [igt-dev] [PATCH v4 1/4] lib/igt_sysfs: Add support to query
> number of tiles
>=20
> On Tue, 27 Jun 2023 11:08:02 -0700, Himal Prasad Ghimiray wrote:
> >
>=20
> Hi Himal,
>=20
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > 978b6906..de2c9a86 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -38,6 +38,11 @@
> >	     (dirfd__ =3D igt_sysfs_gt_open(i915__, gt__)) !=3D -1; \
> >	     close(dirfd__), gt__++)
> >
> > +#define for_each_sysfs_tile_dirfd(xe__, tile__, tile_cnt__) \
> > +	for (tile__ =3D 0, tile_cnt__ =3D igt_sysfs_get_num_tiles(xe__); \
> > +	     tile__ < tile_cnt__; \
> > +	     ++tile__)
> > +
>=20
> You did not answer the question I asked previously about this:
>=20
> "Where is dirfd here which should be a fd to an open sysfs directory as i=
n
> for_each_sysfs_gt_dirfd?"
>=20
> >  #define i915_for_each_gt for_each_sysfs_gt_dirfd
>=20
> >
> >  #define igt_sysfs_rps_write(dir, id, data, len) \  @@ -73,6 +78,8 @@
> >  #define igt_sysfs_rps_set_boolean(dir, id, value) \
> >	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> >
> > +#define xe_for_each_tile for_each_sysfs_tile_dirfd
>=20
> I think let's just do this and get rid of for_each_sysfs_tile_dirfd:
>=20
> #define xe_for_each_tile(xe__, tile__, tile_cnt__) \
> 	for (tile__ =3D 0, tile_cnt__ =3D igt_sysfs_get_num_tiles(xe__); \
> 	     tile__ < tile_cnt__; \
> 	     ++tile__)
>=20
Agreed. Will address in next patch.
> > +
> >  enum i915_attr_id {
> >	RPS_ACT_FREQ_MHZ,
> >	RPS_CUR_FREQ_MHZ,
> > @@ -97,6 +104,7 @@ int igt_sysfs_open(int device);
> >  char *igt_sysfs_gt_path(int device, int gt, char *path, int pathlen);
> >  int igt_sysfs_gt_open(int device, int gt);
> >  int igt_sysfs_get_num_gt(int device);
> > +int igt_sysfs_get_num_tiles(int device);
> >  bool igt_sysfs_has_attr(int dir, const char *attr);  const char
> > *igt_sysfs_dir_id_to_name(int dir, enum i915_attr_id id);  const char
> > *igt_sysfs_path_id_to_name(const char *path, enum i915_attr_id id);
> > --
> > 2.25.1
> >
