Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 490EC10EB20
 for <igt-dev@lists.freedesktop.org>; Thu, 23 Feb 2023 11:20:01 +0000 (UTC)
Date: Thu, 23 Feb 2023 12:19:57 +0100
From: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
To: Zbigniew =?UTF-8?B?S2VtcGN6ecWEc2tp?= <zbigniew.kempczynski@intel.com>
Message-ID: <20230223121957.04fc2489@maurocar-mobl2>
In-Reply-To: <20230221114621.32785-5-zbigniew.kempczynski@intel.com>
References: <20230221114621.32785-1-zbigniew.kempczynski@intel.com>
 <20230221114621.32785-5-zbigniew.kempczynski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [igt-dev] [PATCH i-g-t 4/7] tools/xe_reg: Add Xe register
 read/write tool
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

On Tue, 21 Feb 2023 12:46:18 +0100
Zbigniew Kempczy=C5=84ski <zbigniew.kempczynski@intel.com> wrote:

Some description is needed here.

> Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>


After adding a patch description, feel free to add:

Acked-by: Mauro Carvalho Chehab <mchehab@kernel.org>


> ---
>  tools/meson.build |   1 +
>  tools/xe_reg.c    | 366 ++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 367 insertions(+)
>  create mode 100644 tools/xe_reg.c
>=20
> diff --git a/tools/meson.build b/tools/meson.build
> index d2defec8..4c45f16b 100644
> --- a/tools/meson.build
> +++ b/tools/meson.build
> @@ -42,6 +42,7 @@ tools_progs =3D [
>  	'intel_gvtg_test',
>  	'dpcd_reg',
>  	'lsgpu',
> +	'xe_reg',
>  ]
>  tool_deps =3D igt_deps
>  tool_deps +=3D zlib
> diff --git a/tools/xe_reg.c b/tools/xe_reg.c
> new file mode 100644
> index 00000000..1f7b384d
> --- /dev/null
> +++ b/tools/xe_reg.c
> @@ -0,0 +1,366 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2021 Intel Corporation
> + */
> +
> +#include "igt.h"
> +#include "igt_device_scan.h"
> +
> +#include "xe_drm.h"
> +
> +#include <stdlib.h>
> +#include <stdio.h>
> +#include <string.h>
> +
> +#define DECL_XE_MMIO_READ_FN(bits) \
> +static inline uint##bits##_t \
> +xe_mmio_read##bits(int fd, uint32_t reg) \
> +{ \
> +	struct drm_xe_mmio mmio =3D { \
> +		.addr =3D reg, \
> +		.flags =3D DRM_XE_MMIO_READ | DRM_XE_MMIO_##bits##BIT, \
> +	}; \
> +\
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
> +\
> +	return mmio.value;\
> +}\
> +static inline void \
> +xe_mmio_write##bits(int fd, uint32_t reg, uint##bits##_t value) \
> +{ \
> +	struct drm_xe_mmio mmio =3D { \
> +		.addr =3D reg, \
> +		.flags =3D DRM_XE_MMIO_WRITE | DRM_XE_MMIO_##bits##BIT, \
> +		.value =3D value, \
> +	}; \
> +\
> +	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
> +}
> +
> +DECL_XE_MMIO_READ_FN(8)
> +DECL_XE_MMIO_READ_FN(16)
> +DECL_XE_MMIO_READ_FN(32)
> +DECL_XE_MMIO_READ_FN(64)
> +
> +static void print_help(FILE *fp)
> +{
> +	fprintf(fp, "usage: xe_reg read REG1 [REG2]...\n");
> +	fprintf(fp, "       xe_reg write REG VALUE\n");
> +}
> +
> +enum ring {
> +	RING_UNKNOWN =3D -1,
> +	RING_RCS0,
> +	RING_BCS0,
> +};
> +
> +static const struct ring_info {
> +	enum ring ring;
> +	const char *name;
> +	uint32_t mmio_base;
> +} ring_info[] =3D {
> +	{RING_RCS0, "rcs0", 0x02000, },
> +	{RING_BCS0, "bcs0", 0x22000, },
> +};
> +
> +static const struct ring_info *ring_info_for_name(const char *name)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(ring_info); i++)
> +		if (strcmp(name, ring_info[i].name) =3D=3D 0)
> +			return &ring_info[i];
> +
> +	return NULL;
> +}
> +
> +struct reg_info {
> +	const char *name;
> +	bool is_ring;
> +	uint32_t addr_low;
> +	uint32_t addr_high;
> +} reg_info[] =3D {
> +#define REG32(name, addr) { #name, false, addr }
> +#define REG64(name, low, high) { #name, false, low, high }
> +#define RING_REG32(name, addr) { #name, true, addr }
> +#define RING_REG64(name, low, high) { #name, true, low, high }
> +
> +	RING_REG64(ACTHD, 0x74, 0x5c),
> +	RING_REG32(BB_ADDR_DIFF, 0x154),
> +	RING_REG64(BB_ADDR, 0x140, 0x168),
> +	RING_REG32(BB_PER_CTX_PTR, 0x2c0),
> +	RING_REG64(EXECLIST_STATUS, 0x234, 0x238),
> +	RING_REG64(EXECLIST_SQ0, 0x510, 0x514),
> +	RING_REG64(EXECLIST_SQ1, 0x518, 0x51c),
> +	RING_REG32(HWS_PGA, 0x80),
> +	RING_REG32(INDIRECT_CTX, 0x1C4),
> +	RING_REG32(INDIRECT_CTX_OFFSET, 0x1C8),
> +	RING_REG32(NOPID, 0x94),
> +	RING_REG64(PML4E, 0x270, 0x274),
> +	RING_REG32(RING_BUFFER_CTL, 0x3c),
> +	RING_REG32(RING_BUFFER_HEAD, 0x34),
> +	RING_REG32(RING_BUFFER_START, 0x38),
> +	RING_REG32(RING_BUFFER_TAIL, 0x30),
> +	RING_REG64(SBB_ADDR, 0x114, 0x11c),
> +	RING_REG32(SBB_STATE, 0x118),
> +
> +#undef REG32
> +#undef REG64
> +#undef RING_REG32
> +#undef RING_REG64
> +};
> +
> +static const struct reg_info *reg_info_for_name(const char *name)
> +{
> +	int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(reg_info); i++)
> +		if (strcmp(name, reg_info[i].name) =3D=3D 0)
> +			return &reg_info[i];
> +
> +	return NULL;
> +}
> +
> +static int print_reg_for_info(int xe, FILE *fp, const struct reg_info *r=
eg,
> +			      const struct ring_info *ring)
> +{
> +	if (reg->is_ring) {
> +		if (!ring) {
> +			fprintf(stderr, "%s is a ring register but --ring "
> +					"not set\n", reg->name);
> +			return EXIT_FAILURE;
> +		}
> +
> +		if (reg->addr_high) {
> +			uint32_t low =3D xe_mmio_read32(xe, reg->addr_low +
> +							  ring->mmio_base);
> +			uint32_t high =3D xe_mmio_read32(xe, reg->addr_high +
> +							   ring->mmio_base);
> +
> +			fprintf(fp, "%s[%s] =3D 0x%08x %08x\n", reg->name,
> +				ring->name, high, low);
> +		} else {
> +			uint32_t value =3D xe_mmio_read32(xe, reg->addr_low +
> +							    ring->mmio_base);
> +
> +			fprintf(fp, "%s[%s] =3D 0x%08x\n", reg->name,
> +				ring->name, value);
> +		}
> +	} else {
> +		if (reg->addr_high) {
> +			uint32_t low =3D xe_mmio_read32(xe, reg->addr_low);
> +			uint32_t high =3D xe_mmio_read32(xe, reg->addr_high);
> +
> +			fprintf(fp, "%s =3D 0x%08x %08x\n", reg->name, high, low);
> +		} else {
> +			uint32_t value =3D xe_mmio_read32(xe, reg->addr_low);
> +
> +			fprintf(fp, "%s =3D 0x%08x\n", reg->name, value);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void print_reg_for_addr(int xe, FILE *fp, uint32_t addr)
> +{
> +	uint32_t value =3D xe_mmio_read32(xe, addr);
> +
> +	fprintf(fp, "MMIO[0x%05x] =3D 0x%08x\n", addr, value);
> +}
> +
> +enum opt {
> +	OPT_UNKNOWN =3D '?',
> +	OPT_END =3D -1,
> +	OPT_DEVICE,
> +	OPT_RING,
> +	OPT_ALL,
> +};
> +
> +static int read_reg(int argc, char *argv[])
> +{
> +	int xe, i, err, index;
> +	unsigned long reg_addr;
> +	char *endp =3D NULL;
> +	const struct ring_info *ring =3D NULL;
> +	enum opt opt;
> +	bool dump_all =3D false;
> +
> +	static struct option options[] =3D {
> +		{ "device",	required_argument,	NULL,	OPT_DEVICE },
> +		{ "ring",	required_argument,	NULL,	OPT_RING },
> +		{ "all",	no_argument,		NULL,	OPT_ALL },
> +	};
> +
> +	for (opt =3D 0; opt !=3D OPT_END; ) {
> +		opt =3D getopt_long(argc, argv, "", options, &index);
> +
> +		switch (opt) {
> +		case OPT_DEVICE:
> +			igt_device_filter_add(optarg);
> +			break;
> +		case OPT_RING:
> +			ring =3D ring_info_for_name(optarg);
> +			if (!ring) {
> +				fprintf(stderr, "invalid ring: %s\n", optarg);
> +				return EXIT_FAILURE;
> +			}
> +			break;
> +		case OPT_ALL:
> +			dump_all =3D true;
> +			break;
> +		case OPT_END:
> +			break;
> +		case OPT_UNKNOWN:
> +			return EXIT_FAILURE;
> +		}
> +	}
> +
> +	argc -=3D optind;
> +	argv +=3D optind;
> +
> +	xe =3D drm_open_driver(DRIVER_XE);
> +	if (dump_all) {
> +		for (i =3D 0; i < ARRAY_SIZE(reg_info); i++) {
> +			if (reg_info[i].is_ring !=3D !!ring)
> +				continue;
> +
> +			print_reg_for_info(xe, stdout, &reg_info[i], ring);
> +		}
> +	} else {
> +		for (i =3D 0; i < argc; i++) {
> +			const struct reg_info *reg =3D reg_info_for_name(argv[i]);
> +			if (reg) {
> +				err =3D print_reg_for_info(xe, stdout, reg, ring);
> +				if (err)
> +					return err;
> +				continue;
> +			}
> +			reg_addr =3D strtoul(argv[i], &endp, 16);
> +			if (!reg_addr || reg_addr >=3D (4 << 20) || *endp) {
> +				fprintf(stderr, "invalid reg address '%s'\n",
> +					argv[i]);
> +				return EXIT_FAILURE;
> +			}
> +			print_reg_for_addr(xe, stdout, reg_addr);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static int write_reg_for_info(int xe, const struct reg_info *reg,
> +			      const struct ring_info *ring,
> +			      uint64_t value)
> +{
> +	if (reg->is_ring) {
> +		if (!ring) {
> +			fprintf(stderr, "%s is a ring register but --ring "
> +					"not set\n", reg->name);
> +			return EXIT_FAILURE;
> +		}
> +
> +		xe_mmio_write32(xe, reg->addr_low + ring->mmio_base, value);
> +		if (reg->addr_high) {
> +			xe_mmio_write32(xe, reg->addr_high + ring->mmio_base,
> +					value >> 32);
> +		}
> +	} else {
> +		xe_mmio_write32(xe, reg->addr_low, value);
> +		if (reg->addr_high)
> +			xe_mmio_write32(xe, reg->addr_high, value >> 32);
> +	}
> +
> +	return 0;
> +}
> +
> +static void write_reg_for_addr(int xe, uint32_t addr, uint32_t value)
> +{
> +	xe_mmio_write32(xe, addr, value);
> +}
> +
> +static int write_reg(int argc, char *argv[])
> +{
> +	int xe, index;
> +	unsigned long reg_addr;
> +	char *endp =3D NULL;
> +	const struct ring_info *ring =3D NULL;
> +	enum opt opt;
> +	const char *reg_name;
> +	const struct reg_info *reg;
> +	uint64_t value;
> +
> +	static struct option options[] =3D {
> +		{ "device",	required_argument,	NULL,	OPT_DEVICE },
> +		{ "ring",	required_argument,	NULL,	OPT_RING },
> +	};
> +
> +	for (opt =3D 0; opt !=3D OPT_END; ) {
> +		opt =3D getopt_long(argc, argv, "", options, &index);
> +
> +		switch (opt) {
> +		case OPT_DEVICE:
> +			igt_device_filter_add(optarg);
> +			break;
> +		case OPT_RING:
> +			ring =3D ring_info_for_name(optarg);
> +			if (!ring) {
> +				fprintf(stderr, "invalid ring: %s\n", optarg);
> +				return EXIT_FAILURE;
> +			}
> +			break;
> +		case OPT_END:
> +			break;
> +		case OPT_UNKNOWN:
> +			return EXIT_FAILURE;
> +		default:
> +			break;
> +		}
> +	}
> +
> +	argc -=3D optind;
> +	argv +=3D optind;
> +
> +	if (argc !=3D 2) {
> +		print_help(stderr);
> +		return EXIT_FAILURE;
> +	}
> +
> +	reg_name =3D argv[0];
> +	value =3D strtoull(argv[1], &endp, 0);
> +	if (*endp) {
> +		fprintf(stderr, "Invalid register value: %s\n", argv[1]);
> +		return EXIT_FAILURE;
> +	}
> +
> +	xe =3D drm_open_driver(DRIVER_XE);
> +
> +	reg =3D reg_info_for_name(reg_name);
> +	if (reg)
> +		return write_reg_for_info(xe, reg, ring, value);
> +
> +	reg_addr =3D strtoul(reg_name, &endp, 16);
> +	if (!reg_addr || reg_addr >=3D (4 << 20) || *endp) {
> +		fprintf(stderr, "invalid reg address '%s'\n", reg_name);
> +		return EXIT_FAILURE;
> +	}
> +	write_reg_for_addr(xe, reg_addr, value);
> +
> +	return 0;
> +}
> +
> +int main(int argc, char *argv[])
> +{
> +	if (argc < 2) {
> +		print_help(stderr);
> +		return EXIT_FAILURE;
> +	}
> +
> +	if (strcmp(argv[1], "read") =3D=3D 0)
> +		return read_reg(argc - 1, argv + 1);
> +	else if (strcmp(argv[1], "write") =3D=3D 0)
> +		return write_reg(argc - 1, argv + 1);
> +
> +	fprintf(stderr, "invalid sub-command: %s", argv[1]);
> +	return EXIT_FAILURE;
> +}
