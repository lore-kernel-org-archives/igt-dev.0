Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF0010E15F
 for <igt-dev@lists.freedesktop.org>; Mon, 10 Jul 2023 04:12:24 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Mon, 10 Jul 2023 04:12:20 +0000
Message-ID: <MW4PR11MB7056361F007D5B910BD72D21B330A@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230707113055.648662-1-himal.prasad.ghimiray@intel.com>
 <20230707113055.648662-2-himal.prasad.ghimiray@intel.com>
 <874jmei4lt.wl-ashutosh.dixit@intel.com>
In-Reply-To: <874jmei4lt.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v8 1/4] lib/igt_sysfs: Add support to
 query number of tiles
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
> Sent: 09 July 2023 01:00
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: Re: [PATCH i-g-t v8 1/4] lib/igt_sysfs: Add support to query num=
ber
> of tiles
>=20
> On Fri, 07 Jul 2023 04:30:52 -0700, Himal Prasad Ghimiray wrote:
> >
> > diff --git a/lib/igt_sysfs.h b/lib/igt_sysfs.h index
> > 5635fc690..5d584b1c7 100644
> > --- a/lib/igt_sysfs.h
> > +++ b/lib/igt_sysfs.h
> > @@ -38,6 +38,11 @@
> >	     (dirfd__ =3D igt_sysfs_gt_open(i915__, gt__)) !=3D -1; \
> >	     close(dirfd__), gt__++)
> >
> > +#define for_each_sysfs_tile_dirfd(xe__, dirfd__, tile__) \
> > +	for (tile__ =3D 0; \
> > +	     (dirfd__ =3D xe_sysfs_tile_open(xe__, tile__)) !=3D -1; \
> > +	     close(dirfd__), tile__++)
> > +
> >  #define i915_for_each_gt for_each_sysfs_gt_dirfd
> >
> >  #define igt_sysfs_rps_write(dir, id, data, len) \  @@ -73,6 +78,8 @@
> >  #define igt_sysfs_rps_set_boolean(dir, id, value) \
> >	igt_sysfs_set_boolean(dir, igt_sysfs_dir_id_to_name(dir, id), value)
> >
> > +#define xe_for_each_tile for_each_sysfs_tile_dirfd
>=20
> Let's delete xe_for_each_tile and directly use for_each_sysfs_tile_dirfd =
in
> Patch 4. Because xe_for_each_gt is written without the dirfd so it will b=
e
> confusing if xe_for_each_tile now has dirfd.

Sure.

>=20
> Thanks.
> --
> Ashutosh
