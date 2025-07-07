Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 973ABC83030
	for <igt-dev@archiver.kernel.org>; Mon,  7 Jul 2025 21:03:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 401C210E07E;
	Mon,  7 Jul 2025 21:03:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="N5IvNBFD";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 486FF10E565
 for <igt-dev@lists.freedesktop.org>; Mon,  7 Jul 2025 21:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751922234; x=1783458234;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bPJNqUtLIZ/fkPFaFJQEx3YyH//YzFeZm4mMX+oDVN0=;
 b=N5IvNBFDwpgZPxp0RffPSYuiAaYXUhKX0aXVPxR/J13R9+dUPBp9vVYP
 22VzUvpN4AEgedkqkpKcnBbP8TX25SghkuWuIYdvW4fF9YtjpNdOJDFW1
 eXNQrlZ/k20RDFDYmjZZdQQDX//RloR1dwkn8yCiptlDaT6FBrJMsW2rD
 y+eh3PXqLYePgKvOdcP5QDU5SqM5On7zOS2Y82xu5+LAx9KsZb/TMgkjm
 ijhbwy+VBtVxg0DRdQsxl2D7qAO7ZxleN4jUsGaxbSVd/KfT3Bc48qozH
 ja7lA36dMUygGxM0a4ND+0zzDL/Qw2Cz04h2sXfT+1JcGCvzjW/Y+eKkQ g==;
X-CSE-ConnectionGUID: bb/7guFhSLefPbDraI7HcA==
X-CSE-MsgGUID: qeAQa8PhQ3mauOvSpIECGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="71597465"
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="71597465"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:03:54 -0700
X-CSE-ConnectionGUID: LEre7XSvRtSk5PNxEVyTvg==
X-CSE-MsgGUID: sxtT64UMS8GzG/Yctalf6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,295,1744095600"; d="scan'208";a="159590498"
Received: from jmkrefta-mobl2.ger.corp.intel.com (HELO
 friendship7-home.clients.intel.com) ([10.245.255.250])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2025 14:03:52 -0700
From: Peter Senna Tschudin <peter.senna@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Peter Senna Tschudin <peter.senna@linux.intel.com>,
 lucas.demarchi@intel.com, rodrigo.vivi@intel.com,
 kamil.konieczny@linux.intel.com, katarzyna.piecielska@intel.com,
 zbigniew.kempczynski@intel.com, michal.wajdeczko@intel.com,
 karthik.b.s@intel.com
Subject: [PATCH v4 i-g-t 5/6] tests: Add xe_debugfs
Date: Mon,  7 Jul 2025 23:03:07 +0200
Message-ID: <20250707210310.54861-6-peter.senna@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707210310.54861-1-peter.senna@linux.intel.com>
References: <20250616074240.45818-1-peter.senna@linux.intel.com>
 <20250707210310.54861-1-peter.senna@linux.intel.com>
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

xe_debugfs is a test specific to Xe GPUs. It is intended to complement
the existing generic debugfs tests core_debugfs and
core_debugfs_display_on_off.

Additionally, this test has been updated to use the igt_dir
infrastructure, resulting in simpler code.

Cc: lucas.demarchi@intel.com
Cc: rodrigo.vivi@intel.com
Cc: kamil.konieczny@linux.intel.com
Cc: katarzyna.piecielska@intel.com
Cc: zbigniew.kempczynski@intel.com
Cc: michal.wajdeczko@intel.com
Cc: karthik.b.s@intel.com
Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Peter Senna Tschudin <peter.senna@linux.intel.com>
---
v4:
 - unchanged from v3
v3:
 - unchanged from v2
v2:
 - changed style of comparison to NULL

 tests/intel-ci/xe-fast-feedback.testlist |   2 +
 tests/intel/xe_debugfs.c                 | 208 +++++++++++++++++++++++
 tests/meson.build                        |   1 +
 3 files changed, 211 insertions(+)
 create mode 100644 tests/intel/xe_debugfs.c

diff --git a/tests/intel-ci/xe-fast-feedback.testlist b/tests/intel-ci/xe-fast-feedback.testlist
index a5f799f6b..c52f08953 100644
--- a/tests/intel-ci/xe-fast-feedback.testlist
+++ b/tests/intel-ci/xe-fast-feedback.testlist
@@ -78,6 +78,8 @@ igt@xe_create@create-execqueues-noleak
 igt@xe_create@create-execqueues-leak
 igt@xe_create@create-invalid-mbz
 igt@xe_create@create-massive-size
+igt@xe_debugfs@xe-base
+igt@xe_debugfs@xe-forcewake
 igt@xe_dma_buf_sync@export-dma-buf-once-write-sync
 igt@xe_dma_buf_sync@export-dma-buf-once-read-sync
 igt@xe_dma_buf_sync@export-dma-buf-once-read-write-sync
diff --git a/tests/intel/xe_debugfs.c b/tests/intel/xe_debugfs.c
new file mode 100644
index 000000000..66a5fa0f6
--- /dev/null
+++ b/tests/intel/xe_debugfs.c
@@ -0,0 +1,208 @@
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
+#include "igt_dir.h"
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
+static int xe_validate_entries(igt_dir_t *igt_dir,
+			       const char * const str_val[], int str_cnt)
+{
+	igt_dir_file_list_t *file_list_entry;
+
+	if (!igt_dir)
+		return -1;
+
+	igt_dir_scan_dirfd(igt_dir, -1);
+
+	for (int i = 0; i < str_cnt; i++) {
+		int hit = 0;
+
+		igt_list_for_each_entry(file_list_entry,
+					&igt_dir->file_list_head, link) {
+			if (strcmp(file_list_entry->relative_path,
+				   str_val[i]) == 0) {
+				hit = 1;
+				break;
+			}
+		}
+
+		if (!hit && opt.warn_on_not_hit)
+			igt_warn("no test for: %s\n", str_val[i]);
+	}
+
+	return 0;
+}
+
+/**
+ * SUBTEST: xe-base
+ * Description: Check if various debugfs devnodes exist and test reading them
+ */
+static void
+xe_test_base(int fd, struct drm_xe_query_config *config, igt_dir_t *igt_dir)
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
+	xe_validate_entries(igt_dir, expected_files,
+			    ARRAY_SIZE(expected_files));
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
+	igt_dir_t *igt_dir = NULL;
+
+	igt_fixture {
+		fd = drm_open_driver_master(DRIVER_XE);
+		__igt_debugfs_dump(fd, "info", IGT_LOG_INFO);
+		debugfs = igt_debugfs_dir(fd);
+
+		igt_dir = igt_dir_create(debugfs);
+		igt_require(igt_dir);
+
+		kmstest_set_vt_graphics_mode();
+	}
+
+	igt_describe("Check if various debugfs devnodes exist and test reading them.");
+	igt_subtest("xe-base") {
+		xe_test_base(fd, xe_config(fd), igt_dir);
+	}
+
+	igt_describe("Check forcewake debugfs devnode");
+	igt_subtest("xe-forcewake") {
+		xe_test_forcewake(fd);
+	}
+
+	igt_fixture {
+		igt_dir_destroy(igt_dir);
+		close(debugfs);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 4976f2d91..df0d9cb1a 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -284,6 +284,7 @@ intel_xe_progs = [
 	'xe_compute_preempt',
 	'xe_copy_basic',
 	'xe_configfs',
+	'xe_debugfs',
 	'xe_dma_buf_sync',
 	'xe_drm_fdinfo',
 	'xe_eu_stall',
-- 
2.43.0

