Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0167E606A879
	for <igt-dev@archiver.kernel.org>; Mon,  2 Nov 2026 12:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NY0dlbYY
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A73A10E61F;
	Mon,  2 Nov 2026 12:18:06 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AE8510E61F
 for <igt-dev@lists.freedesktop.org>; Mon,  2 Nov 2026 12:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793621804; x=1825157804;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=kZHc7wH/F15+bX84DCF4NNvUFiIo9ewZMRKFeYzighc=;
 b=NY0dlbYYd2tDFMV9ZJQKWqZzhzMCqUEp69qpH9lxmq21h1wzAQbzVFit
 wtS4qDyOUfsccHPfmXjl/lLfuDfOokC+Uu6FqYKchWSKFuGcgMCgBhU2v
 Wl14zq9l0YzBFL7zu/6ouFhrWg3B+Z0d/Zlfa9OIdOTnvhvn1TzFVUfgE
 3g14HDCFwVgUywkhhbi1fSQx5QNIQV6yaikE4I7hJkVpuZ2faOMPSMAxW
 kJTf0pRE76xKSnFcwg0F5Iq4CKrqhNEQTCOYaysnRGM5WH6t01MxGeKJy
 z/E+R6KW9sW+gVhHTMAq2I0XhRFUA7nsUkr6v0hur44tknPX0FUh8HIOh Q==;
X-CSE-ConnectionGUID: 3vhuZvm/RMee15WhWLkyKA==
X-CSE-MsgGUID: QW9RlKtuSR+LLzapPncoig==
X-IronPort-AV: E=McAfee;i="6800,10657,11953"; a="2338401"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2338401"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:16:44 -0800
X-CSE-ConnectionGUID: yqiIJUfvSGyhLNTcsAzkwg==
X-CSE-MsgGUID: g/E5p4wBQu2js3Ag5/9SPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6657639"
Received: from tejasupa-desk.iind.intel.com (HELO tejasupa-desk)
 ([10.190.239.37])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 04:16:43 -0800
From: Tejas Upadhyay <tejas.upadhyay@intel.com>
To: igt-dev@lists.freedesktop.org
Cc: himal.prasad.ghimiray@intel.com, Tejas Upadhyay <tejas.upadhyay@intel.com>
Subject: [i-g-t] tests/xe: Add bad page decay reclaim coverage
Date: Mon,  2 Nov 2026 17:46:31 +0530
Message-ID: <20261102121630.2360816-2-tejas.upadhyay@intel.com>
X-Mailer: git-send-email 2.52.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
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

Add coverage for VRAM bad page decay handling.

The new tests verify two scenarios:

- A soft-offlined page is reclaimed after the configured
  bad_page_decay_secs timeout expires.

- Re-injecting the same page before timeout promotes the page
  from SOFT to HARD offline status, preventing reclaim.

To keep the tests synchronized with the active kernel
configuration, the timeout is read from xe configfs instead of
being hardcoded. The tests derive their wait times from the
configured decay interval and skip with instructions when the
configuration is unsuitable for automated execution.

Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
---
 tests/intel/xe_mempage_offline.c | 193 +++++++++++++++++++++++++++++++
 1 file changed, 193 insertions(+)

diff --git a/tests/intel/xe_mempage_offline.c b/tests/intel/xe_mempage_offline.c
index f1f7765b1..4322ff4ba 100644
--- a/tests/intel/xe_mempage_offline.c
+++ b/tests/intel/xe_mempage_offline.c
@@ -19,6 +19,7 @@
 #include <unistd.h>
 
 #include "igt.h"
+#include "igt_configfs.h"
 #include "igt_debugfs.h"
 #include "igt_device.h"
 #include "igt_kmod.h"
@@ -106,6 +107,78 @@ static uint64_t get_last_bad_page_pfn(int fd)
 	return pfn;
 }
 
+static bool vram_bad_page_exists(int fd, uint64_t addr)
+{
+        char buf[4096];
+        char *line, *saveptr;
+        uint64_t found_addr;
+
+        __igt_debugfs_read(fd, VRAM_BAD_PAGES, buf, sizeof(buf));
+
+        for (line = strtok_r(buf, "\n", &saveptr);
+             line;
+             line = strtok_r(NULL, "\n", &saveptr)) {
+
+                if (sscanf(line, "%lx", &found_addr) == 1 &&
+                    found_addr == addr)
+                        return true;
+        }
+
+        return false;
+}
+
+static char bus_addr[32];
+
+static void set_bus_addr(int fd)
+{
+        struct pci_device *pci = igt_device_get_pci_device(fd);
+
+        snprintf(bus_addr, sizeof(bus_addr),
+                 "%04x:%02x:%02x.%d",
+                 pci->domain,
+                 pci->bus,
+                 pci->dev,
+                 pci->func);
+}
+
+static int get_bad_page_decay_secs(void)
+{
+        int configfs_fd;
+        int device_fd;
+        int val;
+        int ret;
+
+        configfs_fd = igt_configfs_open("xe");
+        igt_require(configfs_fd >= 0);
+
+        device_fd = openat(configfs_fd,
+                           bus_addr,
+                           O_RDONLY | O_DIRECTORY);
+
+        igt_require_f(device_fd >= 0,
+                      "No configfs entry for %s\n",
+                      bus_addr);
+
+        ret = igt_sysfs_scanf(device_fd,
+                              "bad_page_decay_secs",
+                              "%d",
+                              &val);
+
+        close(device_fd);
+        close(configfs_fd);
+
+        igt_require_f(ret == 1,
+                      "Failed reading bad_page_decay_secs\n");
+
+        return val;
+}
+
+static int decay_gc_wait_secs(int decay_secs)
+{
+        /* Must mirror KMD logic */
+        return max(decay_secs / 8, 60) + 5;
+}
+
 static void inject_fault(int fd)
 {
 	igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "100");
@@ -114,6 +187,21 @@ static void inject_fault(int fd)
 	__igt_debugfs_write(fd, TRIGGER_FILE, "0", 1);
 }
 
+static void require_valid_decay_interval(int decay_interval)
+{
+	igt_require_f(decay_interval > 0 &&
+			decay_interval <= 300,
+			"bad_page_decay_secs=%d is not suitable for this test.\n"
+			"Please reconfigure and reprobe xe:\n"
+			"  echo %s > /sys/bus/pci/drivers/xe/unbind\n"
+			"  echo 30 > /sys/kernel/config/xe/%s/bad_page_decay_secs\n"
+			"  echo %s > /sys/bus/pci/drivers/xe/bind\n",
+			decay_interval,
+			bus_addr,
+			bus_addr,
+			bus_addr);
+}
+
 /**
  * SUBTEST: inject-single-page
  * Description: Inject a single VRAM page fault and verify it appears in vram_bad_pages
@@ -123,6 +211,17 @@ static void inject_fault(int fd)
  * SUBTEST: inject-duplicate-page
  * Description: Inject two pages and verify both appear in vram_bad_pages
  */
+/**
+ * SUBTEST: inject-and-noreclaim
+ * Description: Inject a duplicate VRAM page fault before patrol-scrubber time and
+ * verify it still appears in vram_bad_pages
+ */
+
+/**
+ * SUBTEST: inject-and-reclaim
+ * Description: Inject a page fault once and wait for patrol-scrubber cycle to
+ * completeverify, page should be reclaimed and not appear in vram_bad_pages
+ */
 
 int igt_main()
 {
@@ -188,6 +287,100 @@ int igt_main()
 		igt_assert_eq(after_count, initial_count + 1);
 	}
 
+	igt_subtest("inject-and-noreclaim")
+	{
+		uint64_t pfn;
+		char pfn_str[32];
+		int decay_interval;
+		int wait_time;
+		int debugfs_fd;
+		int ret;
+
+		set_bus_addr(fd);
+		decay_interval = get_bad_page_decay_secs();
+		require_valid_decay_interval(decay_interval);
+
+		wait_time =
+			decay_interval +
+			decay_gc_wait_secs(decay_interval);
+
+		igt_info("decay=%d wait=%d\n",
+				decay_interval, wait_time);
+
+		inject_fault(fd);
+
+		pfn = get_last_bad_page_pfn(fd);
+		igt_assert(pfn != 0);
+
+		sleep(max(decay_interval / 2, 1));
+
+		snprintf(pfn_str, sizeof(pfn_str),
+				"0x%llx",
+				(unsigned long long)pfn);
+
+		/* Reset / override the allowed fault count to 2 (or more) */
+		if (igt_debugfs_exists(fd, FAULT_INJECT_DIR "/times", O_WRONLY)) {
+			igt_debugfs_write(fd, FAULT_INJECT_DIR "/times", "2");
+		}
+		debugfs_fd = igt_debugfs_open(fd,
+				TRIGGER_FILE,
+				O_WRONLY);
+		igt_assert(debugfs_fd >= 0);
+
+		errno = 0;
+		ret = write(debugfs_fd,
+				pfn_str,
+				strlen(pfn_str));
+
+		igt_assert(ret > 0 || errno == EEXIST);
+
+		close(debugfs_fd);
+
+		sleep(wait_time);
+
+		/* HARD page should survive reclaim */
+		igt_assert(vram_bad_page_exists(fd, pfn));
+	}
+
+	igt_subtest("inject-and-reclaim")
+	{
+		int initial_count, after_count;
+		int decay_interval;
+		int wait_time;
+		uint64_t pfn;
+
+		set_bus_addr(fd);
+		decay_interval = get_bad_page_decay_secs();
+		require_valid_decay_interval(decay_interval);
+
+		wait_time =
+			decay_interval +
+			decay_gc_wait_secs(decay_interval);
+
+		igt_info("decay=%d wait=%d\n",
+				decay_interval, wait_time);
+
+		initial_count = count_bad_pages(fd);
+
+		inject_fault(fd);
+
+		pfn = get_last_bad_page_pfn(fd);
+		igt_assert(pfn != 0);
+
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count + 1);
+
+		igt_assert(vram_bad_page_exists(fd, pfn));
+
+		sleep(wait_time);
+
+		/* SOFT page should be reclaimed */
+		igt_assert(!vram_bad_page_exists(fd, pfn));
+
+		after_count = count_bad_pages(fd);
+		igt_assert_eq(after_count, initial_count);
+	}
+
 	igt_fixture() {
 		igt_debugfs_write(fd, FAULT_INJECT_DIR "/probability", "0");
 		drm_close_driver(fd);
-- 
2.52.0

