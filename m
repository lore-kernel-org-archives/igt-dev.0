Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E865FC54E71
	for <igt-dev@archiver.kernel.org>; Tue, 20 May 2025 19:30:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B95210E0A2;
	Tue, 20 May 2025 19:30:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VkDMKgV9";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D053710E0C1
 for <igt-dev@lists.freedesktop.org>; Tue, 20 May 2025 19:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747769448; x=1779305448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pQsb5syxsa9PXCzriB0FQQ+c/T85X894TxUaOFydPv0=;
 b=VkDMKgV9XI8+BeU3uy4vJmnp1hdhOUyQmaChkg6xR7AsbmTVg+2WmX1Q
 cuCAvRXRmqikgfnvgi5Ci6Il9o9vrj6V+H8+37Dn9/jjTsk3lZc/Mx27G
 4UhZwyeC/48N8fnwXVhdagJ6PtKeYNJSLUpdQzppKQq0GVmKeoQRkXQ7+
 8RveZJ0Sv5pmzJ+icMW0h/OQCXKv53ghtZNMpp2R1SdG4ATEJriO50TT9
 NTJmbSNEaX13b4waXIkYiAIX8h0M18WGMQQnRe7mHdpXKg6qLvr2NG38/
 j4beAFR74XmU7zGEumgRo/qTfNLZV11M6Fi2GnnBj2Y2zsplko78Zw5uk w==;
X-CSE-ConnectionGUID: shlfe83zTKS7CViK1AfBSw==
X-CSE-MsgGUID: dA32qKUzSD+1/or2i/skJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="53386108"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="53386108"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:48 -0700
X-CSE-ConnectionGUID: 6RGv4K/qTBOD801Dyvwcmw==
X-CSE-MsgGUID: 5naiasLOQaanDN3yimhbdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140840366"
Received: from mstancu-mobl1.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.118.0])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 12:30:44 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 marcin.bernatowicz@intel.com, himanshu.girotra@intel.com,
 aditya.chauhan@intel.com, pravalika.gurram@intel.com,
 sai.gowtham.ch@intel.com, ramadevi.gandi@intel.com,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com
Subject: [RFC v2 i-g-t 5/5] tests/intel/xe_debugfs: Add Xe-specific debugfs
 testing
Date: Tue, 20 May 2025 21:29:49 +0200
Message-ID: <20250520192951.411614-6-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520192951.411614-1-peter.senna@linux.intel.com>
References: <20250514175140.115033-1-peter.senna@linux.intel.com>
 <20250520192951.411614-1-peter.senna@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Introduces xe_debugfs, a test designed specifically for Xe GPUs. This test
complements the generic debugfs tests:
- core_debugfs
- core_debugfs_display_on_off

Cc: marcin.bernatowicz@intel.com
Cc: himanshu.girotra@intel.com
Cc: aditya.chauhan@intel.com
Cc: pravalika.gurram@intel.com
Cc: sai.gowtham.ch@intel.com
Cc: ramadevi.gandi@intel.com
Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
 tests/intel/xe_debugfs.c | 212 +++++++++++++++++++++++++++++++++++++++
 tests/meson.build        |   1 +
 2 files changed, 213 insertions(+)
 create mode 100644 tests/intel/xe_debugfs.c

diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
new file mode 100644
index 000000000..b4eef81d1
--- /dev/null
+++ b/tests/intel/xe_debugfs.c
@@ -0,0 +1,212 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2025 Intel Corporation
+ */
+
+#include <dirent.h>
+#include <fcntl.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_sysfs.h"
+#include "xe/xe_query.h"
+
+
+struct {
+	bool warn_on_not_hit;
+} opt = { 0 };
+
+/**
+ * TEST: Xe debugfs test
+ * Description: Xe-specific debugfs tests. These are complementary to the
+ * core_debugfs and core_debugfs_display_on_off tests.
+ *
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: uapi
+ * Functionality: debugfs
+ * Feature: core
+ * Test category: uapi
+ *
+ */
+
+IGT_TEST_DESCRIPTION("Read entries from debugfs, and sysfs paths.");
+
+static int xe_validate_entries(int fd, const char *add_path,
+			       const char * const str_val[], int str_cnt)
+{
+	int i;
+	int hit;
+	int found = 0;
+	int not_found = 0;
+	DIR *dir;
+	struct dirent *de;
+	char path[PATH_MAX];
+
+	if (!igt_debugfs_path(fd, path, sizeof(path)))
+		return -1;
+
+	strcat(path, add_path);
+	dir = opendir(path);
+	if (!dir)
+		return -1;
+
+	while ((de = readdir(dir))) {
+		if (de->d_name[0] == '.')
+			continue;
+		hit = 0;
+		for (i = 0; i < str_cnt; i++) {
+			if (!strcmp(str_val[i], de->d_name)) {
+				hit = 1;
+				break;
+			}
+		}
+		if (hit) {
+			found++;
+		} else if (opt.warn_on_not_hit) {
+			not_found++;
+			igt_warn("no test for: %s/%s\n", path, de->d_name);
+		}
+	}
+	closedir(dir);
+	return 0;
+}
+
+/**
+ * SUBTEST: xe-base
+ * Description: Check if various debugfs devnodes exist and test reading them
+ */
+static void
+xe_test_base(int fd, struct drm_xe_query_config *config)
+{
+	uint16_t devid = intel_get_drm_devid(fd);
+	static const char * const expected_files[] = {
+		"gt0",
+		"gt1",
+		"stolen_mm",
+		"gtt_mm",
+		"vram0_mm",
+		"forcewake_all",
+		"info",
+		"gem_names",
+		"clients",
+		"name"
+	};
+	char reference[4096];
+	int val = 0;
+
+	igt_assert(config);
+	sprintf(reference, "devid 0x%llx",
+			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] & 0xffff);
+	igt_assert(igt_debugfs_search(fd, "info", reference));
+
+	sprintf(reference, "revid %lld",
+			config->info[DRM_XE_QUERY_CONFIG_REV_AND_DEVICE_ID] >> 16);
+	igt_assert(igt_debugfs_search(fd, "info", reference));
+
+	sprintf(reference, "is_dgfx %s", config->info[DRM_XE_QUERY_CONFIG_FLAGS] &
+		DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM ? "yes" : "no");
+
+	igt_assert(igt_debugfs_search(fd, "info", reference));
+
+	if (intel_gen(devid) < 20) {
+		switch (config->info[DRM_XE_QUERY_CONFIG_VA_BITS]) {
+		case 48:
+			val = 3;
+			break;
+		case 57:
+			val = 4;
+			break;
+		}
+
+		sprintf(reference, "vm_max_level %d", val);
+		igt_assert(igt_debugfs_search(fd, "info", reference));
+	}
+
+	snprintf(reference, sizeof(reference), "tile_count %d", xe_sysfs_get_num_tiles(fd));
+	igt_assert(igt_debugfs_search(fd, "info", reference));
+
+	igt_assert(igt_debugfs_exists(fd, "gt0", O_RDONLY));
+
+	igt_assert(igt_debugfs_exists(fd, "gtt_mm", O_RDONLY));
+	igt_debugfs_dump(fd, "gtt_mm");
+
+	if (config->info[DRM_XE_QUERY_CONFIG_FLAGS] & DRM_XE_QUERY_CONFIG_FLAG_HAS_VRAM) {
+		igt_assert(igt_debugfs_exists(fd, "vram0_mm", O_RDONLY));
+		igt_debugfs_dump(fd, "vram0_mm");
+	}
+
+	if (igt_debugfs_exists(fd, "stolen_mm", O_RDONLY))
+		igt_debugfs_dump(fd, "stolen_mm");
+
+	igt_assert(igt_debugfs_exists(fd, "clients", O_RDONLY));
+	igt_debugfs_dump(fd, "clients");
+
+	igt_assert(igt_debugfs_exists(fd, "gem_names", O_RDONLY));
+	igt_debugfs_dump(fd, "gem_names");
+
+	xe_validate_entries(fd, "", expected_files, ARRAY_SIZE(expected_files));
+}
+
+/**
+ * SUBTEST: xe-forcewake
+ * Description: Check forcewake debugfs devnode
+ */
+static void
+xe_test_forcewake(int fd)
+{
+	int handle = igt_debugfs_open(fd, "forcewake_all", O_WRONLY);
+
+	igt_assert_neq(handle, -1);
+	close(handle);
+}
+
+const char *help_str =
+	"  -w\t--warn-not-hit Produce warnings if it founds a devfs node without tests";
+
+struct option long_options[] = {
+	{ "--warn-not-hit", no_argument, NULL, 'w'},
+	{ 0, 0, 0, 0 }
+};
+
+static int opt_handler(int option, int option_index, void *input)
+{
+	switch (option) {
+	case 'w':
+		opt.warn_on_not_hit = true;
+		break;
+	default:
+		return IGT_OPT_HANDLER_ERROR;
+	}
+
+	return IGT_OPT_HANDLER_SUCCESS;
+}
+
+igt_main_args("", long_options, help_str, opt_handler, NULL)
+{
+	int debugfs = -1;
+	int fd = -1;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_XE);
+		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
+		debugfs = igt_debugfs_dir(fd);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Check if various debugfs devnodes exist and test reading them.");
+	igt_subtest("xe-base") {
+		xe_test_base(fd, xe_config(fd));
+	}
+
+	igt_describe("Check forcewake debugfs devnode");
+	igt_subtest("xe-forcewake") {
+		xe_test_forcewake(fd);
+	}
+
+	igt_fixture {
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index eac77fb81..97d60f9f6 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -281,6 +281,7 @@ intel_xe_progs = [
 	'xe_compute',
 	'xe_compute_preempt',
 	'xe_copy_basic',
+	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
 	'xe_eu_stall',
-- 
2.43.0

