Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 445DB10E078
 for <igt-dev@lists.freedesktop.org>; Tue,  4 Jul 2023 05:46:37 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Tue, 4 Jul 2023 05:46:33 +0000
Message-ID: <MW4PR11MB7056A43FA0715D9669BC5C08B32EA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230627180805.4189160-1-himal.prasad.ghimiray@intel.com>
 <20230627180805.4189160-4-himal.prasad.ghimiray@intel.com>
 <87jzvj8qf4.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87jzvj8qf4.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v4 3/4] tests/xe/xe_guc_pc: Change the sysfs
 paths
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>, "Nilawar,
 Badal" <badal.nilawar@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Hi Ashutosh,

> -----Original Message-----
> From: Dixit, Ashutosh <ashutosh.dixit@intel.com>
> Sent: 01 July 2023 23:28
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Iddamsetty, Aravind
> <aravind.iddamsetty@intel.com>; Kamil Konieczny
> <kamil.konieczny@linux.intel.com>; Nilawar, Badal
> <badal.nilawar@intel.com>; Tauro, Riana <riana.tauro@intel.com>; Gupta,
> Anshuman <anshuman.gupta@intel.com>
> Subject: Re: [PATCH v4 3/4] tests/xe/xe_guc_pc: Change the sysfs paths
>=20
> On Tue, 27 Jun 2023 11:08:04 -0700, Himal Prasad Ghimiray wrote:
> >
>=20
> Hi Himal,
>=20
> > diff --git a/tests/xe/xe_guc_pc.c b/tests/xe/xe_guc_pc.c index
> > 89d5ae9e..2900ff09 100644
> > --- a/tests/xe/xe_guc_pc.c
> > +++ b/tests/xe/xe_guc_pc.c
> > @@ -133,23 +133,25 @@ static void exec_basic(int fd, struct
> drm_xe_engine_class_instance *eci,
> >	xe_vm_destroy(fd, vm);
> >  }
> >
> > -static int set_freq(int sysfs, int gt_id, const char *freq_name,
> > uint32_t freq)
> > +static int set_freq(int sysfs, int tile_id, int gt_id, const char
> > +*freq_name, uint32_t freq)
> >  {
> >	int ret =3D -EAGAIN;
> >	char path[32];
> >
> > -	sprintf(path, "device/gt%d/freq_%s", gt_id, freq_name);
> > +	igt_assert(snprintf(path, sizeof(path),
> "device/tile%d/gt%d/freq_%s",
> > +			    tile_id, gt_id, freq_name) < sizeof(path));
> >	while (ret =3D=3D -EAGAIN)
> >		ret =3D igt_sysfs_printf(sysfs, path, "%u", freq);
> >	return ret;
> >  }
>=20
> /snip/
>=20
> > @@ -162,37 +164,37 @@ static uint32_t get_freq(int sysfs, int gt_id, co=
nst
> char *freq_name)
> >   * Run type: BAT
> >   */
> >
> > -static void test_freq_basic_api(int sysfs, int gt_id)
> > +static void test_freq_basic_api(int sysfs, int tile_id, int gt_id)
> >  {
> > -	uint32_t rpn =3D get_freq(sysfs, gt_id, "rpn");
> > -	uint32_t rpe =3D get_freq(sysfs, gt_id, "rpe");
> > -	uint32_t rp0 =3D get_freq(sysfs, gt_id, "rp0");
> > +	uint32_t rpn =3D get_freq(sysfs, tile_id, gt_id, "rpn");
> > +	uint32_t rpe =3D get_freq(sysfs, tile_id, gt_id, "rpe");
> > +	uint32_t rp0 =3D get_freq(sysfs, tile_id, gt_id, "rp0");
>=20
> /snip/
>=20
> > @@ -373,7 +375,7 @@ igt_main
> >  {
> >	struct drm_xe_engine_class_instance *hwe;
> >	int fd;
> > -	int gt;
> > +	int gt, tile;
> >	static int sysfs =3D -1;
> >	int ncpus =3D sysconf(_SC_NPROCESSORS_ONLN);
> >	uint32_t stash_min;
> > @@ -386,24 +388,24 @@ igt_main
> >		sysfs =3D igt_sysfs_open(fd);
> >		igt_assert(sysfs !=3D -1);
> >
> > -		/* The defaults are the same. Stashing the gt0 is enough */
> > -		stash_min =3D get_freq(sysfs, 0, "min");
> > -		stash_max =3D get_freq(sysfs, 0, "max");
> > +		/* The defaults are the same. Stashing the gt0 in tile0 is
> enough */
> > +		stash_min =3D get_freq(sysfs, 0, 0, "min");
> > +		stash_max =3D get_freq(sysfs, 0, 0, "max");
> >	}
> >
> >	igt_subtest("freq_basic_api") {
> > -		xe_for_each_gt(fd, gt)
> > -			test_freq_basic_api(sysfs, gt);
> > +		xe_for_each_gt_under_each_tile(fd, tile, gt)
> > +			test_freq_basic_api(sysfs, tile, gt);
>=20
> Basically I have decided I disagree with the entire approach here, so I
> disagree with Patches 2 and 3 in this series. Patch 2 is especially hacky=
 but I
> think it's not needed. Let's do this differently. My points:
>=20
> * gt id's are unique (so e.g. on MTL we have tile0/gt0 and tile0/gt1, on
>   PVC we have tile0/gt0 and tile1/gt1).
>=20
> * The code in xe_guc_pc.c touches quantities (freq's etc.) which are
>   associated with gt's. It doesn't care about tiles and which gt is prese=
nt
>   on which tile etc. It just cares about gt's. So it wrong to change the
>   whole code to start worrying about tiles now as this patch is doing (vi=
a
>   xe_for_each_gt_under_each_tile()).
>=20
> * So instead what we need to do is very simple. Let's write a function
>   which will return the sysfs path for a gt (this function will need to b=
e
>   tile aware so it will return things like "device/tile0/gt0",
>   "device/tile0/gt1", "device/tile1/gt1" etc.). The function prototype is
>   something like:
>=20
>   char *xe_gt_sysfs_path(int gt_id);
>=20
>   How it is implemented probably doesn't matter much. It could e.g. go
>   through the sysfs directory tree to find the path of a gt or it could u=
se
>   info on how gts are situated on tiles for particular platforms (MTL vs
>   PVC as shown above e.g.). Either approach is fine, the platform approac=
h
>   is simpler.
>=20
>   So once we have this function implemented, in the above
>   set_freq()/get_freq() functions we could just use the gt path returned =
by
>   this function to read/write the sysfs. We don't need to make the entire
>   file tile aware. We just need to modify set_freq()/get_freq().
>=20
My intention of introducing patch 2 was to ensure uniformity and applicabil=
ity in=20
case gt specific debugfs and other entries also move under tiles.=20
If recommendation is to use something sysfs specific, will implement xe_gt_=
sysfs_path(int gt_id);
And update this test accordingly in next patch.

BR
Himal=20
> If this doesn't work for some reason please let me know why. Please don't
> merge this series till we resolve this.
>=20
> Thanks.
> --
> Ashutosh
