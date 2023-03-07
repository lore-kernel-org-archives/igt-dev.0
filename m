Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237C810E3B8
 for <igt-dev@lists.freedesktop.org>; Tue,  7 Mar 2023 09:17:39 +0000 (UTC)
Date: Tue, 7 Mar 2023 10:17:34 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230307101734.7e4246d9@maurocar-mobl2>
In-Reply-To: <20230302110947.548610-3-zbigniew.kempczynski@intel.com>
References: <20230302110947.548610-1-zbigniew.kempczynski@intel.com>
 <20230302110947.548610-3-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t v4 2/8] lib/xe: Introduce Xe library
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: igt-dev@lists.freedesktop.org
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

On Thu,  2 Mar 2023 12:09:41 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

> Xe, is a new driver for Intel GPUs that supports both integrated
> and discrete platforms starting with Tiger Lake (first Intel Xe
> Architecture).
>=20
> Series was split to allow easier review. Library, drm uapi, tests,
> tools and other were squashed according to code subject.
>=20
> This patch introduces library used for Xe tests. As there's not
> too trivial to calculate credits for squashed subjects full series
> credits are:
>=20
> Co-developed-by: Matthew Brost
> [commits: 90 / lines changed: 12574]
> Co-developed-by: Mauro Carvalho Chehab
> [commits: 28 / lines changed: 1873]
> Co-developed-by: Rodrigo Vivi
> [commits: 15 / lines changed: 1317]
> Co-developed-by: Jason Ekstrand
> [commits: 14 / lines changed: 1418]
> Co-developed-by: Francois Dugast
> [commits: 8 / lines changed: 1082]
> Co-developed-by: Philippe Lecluse
> [commits: 6 / lines changed: 560]
> Co-developed-by: Zbigniew Kempczy=C5=84ski
> [commits: 4 / lines changed: 1091]
> Co-developed-by: Matthew Auld
> [commits: 3 / lines changed: 35]
> Co-developed-by: Niranjana Vishwanathapura
> [commits: 2 / lines changed: 66]
> Co-developed-by: Maarten Lankhorst
> [commits: 2 / lines changed: 774]
> Co-developed-by: Ryszard Knop
> [commits: 1 / lines changed: 12]
> Co-developed-by: Thomas Hellstr=C3=B6m
> [commits: 1 / lines changed: 12]
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Signed-off-by: Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com>

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>

> ---
>  lib/drmtest.c       |   3 +
>  lib/drmtest.h       |   1 +
>  lib/meson.build     |   4 +
>  lib/xe/xe_compute.c | 406 ++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_compute.h |  29 +++
>  lib/xe/xe_ioctl.c   | 436 ++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_ioctl.h   |  87 ++++++++
>  lib/xe/xe_query.c   | 471 ++++++++++++++++++++++++++++++++++++++++++++
>  lib/xe/xe_query.h   |  94 +++++++++
>  lib/xe/xe_spin.c    | 157 +++++++++++++++
>  lib/xe/xe_spin.h    |  48 +++++
>  meson.build         |   8 +
>  12 files changed, 1744 insertions(+)
>  create mode 100644 lib/xe/xe_compute.c
>  create mode 100644 lib/xe/xe_compute.h
>  create mode 100644 lib/xe/xe_ioctl.c
>  create mode 100644 lib/xe/xe_ioctl.h
>  create mode 100644 lib/xe/xe_query.c
>  create mode 100644 lib/xe/xe_query.h
>  create mode 100644 lib/xe/xe_spin.c
>  create mode 100644 lib/xe/xe_spin.h
>=20
> diff --git a/lib/drmtest.c b/lib/drmtest.c
> index 8e2d1ac50b..0ceab10389 100644
> --- a/lib/drmtest.c
> +++ b/lib/drmtest.c
> @@ -189,6 +189,7 @@ static const struct module {
>  	{ DRIVER_V3D, "v3d" },
>  	{ DRIVER_VC4, "vc4" },
>  	{ DRIVER_VGEM, "vgem" },
> +	{ DRIVER_XE, "xe" },
>  	{}
>  };
> =20
> @@ -547,6 +548,8 @@ static const char *chipset_to_str(int chipset)
>  		return "panfrost";
>  	case DRIVER_MSM:
>  		return "msm";
> +	case DRIVER_XE:
> +		return "xe";
>  	case DRIVER_ANY:
>  		return "any";
>  	default:
> diff --git a/lib/drmtest.h b/lib/drmtest.h
> index b5debd44b3..448ac03b49 100644
> --- a/lib/drmtest.h
> +++ b/lib/drmtest.h
> @@ -51,6 +51,7 @@
>  #define DRIVER_V3D	(1 << 4)
>  #define DRIVER_PANFROST	(1 << 5)
>  #define DRIVER_MSM	(1 << 6)
> +#define DRIVER_XE	(1 << 7)
> =20
>  /*
>   * Exclude DRVER_VGEM from DRIVER_ANY since if you run on a system
> diff --git a/lib/meson.build b/lib/meson.build
> index c5131d9aff..768ce90b54 100644
> --- a/lib/meson.build
> +++ b/lib/meson.build
> @@ -98,6 +98,10 @@ lib_sources =3D [
>  	'veboxcopy_gen12.c',
>  	'igt_msm.c',
>  	'igt_dsc.c',
> +	'xe/xe_compute.c',
> +	'xe/xe_ioctl.c',
> +	'xe/xe_query.c',
> +	'xe/xe_spin.c'
>  ]
> =20
>  lib_deps =3D [
> diff --git a/lib/xe/xe_compute.c b/lib/xe/xe_compute.c
> new file mode 100644
> index 0000000000..8c0f8c87d5
> --- /dev/null
> +++ b/lib/xe/xe_compute.c
> @@ -0,0 +1,406 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Francois Dugast <francois.dugast@intel.com>
> + */
> +
> +#include "xe_compute.h"
> +
> +#define PIPE_CONTROL			0x7a000004
> +#define MI_LOAD_REGISTER_IMM		0x11000001
> +#define PIPELINE_SELECT			0x69040302
> +#define MEDIA_VFE_STATE			0x70000007
> +#define STATE_BASE_ADDRESS		0x61010014
> +#define MEDIA_STATE_FLUSH		0x0
> +#define MEDIA_INTERFACE_DESCRIPTOR_LOAD	0x70020002
> +#define GPGPU_WALKER			0x7105000d
> +#define MI_BATCH_BUFFER_END		(0xA << 23)
> +
> +// generated with: ocloc -file kernel.cl -device tgllp && xxd -i kernel_=
Gen12LPlp.gen
> +unsigned char tgllp_kernel_square_bin[] =3D {
> +	0x61, 0x00, 0x03, 0x80, 0x20, 0x02, 0x05, 0x03, 0x04, 0x00, 0x10, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x66, 0x01, 0x00, 0x80, 0x20, 0x82, 0x01, 0x80,
> +	0x00, 0x80, 0x00, 0x01, 0xc0, 0x04, 0xc0, 0x04, 0x41, 0x01, 0x20, 0x22,
> +	0x16, 0x09, 0x11, 0x03, 0x49, 0x00, 0x04, 0xa2, 0x12, 0x09, 0x11, 0x03,
> +	0x40, 0x01, 0x04, 0x00, 0x60, 0x06, 0x05, 0x05, 0x04, 0x04, 0x00, 0x01,
> +	0x05, 0x01, 0x58, 0x00, 0x40, 0x00, 0x24, 0x00, 0x60, 0x06, 0x05, 0x0a,
> +	0x04, 0x04, 0x00, 0x01, 0x05, 0x02, 0x58, 0x00, 0x40, 0x02, 0x0c, 0xa0,
> +	0x02, 0x05, 0x10, 0x07, 0x40, 0x02, 0x0e, 0xa6, 0x02, 0x0a, 0x10, 0x07,
> +	0x70, 0x02, 0x04, 0x00, 0x60, 0x02, 0x01, 0x00, 0x05, 0x0c, 0x46, 0x52,
> +	0x84, 0x08, 0x00, 0x00, 0x70, 0x02, 0x24, 0x00, 0x60, 0x02, 0x01, 0x00,
> +	0x05, 0x0e, 0x46, 0x52, 0x84, 0x08, 0x00, 0x00, 0x72, 0x00, 0x02, 0x80,
> +	0x50, 0x0d, 0x04, 0x00, 0x05, 0x00, 0x05, 0x1d, 0x05, 0x00, 0x05, 0x00,
> +	0x22, 0x00, 0x05, 0x01, 0x00, 0xc0, 0x00, 0x00, 0x90, 0x00, 0x00, 0x00,
> +	0x90, 0x00, 0x00, 0x00, 0x69, 0x00, 0x10, 0x60, 0x02, 0x0c, 0x20, 0x00,
> +	0x69, 0x00, 0x12, 0x66, 0x02, 0x0e, 0x20, 0x00, 0x40, 0x02, 0x14, 0xa0,
> +	0x32, 0x10, 0x10, 0x08, 0x40, 0x02, 0x16, 0xa6, 0x32, 0x12, 0x10, 0x08,
> +	0x31, 0xa0, 0x04, 0x00, 0x00, 0x00, 0x14, 0x18, 0x14, 0x14, 0x00, 0xcc,
> +	0x00, 0x00, 0x16, 0x00, 0x31, 0x91, 0x24, 0x00, 0x00, 0x00, 0x14, 0x1a,
> +	0x14, 0x16, 0x00, 0xcc, 0x00, 0x00, 0x16, 0x00, 0x40, 0x00, 0x10, 0xa0,
> +	0x4a, 0x10, 0x10, 0x08, 0x40, 0x00, 0x12, 0xa6, 0x4a, 0x12, 0x10, 0x08,
> +	0x41, 0x20, 0x18, 0x20, 0x00, 0x18, 0x00, 0x18, 0x41, 0x21, 0x1a, 0x26,
> +	0x00, 0x1a, 0x00, 0x1a, 0x31, 0xa2, 0x04, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x14, 0x10, 0x02, 0xcc, 0x14, 0x18, 0x96, 0x00, 0x31, 0x93, 0x24, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x14, 0x12, 0x02, 0xcc, 0x14, 0x1a, 0x96, 0x00,
> +	0x25, 0x00, 0x05, 0x00, 0x00, 0x40, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x10, 0x00, 0x00, 0x00, 0x61, 0x00, 0x7f, 0x64, 0x00, 0x03, 0x10, 0x00,
> +	0x31, 0x44, 0x03, 0x80, 0x00, 0x00, 0x0c, 0x1c, 0x0c, 0x03, 0x00, 0xa0,
> +	0x00, 0x00, 0x78, 0x02, 0x61, 0x24, 0x03, 0x80, 0x20, 0x02, 0x01, 0x00,
> +	0x05, 0x1c, 0x46, 0x00, 0x00, 0x00, 0x00, 0x00, 0x61, 0x00, 0x04, 0x80,
> +	0xa0, 0x4a, 0x01, 0x20, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x31, 0x01, 0x03, 0x80, 0x04, 0x00, 0x00, 0x00, 0x0c, 0x7f, 0x20, 0x70,
> +	0x00, 0x00, 0x00, 0x00, 0x60, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
> +	0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
> +};
> +unsigned int tgllp_kernel_square_length =3D sizeof(tgllp_kernel_square_b=
in);
> +
> +/**
> + * tgllp_create_indirect_data:
> + * @addr_bo_buffer_batch: pointer to batch buffer
> + * @addr_input: input buffer gpu offset
> + * @addr_output: output buffer gpu offset
> + *
> + * Prepares indirect data for compute pipeline.
> + */
> +void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_input, uint64_t addr_output)
> +{
> +	int b =3D 0;
> +
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000200;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D addr_input >> 32;
> +	addr_bo_buffer_batch[b++] =3D addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D addr_output >> 32;
> +	addr_bo_buffer_batch[b++] =3D 0x00000400;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000200;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00010000;
> +	addr_bo_buffer_batch[b++] =3D 0x00030002;
> +	addr_bo_buffer_batch[b++] =3D 0x00050004;
> +	addr_bo_buffer_batch[b++] =3D 0x00070006;
> +	addr_bo_buffer_batch[b++] =3D 0x00090008;
> +	addr_bo_buffer_batch[b++] =3D 0x000B000A;
> +	addr_bo_buffer_batch[b++] =3D 0x000D000C;
> +	addr_bo_buffer_batch[b++] =3D 0x000F000E;
> +	addr_bo_buffer_batch[b++] =3D 0x00110010;
> +	addr_bo_buffer_batch[b++] =3D 0x00130012;
> +	addr_bo_buffer_batch[b++] =3D 0x00150014;
> +	addr_bo_buffer_batch[b++] =3D 0x00170016;
> +	addr_bo_buffer_batch[b++] =3D 0x00190018;
> +	addr_bo_buffer_batch[b++] =3D 0x001B001A;
> +	addr_bo_buffer_batch[b++] =3D 0x001D001C;
> +	addr_bo_buffer_batch[b++] =3D 0x001F001E;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00210020;
> +	addr_bo_buffer_batch[b++] =3D 0x00230022;
> +	addr_bo_buffer_batch[b++] =3D 0x00250024;
> +	addr_bo_buffer_batch[b++] =3D 0x00270026;
> +	addr_bo_buffer_batch[b++] =3D 0x00290028;
> +	addr_bo_buffer_batch[b++] =3D 0x002B002A;
> +	addr_bo_buffer_batch[b++] =3D 0x002D002C;
> +	addr_bo_buffer_batch[b++] =3D 0x002F002E;
> +	addr_bo_buffer_batch[b++] =3D 0x00310030;
> +	addr_bo_buffer_batch[b++] =3D 0x00330032;
> +	addr_bo_buffer_batch[b++] =3D 0x00350034;
> +	addr_bo_buffer_batch[b++] =3D 0x00370036;
> +	addr_bo_buffer_batch[b++] =3D 0x00390038;
> +	addr_bo_buffer_batch[b++] =3D 0x003B003A;
> +	addr_bo_buffer_batch[b++] =3D 0x003D003C;
> +	addr_bo_buffer_batch[b++] =3D 0x003F003E;
> +}
> +
> +/**
> + * tgllp_create_surface_state:
> + * @addr_bo_buffer_batch: pointer to batch buffer
> + * @addr_input: input buffer gpu offset
> + * @addr_output: output buffer gpu offset
> + *
> + * Prepares surface state for compute pipeline.
> + */
> +void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_input, uint64_t addr_output)
> +{
> +	int b =3D 0;
> +
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x87FD4000;
> +	addr_bo_buffer_batch[b++] =3D 0x04000000;
> +	addr_bo_buffer_batch[b++] =3D 0x001F007F;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00004000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D addr_input & 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D addr_input >> 32;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x87FD4000;
> +	addr_bo_buffer_batch[b++] =3D 0x04000000;
> +	addr_bo_buffer_batch[b++] =3D 0x001F007F;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00004000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D addr_output & 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D addr_output >> 32;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000040;
> +	addr_bo_buffer_batch[b++] =3D 0x00000080;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +}
> +
> +/**
> + * tgllp_create_dynamic_state:
> + * @addr_bo_buffer_batch: pointer to batch buffer
> + * @offset_kernel: gpu offset of the shader
> + *
> + * Prepares dynamic state for compute pipeline.
> + */
> +void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> +				uint64_t offset_kernel)
> +{
> +	int b =3D 0;
> +
> +	addr_bo_buffer_batch[b++] =3D offset_kernel;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00180000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x000000C0;
> +	addr_bo_buffer_batch[b++] =3D 0x00060000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000010;
> +	addr_bo_buffer_batch[b++] =3D 0x00000003;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +}
> +
> +/**
> + * tgllp_create_batch_compute:
> + * @addr_bo_buffer_batch: pointer to batch buffer
> + * @addr_surface_state_base: gpu offset of surface state data
> + * @addr_dynamic_state_base: gpu offset of dynamic state data
> + * @addr_indirect_object_base: gpu offset of indirect object data
> + * @offset_indirect_data_start: gpu offset of indirect data start
> + *
> + * Prepares compute pipeline.
> + */
> +void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_surface_state_base,
> +				uint64_t addr_dynamic_state_base,
> +				uint64_t addr_indirect_object_base,
> +				uint64_t offset_indirect_data_start)
> +{
> +	int b =3D 0;
> +
> +	addr_bo_buffer_batch[b++] =3D MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] =3D 0x00002580;
> +	addr_bo_buffer_batch[b++] =3D 0x00060002;
> +	addr_bo_buffer_batch[b++] =3D PIPELINE_SELECT;
> +	addr_bo_buffer_batch[b++] =3D MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] =3D 0x00007034;
> +	addr_bo_buffer_batch[b++] =3D 0x60000321;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D MI_LOAD_REGISTER_IMM;
> +	addr_bo_buffer_batch[b++] =3D 0x0000E404;
> +	addr_bo_buffer_batch[b++] =3D 0x00000100;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00101021;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D MEDIA_VFE_STATE;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00A70100;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x07820000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100420;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D STATE_BASE_ADDRESS;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00040000;
> +	addr_bo_buffer_batch[b++] =3D (addr_surface_state_base & 0xffffffff) | =
0x1;
> +	addr_bo_buffer_batch[b++] =3D addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] =3D (addr_dynamic_state_base & 0xffffffff) | =
0x1;
> +	addr_bo_buffer_batch[b++] =3D addr_dynamic_state_base >> 32;
> +	addr_bo_buffer_batch[b++] =3D (addr_indirect_object_base & 0xffffffff) =
| 0x1;
> +	addr_bo_buffer_batch[b++] =3D (addr_indirect_object_base >> 32) | 0xfff=
f0000;
> +	addr_bo_buffer_batch[b++] =3D (addr_indirect_object_base & 0xffffffff) =
| 0x41;
> +	addr_bo_buffer_batch[b++] =3D addr_indirect_object_base >> 32;
> +	addr_bo_buffer_batch[b++] =3D 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] =3D 0x00010001;
> +	addr_bo_buffer_batch[b++] =3D 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] =3D 0xFFFFF001;
> +	addr_bo_buffer_batch[b++] =3D (addr_surface_state_base & 0xffffffff) | =
0x1;
> +	addr_bo_buffer_batch[b++] =3D addr_surface_state_base >> 32;
> +	addr_bo_buffer_batch[b++] =3D 0x003BF000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000041;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D MEDIA_STATE_FLUSH;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D MEDIA_INTERFACE_DESCRIPTOR_LOAD;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000020;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D GPGPU_WALKER;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000c80;
> +	addr_bo_buffer_batch[b++] =3D offset_indirect_data_start;
> +	addr_bo_buffer_batch[b++] =3D 0x8000000f;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000002;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000001;
> +	addr_bo_buffer_batch[b++] =3D 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D 0xffffffff;
> +	addr_bo_buffer_batch[b++] =3D MEDIA_STATE_FLUSH;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D PIPE_CONTROL;
> +	addr_bo_buffer_batch[b++] =3D 0x00100120;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D 0x00000000;
> +	addr_bo_buffer_batch[b++] =3D MI_BATCH_BUFFER_END;
> +}
> diff --git a/lib/xe/xe_compute.h b/lib/xe/xe_compute.h
> new file mode 100644
> index 0000000000..de763101da
> --- /dev/null
> +++ b/lib/xe/xe_compute.h
> @@ -0,0 +1,29 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Francois Dugast <francois.dugast@intel.com>
> + */
> +
> +#ifndef XE_COMPUTE_H
> +#define XE_COMPUTE_H
> +
> +#include <stdint.h>
> +
> +void tgllp_create_indirect_data(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_input, uint64_t addr_output);
> +void tgllp_create_surface_state(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_input, uint64_t addr_output);
> +void tgllp_create_dynamic_state(uint32_t *addr_bo_buffer_batch,
> +				uint64_t offset_kernel);
> +void tgllp_create_batch_compute(uint32_t *addr_bo_buffer_batch,
> +				uint64_t addr_surface_state_base,
> +				uint64_t addr_dynamic_state_base,
> +				uint64_t addr_indirect_object_base,
> +				uint64_t offset_indirect_data_start);
> +
> +extern unsigned char tgllp_kernel_square_bin[];
> +extern unsigned int tgllp_kernel_square_length;
> +
> +#endif	/* XE_COMPUTE_H */
> diff --git a/lib/xe/xe_ioctl.c b/lib/xe/xe_ioctl.c
> new file mode 100644
> index 0000000000..9d5793dff7
> --- /dev/null
> +++ b/lib/xe/xe_ioctl.c
> @@ -0,0 +1,436 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Jason Ekstrand <jason@jlekstrand.net>
> + *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifdef HAVE_LIBGEN_H
> +#include <libgen.h>
> +#endif
> +
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <getopt.h>
> +#include <pciaccess.h>
> +#include <signal.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <string.h>
> +#include <termios.h>
> +#include <unistd.h>
> +#include <sys/ioctl.h>
> +#include <sys/mman.h>
> +#include <sys/stat.h>
> +#include <sys/syscall.h>
> +#include <sys/types.h>
> +#include <sys/utsname.h>
> +#include <sys/wait.h>
> +
> +#ifdef __linux__
> +#include <sys/sysmacros.h>
> +#else
> +#define major(__v__) (((__v__) >> 8) & 0xff)
> +#define minor(__v__) ((__v__) & 0xff)
> +#endif
> +
> +#include "config.h"
> +#include "drmtest.h"
> +#include "igt_syncobj.h"
> +#include "ioctl_wrappers.h"
> +#include "xe_ioctl.h"
> +#include "xe_query.h"
> +
> +uint32_t xe_cs_prefetch_size(int fd)
> +{
> +	return 512;
> +}
> +
> +uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext)
> +{
> +	struct drm_xe_vm_create create =3D {
> +		.extensions =3D ext,
> +		.flags =3D flags,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create), 0);
> +
> +	return create.vm_id;
> +}
> +
> +void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
> +			    uint32_t bo, struct drm_xe_sync *sync,
> +			    uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, 0, 0, 0,
> +			    XE_VM_BIND_OP_UNMAP_ALL | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
> +		      struct drm_xe_vm_bind_op *bind_ops,
> +		      uint32_t num_bind, struct drm_xe_sync *sync,
> +		      uint32_t num_syncs)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.vm_id =3D vm,
> +		.num_binds =3D num_bind,
> +		.vector_of_binds =3D (uintptr_t)bind_ops,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.engine_id =3D engine,
> +	};
> +
> +	igt_assert(num_bind > 1);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind), 0);
> +}
> +
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> +		  uint64_t ext)
> +{
> +	struct drm_xe_vm_bind bind =3D {
> +		.extensions =3D ext,
> +		.vm_id =3D vm,
> +		.num_binds =3D 1,
> +		.bind.obj =3D bo,
> +		.bind.obj_offset =3D offset,
> +		.bind.range =3D size,
> +		.bind.addr =3D addr,
> +		.bind.op =3D op,
> +		.bind.region =3D region,
> +		.num_syncs =3D num_syncs,
> +		.syncs =3D (uintptr_t)sync,
> +		.engine_id =3D engine,
> +	};
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_VM_BIND, &bind))
> +		return -errno;
> +
> +	return 0;
> +}
> +
> +void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t=
 bo,
> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t num_syncs, uint32_t region, uint64_t ext)
> +{
> +	igt_assert_eq(__xe_vm_bind(fd, vm, engine, bo, offset, addr, size,
> +				   op, sync, num_syncs, region, ext), 0);
> +}
> +
> +void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		uint64_t addr, uint64_t size,
> +		struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> +		  uint64_t addr, uint64_t size,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, 0, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_UNMAP, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine, uint64_t=
 offset,
> +			  uint64_t addr, uint64_t size,
> +			  struct drm_xe_sync *sync, uint32_t num_syncs,
> +			  uint32_t region)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_PREFETCH | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, region, 0);
> +}
> +
> +void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		      uint64_t offset, uint64_t addr, uint64_t size,
> +		      struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32=
_t bo,
> +			    uint64_t offset, uint64_t addr, uint64_t size,
> +			    struct drm_xe_sync *sync, uint32_t num_syncs,
> +			    uint32_t flags)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, bo, offset, addr, size,
> +			    XE_VM_BIND_OP_MAP | XE_VM_BIND_FLAG_ASYNC | flags,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
> +			      uint64_t userptr, uint64_t addr, uint64_t size,
> +			      struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
> +			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC,
> +			    sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
> +				    uint64_t userptr, uint64_t addr,
> +				    uint64_t size, struct drm_xe_sync *sync,
> +				    uint32_t num_syncs, uint32_t flags)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, userptr, addr, size,
> +			    XE_VM_BIND_OP_MAP_USERPTR | XE_VM_BIND_FLAG_ASYNC |
> +			    flags, sync, num_syncs, 0, 0);
> +}
> +
> +void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
> +			uint64_t offset, uint64_t addr, uint64_t size,
> +			struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	__xe_vm_bind_assert(fd, vm, engine, 0, offset, addr, size,
> +			    XE_VM_BIND_OP_UNMAP | XE_VM_BIND_FLAG_ASYNC, sync,
> +			    num_syncs, 0, 0);
> +}
> +
> +static void __xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t=
 offset,
> +			      uint64_t addr, uint64_t size, uint32_t op)
> +{
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +		.handle =3D syncobj_create(fd, 0),
> +	};
> +
> +	__xe_vm_bind_assert(fd, vm, 0, bo, offset, addr, size, op, &sync, 1, 0,
> +			    0);
> +
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		     uint64_t addr, uint64_t size)
> +{
> +	__xe_vm_bind_sync(fd, vm, bo, offset, addr, size, XE_VM_BIND_OP_MAP);
> +}
> +
> +void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
> +		       uint64_t addr, uint64_t size)
> +{
> +	__xe_vm_bind_sync(fd, vm, 0, offset, addr, size, XE_VM_BIND_OP_UNMAP);
> +}
> +
> +void xe_vm_destroy(int fd, uint32_t vm)
> +{
> +	struct drm_xe_vm_destroy destroy =3D {
> +		.vm_id =3D vm,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_DESTROY, &destroy), 0);
> +}
> +
> +uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t=
 flags)
> +{
> +	struct drm_xe_gem_create create =3D {
> +		.vm_id =3D vm,
> +		.size =3D size,
> +		.flags =3D flags,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create), 0);
> +
> +	return create.handle;
> +}
> +
> +uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size)
> +{
> +	struct drm_xe_gem_create create =3D {
> +		.vm_id =3D vm,
> +		.size =3D size,
> +		.flags =3D vram_if_possible(fd, gt),
> +	};
> +	int err;
> +
> +	err =3D igt_ioctl(fd, DRM_IOCTL_XE_GEM_CREATE, &create);
> +	igt_assert_eq(err, 0);
> +
> +	return create.handle;
> +}
> +
> +uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext)
> +{
> +	struct drm_xe_engine_class_instance instance =3D {
> +		.engine_class =3D DRM_XE_ENGINE_CLASS_VM_BIND,
> +	};
> +	struct drm_xe_engine_create create =3D {
> +		.extensions =3D ext,
> +		.vm_id =3D vm,
> +		.width =3D 1,
> +		.num_placements =3D 1,
> +		.instances =3D to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +uint32_t xe_engine_create(int fd, uint32_t vm,
> +			  struct drm_xe_engine_class_instance *instance,
> +			  uint64_t ext)
> +{
> +	struct drm_xe_engine_create create =3D {
> +		.extensions =3D ext,
> +		.vm_id =3D vm,
> +		.width =3D 1,
> +		.num_placements =3D 1,
> +		.instances =3D to_user_pointer(instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class)
> +{
> +	struct drm_xe_engine_class_instance instance =3D {
> +		.engine_class =3D class,
> +		.engine_instance =3D 0,
> +		.gt_id =3D 0,
> +	};
> +	struct drm_xe_engine_create create =3D {
> +		.vm_id =3D vm,
> +		.width =3D 1,
> +		.num_placements =3D 1,
> +		.instances =3D to_user_pointer(&instance),
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_CREATE, &create), 0);
> +
> +	return create.engine_id;
> +}
> +
> +void xe_engine_destroy(int fd, uint32_t engine)
> +{
> +	struct drm_xe_engine_destroy destroy =3D {
> +		.engine_id =3D engine,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_ENGINE_DESTROY, &destroy), 0);
> +}
> +
> +uint64_t xe_bo_mmap_offset(int fd, uint32_t bo)
> +{
> +	struct drm_xe_gem_mmap_offset mmo =3D {
> +		.handle =3D bo,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_GEM_MMAP_OFFSET, &mmo), 0);
> +
> +	return mmo.offset;
> +}
> +
> +void *xe_bo_map(int fd, uint32_t bo, size_t size)
> +{
> +	uint64_t mmo;
> +	void *map;
> +
> +	mmo =3D xe_bo_mmap_offset(fd, bo);
> +	map =3D mmap(NULL, size, PROT_WRITE, MAP_SHARED, fd, mmo);
> +	igt_assert(map !=3D MAP_FAILED);
> +
> +	return map;
> +}
> +
> +static int __xe_exec(int fd, struct drm_xe_exec *exec)
> +{
> +	int err =3D 0;
> +
> +	if (igt_ioctl(fd, DRM_IOCTL_XE_EXEC, exec)) {
> +		err =3D -errno;
> +		igt_assume(err !=3D 0);
> +	}
> +	errno =3D 0;
> +	return err;
> +}
> +
> +void xe_exec(int fd, struct drm_xe_exec *exec)
> +{
> +	igt_assert_eq(__xe_exec(fd, exec), 0);
> +}
> +
> +void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs)
> +{
> +	struct drm_xe_exec exec =3D {
> +		.engine_id =3D engine,
> +		.syncs =3D (uintptr_t)sync,
> +		.num_syncs =3D num_syncs,
> +		.address =3D addr,
> +		.num_batch_buffer =3D 1,
> +	};
> +
> +	igt_assert_eq(__xe_exec(fd, &exec), 0);
> +}
> +
> +void xe_exec_wait(int fd, uint32_t engine, uint64_t addr)
> +{
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +		.handle =3D syncobj_create(fd, 0),
> +	};
> +
> +	xe_exec_sync(fd, engine, addr, &sync, 1);
> +
> +	igt_assert(syncobj_wait(fd, &sync.handle, 1, INT64_MAX, 0, NULL));
> +	syncobj_destroy(fd, sync.handle);
> +}
> +
> +void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t timeout)
> +{
> +	struct drm_xe_wait_user_fence wait =3D {
> +		.addr =3D to_user_pointer(addr),
> +		.op =3D DRM_XE_UFENCE_WAIT_EQ,
> +		.flags =3D !eci ? DRM_XE_UFENCE_WAIT_SOFT_OP : 0,
> +		.value =3D value,
> +		.mask =3D DRM_XE_UFENCE_WAIT_U64,
> +		.timeout =3D timeout,
> +		.num_engines =3D eci ? 1 :0,
> +		.instances =3D eci ? to_user_pointer(eci) : 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_WAIT_USER_FENCE, &wait), 0);
> +}
> +
> +void xe_force_gt_reset(int fd, int gt)
> +{
> +	char reset_string[128];
> +	struct stat st;
> +
> +	igt_assert_eq(fstat(fd, &st), 0);
> +
> +	snprintf(reset_string, sizeof(reset_string),
> +		 "cat /sys/kernel/debug/dri/%d/gt%d/force_reset",
> +		 minor(st.st_rdev), gt);
> +	system(reset_string);
> +}
> +
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
> +		   uint32_t property, uint32_t value)
> +{
> +	struct drm_xe_vm_madvise madvise =3D {
> +		.vm_id =3D vm,
> +		.range =3D size,
> +		.addr =3D addr,
> +		.property =3D property,
> +		.value =3D value,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_VM_MADVISE, &madvise), 0);
> +}
> diff --git a/lib/xe/xe_ioctl.h b/lib/xe/xe_ioctl.h
> new file mode 100644
> index 0000000000..5c7e773faa
> --- /dev/null
> +++ b/lib/xe/xe_ioctl.h
> @@ -0,0 +1,87 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Jason Ekstrand <jason@jlekstrand.net>
> + *    Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_IOCTL_H
> +#define XE_IOCTL_H
> +
> +#include <stdint.h>
> +#include <xe_drm.h>
> +
> +uint32_t xe_cs_prefetch_size(int fd);
> +uint32_t xe_vm_create(int fd, uint32_t flags, uint64_t ext);
> +int  __xe_vm_bind(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		  uint64_t offset, uint64_t addr, uint64_t size, uint32_t op,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs, uint32_t region,
> +		  uint64_t ext);
> +void  __xe_vm_bind_assert(int fd, uint32_t vm, uint32_t engine, uint32_t=
 bo,
> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  uint32_t op, struct drm_xe_sync *sync,
> +			  uint32_t num_syncs, uint32_t region, uint64_t ext);
> +void xe_vm_bind(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		uint64_t addr, uint64_t size,
> +		struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_unbind(int fd, uint32_t vm, uint64_t offset,
> +		  uint64_t addr, uint64_t size,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_prefetch_async(int fd, uint32_t vm, uint32_t engine,
> +			  uint64_t offset, uint64_t addr, uint64_t size,
> +			  struct drm_xe_sync *sync, uint32_t num_syncs,
> +			  uint32_t region);
> +void xe_vm_bind_async(int fd, uint32_t vm, uint32_t engine, uint32_t bo,
> +		      uint64_t offset, uint64_t addr, uint64_t size,
> +		      struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_userptr_async(int fd, uint32_t vm, uint32_t engine,
> +			      uint64_t userptr, uint64_t addr, uint64_t size,
> +			      struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_async_flags(int fd, uint32_t vm, uint32_t engine, uint32=
_t bo,
> +			    uint64_t offset, uint64_t addr, uint64_t size,
> +			    struct drm_xe_sync *sync, uint32_t num_syncs,
> +			    uint32_t flags);
> +void xe_vm_bind_userptr_async_flags(int fd, uint32_t vm, uint32_t engine,
> +				    uint64_t userptr, uint64_t addr,
> +				    uint64_t size, struct drm_xe_sync *sync,
> +				    uint32_t num_syncs, uint32_t flags);
> +void xe_vm_unbind_async(int fd, uint32_t vm, uint32_t engine,
> +			uint64_t offset, uint64_t addr, uint64_t size,
> +			struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_vm_bind_sync(int fd, uint32_t vm, uint32_t bo, uint64_t offset,
> +		     uint64_t addr, uint64_t size);
> +void xe_vm_unbind_sync(int fd, uint32_t vm, uint64_t offset,
> +		       uint64_t addr, uint64_t size);
> +void xe_vm_bind_array(int fd, uint32_t vm, uint32_t engine,
> +		      struct drm_xe_vm_bind_op *bind_ops,
> +		      uint32_t num_bind, struct drm_xe_sync *sync,
> +		      uint32_t num_syncs);
> +void xe_vm_unbind_all_async(int fd, uint32_t vm, uint32_t engine,
> +			    uint32_t bo, struct drm_xe_sync *sync,
> +			    uint32_t num_syncs);
> +void xe_vm_destroy(int fd, uint32_t vm);
> +uint32_t xe_bo_create_flags(int fd, uint32_t vm, uint64_t size, uint32_t=
 flags);
> +uint32_t xe_bo_create(int fd, int gt, uint32_t vm, uint64_t size);
> +uint32_t xe_engine_create(int fd, uint32_t vm,
> +			  struct drm_xe_engine_class_instance *instance,
> +			  uint64_t ext);
> +uint32_t xe_bind_engine_create(int fd, uint32_t vm, uint64_t ext);
> +uint32_t xe_engine_create_class(int fd, uint32_t vm, uint16_t class);
> +void xe_engine_destroy(int fd, uint32_t engine);
> +uint64_t xe_bo_mmap_offset(int fd, uint32_t bo);
> +void *xe_bo_map(int fd, uint32_t bo, size_t size);
> +void xe_exec(int fd, struct drm_xe_exec *exec);
> +void xe_exec_sync(int fd, uint32_t engine, uint64_t addr,
> +		  struct drm_xe_sync *sync, uint32_t num_syncs);
> +void xe_exec_wait(int fd, uint32_t engine, uint64_t addr);
> +void xe_wait_ufence(int fd, uint64_t *addr, uint64_t value,
> +		    struct drm_xe_engine_class_instance *eci,
> +		    int64_t timeout);
> +void xe_force_gt_reset(int fd, int gt);
> +void xe_vm_madvise(int fd, uint32_t vm, uint64_t addr, uint64_t size,
> +		   uint32_t property, uint32_t value);
> +
> +#endif /* XE_IOCTL_H */
> diff --git a/lib/xe/xe_query.c b/lib/xe/xe_query.c
> new file mode 100644
> index 0000000000..a6926057f0
> --- /dev/null
> +++ b/lib/xe/xe_query.c
> @@ -0,0 +1,471 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <stdlib.h>
> +#include <pthread.h>
> +
> +#include "drmtest.h"
> +#include "ioctl_wrappers.h"
> +#include "igt_map.h"
> +
> +#include "xe_query.h"
> +#include "xe_ioctl.h"
> +
> +static struct drm_xe_query_config *xe_query_config_new(int fd)
> +{
> +	struct drm_xe_query_config *config;
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D 0,
> +		.query =3D DRM_XE_DEVICE_QUERY_CONFIG,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	config =3D malloc(query.size);
> +	igt_assert(config);
> +
> +	query.data =3D to_user_pointer(config);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	igt_assert(config->num_params > 0);
> +
> +	return config;
> +}
> +
> +static struct drm_xe_query_gts *xe_query_gts_new(int fd)
> +{
> +	struct drm_xe_query_gts *gts;
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D 0,
> +		.query =3D DRM_XE_DEVICE_QUERY_GTS,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	gts =3D malloc(query.size);
> +	igt_assert(gts);
> +
> +	query.data =3D to_user_pointer(gts);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return gts;
> +}
> +
> +static uint64_t __memory_regions(const struct drm_xe_query_gts *gts)
> +{
> +	uint64_t regions =3D 0;
> +	int i;
> +
> +	for (i =3D 0; i < gts->num_gt; i++)
> +		regions |=3D gts->gts[i].native_mem_regions |
> +			   gts->gts[i].slow_mem_regions;
> +
> +	return regions;
> +}
> +
> +static struct drm_xe_engine_class_instance *
> +xe_query_engines_new(int fd, unsigned int *num_engines)
> +{
> +	struct drm_xe_engine_class_instance *hw_engines;
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D 0,
> +		.query =3D DRM_XE_DEVICE_QUERY_ENGINES,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	igt_assert(num_engines);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	hw_engines =3D malloc(query.size);
> +	igt_assert(hw_engines);
> +
> +	query.data =3D to_user_pointer(hw_engines);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	*num_engines =3D query.size / sizeof(*hw_engines);
> +
> +	return hw_engines;
> +}
> +
> +static struct drm_xe_query_mem_usage *xe_query_mem_usage_new(int fd)
> +{
> +	struct drm_xe_query_mem_usage *mem_usage;
> +	struct drm_xe_device_query query =3D {
> +		.extensions =3D 0,
> +		.query =3D DRM_XE_DEVICE_QUERY_MEM_USAGE,
> +		.size =3D 0,
> +		.data =3D 0,
> +	};
> +
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	mem_usage =3D malloc(query.size);
> +	igt_assert(mem_usage);
> +
> +	query.data =3D to_user_pointer(mem_usage);
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query), 0);
> +
> +	return mem_usage;
> +}
> +
> +static uint64_t native_region_for_gt(const struct drm_xe_query_gts *gts,=
 int gt)
> +{
> +	uint64_t region;
> +
> +	igt_assert(gts->num_gt > gt);
> +	region =3D gts->gts[gt].native_mem_regions;
> +	igt_assert(region);
> +
> +	return region;
> +}
> +
> +static uint64_t gt_vram_size(const struct drm_xe_query_mem_usage *mem_us=
age,
> +			     const struct drm_xe_query_gts *gts, int gt)
> +{
> +	int region_idx =3D ffs(native_region_for_gt(gts, gt)) - 1;
> +
> +	if (XE_IS_CLASS_VRAM(&mem_usage->regions[region_idx]))
> +		return mem_usage->regions[region_idx].total_size;
> +
> +	return 0;
> +}
> +
> +static bool __mem_has_vram(struct drm_xe_query_mem_usage *mem_usage)
> +{
> +	for (int i =3D 0; i < mem_usage->num_regions; i++)
> +		if (XE_IS_CLASS_VRAM(&mem_usage->regions[i]))
> +			return true;
> +
> +	return false;
> +}
> +
> +static uint32_t __mem_default_alignment(struct drm_xe_query_mem_usage *m=
em_usage)
> +{
> +	uint32_t alignment =3D XE_DEFAULT_ALIGNMENT;
> +
> +	for (int i =3D 0; i < mem_usage->num_regions; i++)
> +		if (alignment < mem_usage->regions[i].min_page_size)
> +			alignment =3D mem_usage->regions[i].min_page_size;
> +
> +	return alignment;
> +}
> +
> +static bool xe_check_supports_faults(int fd)
> +{
> +	bool supports_faults;
> +
> +	struct drm_xe_vm_create create =3D {
> +		.flags =3D DRM_XE_VM_CREATE_ASYNC_BIND_OPS |
> +			 DRM_XE_VM_CREATE_FAULT_MODE,
> +	};
> +
> +	supports_faults =3D !igt_ioctl(fd, DRM_IOCTL_XE_VM_CREATE, &create);
> +
> +	if (supports_faults)
> +		xe_vm_destroy(fd, create.vm_id);
> +
> +	return supports_faults;
> +}
> +
> +/**
> + * xe_engine_class_string:
> + * @engine_class: engine class
> + *
> + * Returns engine class name or 'unknown class engine' otherwise.
> + */
> +const char *xe_engine_class_string(uint32_t engine_class)
> +{
> +	switch (engine_class) {
> +		case DRM_XE_ENGINE_CLASS_RENDER:
> +			return "DRM_XE_ENGINE_CLASS_RENDER";
> +		case DRM_XE_ENGINE_CLASS_COPY:
> +			return "DRM_XE_ENGINE_CLASS_COPY";
> +		case DRM_XE_ENGINE_CLASS_VIDEO_DECODE:
> +			return "DRM_XE_ENGINE_CLASS_VIDEO_DECODE";
> +		case DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE:
> +			return "DRM_XE_ENGINE_CLASS_VIDEO_ENHANCE";
> +		case DRM_XE_ENGINE_CLASS_COMPUTE:
> +			return "DRM_XE_ENGINE_CLASS_COMPUTE";
> +		default:
> +			igt_warn("Engine class 0x%x unknown\n", engine_class);
> +			return "unknown engine class";
> +	}
> +}
> +
> +static struct xe_device_cache {
> +	pthread_mutex_t cache_mutex;
> +	struct igt_map *map;
> +} cache;
> +
> +static struct xe_device *find_in_cache_unlocked(int fd)
> +{
> +	return igt_map_search(cache.map, &fd);
> +}
> +
> +static struct xe_device *find_in_cache(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	xe_dev =3D find_in_cache_unlocked(fd);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +
> +	return xe_dev;
> +}
> +
> +/**
> + * xe_device_get:
> + * @fd: xe device fd
> + *
> + * Function creates and caches xe_device struct which contains configura=
tion
> + * data returned in few queries. Subsequent calls returns previously
> + * created xe_device. To remove this from cache xe_device_put() must be
> + * called.
> + */
> +struct xe_device *xe_device_get(int fd)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev =3D find_in_cache(fd);
> +	if (xe_dev)
> +		return xe_dev;
> +
> +	xe_dev =3D calloc(1, sizeof(*xe_dev));
> +	igt_assert(xe_dev);
> +
> +	xe_dev->fd =3D fd;
> +	xe_dev->config =3D xe_query_config_new(fd);
> +	xe_dev->number_gt =3D xe_dev->config->info[XE_QUERY_CONFIG_GT_COUNT];
> +	xe_dev->va_bits =3D xe_dev->config->info[XE_QUERY_CONFIG_VA_BITS];
> +	xe_dev->gts =3D xe_query_gts_new(fd);
> +	xe_dev->memory_regions =3D __memory_regions(xe_dev->gts);
> +	xe_dev->hw_engines =3D xe_query_engines_new(fd, &xe_dev->number_hw_engi=
nes);
> +	xe_dev->mem_usage =3D xe_query_mem_usage_new(fd);
> +	xe_dev->vram_size =3D calloc(xe_dev->number_gt, sizeof(*xe_dev->vram_si=
ze));
> +	for (int gt =3D 0; gt < xe_dev->number_gt; gt++)
> +		xe_dev->vram_size[gt] =3D gt_vram_size(xe_dev->mem_usage,
> +						     xe_dev->gts, gt);
> +	xe_dev->default_alignment =3D __mem_default_alignment(xe_dev->mem_usage=
);
> +	xe_dev->has_vram =3D __mem_has_vram(xe_dev->mem_usage);
> +	xe_dev->supports_faults =3D xe_check_supports_faults(fd);
> +
> +	igt_map_insert(cache.map, &xe_dev->fd, xe_dev);
> +
> +	return xe_dev;
> +}
> +
> +static void xe_device_free(struct xe_device *xe_dev)
> +{
> +	free(xe_dev->config);
> +	free(xe_dev->gts);
> +	free(xe_dev->hw_engines);
> +	free(xe_dev->mem_usage);
> +	free(xe_dev->vram_size);
> +	free(xe_dev);
> +}
> +
> +static void delete_in_cache(struct igt_map_entry *entry)
> +{
> +	xe_device_free((struct xe_device *)entry->data);
> +}
> +
> +/**
> + * xe_device_put:
> + * @fd: xe device fd
> + *
> + * Remove previously allocated and cached xe_device (if any).
> + */
> +void xe_device_put(int fd)
> +{
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	if (find_in_cache_unlocked(fd))
> +		igt_map_remove(cache.map, &fd, delete_in_cache);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +}
> +
> +static void xe_device_destroy_cache(void)
> +{
> +	pthread_mutex_lock(&cache.cache_mutex);
> +	igt_map_destroy(cache.map, delete_in_cache);
> +	pthread_mutex_unlock(&cache.cache_mutex);
> +}
> +
> +static void xe_device_cache_init(void)
> +{
> +	pthread_mutex_init(&cache.cache_mutex, NULL);
> +	xe_device_destroy_cache();
> +	cache.map =3D igt_map_create(igt_map_hash_32, igt_map_equal_32);
> +}
> +
> +#define xe_dev_FN(_NAME, _FIELD, _TYPE) \
> +_TYPE _NAME(int fd)			\
> +{					\
> +	struct xe_device *xe_dev;	\
> +					\
> +	xe_dev =3D find_in_cache(fd);	\
> +	igt_assert(xe_dev);		\
> +	return xe_dev->_FIELD;		\
> +}
> +
> +/**
> + * xe_number_gt:
> + * @fd: xe device fd
> + *
> + * Return number of gts for xe device fd.
> + */
> +xe_dev_FN(xe_number_gt, number_gt, unsigned int);
> +
> +/**
> + * all_memory_regions:
> + * @fd: xe device fd
> + *
> + * Returns memory regions bitmask for xe device @fd.
> + */
> +xe_dev_FN(all_memory_regions, memory_regions, uint64_t);
> +
> +/**
> + * system_memory:
> + * @fd: xe device fd
> + *
> + * Returns system memory bitmask for xe device @fd.
> + */
> +uint64_t system_memory(int fd)
> +{
> +	uint64_t regions =3D all_memory_regions(fd);
> +
> +	return regions & 0x1;
> +}
> +
> +/**
> + * vram_memory:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns vram memory bitmask for xe device @fd and @gt id.
> + */
> +uint64_t vram_memory(int fd, int gt)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev =3D find_in_cache(fd);
> +	igt_assert(xe_dev);
> +	igt_assert(gt >=3D 0 && gt < xe_dev->number_gt);
> +
> +	return native_region_for_gt(xe_dev->gts, gt);
> +}
> +
> +/**
> + * vram_if_possible:
> + * @fd: xe device fd
> + * @gt: gt id
> + *
> + * Returns vram memory bitmask for xe device @fd and @gt id or system me=
mory
> + * if there's no vram memory available for @gt.
> + */
> +uint64_t vram_if_possible(int fd, int gt)
> +{
> +	uint64_t regions =3D all_memory_regions(fd);
> +	uint64_t system_memory =3D regions & 0x1;
> +	uint64_t vram =3D regions & (~0x1);
> +
> +	return vram ? vram : system_memory;
> +}
> +
> +/**
> + * xe_hw_engines:
> + * @fd: xe device fd
> + *
> + * Returns engines array of xe device @fd.
> + */
> +xe_dev_FN(xe_hw_engines, hw_engines, struct drm_xe_engine_class_instance=
 *);
> +
> +/**
> + * xe_hw_engine:
> + * @fd: xe device fd
> + * @idx: engine index
> + *
> + * Returns engine instance of xe device @fd and @idx.
> + */
> +struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev =3D find_in_cache(fd);
> +	igt_assert(xe_dev);
> +	igt_assert(idx >=3D 0 && idx < xe_dev->number_hw_engines);
> +
> +	return &xe_dev->hw_engines[idx];
> +}
> +
> +/**
> + * xe_number_hw_engine:
> + * @fd: xe device fd
> + *
> + * Returns number of hw engines of xe device @fd.
> + */
> +xe_dev_FN(xe_number_hw_engines, number_hw_engines, unsigned int);
> +
> +/**
> + * xe_has_vram:
> + * @fd: xe device fd
> + *
> + * Returns true if xe device @fd has vram otherwise false.
> + */
> +xe_dev_FN(xe_has_vram, has_vram, bool);
> +
> +/**
> + * xe_vram_size:
> + * @fd: xe device fd
> + * @gt: gt
> + *
> + * Returns size of vram of xe device @fd.
> + */
> +uint64_t xe_vram_size(int fd, int gt)
> +{
> +	struct xe_device *xe_dev;
> +
> +	xe_dev =3D find_in_cache(fd);
> +	igt_assert(xe_dev);
> +
> +	return xe_dev->vram_size[gt];
> +}
> +
> +/**
> + * xe_get_default_alignment:
> + * @fd: xe device fd
> + *
> + * Returns default alignment of objects for xe device @fd.
> + */
> +xe_dev_FN(xe_get_default_alignment, default_alignment, uint32_t);
> +
> +/**
> + * xe_supports_faults:
> + * @fd: xe device fd
> + *
> + * Returns true if xe device @fd allows creating vm in fault mode otherw=
ise
> + * false.
> + */
> +xe_dev_FN(xe_supports_faults, supports_faults, bool);
> +
> +/**
> + * xe_va_bits:
> + * @fd: xe device fd
> + *
> + * Returns number of virtual address bits used in xe device @fd.
> + */
> +xe_dev_FN(xe_va_bits, va_bits, uint32_t);
> +
> +igt_constructor
> +{
> +	xe_device_cache_init();
> +}
> diff --git a/lib/xe/xe_query.h b/lib/xe/xe_query.h
> new file mode 100644
> index 0000000000..fe1343f616
> --- /dev/null
> +++ b/lib/xe/xe_query.h
> @@ -0,0 +1,94 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_QUERY_H
> +#define XE_QUERY_H
> +
> +#include <stdint.h>
> +#include <xe_drm.h>
> +#include "igt_list.h"
> +
> +#define SZ_4K	0x1000
> +#define SZ_64K	0x10000
> +
> +#define XE_DEFAULT_ALIGNMENT           SZ_4K
> +#define XE_DEFAULT_ALIGNMENT_64K       SZ_64K
> +
> +struct xe_device {
> +	/** @fd: xe fd */
> +	int fd;
> +
> +	/** @config: xe configuration */
> +	struct drm_xe_query_config *config;
> +
> +	/** @gts: gt info */
> +	struct drm_xe_query_gts *gts;
> +
> +	/** @number_gt: number of gt */
> +	unsigned int number_gt;
> +
> +	/** @gts: bitmask of all memory regions */
> +	uint64_t memory_regions;
> +
> +	/** @hw_engines: array of hardware engines */
> +	struct drm_xe_engine_class_instance *hw_engines;
> +
> +	/** @number_hw_engines: length of hardware engines array */
> +	unsigned int number_hw_engines;
> +
> +	/** @mem_usage: regions memory information and usage */
> +	struct drm_xe_query_mem_usage *mem_usage;
> +
> +	/** @vram_size: array of vram sizes for all gts */
> +	uint64_t *vram_size;
> +
> +	/** @default_alignment: safe alignment regardless region location */
> +	uint32_t default_alignment;
> +
> +	/** @has_vram: true if gpu has vram, false if system memory only */
> +	bool has_vram;
> +
> +	/** @supports_faults: true if gpu supports faults, otherwise false */
> +	bool supports_faults;
> +
> +	/** @va_bits: va length in bits */
> +	uint32_t va_bits;
> +};
> +
> +#define for_each_hw_engine(__fd, __hwe) \
> +	for (int __i =3D 0; __i < xe_number_hw_engines(__fd) && \
> +	     (__hwe =3D xe_hw_engine(__fd, __i)); ++__i)
> +#define for_each_hw_engine_class(__class) \
> +	for (__class =3D 0; __class < DRM_XE_ENGINE_CLASS_COMPUTE + 1; \
> +	     ++__class)
> +#define for_each_gt(__fd, __gt) \
> +	for (__gt =3D 0; __gt < xe_number_gt(__fd); ++__gt)
> +
> +#define XE_IS_CLASS_SYSMEM(__region) ((__region)->mem_class =3D=3D XE_ME=
M_REGION_CLASS_SYSMEM)
> +#define XE_IS_CLASS_VRAM(__region) ((__region)->mem_class =3D=3D XE_MEM_=
REGION_CLASS_VRAM)
> +
> +unsigned int xe_number_gt(int fd);
> +uint64_t all_memory_regions(int fd);
> +uint64_t system_memory(int fd);
> +uint64_t vram_memory(int fd, int gt);
> +uint64_t vram_if_possible(int fd, int gt);
> +struct drm_xe_engine_class_instance *xe_hw_engines(int fd);
> +struct drm_xe_engine_class_instance *xe_hw_engine(int fd, int idx);
> +unsigned int xe_number_hw_engines(int fd);
> +bool xe_has_vram(int fd);
> +//uint64_t xe_vram_size(int fd);
> +uint64_t xe_vram_size(int fd, int gt);
> +uint32_t xe_get_default_alignment(int fd);
> +uint32_t xe_va_bits(int fd);
> +bool xe_supports_faults(int fd);
> +const char *xe_engine_class_string(uint32_t engine_class);
> +
> +struct xe_device *xe_device_get(int fd);
> +void xe_device_put(int fd);
> +
> +#endif	/* XE_QUERY_H */
> diff --git a/lib/xe/xe_spin.c b/lib/xe/xe_spin.c
> new file mode 100644
> index 0000000000..6dc705aea6
> --- /dev/null
> +++ b/lib/xe/xe_spin.c
> @@ -0,0 +1,157 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#include <string.h>
> +
> +#include "drmtest.h"
> +#include "igt.h"
> +#include "igt_core.h"
> +#include "igt_syncobj.h"
> +#include "intel_reg.h"
> +#include "xe_ioctl.h"
> +#include "xe_spin.h"
> +
> +/**
> + * xe_spin_init:
> + * @spin: pointer to mapped bo in which spinner code will be written
> + * @addr: offset of spinner within vm
> + * @preempt: allow spinner to be preempted or not
> + */
> +void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt)
> +{
> +	uint64_t batch_offset =3D (char *)&spin->batch - (char *)spin;
> +	uint64_t batch_addr =3D addr + batch_offset;
> +	uint64_t start_offset =3D (char *)&spin->start - (char *)spin;
> +	uint64_t start_addr =3D addr + start_offset;
> +	uint64_t end_offset =3D (char *)&spin->end - (char *)spin;
> +	uint64_t end_addr =3D addr + end_offset;
> +	int b =3D 0;
> +
> +	spin->start =3D 0;
> +	spin->end =3D 0xffffffff;
> +
> +	spin->batch[b++] =3D MI_STORE_DWORD_IMM;
> +	spin->batch[b++] =3D start_addr;
> +	spin->batch[b++] =3D start_addr >> 32;
> +	spin->batch[b++] =3D 0xc0ffee;
> +
> +	if (preempt)
> +		spin->batch[b++] =3D (0x5 << 23);
> +
> +	spin->batch[b++] =3D MI_COND_BATCH_BUFFER_END | MI_DO_COMPARE | 2;
> +	spin->batch[b++] =3D 0;
> +	spin->batch[b++] =3D end_addr;
> +	spin->batch[b++] =3D end_addr >> 32;
> +
> +	spin->batch[b++] =3D MI_BATCH_BUFFER_START | 1 << 8 | 1;
> +	spin->batch[b++] =3D batch_addr;
> +	spin->batch[b++] =3D batch_addr >> 32;
> +
> +	igt_assert(b <=3D ARRAY_SIZE(spin->batch));
> +}
> +
> +/**
> + * xe_spin_started:
> + * @spin: pointer to spinner mapped bo
> + *
> + * Returns: true if spinner is running, othwerwise false.
> + */
> +bool xe_spin_started(struct xe_spin *spin)
> +{
> +	return spin->start !=3D 0;
> +}
> +
> +/**
> + * xe_spin_wait_started:
> + * @spin: pointer to spinner mapped bo
> + *
> + * Wait in userspace code until spinner won't start.
> + */
> +void xe_spin_wait_started(struct xe_spin *spin)
> +{
> +	while(!xe_spin_started(spin));
> +}
> +
> +void xe_spin_end(struct xe_spin *spin)
> +{
> +	spin->end =3D 0;
> +}
> +
> +void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> +		  struct xe_cork *cork)
> +{
> +	uint64_t addr =3D xe_get_default_alignment(fd);
> +	size_t bo_size =3D xe_get_default_alignment(fd);
> +	uint32_t vm, bo, engine, syncobj;
> +	struct xe_spin *spin;
> +	struct drm_xe_sync sync =3D {
> +		.flags =3D DRM_XE_SYNC_SYNCOBJ | DRM_XE_SYNC_SIGNAL,
> +	};
> +	struct drm_xe_exec exec =3D {
> +		.num_batch_buffer =3D 1,
> +		.num_syncs =3D 1,
> +		.syncs =3D to_user_pointer(&sync),
> +	};
> +
> +	vm =3D xe_vm_create(fd, 0, 0);
> +
> +	bo =3D xe_bo_create(fd, hwe->gt_id, vm, bo_size);
> +	spin =3D xe_bo_map(fd, bo, 0x1000);
> +
> +	xe_vm_bind_sync(fd, vm, bo, 0, addr, bo_size);
> +
> +	engine =3D xe_engine_create(fd, vm, hwe, 0);
> +	syncobj =3D syncobj_create(fd, 0);
> +
> +	xe_spin_init(spin, addr, true);
> +	exec.engine_id =3D engine;
> +	exec.address =3D addr;
> +	sync.handle =3D syncobj;
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_EXEC, &exec), 0);
> +
> +	cork->spin =3D spin;
> +	cork->fd =3D fd;
> +	cork->vm =3D vm;
> +	cork->bo =3D bo;
> +	cork->engine =3D engine;
> +	cork->syncobj =3D syncobj;
> +}
> +
> +bool xe_cork_started(struct xe_cork *cork)
> +{
> +	return xe_spin_started(cork->spin);
> +}
> +
> +void xe_cork_wait_started(struct xe_cork *cork)
> +{
> +	xe_spin_wait_started(cork->spin);
> +}
> +
> +void xe_cork_end(struct xe_cork *cork)
> +{
> +	xe_spin_end(cork->spin);
> +}
> +
> +void xe_cork_wait_done(struct xe_cork *cork)
> +{
> +	igt_assert(syncobj_wait(cork->fd, &cork->syncobj, 1, INT64_MAX, 0,
> +				NULL));
> +}
> +
> +void xe_cork_fini(struct xe_cork *cork)
> +{
> +	syncobj_destroy(cork->fd, cork->syncobj);
> +	xe_engine_destroy(cork->fd, cork->engine);
> +	xe_vm_destroy(cork->fd, cork->vm);
> +	gem_close(cork->fd, cork->bo);
> +}
> +
> +uint32_t xe_cork_sync_handle(struct xe_cork *cork)
> +{
> +	return cork->syncobj;
> +}
> diff --git a/lib/xe/xe_spin.h b/lib/xe/xe_spin.h
> new file mode 100644
> index 0000000000..73f9a026f7
> --- /dev/null
> +++ b/lib/xe/xe_spin.h
> @@ -0,0 +1,48 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2023 Intel Corporation
> + *
> + * Authors:
> + *    Matthew Brost <matthew.brost@intel.com>
> + */
> +
> +#ifndef XE_SPIN_H
> +#define XE_SPIN_H
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +#include "xe_query.h"
> +
> +/* Mapped GPU object */
> +struct xe_spin {
> +	uint32_t batch[16];
> +	uint64_t pad;
> +	uint32_t start;
> +	uint32_t end;
> +};
> +
> +void xe_spin_init(struct xe_spin *spin, uint64_t addr, bool preempt);
> +bool xe_spin_started(struct xe_spin *spin);
> +void xe_spin_wait_started(struct xe_spin *spin);
> +void xe_spin_end(struct xe_spin *spin);
> +
> +struct xe_cork {
> +	struct xe_spin *spin;
> +	int fd;
> +	uint32_t vm;
> +	uint32_t bo;
> +	uint32_t engine;
> +	uint32_t syncobj;
> +};
> +
> +void xe_cork_init(int fd, struct drm_xe_engine_class_instance *hwe,
> +		  struct xe_cork *cork);
> +bool xe_cork_started(struct xe_cork *cork);
> +void xe_cork_wait_started(struct xe_cork *cork);
> +void xe_cork_end(struct xe_cork *cork);
> +void xe_cork_wait_done(struct xe_cork *cork);
> +void xe_cork_fini(struct xe_cork *cork);
> +uint32_t xe_cork_sync_handle(struct xe_cork *cork);
> +
> +#endif	/* XE_SPIN_H */
> diff --git a/meson.build b/meson.build
> index e7a68503d7..2a7f6078c4 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -261,6 +261,7 @@ libexecdir =3D join_paths(get_option('libexecdir'), '=
igt-gpu-tools')
>  amdgpudir =3D join_paths(libexecdir, 'amdgpu')
>  v3ddir =3D join_paths(libexecdir, 'v3d')
>  vc4dir =3D join_paths(libexecdir, 'vc4')
> +xedir =3D join_paths(libexecdir, 'xe')
>  mandir =3D get_option('mandir')
>  pkgconfigdir =3D join_paths(libdir, 'pkgconfig')
>  python3 =3D find_program('python3', required : true)
> @@ -308,12 +309,19 @@ if get_option('use_rpath')
>  		vc4_rpathdir =3D join_paths(vc4_rpathdir, '..')
>  	endforeach
>  	vc4_rpathdir =3D join_paths(vc4_rpathdir, libdir)
> +
> +	xedir_rpathdir =3D '$ORIGIN'
> +	foreach p : xedir.split('/')
> +		xedir_rpathdir =3D join_paths(xedir_rpathdir, '..')
> +	endforeach
> +	xedir_rpathdir =3D join_paths(xedir_rpathdir, libdir)
>  else
>  	bindir_rpathdir =3D ''
>  	libexecdir_rpathdir =3D ''
>  	amdgpudir_rpathdir =3D ''
>  	v3d_rpathdir =3D ''
>  	vc4_rpathdir =3D ''
> +	xedir_rpathdir =3D ''
>  endif
> =20
>  subdir('lib')
