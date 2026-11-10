Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46C03606A333
	for <igt-dev@archiver.kernel.org>; Tue, 10 Nov 2026 08:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WAVJaepi
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE9D910E1D1;
	Tue, 10 Nov 2026 08:32:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C0EE10E02F
 for <igt-dev@lists.freedesktop.org>; Tue, 10 Nov 2026 08:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794299337; x=1825835337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KhWG4heLtpSUEClOQtaHVMtZPz2D83hYv/jvem8SGqk=;
 b=WAVJaepiR1dcwbAJoJBacnXDhNhcTzMRy5oZ/017h+jufWR7DnaUFaAy
 ae5BHcfSlqFnQNWwKkKZVoV60dajCQC61X5LiJaBkXMqn3EyjBUeGxMXv
 +WnXaDtQ4SfqDtYfd/qLkzsriYgToFkdbP5AisZZHf8Y5vgGXaX7wnOfW
 0xCO22KP+9w1Dci/pz41eCOG1XRHB1pRQHImglF6I4nLH2ZoGoUBiOxb7
 AcF/dE0l+yLLjAcg+J/UMoPOKRGyivGj45ADT2Q4NjELQQP/5rb96eJKT
 Qli6jpf/7QGa0pUYPQq9sYnC0WzGOHUXu03NKYENaAkGBsxMhBfFoIcS2 A==;
X-CSE-ConnectionGUID: IgaNHMUdROyKuIz+u9orjw==
X-CSE-MsgGUID: aqroupmxSDuwf8UpDdiAsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2916442"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2916442"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:28:57 -0800
X-CSE-ConnectionGUID: 4s6Wk6O0QfK2/yehfoZ7HA==
X-CSE-MsgGUID: O/dct8qVQDiszoZSBbL2Jg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7961899"
Received: from dev-150.igk.intel.com (HELO localhost) ([10.91.214.40])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 00:28:56 -0800
From: Lukasz Laguna <lukasz.laguna@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: marcin.bernatowicz@intel.com,
	piotr.piorkowski@intel.com
Subject: [PATCH v4 2/3] tests/intel/xe_sriov_mmio_regs: Add tests to verify
 registers on VFs
Date: Tue, 10 Nov 2026 09:28:37 +0100
Message-ID: <20261110082838.2034264-3-lukasz.laguna@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110082838.2034264-1-lukasz.laguna@intel.com>
References: <20261110082838.2034264-1-lukasz.laguna@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

In case of SR-IOV, the VF has limited access to the registers. Let's add
tests to verify that the VF actually has access only to the allowed list
of registers, and verify that registers dedicated to VFs work properly.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Co-developed-by: Lukasz Laguna <lukasz.laguna@intel.com>
Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
Reviewed-by: Marcin Bernatowicz <marcin.bernatowicz@linux.intel.com>
---
v4:
 - fix compilation issue
---
 tests/intel/xe_sriov_mmio_regs.c | 408 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 409 insertions(+)
 create mode 100644 tests/intel/xe_sriov_mmio_regs.c

diff --git a/tests/intel/xe_sriov_mmio_regs.c b/tests/intel/xe_sriov_mmio_regs.c
new file mode 100644
index 000000000..121ebdea6
--- /dev/null
+++ b/tests/intel/xe_sriov_mmio_regs.c
@@ -0,0 +1,408 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright(c) 2026 Intel Corporation. All rights reserved.
+ */
+#include "drmtest.h"
+#include "igt_sriov_device.h"
+#include "intel_chipset.h"
+#include "xe/xe_mmio.h"
+#include "xe/xe_query.h"
+
+/**
+ * TEST: xe_sriov_mmio_regs
+ * Category: Core
+ * Mega feature: SR-IOV
+ * Sub-category: MMIO
+ * Functionality: MMIO isolation
+ * Description: Checks MMIO isolation
+ *
+ * SUBTEST: vf-cap-reg
+ * Description:
+ *   Verify that VF has access to VF capability register
+ *
+ * SUBTEST: vf-scratch-regs
+ * Description:
+ *   Verify that VF has RW access to VF scratch registers
+ *
+ * SUBTEST: vf-scratch-regs-unique-instance
+ * Description:
+ *   Verify that VF has its own instance of scratch registers
+ *
+ * SUBTEST: vf-not-allowed-regs
+ * Description:
+ *   Verify that VF does not have access to restricted registers
+ */
+
+IGT_TEST_DESCRIPTION("Xe tests for SR-IOV MMIO registers");
+
+/*
+ * Although 8 MB is reserved for the registers, they actually use only
+ * the first 4 MB
+ */
+#define MMIO_REGS_TILE_SIZE	SZ_4M
+
+#define VF_CAP_REG		0x1901f8
+#define MEDIA_VF_CAP_REG	0x19030C
+#define    IS_VF_MASK		0x1
+
+#define SOFT_SCRATCH_COUNT	4
+#define SOFT_SCRATCH(n)		(0x190240 + (n) * SOFT_SCRATCH_COUNT)
+#define MEDIA_SOFT_SCRATCH(n)	(0x190310 + (n) * SOFT_SCRATCH_COUNT)
+
+#define for_each_reg(reg_addr__) \
+	for ((reg_addr__) = 0; \
+	     (reg_addr__) < (MMIO_REGS_TILE_SIZE); \
+	     (reg_addr__) += 0x4)
+
+enum reg_access_type {
+	NO_ACCESS_OR_UNDEFINED = 0,
+	RO,
+	RW,
+};
+
+struct vf_regs_allowlist {
+	uint32_t start;
+	uint32_t end;
+	uint32_t mask;
+	uint32_t expected_mask;
+	enum reg_access_type access_type;
+	bool (*requires)(int pf_fd);
+};
+
+static const char *stringify_reg_access_type(enum reg_access_type access_type)
+{
+	switch (access_type) {
+	case NO_ACCESS_OR_UNDEFINED:
+		return "NO ACCESS OR UNDEFINED";
+	case RO:
+		return "RO";
+	case RW:
+		return "RW";
+	default:
+		igt_assert(0);
+	}
+
+	return "";
+}
+
+static bool has_vf_fence(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return (intel_graphics_ver(dev_id) < IP_VER(12, 10));
+}
+
+static bool has_memirq(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return (intel_graphics_ver(dev_id) >= IP_VER(12, 50));
+}
+
+static bool no_memirq(int pf_fd)
+{
+	return !has_memirq(pf_fd);
+}
+
+static bool has_media_regs(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return (intel_graphics_ver(dev_id) >= IP_VER(12, 70));
+}
+
+static enum reg_access_type check_vf_reg_access(int pf_fd, uint8_t tile,
+						struct xe_mmio *vf_mmio, uint32_t reg)
+{
+	enum reg_access_type access = NO_ACCESS_OR_UNDEFINED;
+	uint32_t orig;
+
+	orig = xe_mmio_tile_read32(vf_mmio, tile, reg);
+	if (orig != 0 && orig != ~0)
+		access = RO;
+
+	xe_mmio_tile_write32(vf_mmio, tile, reg, ~orig);
+	if (xe_mmio_tile_read32(vf_mmio, tile, reg) != orig)
+		access = RW;
+
+	xe_mmio_tile_write32(vf_mmio, tile, reg, orig);
+
+	return access;
+}
+
+static void vf_check_cap_reg(int pf_fd, unsigned int vf_id, uint8_t tile)
+{
+	enum reg_access_type access_type;
+	struct xe_mmio vf_mmio;
+	uint32_t val;
+
+	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
+
+	access_type = check_vf_reg_access(pf_fd, tile, &vf_mmio, VF_CAP_REG);
+	val = xe_mmio_tile_read32(&vf_mmio, tile, VF_CAP_REG);
+
+	xe_mmio_access_fini(&vf_mmio);
+
+	igt_fail_on_f(access_type != RO, "VF%u capability register should be RO. Detected: %s\n",
+		      vf_id, stringify_reg_access_type(access_type));
+	igt_fail_on_f(!(val & IS_VF_MASK), "VF%u capability register should report VF active\n",
+		      vf_id);
+}
+
+static bool check_scratch_regs_access(int pf_fd, uint8_t tile, struct xe_mmio *vf_mmio, bool media)
+{
+	bool failed = false;
+	uint8_t i;
+
+	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+		uint32_t reg = media ? MEDIA_SOFT_SCRATCH(i) : SOFT_SCRATCH(i);
+		enum reg_access_type access_type = check_vf_reg_access(pf_fd, tile, vf_mmio, reg);
+
+		if (access_type != RW) {
+			igt_warn("%s register (%#x) should be RW. Detected: %s\n",
+				 media ? "Media scratch" : "Scratch", reg,
+				 stringify_reg_access_type(access_type));
+			failed = true;
+		}
+	}
+
+	return failed;
+}
+
+static void vf_check_scratch_regs(int pf_fd, unsigned int vf_id, uint8_t tile)
+{
+	struct xe_mmio vf_mmio;
+	bool failed;
+
+	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
+
+	failed = check_scratch_regs_access(pf_fd, tile, &vf_mmio, false);
+	if (xe_has_media_gt(pf_fd))
+		failed |= check_scratch_regs_access(pf_fd, tile, &vf_mmio, true);
+
+	xe_mmio_access_fini(&vf_mmio);
+
+	igt_fail_on_f(failed, "At least one of VF%u soft scratch register is not RW.\n", vf_id);
+}
+
+static uint32_t get_vf_regs_stride(int pf_fd)
+{
+	uint16_t dev_id = intel_get_drm_devid(pf_fd);
+
+	return intel_graphics_ver(dev_id) > IP_VER(12, 0) ? 0x400 : 0x1000;
+}
+
+static uint32_t vf_reg_to_pf(int pf_fd, unsigned int vf_id, uint32_t addr)
+{
+	uint32_t stride = get_vf_regs_stride(pf_fd);
+
+	return addr + stride * vf_id;
+}
+
+static bool check_scratch_regs_uniqueness(int pf_fd, unsigned int vf_id, uint8_t tile,
+					  struct xe_mmio *pf_mmio, struct xe_mmio *vf_mmio,
+					  bool media)
+{
+	unsigned int total_vfs = igt_sriov_get_total_vfs(pf_fd);
+	bool failed = false;
+	unsigned int i, j;
+
+	for (i = 0; i < SOFT_SCRATCH_COUNT; i++) {
+		uint32_t reg = media ? MEDIA_SOFT_SCRATCH(i) : SOFT_SCRATCH(i);
+		uint32_t cached[total_vfs + 1];
+		uint32_t write, read;
+		char buf[8];
+
+		for (j = 0; j <= total_vfs; j++)
+			cached[j] = xe_mmio_tile_read32(pf_mmio, tile,
+							vf_reg_to_pf(pf_fd, j, reg));
+
+		write = ~cached[vf_id];
+		xe_mmio_tile_write32(vf_mmio, tile, reg, write);
+		igt_assert(xe_mmio_tile_read32(vf_mmio, tile, reg) == write);
+
+		for (j = 0; j <= total_vfs; j++) {
+			if (j == vf_id)
+				continue;
+
+			read = xe_mmio_tile_read32(pf_mmio, tile, vf_reg_to_pf(pf_fd, j, reg));
+			if (read != cached[j]) {
+				igt_warn("Unexpected value (%#x vs %#x) of %s %sscratch register (%#x) after VF%u write (%#x) to its own register\n",
+					 read, cached[j], igt_sriov_function_name_upper(j, buf,
+					 sizeof(buf)), media ? "media " : "", reg, vf_id, write);
+				xe_mmio_tile_write32(pf_mmio, tile, vf_reg_to_pf(pf_fd, j, reg),
+						     cached[j]);
+				failed = true;
+			}
+		}
+
+		xe_mmio_tile_write32(vf_mmio, tile, reg, cached[vf_id]);
+	}
+
+	return failed;
+}
+
+static void vf_scratch_regs_unique_instance(int pf_fd, unsigned int vf_id, uint8_t tile)
+{
+	struct xe_mmio pf_mmio, vf_mmio;
+	bool failed;
+
+	xe_mmio_vf_access_init(pf_fd, 0, &pf_mmio);
+	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
+
+	failed = check_scratch_regs_uniqueness(pf_fd, vf_id, tile, &pf_mmio, &vf_mmio, false);
+	if (xe_has_media_gt(pf_fd))
+		failed |= check_scratch_regs_uniqueness(pf_fd, vf_id, tile, &pf_mmio, &vf_mmio,
+							true);
+
+	xe_mmio_access_fini(&vf_mmio);
+	xe_mmio_access_fini(&pf_mmio);
+
+	igt_fail_on_f(failed, "VF%u write to scratch register changed the value of at least one other VF scratch register\n",
+		      vf_id);
+}
+
+/* XXX: Keep sorted */
+static const struct vf_regs_allowlist allowlist[] = {
+	{ .start = 0x100000, .end = 0x10001c, .requires = has_vf_fence },
+	{ .start = 0x190010, .end = 0x190010, .requires = no_memirq },
+	{ .start = 0x190018, .end = 0x19001C, .requires = no_memirq },
+	{ .start = 0x190030, .end = 0x190048, .requires = no_memirq },
+	{ .start = 0x190060, .end = 0x190064, .requires = no_memirq },
+	{ .start = 0x190070, .end = 0x190074, .requires = no_memirq },
+	{ .start = 0x190090, .end = 0x190090, .requires = no_memirq },
+	{ .start = 0x1900a0, .end = 0x1900a0, .requires = no_memirq },
+	{ .start = 0x1900a8, .end = 0x1900ac, .requires = no_memirq },
+	{ .start = 0x1900b0, .end = 0x1900b4, .requires = no_memirq },
+	{ .start = 0x1900d0, .end = 0x1900d4, .requires = no_memirq },
+	{ .start = 0x1900e8, .end = 0x1900ec, .requires = no_memirq },
+	{ .start = 0x1900f0, .end = 0x1900f4, .requires = no_memirq },
+	{ .start = 0x190100, .end = 0x190100, .requires = no_memirq },
+	{ .start = 0x1901f0, .end = 0x1901f0 },
+	{ .start = 0x1901f8, .end = 0x1901f8 },
+	{ .start = 0x190240, .end = 0x19024c },
+	{ .start = 0x190300, .end = 0x190300 },
+	{ .start = 0x190304, .end = 0x190304, .requires = has_media_regs },
+	{ .start = 0x19030c, .end = 0x19031c, .requires = has_media_regs },
+};
+
+static int addr_range_cmp(const void *addr, const void *range)
+{
+	if (*(uint32_t *)addr < ((const struct vf_regs_allowlist *)range)->start)
+		return -1;
+	else if (*(uint32_t *)addr > ((const struct vf_regs_allowlist *)range)->end)
+		return 1;
+	else
+		return 0;
+}
+
+static bool skip_if_on_whitelist(int pf_fd, uint32_t reg_addr)
+{
+	struct vf_regs_allowlist *item;
+
+	if (reg_addr < allowlist[0].start && reg_addr > allowlist[ARRAY_SIZE(allowlist) - 1].end)
+		return false;
+
+	item = bsearch(&reg_addr, &allowlist[0], ARRAY_SIZE(allowlist), sizeof(allowlist[0]),
+		       addr_range_cmp);
+	if (item) {
+		if (item->requires)
+			return (item->requires(pf_fd)) ? true : false;
+		else
+			return true;
+	}
+
+	return false;
+}
+
+static void vf_check_not_allowed_regs(int pf_fd, unsigned int vf_id, uint8_t tile)
+{
+	struct xe_mmio vf_mmio;
+	bool failed = false;
+	uint32_t reg;
+
+	xe_mmio_vf_access_init(pf_fd, vf_id, &vf_mmio);
+
+	for_each_reg(reg) {
+		enum reg_access_type access_type;
+
+		if (skip_if_on_whitelist(pf_fd, reg))
+			continue;
+
+		access_type = check_vf_reg_access(pf_fd, tile, &vf_mmio, reg);
+		if (access_type != NO_ACCESS_OR_UNDEFINED) {
+			igt_warn("VF%u register (%#x) shouldn't be %s.\n", vf_id, reg,
+				 stringify_reg_access_type(access_type));
+			failed = true;
+		}
+	}
+
+	xe_mmio_access_fini(&vf_mmio);
+
+	igt_fail_on_f(failed,
+		      "At least one of VF%u register, outside the allowlist, is accessible\n",
+		      vf_id);
+}
+
+int igt_main()
+{
+	bool autoprobe;
+	uint8_t tile;
+	int pf_fd;
+
+	igt_fixture()
+	{
+		pf_fd = drm_open_driver(DRIVER_XE);
+		igt_require(igt_sriov_is_pf(pf_fd));
+		igt_require(igt_sriov_get_enabled_vfs(pf_fd) == 0);
+		autoprobe = igt_sriov_is_driver_autoprobe_enabled(pf_fd);
+		igt_sriov_install_exit_handler(pf_fd, NULL, NULL);
+
+		igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_sriov_enable_vfs(pf_fd, igt_sriov_get_total_vfs(pf_fd));
+	}
+
+	igt_describe("Verify that VF has access to VF capability register");
+	igt_subtest_with_dynamic("vf-cap-reg") {
+		for_each_sriov_vf(pf_fd, vf_id)
+			xe_for_each_tile(pf_fd, tile)
+				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
+					vf_check_cap_reg(pf_fd, vf_id, tile);
+	}
+
+	igt_describe("Verify that VF has RW access to VF scratch registers");
+	igt_subtest_with_dynamic("vf-scratch-regs") {
+		for_each_sriov_vf(pf_fd, vf_id)
+			xe_for_each_tile(pf_fd, tile)
+				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
+					vf_check_scratch_regs(pf_fd, vf_id, tile);
+	}
+
+	igt_describe("Verify that VF has its own instance of scratch registers");
+	igt_subtest_with_dynamic("vf-scratch-regs-unique-instance") {
+		for_each_sriov_vf(pf_fd, vf_id)
+			xe_for_each_tile(pf_fd, tile)
+				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
+					vf_scratch_regs_unique_instance(pf_fd, vf_id, tile);
+	}
+
+	igt_describe("Verify that VF does not have access to restricted registers");
+	igt_subtest_with_dynamic("vf-not-allowed-regs") {
+		for_each_sriov_vf(pf_fd, vf_id)
+			xe_for_each_tile(pf_fd, tile)
+				igt_dynamic_f("vf%u-tile-%u", vf_id, tile)
+					vf_check_not_allowed_regs(pf_fd, vf_id, tile);
+	}
+
+	igt_fixture() {
+		igt_sriov_disable_vfs(pf_fd);
+		/* abort to avoid execution of next tests with enabled VFs */
+		igt_abort_on_f(igt_sriov_get_enabled_vfs(pf_fd) > 0, "Failed to disable VF(s)");
+		autoprobe ? igt_sriov_enable_driver_autoprobe(pf_fd) :
+			    igt_sriov_disable_driver_autoprobe(pf_fd);
+		igt_abort_on_f(autoprobe != igt_sriov_is_driver_autoprobe_enabled(pf_fd),
+			       "Failed to restore sriov_drivers_autoprobe value\n");
+		igt_sriov_clear_exit_handler();
+		drm_close_driver(pf_fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index bb8bef0f9..f0a4cef4c 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -346,6 +346,7 @@ intel_xe_progs = [
 	'xe_sriov_auto_provisioning',
 	'xe_sriov_flr',
 	'xe_sriov_ggtt',
+	'xe_sriov_mmio_regs',
 	'xe_sriov_vfio',
 	'xe_sriov_scheduling',
         'xe_survivability',
-- 
2.43.0

