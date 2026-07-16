Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 869EDC44501
	for <igt-dev@archiver.kernel.org>; Thu, 16 Jul 2026 09:57:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3290A10E335;
	Thu, 16 Jul 2026 09:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YO3Y9AEQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FE910E335
 for <igt-dev@lists.freedesktop.org>; Thu, 16 Jul 2026 09:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784195840; x=1815731840;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nv6br8Hisj7yLjUsLvlv2XeijfwGvss1KAKOIkS6EJQ=;
 b=YO3Y9AEQNrEJqPdlGbS9xk/hAqmGtxTkMSHEGsqRt1LgoXcOjtjHCEau
 4mst5MMCk1QaNEu4IqoZcfODXQKR63ypTroK5rOILoh4xuMXuoDlv7NfT
 P+QZYlW5M9X7BwVygvWVg4R2GIHw7l05twahZDk0DUg8O7C0vhCVNO8vU
 t3d5jgpwefkH3t01n4dAn+TqM2K3D5dS8oZDL/RpJBopbvhsZMIOqf+3Y
 gO4OsZfBa+j7HKQPZyy84a7j24JfmxzUlpfTgwjQX4fEqD10KpWNS9vSo
 r6xY9ITXjs4CFS3STIo97yYcTVLm6+zcy3rdRNfcXGPpULh0eCEiMY3v7 g==;
X-CSE-ConnectionGUID: vkjELEgMRkKpd0H1HlED7A==
X-CSE-MsgGUID: ti6DjgYzTaSDqp9jnF4jkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11847"; a="87394743"
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="87394743"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:57:20 -0700
X-CSE-ConnectionGUID: 3t/eLAoCT0i+Pg62zv6Gqg==
X-CSE-MsgGUID: oZWeZokVSdS0NTRaoxwYWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,167,1779174000"; d="scan'208";a="261382612"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jul 2026 02:57:18 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t] tests/intel/xe_mempage_offline: Add fault-inject based page
 offline tests
Date: Thu, 16 Jul 2026 15:27:04 +0530
Message-ID: <20260716095703.1543088-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
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

Add IGT tests for VRAM page offlining using the kernel's fault-inject
infrastructure (inject_mempage_offline). Tests exercise:

- inject-single-page: Inject one fault via auto-pick ("0"), verify
  page appears in vram_bad_pages sysfs with 'R' (reserved) flag
- inject-duplicate-page: Re-inject the same PFN, verify soft→hard
  promotion returns -EEXIST and page count stays unchanged

The trigger file (inject_mempage_offline_trigger) accepts:
- "0"      : auto-pick last unallocated VRAM page
- "0xPFN"  : inject fault at a specific PFN address

If CONFIG_FAULT_INJECTION_DEBUG_FS is enabled, the fault-inject
probability/times knobs are configured first. If unavailable
(only CONFIG_FAULT_INJECTION), the trigger injects directly.

Requires CRI platform with CONFIG_FAULT_INJECTION enabled.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 195 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 196 insertions(+)
 create mode 100644 tests/intel/xe_mempage_offline.c

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
new file mode 100644
index 000000000..ae9ce981d
--- /dev/null
+++ b/tests/intel/xe_mempage_offline.c
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: MIT
+/*
+ * Copyright © 2026 Intel Corporation
+ */
+
+/**
+ * TEST: VRAM page offline injection and verification
+ * Category: Core
+ * Mega feature: General Core features
+ * Sub-category: RAS
+ * Functionality: memory page offline
+ * Test category: functionality test
+ */
+
+#include <errno.h>
+#include <fcntl.h>
+#include <limits.h>
+#include <string.h>
+#include <unistd.h>
+
+#include "igt.h"
+#include "igt_debugfs.h"
+#include "igt_device.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_query.h"
+
+#define FAULT_INJECT_DIR	"inject_mempage_offline"
+#define TRIGGER_FILE		"inject_mempage_offline_trigger"
+#define VRAM_BAD_PAGES		"device/vram_bad_pages"
+
+static int count_bad_pages(int sysfs_fd)
+{
+	char buf[4096];
+	int len, count = 0;
+	char *line;
+
+	len = igt_sysfs_read(sysfs_fd, VRAM_BAD_PAGES, buf, sizeof(buf) - 1);
+	if (len <= 0)
+		return 0;
+
+	buf[len] = '\0';
+
+	/* Each entry line has format: "0x%08x : 0x%08x : %c\n" */
+	line = buf;
+	while ((line = strchr(line, '\n')) != NULL) {
+		count++;
+		line++;
+	}
+
+	/* Subtract the header line (max_pages : XXXX) */
+	if (count > 0)
+		count--;
+
+	return count;
+}
+
+static bool bad_page_has_flag(int sysfs_fd, char flag)
+{
+	char buf[4096];
+	int len;
+	char *p;
+
+	len = igt_sysfs_read(sysfs_fd, VRAM_BAD_PAGES, buf, sizeof(buf) - 1);
+	if (len <= 0)
+		return false;
+
+	buf[len] = '\0';
+
+	/* Look for the flag character after last ':' on entry lines */
+	p = buf;
+	while ((p = strstr(p, " : ")) != NULL) {
+		p += 3;
+		if (*p == flag)
+			return true;
+	}
+
+	return false;
+}
+
+static uint64_t get_last_bad_page_pfn(int sysfs_fd)
+{
+	char buf[4096];
+	int len;
+	char *line, *last_entry = NULL;
+	uint64_t pfn = 0;
+
+	len = igt_sysfs_read(sysfs_fd, VRAM_BAD_PAGES, buf, sizeof(buf) - 1);
+	if (len <= 0)
+		return 0;
+
+	buf[len] = '\0';
+
+	/* Find last entry line (format: "0x%08llx : 0x%08llx : %c\n") */
+	line = buf;
+	while (*line) {
+		if (line[0] == '0' && line[1] == 'x')
+			last_entry = line;
+		line = strchr(line, '\n');
+		if (!line)
+			break;
+		line++;
+	}
+
+	if (last_entry)
+		sscanf(last_entry, "0x%lx", &pfn);
+
+	return pfn;
+}
+
+static void inject_fault(int fd)
+{
+	/* Use fault-inject knobs if available, otherwise trigger directly */
+	if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/probability", O_WRONLY)) {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/verbose", "1");
+	}
+	__igt_debugfs_write(fd, TRIGGER_FILE, "0", 1);
+}
+
+/**
+ * SUBTEST: inject-single-page
+ * Description: Inject a single VRAM page fault and verify it appears in vram_bad_pages
+ */
+
+/**
+ * SUBTEST: inject-duplicate-page
+ * Description: Inject two pages and verify both appear in vram_bad_pages
+ */
+
+int igt_main()
+{
+	int fd;
+	int sysfs_fd;
+	uint16_t devid;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		igt_require(intel_get_device_info(devid)->is_crescentisland);
+		igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
+		sysfs_fd = igt_sysfs_open(fd);
+		igt_assert(sysfs_fd >= 0);
+	}
+
+	igt_subtest("inject-single-page") {
+		int initial_count, after_count;
+
+		initial_count = count_bad_pages(sysfs_fd);
+		inject_fault(fd);
+		after_count = count_bad_pages(sysfs_fd);
+		igt_assert_eq(after_count, initial_count + 1);
+		igt_assert(bad_page_has_flag(sysfs_fd, 'R'));
+	}
+
+	igt_subtest("inject-duplicate-page") {
+		int initial_count, after_count;
+		uint64_t pfn;
+		char pfn_str[32];
+		int debugfs_fd, ret;
+
+		initial_count = count_bad_pages(sysfs_fd);
+
+		/* First injection — auto-pick unallocated page */
+		inject_fault(fd);
+		after_count = count_bad_pages(sysfs_fd);
+		igt_assert_eq(after_count, initial_count + 1);
+
+		/* Get PFN of the page just injected */
+		pfn = get_last_bad_page_pfn(sysfs_fd);
+		igt_assert(pfn != 0);
+
+		/*
+		 * Re-inject same PFN — should return -EEXIST (soft→hard
+		 * promotion). Write to trigger with the PFN value.
+		 */
+		snprintf(pfn_str, sizeof(pfn_str), "0x%lx", pfn);
+		debugfs_fd = igt_debugfs_open(fd, TRIGGER_FILE, O_WRONLY);
+		igt_assert(debugfs_fd >= 0);
+		ret = write(debugfs_fd, pfn_str, strlen(pfn_str));
+		igt_assert(ret < 0 && errno == EEXIST);
+		close(debugfs_fd);
+
+		/* Count should not change — same page, not a new one */
+		after_count = count_bad_pages(sysfs_fd);
+		igt_assert_eq(after_count, initial_count + 1);
+	}
+
+	igt_fixture() {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "0");
+		close(sysfs_fd);
+		drm_close_driver(fd);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index d73aaecd9..c75633684 100644
--- a/tests/meson.build
+++ b/tests/meson.build
@@ -318,6 +318,7 @@ intel_xe_progs = [
 	'xe_live_ktest',
 	'xe_madvise',
 	'xe_media_fill',
+        'xe_mempage_offline',
 	'xe_mmap',
         'xe_module_load',
         'xe_multigpu_svm',
-- 
2.52.0

