Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F69110E30E
 for <igt-dev@lists.freedesktop.org>; Tue, 27 Jun 2023 15:07:05 +0000 (UTC)
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>
Date: Tue, 27 Jun 2023 15:07:00 +0000
Message-ID: <SJ1PR11MB62045DE5040E8CA358B2C5598127A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20230627122305.4097852-1-himal.prasad.ghimiray@intel.com>
 <20230627122305.4097852-5-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20230627122305.4097852-5-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Subject: Re: [igt-dev] [PATCH v3 4/4] tests/xe/xe_sysfs_tile_prop: adds new
 test to verify per tile vram addr_range
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



> -----Original Message-----
> From: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>
> Sent: Tuesday, June 27, 2023 5:53 PM
> To: igt-dev@lists.freedesktop.org
> Cc: Ghimiray, Himal Prasad <himal.prasad.ghimiray@intel.com>; Iddamsetty,
> Aravind <aravind.iddamsetty@intel.com>; Upadhyay, Tejas
> <tejas.upadhyay@intel.com>; Kumar, Janga Rahul
> <janga.rahul.kumar@intel.com>
> Subject: [PATCH v3 4/4] tests/xe/xe_sysfs_tile_prop: adds new test to ver=
ify
> per tile vram addr_range
>=20
> For each tile the test reads the sysfs entry physical_vram_size_bytes and
> compares the value with vram size exposed from query ioctl.
>=20
> v2:
> - Change sysfs entry name. (Tejas)
> - Change test name to xe_sysfs_tile_prop. (Rahul)
>=20
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Upadhyay <tejas.upadhyay@intel.com>
> Cc: Janga Rahul Kumar <janga.rahul.kumar@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>  tests/meson.build             |  1 +
>  tests/xe/xe_sysfs_tile_prop.c | 63 +++++++++++++++++++++++++++++++++++
>  2 files changed, 64 insertions(+)
>  create mode 100644 tests/xe/xe_sysfs_tile_prop.c
>=20
> diff --git a/tests/meson.build b/tests/meson.build index 61dcc076..569f1d=
22
> 100644
> --- a/tests/meson.build
> +++ b/tests/meson.build
> @@ -267,6 +267,7 @@ xe_progs =3D [
>  	'xe_pm',
>  	'xe_prime_self_import',
>  	'xe_query',
> +	'xe_sysfs_tile_prop',
>  	'xe_vm',
>  	'xe_waitfence',
>  ]
> diff --git a/tests/xe/xe_sysfs_tile_prop.c b/tests/xe/xe_sysfs_tile_prop.=
c new
> file mode 100644 index 00000000..18dfeca5
> --- /dev/null
> +++ b/tests/xe/xe_sysfs_tile_prop.c
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + */
> +
> +/**
> + * TEST: Verify physical_vram_size_bytes of each tiles
> + * SUBTEST: physical_vram_size_bytes
> + * Description:
> + *             Read sysfs entry for physical_vram_size_bytes and compare=
 with
> + *             vram size. physical_vram_size_bytes should be more than v=
ram
> size.
> + */
> +
> +#include <string.h>
> +#include <sys/time.h>
> +
> +#include "igt.h"
> +#include "igt_sysfs.h"
> +
> +#include "xe_drm.h"
> +#include "xe/xe_ioctl.h"
> +#include "xe/xe_query.h"
> +
> +static void test_vram_physical_vram_size_bytes(int sysfs, int tile_num,
> +u64 vram_size) {
> +	u64 physical_vram_size_bytes;
> +	char path[40];

If possible reuse some defined macro for path size.=20
Reviewed-by: Tejas Upadhyay <tejas.upadhyay@intel.com>

> +
> +	igt_assert(snprintf(path, sizeof(path),
> "device/tile%d/physical_vram_size_bytes",
> +			    tile_num) < sizeof(path));
> +	igt_assert(igt_sysfs_scanf(sysfs, path, "%lx",
> &physical_vram_size_bytes) < 0);
> +	igt_assert_lt(vram_size, physical_vram_size_bytes); }
> +
> +igt_main
> +{
> +	int fd;
> +	int tile, total_tiles;
> +	static int sysfs =3D -1;
> +	u64 vram_size;
> +
> +	igt_fixture {
> +		fd =3D drm_open_driver(DRIVER_XE);
> +		xe_device_get(fd);
> +
> +		sysfs =3D igt_sysfs_open(fd);
> +		igt_assert(sysfs !=3D -1);
> +	}
> +
> +	igt_subtest("physical_vram_size_bytes") {
> +		igt_require(xe_has_vram(fd));
> +		xe_for_each_tile(fd, tile, total_tiles) {
> +			vram_size =3D xe_vram_size(fd, tile);
> +			test_vram_physical_vram_size_bytes(sysfs, tile,
> vram_size);
> +		}
> +	}
> +
> +	igt_fixture {
> +		close(sysfs);
> +		xe_device_put(fd);
> +		close(fd);
> +	}
> +}
> --
> 2.25.1
