Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0156C61DE2
	for <igt-dev@archiver.kernel.org>; Mon, 31 Aug 2026 12:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83A1510E52D;
	Mon, 31 Aug 2026 12:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MnFr6uxx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7086610E040
 for <igt-dev@lists.freedesktop.org>; Mon, 31 Aug 2026 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788179235; x=1819715235;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=0kFGnqQY3jruDoNViAZEkUTX7yUsrt57Z8+E2HXAMwA=;
 b=MnFr6uxxLpnM5knO1LW3pZvoIBjyFoNnsKem42q34a+xFBk+rHuPCDDE
 A104bsSkFC9/N1McgLVv7jC6Y+CtCykVlexJuqa5u9+Ra3f6xuUxczKWB
 NtsahTG4cm4qD9mBmpWVIGBCFMOksDztJ2i3/fSFHW7L/p3wq0OstxjEN
 WfWbTg5aUOIqnBlyk2nmwfxVZxwfBYDM3FJq+zF77AsK25DvV4JFhmX6r
 4a0THyUQbhtDt8f7f9UCr5mAcMQy8FSyG+R1jltx4lwzaPj22PmhMBO4B
 KYamBw/GJ2Q9bO0f6gBHfj5hqpqJu3Jds2A0wAkdmJcZi2F03EbNc04NQ Q==;
X-CSE-ConnectionGUID: 6I0pJm92RJaCVxkikBj6pw==
X-CSE-MsgGUID: Lu4GTjDaRs2EzPgLxftyJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="98922108"
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="98922108"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:27:15 -0700
X-CSE-ConnectionGUID: lQOypnyyQVibXpADfegbCg==
X-CSE-MsgGUID: BKUWDNxoTO2zKX2n7q39GQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,254,1779174000"; d="scan'208";a="269377454"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2026 05:27:14 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t v3] tests/intel/xe_mempage_offline: Add fault-inject based
 page offline tests
Date: Mon, 31 Aug 2026 17:56:59 +0530
Message-ID: <20260831122658.334929-2-tejas.upadhyay@intel.com>
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

Requires CRI platform with CONFIG_FAULT_INJECTION enabled.

v3:
- Unload/reload driver post test suite run
v2:
- KMD moved from sysfs to debugfs, align with it

Depends-on: <20260831064942.315720-17-tejas.upadhyay@intel.com>
Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 197 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 tests/intel/xe_mempage_offline.c

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
new file mode 100644
index 000000000..d652db827
--- /dev/null
+++ b/tests/intel/xe_mempage_offline.c
@@ -0,0 +1,197 @@
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
+#include "igt_kmod.h"
+#include "igt_sysfs.h"
+
+#include "xe/xe_query.h"
+
+#define FAULT_INJECT_DIR	"inject_mempage_offline"
+#define TRIGGER_FILE		"inject_mempage_offline_trigger"
+#define VRAM_BAD_PAGES		"vram_bad_pages"
+
+static int count_bad_pages(int fd)
+{
+	char buf[4096];
+	int count = 0;
+	char *line;
+
+	/* Read file into buf. It automatically null-terminates inside. */
+	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+	/* Check if the buffer is empty or could not be read */
+	if (buf[0] == '\0')
+		return 0;
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
+static bool bad_page_has_flag(int fd, char flag)
+{
+	char buf[4096];
+	char *p;
+
+	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+	if (buf[0] == '\0')
+		return false;
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
+static uint64_t get_last_bad_page_pfn(int fd)
+{
+	char buf[4096];
+	char *line, *last_entry = NULL;
+	uint64_t pfn = 0;
+
+	__igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+	if (buf[0] == '\0')
+		return 0;
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
+	uint16_t devid;
+
+	igt_fixture() {
+		fd = drm_open_driver(DRIVER_XE);
+		devid = intel_get_drm_devid(fd);
+		igt_require(intel_get_device_info(devid)->is_crescentisland);
+		igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
+		igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
+		igt_assert(fd >= 0);
+	}
+
+	igt_subtest("inject-single-page") {
+		int initial_count, after_count;
+
+		initial_count = count_bad_pages(fd);
+		inject_fault(fd);
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+		igt_assert(bad_page_has_flag(fd, 'R'));
+	}
+
+	igt_subtest("inject-duplicate-page") {
+		int initial_count, after_count;
+		uint64_t pfn;
+		char pfn_str[32];
+		int debugfs_fd, ret;
+
+		initial_count = count_bad_pages(fd);
+
+		/* First injection — auto-pick unallocated page */
+		inject_fault(fd);
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+
+		/* Get PFN of the page just injected */
+		pfn = get_last_bad_page_pfn(fd);
+		igt_assert(pfn != 0);
+
+		/* Reset / override the allowed fault count to 2 (or more) */
+		if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/times", O_WRONLY)) {
+			igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "2");
+		}
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
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+	}
+
+	igt_fixture() {
+		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "0");
+		drm_close_driver(fd);
+		igt_xe_driver_unload();
+		igt_assert_eq(igt_xe_driver_load(NULL), 0);
+	}
+}
diff --git a/tests/meson.build b/tests/meson.build
index 1ac89bab7..c7c614e7c 100644
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

