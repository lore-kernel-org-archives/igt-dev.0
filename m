Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF60BC54F54
	for <igt-dev@archiver.kernel.org>; Fri, 31 Jul 2026 10:13:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80AAC10F20A;
	Fri, 31 Jul 2026 10:13:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gpOBsx9l";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2442910F20A
 for <igt-dev@lists.freedesktop.org>; Fri, 31 Jul 2026 10:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785492760; x=1817028760;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=SIWjfMt8YICOyZWiEWu/nfIsbakgOeQiKK+qZ+zlIh0=;
 b=gpOBsx9lMcSycsA7FQkF46dsQdc4GF7DyOkHK5ygYuXifBQI+6CsLhsC
 h0+xk06K5am3SRYQhdgV1kunZ3JVRUV0JbmeImrM+NFSaVxAG5lPsE6BI
 u4I9AiK/pCe6Z/lHl8l0IPlJJFP93zou9t1qdk7sRzVHYjuz+cUGoNgvO
 hTTd+fbEwLo8gLLffnQP9k5udzkxj62jPDpF3Ykok0GF60Srg5ik65BYh
 r6S7nbdGnK6y91eyyb7tQPDzC+p6Y5wJ3a3pt+PbdX1xzp4puGKPfQMpP
 eXUFp80HVjwf1r/hzC5ZkumJv9UKqG3IRahqnV5QZ02XHzHMJPztkDIkt w==;
X-CSE-ConnectionGUID: o9Xl6yYORPSgn4y8kCXgZg==
X-CSE-MsgGUID: S455RbPXQSOiw9KEOTj4FQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="85884803"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="85884803"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2026 03:12:39 -0700
X-CSE-ConnectionGUID: GrotKdBIQf2h0XiiFDQmFg==
X-CSE-MsgGUID: BIy4c1RkSgC9I8DuhpuqIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; d="scan'208";a="256238140"
Received: from dut2051bmgfrd.iind.intel.com ([10.190.232.55])
 by fmviesa006.fm.intel.com with ESMTP; 31 Jul 2026 03:12:37 -0700
From: nishit.sharma@intel.com
To: igt-dev@lists.freedesktop.org, matthew.d.roper@intel.com,
 naresh.kumar.g@intel.com
Subject: [PATCH] tools/intel_reg: add MCR steered register access command
Date: Fri, 31 Jul 2026 10:12:36 +0000
Message-ID: <20260731101236.11815-1-nishit.sharma@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-BeenThere: igt-dev@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Development mailing list for IGT GPU Tools
 <igt-dev.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/igt-dev>
List-Post: <mailto:igt-dev@lists.freedesktop.org>
List-Help: <mailto:igt-dev-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/igt-dev>,
 <mailto:igt-dev-request@lists.freedesktop.org?subject=subscribe>
Errors-To: igt-dev-bounces@lists.freedesktop.org
Sender: "igt-dev" <igt-dev-bounces@lists.freedesktop.org>

From: Nishit Sharma <nishit.sharma@intel.com>

Add an "mcr" subcommand to read/write per-DSS multicast (MCR) GT
registers. It mirrors the KMD flow derives the DSS-per-group divisor
from the GuC hwconfig table, takes forcewake via the debugfs forcewake_all
handle (with a manual ack fallback), reads the DSS fuse masks under
forcewake, best-effort acquires the steering semaphore,
then steers the selector at each enabled DSS in turn to find
the first instance returning a non-zero value.

Signed-off-by: Nishit Sharma <nishit.sharma@intel.com>
---
 tools/intel_reg.c | 256 ++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 256 insertions(+)

diff --git a/tools/intel_reg.c b/tools/intel_reg.c
index 49afe91c0..d48e889e7 100644
--- a/tools/intel_reg.c
+++ b/tools/intel_reg.c
@@ -22,6 +22,7 @@
  */
 
 #include <errno.h>
+#include <fcntl.h>
 #include <getopt.h>
 #include <limits.h>
 #include <stdbool.h>
@@ -40,6 +41,7 @@
 
 #include "intel_reg_spec.h"
 #include "igt_device_scan.h"
+#include "xe_drm.h"
 
 
 #ifdef HAVE_SYS_IO_H
@@ -975,6 +977,253 @@ static int intel_reg_list(struct config *config, int argc, char *argv[])
 	return EXIT_SUCCESS;
 }
 
+#define MCR_STEER_SEMAPHORE		(0xfd0)
+#define MCR_SELECTOR			(0xfd4)
+#define MCR_GROUPID_SHIFT		8
+#define MCR_GROUPID_MASK		(0x1fu << MCR_GROUPID_SHIFT)
+#define MCR_INSTANCEID_MASK		0xfu
+#define MCR_MULTICAST_BIT		REG_BIT(31)
+
+#define GT_GEOMETRY_DSS_ENABLE		(0x913c)
+#define GT_COMPUTE_DSS_ENABLE		(0x9144)
+
+#define FW_GT_REQ			(0xa188)
+#define FW_GT_ACK			(0xdfc)
+#define FW_KERNEL_BIT			(1u << 0)
+#define FW_REQ_ENABLE			((FW_KERNEL_BIT << 16) | FW_KERNEL_BIT)
+#define FW_REQ_DISABLE			(FW_KERNEL_BIT << 16)
+
+#define HWCONFIG_ATTR_MAX_SLICES	1
+#define HWCONFIG_ATTR_MAX_SUBSLICES	70
+
+/*
+ * xe_hwconfig_lookup_u32 - Look up a 32-bit attribute in the GuC hwconfig table
+ * @fd: open DRM device fd for the Xe device
+ * @attribute: hwconfig attribute key to search for
+ * val: output; receives the attribute's 32-bit value on success
+ *
+ * Return: 0 on success, or a negative errno (-EINVAL on query failure,
+ * ENOMEM on allocation failure, -ENOENT if the attribute is not present).
+ *
+ */
+static int xe_hwconfig_lookup_u32(int fd, uint32_t attribute, uint32_t *val)
+{
+	struct drm_xe_device_query query = {
+		.query = DRM_XE_DEVICE_QUERY_HWCONFIG,
+	};
+	uint32_t *cfg;
+	uint64_t num_dw;
+	unsigned int i = 0;
+	int ret = -ENOENT;
+
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query) || !query.size)
+		return -EINVAL;
+
+	cfg = malloc(query.size);
+	if (!cfg)
+		return -ENOMEM;
+
+	query.data = to_user_pointer(cfg);
+	if (igt_ioctl(fd, DRM_IOCTL_XE_DEVICE_QUERY, &query)) {
+		free(cfg);
+		return -EINVAL;
+	}
+
+	num_dw = query.size / sizeof(uint32_t);
+	while (i + 3 <= num_dw) {
+		uint32_t key = cfg[i++];
+		uint32_t len_dw = cfg[i++];
+
+		if (key == attribute && len_dw >= 1) {
+			*val = cfg[i];
+			ret = 0;
+			break;
+		}
+		i += len_dw;
+	}
+
+	free(cfg);
+	return ret;
+}
+
+/*
+ * mcr_dss_per_group - Determine the number of DSS in each steering group
+ * @fd: open DRM device fd for the Xe device
+ * @devid: PCI device id of the target platform
+ *
+ * Return: number of DSS instances packed into each MCR steering group.
+ *
+ */
+static unsigned int mcr_dss_per_group(int fd, uint32_t devid)
+{
+	uint32_t max_slices = 0, max_subslices = 0;
+	int ret;
+
+	ret = xe_hwconfig_lookup_u32(fd, HWCONFIG_ATTR_MAX_SLICES, &max_slices);
+	if (ret < 0 || max_slices == 0)
+		goto fallback;
+
+	ret = xe_hwconfig_lookup_u32(fd, HWCONFIG_ATTR_MAX_SUBSLICES, &max_subslices);
+	if (ret < 0 || max_subslices == 0)
+		goto fallback;
+
+	return DIV_ROUND_UP(max_subslices, max_slices);
+
+fallback:
+	if (IS_PONTEVECCHIO(devid))
+		return 8;
+	else if (intel_graphics_ver(devid) >= IP_VER(12, 50))
+		return 4;
+	else
+		return 6;
+}
+
+static void
+xe_gt_mcr_get_dss_steering(unsigned int dss_per_grp,
+			   unsigned int dss,
+			   uint16_t *group, uint16_t *instance)
+{
+	*group = dss / dss_per_grp;
+	*instance = dss % dss_per_grp;
+}
+
+static int intel_reg_mcr_rw(struct config *config, int argc, char *argv[])
+{
+	uint32_t addr, value = 0, probe;
+	uint32_t fuse_geom, fuse_comp, dss_mask;
+	uint32_t steer = 0, readback, dss_per_grp = 4;
+	int dss_bit, grpid, instid, xe_fd = -1;
+	int fw_handle = -1;
+	uint16_t group16, instance16, ret = EXIT_SUCCESS;
+	bool is_write, found = false;
+	char *endp;
+
+	if (argc < 2) {
+		fprintf(stderr, "mcr: no register specified\n");
+		return EXIT_FAILURE;
+	}
+
+	addr = strtoul(argv[1], &endp, 16);
+	if (endp == argv[1] || *endp) {
+		fprintf(stderr, "mcr: invalid register '%s'\n", argv[1]);
+		return EXIT_FAILURE;
+	}
+
+	is_write = argc >= 3;
+	if (is_write) {
+		value = strtoul(argv[2], &endp, 16);
+		if (endp == argv[2] || *endp) {
+			fprintf(stderr, "mcr: invalid value '%s'\n", argv[2]);
+			return EXIT_FAILURE;
+		}
+	}
+
+	intel_register_access_init(&config->mmio_data, config->pci_dev, 0);
+
+	xe_fd = __drm_open_driver(DRIVER_XE);
+
+	if (xe_fd >= 0)
+		dss_per_grp = mcr_dss_per_group(xe_fd, config->devid);
+
+	if (xe_fd >= 0)
+		fw_handle = igt_debugfs_open(xe_fd, "forcewake_all", O_RDONLY);
+
+	if (fw_handle < 0) {
+		OUTREG(FW_GT_REQ, FW_REQ_ENABLE);
+		if (!igt_wait(INREG(FW_GT_ACK) & FW_KERNEL_BIT, 50, 1)) {
+			fprintf(stderr,
+				"mcr: timed out waiting for GT forcewake ack "
+				"(device may be runtime-suspended and the xe "
+				"debugfs forcewake_all handle was unavailable)\n");
+			if (xe_fd >= 0)
+				close(xe_fd);
+			intel_register_access_fini(&config->mmio_data);
+			return EXIT_FAILURE;
+		}
+	}
+
+	fuse_geom = INREG(GT_GEOMETRY_DSS_ENABLE);
+	fuse_comp = INREG(GT_COMPUTE_DSS_ENABLE);
+	dss_mask = fuse_geom | fuse_comp;
+
+	if (!dss_mask) {
+		fprintf(stderr,
+			"mcr: no enabled DSS found (fuses 0x%08x / 0x%08x)\n",
+			fuse_geom, fuse_comp);
+		ret = EXIT_FAILURE;
+		goto fw_release;
+	}
+
+	/* Matching KMD implementation, if SEMAPHORE contended
+	 * print warning and continue
+	 */
+	if (!igt_wait(INREG(MCR_STEER_SEMAPHORE) & 0x1, 10, 1))
+		fprintf(stderr, "mcr: warning: steering semaphore not acquired\n");
+
+	readback = 0;
+	dss_bit = __builtin_ctz(dss_mask);
+	grpid = dss_bit / dss_per_grp;
+	instid = dss_bit % dss_per_grp;
+
+	probe = dss_mask;
+	while (probe) {
+		int bit = __builtin_ctz(probe);
+		uint32_t val;
+
+		probe &= probe - 1;
+
+		xe_gt_mcr_get_dss_steering(dss_per_grp, bit,
+					   &group16, &instance16);
+		steer = ((uint32_t)group16 << MCR_GROUPID_SHIFT) &
+			MCR_GROUPID_MASK;
+		steer |= (uint32_t)instance16 & MCR_INSTANCEID_MASK;
+
+		OUTREG(MCR_SELECTOR, steer);
+		if (is_write)
+			OUTREG(addr, value);
+		val = INREG(addr);
+
+		dss_bit = bit;
+		grpid = group16;
+		instid = instance16;
+		readback = val;
+		if (val) {
+			found = true;
+			break;
+		}
+	}
+
+	OUTREG(MCR_SELECTOR, MCR_MULTICAST_BIT | steer);
+	OUTREG(MCR_STEER_SEMAPHORE, 0x1);
+
+	if (!found) {
+		printf("DSS mask 0x%08x: register 0x%05x reads back 0x00000000 on all enabled DSS instances\n",
+		       dss_mask, addr);
+	} else {
+		printf("DSS mask 0x%08x, selected DSS bit %d => group %d, instance %d\n",
+		       dss_mask, dss_bit, grpid, instid);
+		if (is_write)
+			printf("MCR write 0x%05x = 0x%08x (read-back 0x%08x)\n",
+			       addr, value, readback);
+		else
+			printf("MCR read  0x%05x = 0x%08x\n", addr, readback);
+	}
+
+fw_release:
+	if (fw_handle >= 0) {
+		close(fw_handle);
+	} else {
+		OUTREG(FW_GT_REQ, FW_REQ_DISABLE);
+		igt_wait(!(INREG(FW_GT_ACK) & FW_KERNEL_BIT), 50, 1);
+	}
+
+	if (xe_fd >= 0)
+		close(xe_fd);
+
+	intel_register_access_fini(&config->mmio_data);
+	return ret;
+}
+
 static int intel_reg_help(struct config *config, int argc, char *argv[]);
 
 struct command {
@@ -1003,6 +1252,13 @@ static const struct command commands[] = {
 		.synopsis = "[--post] REGISTER VALUE [REGISTER VALUE ...]",
 		.description = "write value(s) to specified register(s)",
 	},
+	{
+		.name = "mcr",
+		.function = intel_reg_mcr_rw,
+		.synopsis = "REG-ADDR [VALUE]",
+		.description = "read/write an MCR register steered to the first "
+			       "non-terminated DSS (write if VALUE given, else read)",
+	},
 	{
 		.name = "snapshot",
 		.function = intel_reg_snapshot,
-- 
2.43.0

