Return-Path: <igt-dev-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C102C61DD6
	for <igt-dev@archiver.kernel.org>; Fri,  4 Sep 2026 13:00:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C417010E54F;
	Fri,  4 Sep 2026 13:00:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nYa6tdz3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A90E10E159
 for <igt-dev@lists.freedesktop.org>; Fri,  4 Sep 2026 12:59:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788526785; x=1820062785;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=isSwsy0QbJxz3F6E30kR3cAZ2rkHgEsH+JnoM++t+cE=;
 b=nYa6tdz3IjIAX7TICF0QdrxgxVwmbcGZnZXGLcCx9twnZgTC7UT7IG6c
 jYRufB3OwC5A7gtRyX8rG7XChRvGP1wOCTS+Tt0wfQARc3MBpNYaoEIPE
 Ycr09IX3KdfcAHvkqWKIB+X1h8Qp7Y1880AbkOjXLh07hcFaiphxy2D4i
 I8s2ybeO9mdr7d6v67YXZhGoAw601oWLXGiI2vg0Kg0MB3j6HaQzuXraE
 htAjCLivc6KOncNMGDErL8jN1PHhOp1L9kvfe1rIpw7z7WTdxRtqrjyKj
 PULIEdeVTyHnr8OjwgXH6r9enb6clsoKT3hL4vMq7L3iNrN5e++IUcnq4 A==;
X-CSE-ConnectionGUID: kcTneZvCTc+2sNEQTh5xng==
X-CSE-MsgGUID: 9BmiFxw5Squ/pO9chgMhQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11895"; a="114568679"
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="114568679"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:59:45 -0700
X-CSE-ConnectionGUID: 3H6inUYxSt2WX4HvrxmGLw==
X-CSE-MsgGUID: 9PX/kpzxTaCjxwpmfGum9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,262,1779174000"; d="scan'208";a="265688369"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2026 05:59:44 -0700
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t V4] tests/intel/xe_mempage_offline: Add fault-inject based
 page offline tests
Date: Fri,  4 Sep 2026 18:29:33 +0530
Message-ID: <20260904125932.822044-2-tejas.upadhyay@intel.com>
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

v4(Himal):
- Run test only if CONFIG_FAULT_INJECTION_DEBUG_FS is y
v3(Himal):
- Unload/reload driver post test suite run
v2:
- KMD moved from sysfs to debugfs, align with it

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 197 +++++++++++++++++++++++++++++++
 tests/meson.build                |   1 +
 2 files changed, 198 insertions(+)
 create mode 100644 tests/intel/xe_mempage_offline.c

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
new file mode 100644
index 000000000..f1f7765b1
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
+	igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
+	igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "1");
+	igt_debugfs_write(fd, FAULT_INJECT_DIR "/verbose", "1");
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
+		igt_assert(fd >= 0);
+		devid = intel_get_drm_devid(fd);
+		igt_require(intel_get_device_info(devid)->is_crescentisland);
+		igt_require(igt_debugfs_exists(fd,
+					       FAULT_INJECT_DIR "/probability",
+					       O_WRONLY));
+		igt_require(igt_debugfs_exists(fd, VRAM_BAD_PAGES, O_RDONLY));
+		igt_require(igt_debugfs_exists(fd, TRIGGER_FILE, O_WRONLY));
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

