Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4B0610E505
 for <igt-dev@lists.freedesktop.org>; Fri,  7 Jul 2023 05:04:45 +0000 (UTC)
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Date: Fri, 7 Jul 2023 05:04:43 +0000
Message-ID: <MW4PR11MB7056B3F307E414A3FCA5A089B32DA@MW4PR11MB7056.namprd11.prod.outlook.com>
References: <20230706104500.595707-1-himal.prasad.ghimiray@intel.com>
 <20230706104500.595707-5-himal.prasad.ghimiray@intel.com>
 <87bkgocyqw.wl-ashutosh.dixit@intel.com>
In-Reply-To: <87bkgocyqw.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH i-g-t v7 4/4] tests/xe/xe_sysfs_tile_prop:
 adds new test to verify per tile vram addr_range
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
> Sent: 07 July 2023 06:41
> To: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Cc: igt-dev@lists.freedesktop.org; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>
> Subject: Re: [igt-dev] [PATCH i-g-t v7 4/4] tests/xe/xe_sysfs_tile_prop: =
adds
> new test to verify per tile vram addr_range
>=20
> On Thu, 06 Jul 2023 03:45:00 -0700, Himal Prasad Ghimiray wrote:
> >
> > diff --git a/tests/xe/xe_sysfs_tile_prop.c
> > b/tests/xe/xe_sysfs_tile_prop.c
>=20
> Let's call this either xe_sysfs_tile_properties.c or xe_sysfs_tile.c
>=20
> > +static void test_vram_physical_vram_size_bytes(int sysfs, int
> > +tile_num, u64 vram_size)
>=20
> Pass tilefd into this function, see below, so
>=20
> static void test_vram_physical_vram_size_bytes(int tilefd, u64 vram_size)
>=20

Will address in next patch.

> > +{
> > +	u64 physical_vram_size_bytes;
> > +	char path[40];
> > +
> > +	igt_assert(snprintf(path, sizeof(path),
> "device/tile%d/physical_vram_size_bytes",
> > +			    tile_num) < sizeof(path));
>=20
> No need for all this.
>=20
> > +	igt_assert(igt_sysfs_scanf(sysfs, path, "%lx",
> > +&physical_vram_size_bytes) > 0);
>=20
> This just becomes
>=20
> 	igt_assert(igt_sysfs_scanf(tilefd, "physical_vram_size_bytes", "%lx",
> &physical_vram_size_bytes) > 0);
>=20

Ok.

> > +	igt_assert_lt_u64(vram_size, physical_vram_size_bytes); }
> > +
> > +igt_main
> > +{
> > +	int fd, tmp;
>=20
> s/tmp/tilefd/
>=20
> > +	int tile;
> > +	static int sysfs =3D -1;
> > +	u64 vram_size;
> > +
> > +	igt_fixture {
> > +		fd =3D drm_open_driver(DRIVER_XE);
> > +		xe_device_get(fd);
> > +
> > +		sysfs =3D igt_sysfs_open(fd);
>=20
> No need to do this, we already have tilefd in xe_for_each_tile, we can pa=
ss
> that into test_vram_physical_vram_size_bytes.
>=20

Sure.

> > +		igt_assert(sysfs !=3D -1);
> > +	}
> > +
> > +	igt_subtest("physical_vram_size_bytes") {
> > +		igt_require(xe_has_vram(fd));
> > +		xe_for_each_tile(fd, tmp, tile) {
> > +			vram_size =3D xe_vram_size(fd, tile);
> > +			test_vram_physical_vram_size_bytes(sysfs, tile,
> vram_size);
> > +		}
> > +	}
> > +
> > +	igt_fixture {
> > +		close(sysfs);
> > +		xe_device_put(fd);
> > +		close(fd);
> > +	}
> > +}
> > --
> > 2.25.1
> >
