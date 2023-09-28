Return-Path: <igt-dev-bounces@lists.freedesktop.org>
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A5110E607
 for <igt-dev@lists.freedesktop.org>; Thu, 28 Sep 2023 11:05:37 +0000 (UTC)
From: Francois Dugast <francois.dugast@intel.com>
To: igt-dev@lists.freedesktop.org
Date: Thu, 28 Sep 2023 11:05:06 +0000
Message-Id: <20230928110516.7-5-francois.dugast@intel.com>
In-Reply-To: <20230928110516.7-1-francois.dugast@intel.com>
References: <20230928110516.7-1-francois.dugast@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [igt-dev] [PATCH v4 04/14] drm-uapi/xe_drm: Remove MMIO ioctl and
 align with latest uapi
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
List-ID: <igt-dev@lists.freedesktop.org>

Align with commit ("drm/xe/uapi: Remove MMIO ioctl")

Signed-off-by: Francois Dugast <francois.dugast@intel.com>
Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
---
 include/drm-uapi/xe_drm.h                |  31 +-
 tests/intel-ci/xe-fast-feedback.testlist |   2 -
 tests/intel/xe_mmio.c                    |  91 ------
 tests/meson.build                        |   1 -
 tools/meson.build                        |   1 -
 tools/xe_reg.c                           | 366 -----------------------
 6 files changed, 4 insertions(+), 488 deletions(-)
 delete mode 100644 tests/intel/xe_mmio.c
 delete mode 100644 tools/xe_reg.c

diff --git a/include/drm-uapi/xe_drm.h b/include/drm-uapi/xe_drm.h
index 807d8ac2c..143918b9e 100644
--- a/include/drm-uapi/xe_drm.h
+++ b/include/drm-uapi/xe_drm.h
@@ -106,11 +106,10 @@ struct xe_user_extension {
 #define DRM_XE_EXEC_QUEUE_CREATE		0x06
 #define DRM_XE_EXEC_QUEUE_DESTROY		0x07
 #define DRM_XE_EXEC			0x08
-#define DRM_XE_MMIO			0x09
-#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0a
-#define DRM_XE_WAIT_USER_FENCE		0x0b
-#define DRM_XE_VM_MADVISE		0x0c
-#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0d
+#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x09
+#define DRM_XE_WAIT_USER_FENCE		0x0a
+#define DRM_XE_VM_MADVISE		0x0b
+#define DRM_XE_EXEC_QUEUE_GET_PROPERTY	0x0c
 
 /* Must be kept compact -- no holes */
 #define DRM_IOCTL_XE_DEVICE_QUERY		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_DEVICE_QUERY, struct drm_xe_device_query)
@@ -123,7 +122,6 @@ struct xe_user_extension {
 #define DRM_IOCTL_XE_EXEC_QUEUE_GET_PROPERTY	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_GET_PROPERTY, struct drm_xe_exec_queue_get_property)
 #define DRM_IOCTL_XE_EXEC_QUEUE_DESTROY		 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_DESTROY, struct drm_xe_exec_queue_destroy)
 #define DRM_IOCTL_XE_EXEC			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
-#define DRM_IOCTL_XE_MMIO			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MMIO, struct drm_xe_mmio)
 #define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
 #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
 #define DRM_IOCTL_XE_VM_MADVISE			 DRM_IOW(DRM_COMMAND_BASE + DRM_XE_VM_MADVISE, struct drm_xe_vm_madvise)
@@ -936,27 +934,6 @@ struct drm_xe_exec {
 	__u64 reserved[2];
 };
 
-struct drm_xe_mmio {
-	/** @extensions: Pointer to the first extension struct, if any */
-	__u64 extensions;
-
-	__u32 addr;
-
-#define DRM_XE_MMIO_8BIT	0x0
-#define DRM_XE_MMIO_16BIT	0x1
-#define DRM_XE_MMIO_32BIT	0x2
-#define DRM_XE_MMIO_64BIT	0x3
-#define DRM_XE_MMIO_BITS_MASK	0x3
-#define DRM_XE_MMIO_READ	0x4
-#define DRM_XE_MMIO_WRITE	0x8
-	__u32 flags;
-
-	__u64 value;
-
-	/** @reserved: Reserved */
-	__u64 reserved[2];
-};
-
 /**
  * struct drm_xe_wait_user_fence - wait user fence
  *
diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index 610cc958c..a9fe43b08 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -141,8 +141,6 @@ igt@xe_mmap@bad-object
 igt@xe_mmap@system
 igt@xe_mmap@vram
 igt@xe_mmap@vram-system
-igt@xe_mmio@mmio-timestamp
-igt@xe_mmio@mmio-invalid
 igt@xe_pm_residency@gt-c6-on-idle
 igt@xe_prime_self_import@basic-with_one_bo
 igt@xe_prime_self_import@basic-with_fd_dup
diff --git a/tests/intel/xe_mmio.c b/tests/intel/xe_mmio.c
deleted file mode 100644
index 9ac544770..000000000
--- a/tests/intel/xe_mmio.c
+++ /dev/null
@@ -1,91 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2023 Intel Corporation
- */
-
-/**
- * TEST: Test if mmio feature
- * Category: Software building block
- * Sub-category: mmio
- * Functionality: mmap
- */
-
-#include "igt.h"
-
-#include "xe_drm.h"
-#include "xe/xe_ioctl.h"
-#include "xe/xe_query.h"
-
-#include <string.h>
-
-#define RCS_TIMESTAMP 0x2358
-
-/**
- * SUBTEST: mmio-timestamp
- * Test category: functionality test
- * Description:
- *	Try to run mmio ioctl with 32 and 64 bits and check it a timestamp
- *	matches
- */
-
-static void test_xe_mmio_timestamp(int fd)
-{
-	int ret;
-	struct drm_xe_mmio mmio = {
-		.addr = RCS_TIMESTAMP,
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT,
-	};
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	if (!ret)
-		igt_debug("RCS_TIMESTAMP 64b = 0x%llx\n", mmio.value);
-	igt_assert(!ret);
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_32BIT;
-	mmio.value = 0;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	if (!ret)
-		igt_debug("RCS_TIMESTAMP 32b = 0x%llx\n", mmio.value);
-	igt_assert(!ret);
-}
-
-
-/**
- * SUBTEST: mmio-invalid
- * Test category: negative test
- * Description: Try to run mmio ioctl with 8, 16 and 32 and 64 bits mmio
- */
-
-static void test_xe_mmio_invalid(int fd)
-{
-	int ret;
-	struct drm_xe_mmio mmio = {
-		.addr = RCS_TIMESTAMP,
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_8BIT,
-	};
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_16BIT;
-	mmio.value = 0;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-	mmio.addr = RCS_TIMESTAMP;
-	mmio.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_64BIT;
-	mmio.value = 0x1;
-	ret = igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio);
-	igt_assert(ret);
-}
-
-igt_main
-{
-	int fd;
-
-	igt_fixture
-		fd = drm_open_driver(DRIVER_XE);
-
-	igt_subtest("mmio-timestamp")
-		test_xe_mmio_timestamp(fd);
-	igt_subtest("mmio-invalid")
-		test_xe_mmio_invalid(fd);
-
-	igt_fixture
-		drm_close_driver(fd);
-}
diff --git a/tests/meson.build b/tests/meson.build
index 974cb433b..c3de337c8 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -293,7 +293,6 @@ intel_xe_progs = [
 	'xe_live_ktest',
 	'xe_media_fill',
 	'xe_mmap',
-	'xe_mmio',
 	'xe_module_load',
 	'xe_noexec_ping_pong',
 	'xe_pm',
diff --git a/tools/meson.build b/tools/meson.build
index 21e244c24..ac79d8b58 100644
--- a/tools/meson.build
+++ b/tools/meson.build
@@ -42,7 +42,6 @@ tools_progs = [
 	'intel_gvtg_test',
 	'dpcd_reg',
 	'lsgpu',
-	'xe_reg',
 ]
 tool_deps = igt_deps
 tool_deps += zlib
diff --git a/tools/xe_reg.c b/tools/xe_reg.c
deleted file mode 100644
index 1f7b384d3..000000000
--- a/tools/xe_reg.c
+++ /dev/null
@@ -1,366 +0,0 @@
-// SPDX-License-Identifier: MIT
-/*
- * Copyright © 2021 Intel Corporation
- */
-
-#include "igt.h"
-#include "igt_device_scan.h"
-
-#include "xe_drm.h"
-
-#include <stdlib.h>
-#include <stdio.h>
-#include <string.h>
-
-#define DECL_XE_MMIO_READ_FN(bits) \
-static inline uint##bits##_t \
-xe_mmio_read##bits(int fd, uint32_t reg) \
-{ \
-	struct drm_xe_mmio mmio = { \
-		.addr = reg, \
-		.flags = DRM_XE_MMIO_READ | DRM_XE_MMIO_##bits##BIT, \
-	}; \
-\
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
-\
-	return mmio.value;\
-}\
-static inline void \
-xe_mmio_write##bits(int fd, uint32_t reg, uint##bits##_t value) \
-{ \
-	struct drm_xe_mmio mmio = { \
-		.addr = reg, \
-		.flags = DRM_XE_MMIO_WRITE | DRM_XE_MMIO_##bits##BIT, \
-		.value = value, \
-	}; \
-\
-	igt_assert_eq(igt_ioctl(fd, DRM_IOCTL_XE_MMIO, &mmio), 0); \
-}
-
-DECL_XE_MMIO_READ_FN(8)
-DECL_XE_MMIO_READ_FN(16)
-DECL_XE_MMIO_READ_FN(32)
-DECL_XE_MMIO_READ_FN(64)
-
-static void print_help(FILE *fp)
-{
-	fprintf(fp, "usage: xe_reg read REG1 [REG2]...\n");
-	fprintf(fp, "       xe_reg write REG VALUE\n");
-}
-
-enum ring {
-	RING_UNKNOWN = -1,
-	RING_RCS0,
-	RING_BCS0,
-};
-
-static const struct ring_info {
-	enum ring ring;
-	const char *name;
-	uint32_t mmio_base;
-} ring_info[] = {
-	{RING_RCS0, "rcs0", 0x02000, },
-	{RING_BCS0, "bcs0", 0x22000, },
-};
-
-static const struct ring_info *ring_info_for_name(const char *name)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(ring_info); i++)
-		if (strcmp(name, ring_info[i].name) == 0)
-			return &ring_info[i];
-
-	return NULL;
-}
-
-struct reg_info {
-	const char *name;
-	bool is_ring;
-	uint32_t addr_low;
-	uint32_t addr_high;
-} reg_info[] = {
-#define REG32(name, addr) { #name, false, addr }
-#define REG64(name, low, high) { #name, false, low, high }
-#define RING_REG32(name, addr) { #name, true, addr }
-#define RING_REG64(name, low, high) { #name, true, low, high }
-
-	RING_REG64(ACTHD, 0x74, 0x5c),
-	RING_REG32(BB_ADDR_DIFF, 0x154),
-	RING_REG64(BB_ADDR, 0x140, 0x168),
-	RING_REG32(BB_PER_CTX_PTR, 0x2c0),
-	RING_REG64(EXECLIST_STATUS, 0x234, 0x238),
-	RING_REG64(EXECLIST_SQ0, 0x510, 0x514),
-	RING_REG64(EXECLIST_SQ1, 0x518, 0x51c),
-	RING_REG32(HWS_PGA, 0x80),
-	RING_REG32(INDIRECT_CTX, 0x1C4),
-	RING_REG32(INDIRECT_CTX_OFFSET, 0x1C8),
-	RING_REG32(NOPID, 0x94),
-	RING_REG64(PML4E, 0x270, 0x274),
-	RING_REG32(RING_BUFFER_CTL, 0x3c),
-	RING_REG32(RING_BUFFER_HEAD, 0x34),
-	RING_REG32(RING_BUFFER_START, 0x38),
-	RING_REG32(RING_BUFFER_TAIL, 0x30),
-	RING_REG64(SBB_ADDR, 0x114, 0x11c),
-	RING_REG32(SBB_STATE, 0x118),
-
-#undef REG32
-#undef REG64
-#undef RING_REG32
-#undef RING_REG64
-};
-
-static const struct reg_info *reg_info_for_name(const char *name)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(reg_info); i++)
-		if (strcmp(name, reg_info[i].name) == 0)
-			return &reg_info[i];
-
-	return NULL;
-}
-
-static int print_reg_for_info(int xe, FILE *fp, const struct reg_info *reg,
-			      const struct ring_info *ring)
-{
-	if (reg->is_ring) {
-		if (!ring) {
-			fprintf(stderr, "%s is a ring register but --ring "
-					"not set\n", reg->name);
-			return EXIT_FAILURE;
-		}
-
-		if (reg->addr_high) {
-			uint32_t low = xe_mmio_read32(xe, reg->addr_low +
-							  ring->mmio_base);
-			uint32_t high = xe_mmio_read32(xe, reg->addr_high +
-							   ring->mmio_base);
-
-			fprintf(fp, "%s[%s] = 0x%08x %08x\n", reg->name,
-				ring->name, high, low);
-		} else {
-			uint32_t value = xe_mmio_read32(xe, reg->addr_low +
-							    ring->mmio_base);
-
-			fprintf(fp, "%s[%s] = 0x%08x\n", reg->name,
-				ring->name, value);
-		}
-	} else {
-		if (reg->addr_high) {
-			uint32_t low = xe_mmio_read32(xe, reg->addr_low);
-			uint32_t high = xe_mmio_read32(xe, reg->addr_high);
-
-			fprintf(fp, "%s = 0x%08x %08x\n", reg->name, high, low);
-		} else {
-			uint32_t value = xe_mmio_read32(xe, reg->addr_low);
-
-			fprintf(fp, "%s = 0x%08x\n", reg->name, value);
-		}
-	}
-
-	return 0;
-}
-
-static void print_reg_for_addr(int xe, FILE *fp, uint32_t addr)
-{
-	uint32_t value = xe_mmio_read32(xe, addr);
-
-	fprintf(fp, "MMIO[0x%05x] = 0x%08x\n", addr, value);
-}
-
-enum opt {
-	OPT_UNKNOWN = '?',
-	OPT_END = -1,
-	OPT_DEVICE,
-	OPT_RING,
-	OPT_ALL,
-};
-
-static int read_reg(int argc, char *argv[])
-{
-	int xe, i, err, index;
-	unsigned long reg_addr;
-	char *endp = NULL;
-	const struct ring_info *ring = NULL;
-	enum opt opt;
-	bool dump_all = false;
-
-	static struct option options[] = {
-		{ "device",	required_argument,	NULL,	OPT_DEVICE },
-		{ "ring",	required_argument,	NULL,	OPT_RING },
-		{ "all",	no_argument,		NULL,	OPT_ALL },
-	};
-
-	for (opt = 0; opt != OPT_END; ) {
-		opt = getopt_long(argc, argv, "", options, &index);
-
-		switch (opt) {
-		case OPT_DEVICE:
-			igt_device_filter_add(optarg);
-			break;
-		case OPT_RING:
-			ring = ring_info_for_name(optarg);
-			if (!ring) {
-				fprintf(stderr, "invalid ring: %s\n", optarg);
-				return EXIT_FAILURE;
-			}
-			break;
-		case OPT_ALL:
-			dump_all = true;
-			break;
-		case OPT_END:
-			break;
-		case OPT_UNKNOWN:
-			return EXIT_FAILURE;
-		}
-	}
-
-	argc -= optind;
-	argv += optind;
-
-	xe = drm_open_driver(DRIVER_XE);
-	if (dump_all) {
-		for (i = 0; i < ARRAY_SIZE(reg_info); i++) {
-			if (reg_info[i].is_ring != !!ring)
-				continue;
-
-			print_reg_for_info(xe, stdout, &reg_info[i], ring);
-		}
-	} else {
-		for (i = 0; i < argc; i++) {
-			const struct reg_info *reg = reg_info_for_name(argv[i]);
-			if (reg) {
-				err = print_reg_for_info(xe, stdout, reg, ring);
-				if (err)
-					return err;
-				continue;
-			}
-			reg_addr = strtoul(argv[i], &endp, 16);
-			if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
-				fprintf(stderr, "invalid reg address '%s'\n",
-					argv[i]);
-				return EXIT_FAILURE;
-			}
-			print_reg_for_addr(xe, stdout, reg_addr);
-		}
-	}
-
-	return 0;
-}
-
-static int write_reg_for_info(int xe, const struct reg_info *reg,
-			      const struct ring_info *ring,
-			      uint64_t value)
-{
-	if (reg->is_ring) {
-		if (!ring) {
-			fprintf(stderr, "%s is a ring register but --ring "
-					"not set\n", reg->name);
-			return EXIT_FAILURE;
-		}
-
-		xe_mmio_write32(xe, reg->addr_low + ring->mmio_base, value);
-		if (reg->addr_high) {
-			xe_mmio_write32(xe, reg->addr_high + ring->mmio_base,
-					value >> 32);
-		}
-	} else {
-		xe_mmio_write32(xe, reg->addr_low, value);
-		if (reg->addr_high)
-			xe_mmio_write32(xe, reg->addr_high, value >> 32);
-	}
-
-	return 0;
-}
-
-static void write_reg_for_addr(int xe, uint32_t addr, uint32_t value)
-{
-	xe_mmio_write32(xe, addr, value);
-}
-
-static int write_reg(int argc, char *argv[])
-{
-	int xe, index;
-	unsigned long reg_addr;
-	char *endp = NULL;
-	const struct ring_info *ring = NULL;
-	enum opt opt;
-	const char *reg_name;
-	const struct reg_info *reg;
-	uint64_t value;
-
-	static struct option options[] = {
-		{ "device",	required_argument,	NULL,	OPT_DEVICE },
-		{ "ring",	required_argument,	NULL,	OPT_RING },
-	};
-
-	for (opt = 0; opt != OPT_END; ) {
-		opt = getopt_long(argc, argv, "", options, &index);
-
-		switch (opt) {
-		case OPT_DEVICE:
-			igt_device_filter_add(optarg);
-			break;
-		case OPT_RING:
-			ring = ring_info_for_name(optarg);
-			if (!ring) {
-				fprintf(stderr, "invalid ring: %s\n", optarg);
-				return EXIT_FAILURE;
-			}
-			break;
-		case OPT_END:
-			break;
-		case OPT_UNKNOWN:
-			return EXIT_FAILURE;
-		default:
-			break;
-		}
-	}
-
-	argc -= optind;
-	argv += optind;
-
-	if (argc != 2) {
-		print_help(stderr);
-		return EXIT_FAILURE;
-	}
-
-	reg_name = argv[0];
-	value = strtoull(argv[1], &endp, 0);
-	if (*endp) {
-		fprintf(stderr, "Invalid register value: %s\n", argv[1]);
-		return EXIT_FAILURE;
-	}
-
-	xe = drm_open_driver(DRIVER_XE);
-
-	reg = reg_info_for_name(reg_name);
-	if (reg)
-		return write_reg_for_info(xe, reg, ring, value);
-
-	reg_addr = strtoul(reg_name, &endp, 16);
-	if (!reg_addr || reg_addr >= (4 << 20) || *endp) {
-		fprintf(stderr, "invalid reg address '%s'\n", reg_name);
-		return EXIT_FAILURE;
-	}
-	write_reg_for_addr(xe, reg_addr, value);
-
-	return 0;
-}
-
-int main(int argc, char *argv[])
-{
-	if (argc < 2) {
-		print_help(stderr);
-		return EXIT_FAILURE;
-	}
-
-	if (strcmp(argv[1], "read") == 0)
-		return read_reg(argc - 1, argv + 1);
-	else if (strcmp(argv[1], "write") == 0)
-		return write_reg(argc - 1, argv + 1);
-
-	fprintf(stderr, "invalid sub-command: %s", argv[1]);
-	return EXIT_FAILURE;
-}
-- 
2.34.1
